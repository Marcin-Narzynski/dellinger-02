/*
 *      Copyright (C) 2000,2001 Nikos Mavroyanopoulos
 *
 * This file is part of GNUTLS.
 *
 * GNUTLS is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * GNUTLS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 */

#include "gnutls_int.h"
#include "gnutls_auth_int.h"
#include "gnutls_errors.h"
#include "gnutls_dh.h"
#include "gnutls_num.h"
#include "x509_asn1.h"
#include "x509_der.h"
#include "gnutls_datum.h"
#include "auth_cert.h"
#include <gnutls_random.h>
#include <gnutls_pk.h>
#include <gnutls_algorithms.h>
#include <gnutls_global.h>
#include <x509_verify.h>
#include "debug.h"
#include <gnutls_sig.h>
#include <gnutls_x509.h>
#include <gnutls_openpgp.h>

int gen_rsa_client_kx(GNUTLS_STATE, opaque **);
int proc_rsa_client_kx(GNUTLS_STATE, opaque *, int);


MOD_AUTH_STRUCT rsa_auth_struct = {
	"RSA",
	_gnutls_gen_cert_server_certificate,
	_gnutls_gen_cert_client_certificate,
	NULL,			/* gen server kx */
	NULL,			/* gen server kx2 */
	NULL,			/* gen client kx0 */
	gen_rsa_client_kx,
	_gnutls_gen_cert_client_cert_vrfy,	/* gen client cert vrfy */
	_gnutls_gen_cert_server_cert_req,	/* server cert request */

	_gnutls_proc_cert_server_certificate,
	_gnutls_proc_cert_client_certificate,
	NULL,			/* proc server kx */
	NULL,			/* proc server kx2 */
	NULL,			/* proc client kx0 */
	proc_rsa_client_kx,	/* proc client kx */
	_gnutls_proc_cert_client_cert_vrfy,	/* proc client cert vrfy */
	_gnutls_proc_cert_cert_req	/* proc server cert request */
};



/* This function reads the RSA parameters from peer's certificate;
 */
static int _gnutls_get_public_rsa_params(GNUTLS_STATE state)
{
int ret;
CERTIFICATE_AUTH_INFO info = _gnutls_get_auth_info( state);
gnutls_cert peer_cert;

	if (info==NULL || info->ncerts==0) {
		gnutls_assert();
		return GNUTLS_E_UNKNOWN_ERROR;
	}
	
	switch( state->security_parameters.cert_type) {
		case GNUTLS_CRT_X509:
			if ((ret =
			     _gnutls_x509_cert2gnutls_cert( &peer_cert,
					     info->raw_certificate_list[0])) < 0) {
				gnutls_assert();
				return ret;
			}
			break;
#ifdef HAVE_LIBOPENCDK
		case GNUTLS_CRT_OPENPGP:
			if ((ret =
			     _gnutls_openpgp_cert2gnutls_cert( &peer_cert,
					     info->raw_certificate_list[0])) < 0) {
				gnutls_assert();
				return ret;
			}
			break;
#endif /* HAVE_LIBOPENCDK */
		default:
			gnutls_assert();
			return GNUTLS_E_UNKNOWN_ERROR;
	}
	
	
	state->gnutls_key->a =
	    gcry_mpi_copy( peer_cert.params[0]);
	if (state->gnutls_key->a==NULL) {
		gnutls_free_cert( peer_cert);
		return GNUTLS_E_MEMORY_ERROR;
	}
	
	state->gnutls_key->x =
	    gcry_mpi_copy( peer_cert.params[1]);
	if (state->gnutls_key->x==NULL) {
		_gnutls_mpi_release( &state->gnutls_key->a);
		gnutls_free_cert( peer_cert);
		return GNUTLS_E_MEMORY_ERROR;
	}

	return 0;
}

/* This function reads the RSA parameters from the private key
 */
static int _gnutls_get_private_rsa_params(GNUTLS_STATE state)
{
int index;
const GNUTLS_CERTIFICATE_CREDENTIALS cred;

	cred = _gnutls_get_cred(state->gnutls_key, GNUTLS_CRD_CERTIFICATE, NULL);
	if (cred == NULL) {
	        gnutls_assert();
	        return GNUTLS_E_INSUFICIENT_CRED;
	}

	if ( (index=state->gnutls_internals.selected_cert_index) < 0) {
		gnutls_assert();
		return GNUTLS_E_UNKNOWN_ERROR;
	}
	
	state->gnutls_key->u = gcry_mpi_copy( cred->pkey[index].params[2]);
	if (state->gnutls_key->u==NULL) return GNUTLS_E_MEMORY_ERROR;

	state->gnutls_key->A = gcry_mpi_copy(cred->pkey[index].params[0]);
	if (state->gnutls_key->A==NULL) {
		_gnutls_mpi_release( &state->gnutls_key->u);
		return GNUTLS_E_MEMORY_ERROR;
	}

	return 0;
}



#define RANDOMIZE_KEY(x, galloc) x.size=TLS_MASTER_SIZE; x.data=galloc(x.size); \
		if (x.data==NULL) return GNUTLS_E_MEMORY_ERROR; \
		if (_gnutls_get_random( x.data, x.size, GNUTLS_WEAK_RANDOM) < 0) { \
			gnutls_assert(); \
			return GNUTLS_E_MEMORY_ERROR; \
		}

int proc_rsa_client_kx(GNUTLS_STATE state, opaque * data, int data_size)
{
	gnutls_sdatum plaintext;
	gnutls_datum ciphertext;
	int ret, dsize;
	MPI params[RSA_PARAMS];

	if (gnutls_protocol_get_version(state) == GNUTLS_SSL3) {
		/* SSL 3.0 */
		ciphertext.data = data;
		ciphertext.size = data_size;
	} else {		/* TLS 1 */
		ciphertext.data = &data[2];
		dsize = READuint16(data);

		if (dsize != data_size - 2) {
			gnutls_assert();
			return GNUTLS_E_UNEXPECTED_PACKET_LENGTH;
		}
		ciphertext.size = dsize;
	}

	ret = _gnutls_get_private_rsa_params(state);
	if (ret < 0) {
		gnutls_assert();
		return ret;
	}

	params[0] = state->gnutls_key->A;
	params[1] = state->gnutls_key->u;
	ret = _gnutls_pkcs1_rsa_decrypt(&plaintext, ciphertext, params, 2);	/* btype==2 */

	if (ret < 0) {
		/* in case decryption fails then don't inform
		 * the peer. Just use a random key. (in order to avoid
		 * attack against pkcs-1 formating).
		 */

		gnutls_assert();

		_gnutls_log("RSA_AUTH: Possible PKCS-1 format attack\n");

		RANDOMIZE_KEY(state->gnutls_key->key,
			      gnutls_secure_malloc);
	} else {
		ret = 0;
		if (plaintext.size != TLS_MASTER_SIZE) {	/* WOW */
			RANDOMIZE_KEY(state->gnutls_key->key,
				      gnutls_secure_malloc);
		} else {
			if (_gnutls_get_adv_version_major(state) !=
			    plaintext.data[0]
			    || _gnutls_get_adv_version_minor(state) !=
			    plaintext.data[1]) {
				gnutls_assert();
				ret = GNUTLS_E_DECRYPTION_FAILED;
			}
			if (ret != 0) {
				_gnutls_mpi_release(&state->gnutls_key->B);
				_gnutls_mpi_release(&state->gnutls_key->u);
				_gnutls_mpi_release(&state->gnutls_key->A);
				gnutls_assert();
				return ret;
			}
			state->gnutls_key->key.data = plaintext.data;
			state->gnutls_key->key.size = plaintext.size;
		}
	}

	_gnutls_mpi_release(&state->gnutls_key->A);
	_gnutls_mpi_release(&state->gnutls_key->B);
	_gnutls_mpi_release(&state->gnutls_key->u);
	return 0;
}



/* return RSA(random) using the peers public key 
 */
int gen_rsa_client_kx(GNUTLS_STATE state, opaque ** data)
{
	CERTIFICATE_AUTH_INFO auth = state->gnutls_key->auth_info;
	gnutls_datum sdata;	/* data to send */
	MPI params[RSA_PARAMS];
	int ret;
	GNUTLS_Version ver;

	if (auth == NULL) {
		/* this shouldn't have happened. The proc_certificate
		 * function should have detected that.
		 */
		gnutls_assert();
		return GNUTLS_E_INSUFICIENT_CRED;
	}
	RANDOMIZE_KEY(state->gnutls_key->key, gnutls_secure_malloc);

	ver = _gnutls_get_adv_version(state);

	state->gnutls_key->key.data[0] = _gnutls_version_get_major(ver);
	state->gnutls_key->key.data[1] = _gnutls_version_get_minor(ver);

	/* move RSA parameters to gnutls_key (state).
	 */
	if ((ret =
	     _gnutls_get_public_rsa_params(state)) < 0) {
		gnutls_assert();
		return ret;
	}

	params[0] = state->gnutls_key->a;
	params[1] = state->gnutls_key->x;
	if ((ret =
	     _gnutls_pkcs1_rsa_encrypt(&sdata, state->gnutls_key->key,
				       params, 2)) < 0) {
		gnutls_assert();
		return ret;
	}
	_gnutls_mpi_release(&state->gnutls_key->a);
	_gnutls_mpi_release(&state->gnutls_key->x);


	if (ver == GNUTLS_SSL3) {
		/* SSL 3.0 */
		*data = sdata.data;
		return sdata.size;
	} else {		/* TLS 1 */
		*data = gnutls_malloc(sdata.size + 2);
		if (*data == NULL) {
			gnutls_free_datum(&sdata);
			return GNUTLS_E_MEMORY_ERROR;
		}
		WRITEuint16(sdata.size, *data);
		memcpy(&(*data)[2], sdata.data, sdata.size);
		ret = sdata.size + 2;
		gnutls_free_datum(&sdata);
		return ret;
	}

}
