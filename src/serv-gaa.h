
#line 104 "gaa.skel"
/* GAA HEADER */
#ifndef GAA_HEADER_POKY
#define GAA_HEADER_POKY

typedef struct _gaainfo gaainfo;

struct _gaainfo
{
#line 97 "serv.gaa"
	char *priorities;
#line 94 "serv.gaa"
	char *opaque_prf_input;
#line 91 "serv.gaa"
	char *srp_passwd_conf;
#line 88 "serv.gaa"
	char *srp_passwd;
#line 85 "serv.gaa"
	char *psk_hint;
#line 82 "serv.gaa"
	char *psk_passwd;
#line 79 "serv.gaa"
	int disable_client_cert;
#line 76 "serv.gaa"
	int require_cert;
#line 73 "serv.gaa"
	char *x509_dsacertfile;
#line 70 "serv.gaa"
	char *x509_dsakeyfile;
#line 67 "serv.gaa"
	char *x509_certfile;
#line 64 "serv.gaa"
	char *x509_keyfile;
#line 61 "serv.gaa"
	char *pgp_subkey;
#line 58 "serv.gaa"
	char *pgp_certfile;
#line 55 "serv.gaa"
	char *pgp_keyfile;
#line 52 "serv.gaa"
	char *pgp_keyring;
#line 49 "serv.gaa"
	char *x509_crlfile;
#line 46 "serv.gaa"
	char *x509_cafile;
#line 43 "serv.gaa"
	int fmtder;
#line 40 "serv.gaa"
	char *dh_params_file;
#line 36 "serv.gaa"
	int http;
#line 33 "serv.gaa"
	char *sni_hostname;
#line 30 "serv.gaa"
	int sni_hostname_fatal;
#line 27 "serv.gaa"
	int noticket;
#line 24 "serv.gaa"
	int nodb;
#line 21 "serv.gaa"
	int quiet;
#line 18 "serv.gaa"
	int port;
#line 15 "serv.gaa"
	int generate;
#line 12 "serv.gaa"
	int debug;

#line 114 "gaa.skel"
};

#ifdef __cplusplus
extern "C"
{
#endif

    int gaa(int argc, char *argv[], gaainfo *gaaval);

    void gaa_help(void);
    
    int gaa_file(const char *name, gaainfo *gaaval);
    
#ifdef __cplusplus
}
#endif


#endif