# Copyright (c) 2011-2016, Andy Polyakov <appro@openssl.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 
#     * Redistributions of source code must retain copyright notices,
#      this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials
#      provided with the distribution.
#
#     * Neither the name of the Andy Polyakov nor the names of its
#      copyright holder and contributors may be used to endorse or
#      promote products derived from this software without specific
#      prior written permission.
#
# ALTERNATIVELY, provided that this notice is retained in full, this
# product may be distributed under the terms of the GNU General Public
# License (GPL), in which case the provisions of the GPL apply INSTEAD OF
# those given above.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *** This file is auto-generated ***
#
# 1 "lib/accelerated/aarch64/elf/sha256-armv8.s.tmp.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lib/accelerated/aarch64/elf/sha256-armv8.s.tmp.S"
# 56 "lib/accelerated/aarch64/elf/sha256-armv8.s.tmp.S"
# 1 "lib/accelerated/aarch64/aarch64-common.h" 1
# 57 "lib/accelerated/aarch64/elf/sha256-armv8.s.tmp.S" 2


.text


.hidden _gnutls_arm_cpuid_s
.globl sha256_block_data_order
.type sha256_block_data_order,%function
.align 6
sha256_block_data_order:




 ldr x16,.L_gnutls_arm_cpuid_s

 adr x17,.L_gnutls_arm_cpuid_s
 add x16,x16,x17
 ldr w16,[x16]
 tst w16,#(1<<4)
 b.ne .Lv8_entry
 tst w16,#(1<<0)
 b.ne .Lneon_entry

.inst 0xd503233f
 stp x29,x30,[sp,#-128]!
 add x29,sp,#0

 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 sub sp,sp,#4*4

 ldp w20,w21,[x0]
 ldp w22,w23,[x0,#2*4]
 ldp w24,w25,[x0,#4*4]
 add x2,x1,x2,lsl#6
 ldp w26,w27,[x0,#6*4]
 adr x30,.LK256
 stp x0,x2,[x29,#96]

.Loop:
 ldp w3,w4,[x1],#2*4
 ldr w19,[x30],#4
 eor w28,w21,w22
 str x1,[x29,#112]

 rev w3,w3

 ror w16,w24,#6
 add w27,w27,w19
 eor w6,w24,w24,ror#14
 and w17,w25,w24
 bic w19,w26,w24
 add w27,w27,w3
 orr w17,w17,w19
 eor w19,w20,w21
 eor w16,w16,w6,ror#11
 ror w6,w20,#2
 add w27,w27,w17
 eor w17,w20,w20,ror#9
 add w27,w27,w16
 and w28,w28,w19
 add w23,w23,w27
 eor w28,w28,w21
 eor w17,w6,w17,ror#13
 add w27,w27,w28
 ldr w28,[x30],#4


 rev w4,w4

 ldp w5,w6,[x1],#2*4
 add w27,w27,w17
 ror w16,w23,#6
 add w26,w26,w28
 eor w7,w23,w23,ror#14
 and w17,w24,w23
 bic w28,w25,w23
 add w26,w26,w4
 orr w17,w17,w28
 eor w28,w27,w20
 eor w16,w16,w7,ror#11
 ror w7,w27,#2
 add w26,w26,w17
 eor w17,w27,w27,ror#9
 add w26,w26,w16
 and w19,w19,w28
 add w22,w22,w26
 eor w19,w19,w20
 eor w17,w7,w17,ror#13
 add w26,w26,w19
 ldr w19,[x30],#4


 rev w5,w5

 add w26,w26,w17
 ror w16,w22,#6
 add w25,w25,w19
 eor w8,w22,w22,ror#14
 and w17,w23,w22
 bic w19,w24,w22
 add w25,w25,w5
 orr w17,w17,w19
 eor w19,w26,w27
 eor w16,w16,w8,ror#11
 ror w8,w26,#2
 add w25,w25,w17
 eor w17,w26,w26,ror#9
 add w25,w25,w16
 and w28,w28,w19
 add w21,w21,w25
 eor w28,w28,w27
 eor w17,w8,w17,ror#13
 add w25,w25,w28
 ldr w28,[x30],#4


 rev w6,w6

 ldp w7,w8,[x1],#2*4
 add w25,w25,w17
 ror w16,w21,#6
 add w24,w24,w28
 eor w9,w21,w21,ror#14
 and w17,w22,w21
 bic w28,w23,w21
 add w24,w24,w6
 orr w17,w17,w28
 eor w28,w25,w26
 eor w16,w16,w9,ror#11
 ror w9,w25,#2
 add w24,w24,w17
 eor w17,w25,w25,ror#9
 add w24,w24,w16
 and w19,w19,w28
 add w20,w20,w24
 eor w19,w19,w26
 eor w17,w9,w17,ror#13
 add w24,w24,w19
 ldr w19,[x30],#4


 rev w7,w7

 add w24,w24,w17
 ror w16,w20,#6
 add w23,w23,w19
 eor w10,w20,w20,ror#14
 and w17,w21,w20
 bic w19,w22,w20
 add w23,w23,w7
 orr w17,w17,w19
 eor w19,w24,w25
 eor w16,w16,w10,ror#11
 ror w10,w24,#2
 add w23,w23,w17
 eor w17,w24,w24,ror#9
 add w23,w23,w16
 and w28,w28,w19
 add w27,w27,w23
 eor w28,w28,w25
 eor w17,w10,w17,ror#13
 add w23,w23,w28
 ldr w28,[x30],#4


 rev w8,w8

 ldp w9,w10,[x1],#2*4
 add w23,w23,w17
 ror w16,w27,#6
 add w22,w22,w28
 eor w11,w27,w27,ror#14
 and w17,w20,w27
 bic w28,w21,w27
 add w22,w22,w8
 orr w17,w17,w28
 eor w28,w23,w24
 eor w16,w16,w11,ror#11
 ror w11,w23,#2
 add w22,w22,w17
 eor w17,w23,w23,ror#9
 add w22,w22,w16
 and w19,w19,w28
 add w26,w26,w22
 eor w19,w19,w24
 eor w17,w11,w17,ror#13
 add w22,w22,w19
 ldr w19,[x30],#4


 rev w9,w9

 add w22,w22,w17
 ror w16,w26,#6
 add w21,w21,w19
 eor w12,w26,w26,ror#14
 and w17,w27,w26
 bic w19,w20,w26
 add w21,w21,w9
 orr w17,w17,w19
 eor w19,w22,w23
 eor w16,w16,w12,ror#11
 ror w12,w22,#2
 add w21,w21,w17
 eor w17,w22,w22,ror#9
 add w21,w21,w16
 and w28,w28,w19
 add w25,w25,w21
 eor w28,w28,w23
 eor w17,w12,w17,ror#13
 add w21,w21,w28
 ldr w28,[x30],#4


 rev w10,w10

 ldp w11,w12,[x1],#2*4
 add w21,w21,w17
 ror w16,w25,#6
 add w20,w20,w28
 eor w13,w25,w25,ror#14
 and w17,w26,w25
 bic w28,w27,w25
 add w20,w20,w10
 orr w17,w17,w28
 eor w28,w21,w22
 eor w16,w16,w13,ror#11
 ror w13,w21,#2
 add w20,w20,w17
 eor w17,w21,w21,ror#9
 add w20,w20,w16
 and w19,w19,w28
 add w24,w24,w20
 eor w19,w19,w22
 eor w17,w13,w17,ror#13
 add w20,w20,w19
 ldr w19,[x30],#4


 rev w11,w11

 add w20,w20,w17
 ror w16,w24,#6
 add w27,w27,w19
 eor w14,w24,w24,ror#14
 and w17,w25,w24
 bic w19,w26,w24
 add w27,w27,w11
 orr w17,w17,w19
 eor w19,w20,w21
 eor w16,w16,w14,ror#11
 ror w14,w20,#2
 add w27,w27,w17
 eor w17,w20,w20,ror#9
 add w27,w27,w16
 and w28,w28,w19
 add w23,w23,w27
 eor w28,w28,w21
 eor w17,w14,w17,ror#13
 add w27,w27,w28
 ldr w28,[x30],#4


 rev w12,w12

 ldp w13,w14,[x1],#2*4
 add w27,w27,w17
 ror w16,w23,#6
 add w26,w26,w28
 eor w15,w23,w23,ror#14
 and w17,w24,w23
 bic w28,w25,w23
 add w26,w26,w12
 orr w17,w17,w28
 eor w28,w27,w20
 eor w16,w16,w15,ror#11
 ror w15,w27,#2
 add w26,w26,w17
 eor w17,w27,w27,ror#9
 add w26,w26,w16
 and w19,w19,w28
 add w22,w22,w26
 eor w19,w19,w20
 eor w17,w15,w17,ror#13
 add w26,w26,w19
 ldr w19,[x30],#4


 rev w13,w13

 add w26,w26,w17
 ror w16,w22,#6
 add w25,w25,w19
 eor w0,w22,w22,ror#14
 and w17,w23,w22
 bic w19,w24,w22
 add w25,w25,w13
 orr w17,w17,w19
 eor w19,w26,w27
 eor w16,w16,w0,ror#11
 ror w0,w26,#2
 add w25,w25,w17
 eor w17,w26,w26,ror#9
 add w25,w25,w16
 and w28,w28,w19
 add w21,w21,w25
 eor w28,w28,w27
 eor w17,w0,w17,ror#13
 add w25,w25,w28
 ldr w28,[x30],#4


 rev w14,w14

 ldp w15,w0,[x1],#2*4
 add w25,w25,w17
 str w6,[sp,#12]
 ror w16,w21,#6
 add w24,w24,w28
 eor w6,w21,w21,ror#14
 and w17,w22,w21
 bic w28,w23,w21
 add w24,w24,w14
 orr w17,w17,w28
 eor w28,w25,w26
 eor w16,w16,w6,ror#11
 ror w6,w25,#2
 add w24,w24,w17
 eor w17,w25,w25,ror#9
 add w24,w24,w16
 and w19,w19,w28
 add w20,w20,w24
 eor w19,w19,w26
 eor w17,w6,w17,ror#13
 add w24,w24,w19
 ldr w19,[x30],#4


 rev w15,w15

 add w24,w24,w17
 str w7,[sp,#0]
 ror w16,w20,#6
 add w23,w23,w19
 eor w7,w20,w20,ror#14
 and w17,w21,w20
 bic w19,w22,w20
 add w23,w23,w15
 orr w17,w17,w19
 eor w19,w24,w25
 eor w16,w16,w7,ror#11
 ror w7,w24,#2
 add w23,w23,w17
 eor w17,w24,w24,ror#9
 add w23,w23,w16
 and w28,w28,w19
 add w27,w27,w23
 eor w28,w28,w25
 eor w17,w7,w17,ror#13
 add w23,w23,w28
 ldr w28,[x30],#4


 rev w0,w0

 ldp w1,w2,[x1]
 add w23,w23,w17
 str w8,[sp,#4]
 ror w16,w27,#6
 add w22,w22,w28
 eor w8,w27,w27,ror#14
 and w17,w20,w27
 bic w28,w21,w27
 add w22,w22,w0
 orr w17,w17,w28
 eor w28,w23,w24
 eor w16,w16,w8,ror#11
 ror w8,w23,#2
 add w22,w22,w17
 eor w17,w23,w23,ror#9
 add w22,w22,w16
 and w19,w19,w28
 add w26,w26,w22
 eor w19,w19,w24
 eor w17,w8,w17,ror#13
 add w22,w22,w19
 ldr w19,[x30],#4


 rev w1,w1

 ldr w6,[sp,#12]
 add w22,w22,w17
 str w9,[sp,#8]
 ror w16,w26,#6
 add w21,w21,w19
 eor w9,w26,w26,ror#14
 and w17,w27,w26
 bic w19,w20,w26
 add w21,w21,w1
 orr w17,w17,w19
 eor w19,w22,w23
 eor w16,w16,w9,ror#11
 ror w9,w22,#2
 add w21,w21,w17
 eor w17,w22,w22,ror#9
 add w21,w21,w16
 and w28,w28,w19
 add w25,w25,w21
 eor w28,w28,w23
 eor w17,w9,w17,ror#13
 add w21,w21,w28
 ldr w28,[x30],#4


 rev w2,w2

 ldr w7,[sp,#0]
 add w21,w21,w17
 str w10,[sp,#12]
 ror w16,w25,#6
 add w20,w20,w28
 ror w9,w4,#7
 and w17,w26,w25
 ror w8,w1,#17
 bic w28,w27,w25
 ror w10,w21,#2
 add w20,w20,w2
 eor w16,w16,w25,ror#11
 eor w9,w9,w4,ror#18
 orr w17,w17,w28
 eor w28,w21,w22
 eor w16,w16,w25,ror#25
 eor w10,w10,w21,ror#13
 add w20,w20,w17
 and w19,w19,w28
 eor w8,w8,w1,ror#19
 eor w9,w9,w4,lsr#3
 add w20,w20,w16
 eor w19,w19,w22
 eor w17,w10,w21,ror#22
 eor w8,w8,w1,lsr#10
 add w3,w3,w12
 add w24,w24,w20
 add w20,w20,w19
 ldr w19,[x30],#4
 add w3,w3,w9
 add w20,w20,w17
 add w3,w3,w8
.Loop_16_xx:
 ldr w8,[sp,#4]
 str w11,[sp,#0]
 ror w16,w24,#6
 add w27,w27,w19
 ror w10,w5,#7
 and w17,w25,w24
 ror w9,w2,#17
 bic w19,w26,w24
 ror w11,w20,#2
 add w27,w27,w3
 eor w16,w16,w24,ror#11
 eor w10,w10,w5,ror#18
 orr w17,w17,w19
 eor w19,w20,w21
 eor w16,w16,w24,ror#25
 eor w11,w11,w20,ror#13
 add w27,w27,w17
 and w28,w28,w19
 eor w9,w9,w2,ror#19
 eor w10,w10,w5,lsr#3
 add w27,w27,w16
 eor w28,w28,w21
 eor w17,w11,w20,ror#22
 eor w9,w9,w2,lsr#10
 add w4,w4,w13
 add w23,w23,w27
 add w27,w27,w28
 ldr w28,[x30],#4
 add w4,w4,w10
 add w27,w27,w17
 add w4,w4,w9
 ldr w9,[sp,#8]
 str w12,[sp,#4]
 ror w16,w23,#6
 add w26,w26,w28
 ror w11,w6,#7
 and w17,w24,w23
 ror w10,w3,#17
 bic w28,w25,w23
 ror w12,w27,#2
 add w26,w26,w4
 eor w16,w16,w23,ror#11
 eor w11,w11,w6,ror#18
 orr w17,w17,w28
 eor w28,w27,w20
 eor w16,w16,w23,ror#25
 eor w12,w12,w27,ror#13
 add w26,w26,w17
 and w19,w19,w28
 eor w10,w10,w3,ror#19
 eor w11,w11,w6,lsr#3
 add w26,w26,w16
 eor w19,w19,w20
 eor w17,w12,w27,ror#22
 eor w10,w10,w3,lsr#10
 add w5,w5,w14
 add w22,w22,w26
 add w26,w26,w19
 ldr w19,[x30],#4
 add w5,w5,w11
 add w26,w26,w17
 add w5,w5,w10
 ldr w10,[sp,#12]
 str w13,[sp,#8]
 ror w16,w22,#6
 add w25,w25,w19
 ror w12,w7,#7
 and w17,w23,w22
 ror w11,w4,#17
 bic w19,w24,w22
 ror w13,w26,#2
 add w25,w25,w5
 eor w16,w16,w22,ror#11
 eor w12,w12,w7,ror#18
 orr w17,w17,w19
 eor w19,w26,w27
 eor w16,w16,w22,ror#25
 eor w13,w13,w26,ror#13
 add w25,w25,w17
 and w28,w28,w19
 eor w11,w11,w4,ror#19
 eor w12,w12,w7,lsr#3
 add w25,w25,w16
 eor w28,w28,w27
 eor w17,w13,w26,ror#22
 eor w11,w11,w4,lsr#10
 add w6,w6,w15
 add w21,w21,w25
 add w25,w25,w28
 ldr w28,[x30],#4
 add w6,w6,w12
 add w25,w25,w17
 add w6,w6,w11
 ldr w11,[sp,#0]
 str w14,[sp,#12]
 ror w16,w21,#6
 add w24,w24,w28
 ror w13,w8,#7
 and w17,w22,w21
 ror w12,w5,#17
 bic w28,w23,w21
 ror w14,w25,#2
 add w24,w24,w6
 eor w16,w16,w21,ror#11
 eor w13,w13,w8,ror#18
 orr w17,w17,w28
 eor w28,w25,w26
 eor w16,w16,w21,ror#25
 eor w14,w14,w25,ror#13
 add w24,w24,w17
 and w19,w19,w28
 eor w12,w12,w5,ror#19
 eor w13,w13,w8,lsr#3
 add w24,w24,w16
 eor w19,w19,w26
 eor w17,w14,w25,ror#22
 eor w12,w12,w5,lsr#10
 add w7,w7,w0
 add w20,w20,w24
 add w24,w24,w19
 ldr w19,[x30],#4
 add w7,w7,w13
 add w24,w24,w17
 add w7,w7,w12
 ldr w12,[sp,#4]
 str w15,[sp,#0]
 ror w16,w20,#6
 add w23,w23,w19
 ror w14,w9,#7
 and w17,w21,w20
 ror w13,w6,#17
 bic w19,w22,w20
 ror w15,w24,#2
 add w23,w23,w7
 eor w16,w16,w20,ror#11
 eor w14,w14,w9,ror#18
 orr w17,w17,w19
 eor w19,w24,w25
 eor w16,w16,w20,ror#25
 eor w15,w15,w24,ror#13
 add w23,w23,w17
 and w28,w28,w19
 eor w13,w13,w6,ror#19
 eor w14,w14,w9,lsr#3
 add w23,w23,w16
 eor w28,w28,w25
 eor w17,w15,w24,ror#22
 eor w13,w13,w6,lsr#10
 add w8,w8,w1
 add w27,w27,w23
 add w23,w23,w28
 ldr w28,[x30],#4
 add w8,w8,w14
 add w23,w23,w17
 add w8,w8,w13
 ldr w13,[sp,#8]
 str w0,[sp,#4]
 ror w16,w27,#6
 add w22,w22,w28
 ror w15,w10,#7
 and w17,w20,w27
 ror w14,w7,#17
 bic w28,w21,w27
 ror w0,w23,#2
 add w22,w22,w8
 eor w16,w16,w27,ror#11
 eor w15,w15,w10,ror#18
 orr w17,w17,w28
 eor w28,w23,w24
 eor w16,w16,w27,ror#25
 eor w0,w0,w23,ror#13
 add w22,w22,w17
 and w19,w19,w28
 eor w14,w14,w7,ror#19
 eor w15,w15,w10,lsr#3
 add w22,w22,w16
 eor w19,w19,w24
 eor w17,w0,w23,ror#22
 eor w14,w14,w7,lsr#10
 add w9,w9,w2
 add w26,w26,w22
 add w22,w22,w19
 ldr w19,[x30],#4
 add w9,w9,w15
 add w22,w22,w17
 add w9,w9,w14
 ldr w14,[sp,#12]
 str w1,[sp,#8]
 ror w16,w26,#6
 add w21,w21,w19
 ror w0,w11,#7
 and w17,w27,w26
 ror w15,w8,#17
 bic w19,w20,w26
 ror w1,w22,#2
 add w21,w21,w9
 eor w16,w16,w26,ror#11
 eor w0,w0,w11,ror#18
 orr w17,w17,w19
 eor w19,w22,w23
 eor w16,w16,w26,ror#25
 eor w1,w1,w22,ror#13
 add w21,w21,w17
 and w28,w28,w19
 eor w15,w15,w8,ror#19
 eor w0,w0,w11,lsr#3
 add w21,w21,w16
 eor w28,w28,w23
 eor w17,w1,w22,ror#22
 eor w15,w15,w8,lsr#10
 add w10,w10,w3
 add w25,w25,w21
 add w21,w21,w28
 ldr w28,[x30],#4
 add w10,w10,w0
 add w21,w21,w17
 add w10,w10,w15
 ldr w15,[sp,#0]
 str w2,[sp,#12]
 ror w16,w25,#6
 add w20,w20,w28
 ror w1,w12,#7
 and w17,w26,w25
 ror w0,w9,#17
 bic w28,w27,w25
 ror w2,w21,#2
 add w20,w20,w10
 eor w16,w16,w25,ror#11
 eor w1,w1,w12,ror#18
 orr w17,w17,w28
 eor w28,w21,w22
 eor w16,w16,w25,ror#25
 eor w2,w2,w21,ror#13
 add w20,w20,w17
 and w19,w19,w28
 eor w0,w0,w9,ror#19
 eor w1,w1,w12,lsr#3
 add w20,w20,w16
 eor w19,w19,w22
 eor w17,w2,w21,ror#22
 eor w0,w0,w9,lsr#10
 add w11,w11,w4
 add w24,w24,w20
 add w20,w20,w19
 ldr w19,[x30],#4
 add w11,w11,w1
 add w20,w20,w17
 add w11,w11,w0
 ldr w0,[sp,#4]
 str w3,[sp,#0]
 ror w16,w24,#6
 add w27,w27,w19
 ror w2,w13,#7
 and w17,w25,w24
 ror w1,w10,#17
 bic w19,w26,w24
 ror w3,w20,#2
 add w27,w27,w11
 eor w16,w16,w24,ror#11
 eor w2,w2,w13,ror#18
 orr w17,w17,w19
 eor w19,w20,w21
 eor w16,w16,w24,ror#25
 eor w3,w3,w20,ror#13
 add w27,w27,w17
 and w28,w28,w19
 eor w1,w1,w10,ror#19
 eor w2,w2,w13,lsr#3
 add w27,w27,w16
 eor w28,w28,w21
 eor w17,w3,w20,ror#22
 eor w1,w1,w10,lsr#10
 add w12,w12,w5
 add w23,w23,w27
 add w27,w27,w28
 ldr w28,[x30],#4
 add w12,w12,w2
 add w27,w27,w17
 add w12,w12,w1
 ldr w1,[sp,#8]
 str w4,[sp,#4]
 ror w16,w23,#6
 add w26,w26,w28
 ror w3,w14,#7
 and w17,w24,w23
 ror w2,w11,#17
 bic w28,w25,w23
 ror w4,w27,#2
 add w26,w26,w12
 eor w16,w16,w23,ror#11
 eor w3,w3,w14,ror#18
 orr w17,w17,w28
 eor w28,w27,w20
 eor w16,w16,w23,ror#25
 eor w4,w4,w27,ror#13
 add w26,w26,w17
 and w19,w19,w28
 eor w2,w2,w11,ror#19
 eor w3,w3,w14,lsr#3
 add w26,w26,w16
 eor w19,w19,w20
 eor w17,w4,w27,ror#22
 eor w2,w2,w11,lsr#10
 add w13,w13,w6
 add w22,w22,w26
 add w26,w26,w19
 ldr w19,[x30],#4
 add w13,w13,w3
 add w26,w26,w17
 add w13,w13,w2
 ldr w2,[sp,#12]
 str w5,[sp,#8]
 ror w16,w22,#6
 add w25,w25,w19
 ror w4,w15,#7
 and w17,w23,w22
 ror w3,w12,#17
 bic w19,w24,w22
 ror w5,w26,#2
 add w25,w25,w13
 eor w16,w16,w22,ror#11
 eor w4,w4,w15,ror#18
 orr w17,w17,w19
 eor w19,w26,w27
 eor w16,w16,w22,ror#25
 eor w5,w5,w26,ror#13
 add w25,w25,w17
 and w28,w28,w19
 eor w3,w3,w12,ror#19
 eor w4,w4,w15,lsr#3
 add w25,w25,w16
 eor w28,w28,w27
 eor w17,w5,w26,ror#22
 eor w3,w3,w12,lsr#10
 add w14,w14,w7
 add w21,w21,w25
 add w25,w25,w28
 ldr w28,[x30],#4
 add w14,w14,w4
 add w25,w25,w17
 add w14,w14,w3
 ldr w3,[sp,#0]
 str w6,[sp,#12]
 ror w16,w21,#6
 add w24,w24,w28
 ror w5,w0,#7
 and w17,w22,w21
 ror w4,w13,#17
 bic w28,w23,w21
 ror w6,w25,#2
 add w24,w24,w14
 eor w16,w16,w21,ror#11
 eor w5,w5,w0,ror#18
 orr w17,w17,w28
 eor w28,w25,w26
 eor w16,w16,w21,ror#25
 eor w6,w6,w25,ror#13
 add w24,w24,w17
 and w19,w19,w28
 eor w4,w4,w13,ror#19
 eor w5,w5,w0,lsr#3
 add w24,w24,w16
 eor w19,w19,w26
 eor w17,w6,w25,ror#22
 eor w4,w4,w13,lsr#10
 add w15,w15,w8
 add w20,w20,w24
 add w24,w24,w19
 ldr w19,[x30],#4
 add w15,w15,w5
 add w24,w24,w17
 add w15,w15,w4
 ldr w4,[sp,#4]
 str w7,[sp,#0]
 ror w16,w20,#6
 add w23,w23,w19
 ror w6,w1,#7
 and w17,w21,w20
 ror w5,w14,#17
 bic w19,w22,w20
 ror w7,w24,#2
 add w23,w23,w15
 eor w16,w16,w20,ror#11
 eor w6,w6,w1,ror#18
 orr w17,w17,w19
 eor w19,w24,w25
 eor w16,w16,w20,ror#25
 eor w7,w7,w24,ror#13
 add w23,w23,w17
 and w28,w28,w19
 eor w5,w5,w14,ror#19
 eor w6,w6,w1,lsr#3
 add w23,w23,w16
 eor w28,w28,w25
 eor w17,w7,w24,ror#22
 eor w5,w5,w14,lsr#10
 add w0,w0,w9
 add w27,w27,w23
 add w23,w23,w28
 ldr w28,[x30],#4
 add w0,w0,w6
 add w23,w23,w17
 add w0,w0,w5
 ldr w5,[sp,#8]
 str w8,[sp,#4]
 ror w16,w27,#6
 add w22,w22,w28
 ror w7,w2,#7
 and w17,w20,w27
 ror w6,w15,#17
 bic w28,w21,w27
 ror w8,w23,#2
 add w22,w22,w0
 eor w16,w16,w27,ror#11
 eor w7,w7,w2,ror#18
 orr w17,w17,w28
 eor w28,w23,w24
 eor w16,w16,w27,ror#25
 eor w8,w8,w23,ror#13
 add w22,w22,w17
 and w19,w19,w28
 eor w6,w6,w15,ror#19
 eor w7,w7,w2,lsr#3
 add w22,w22,w16
 eor w19,w19,w24
 eor w17,w8,w23,ror#22
 eor w6,w6,w15,lsr#10
 add w1,w1,w10
 add w26,w26,w22
 add w22,w22,w19
 ldr w19,[x30],#4
 add w1,w1,w7
 add w22,w22,w17
 add w1,w1,w6
 ldr w6,[sp,#12]
 str w9,[sp,#8]
 ror w16,w26,#6
 add w21,w21,w19
 ror w8,w3,#7
 and w17,w27,w26
 ror w7,w0,#17
 bic w19,w20,w26
 ror w9,w22,#2
 add w21,w21,w1
 eor w16,w16,w26,ror#11
 eor w8,w8,w3,ror#18
 orr w17,w17,w19
 eor w19,w22,w23
 eor w16,w16,w26,ror#25
 eor w9,w9,w22,ror#13
 add w21,w21,w17
 and w28,w28,w19
 eor w7,w7,w0,ror#19
 eor w8,w8,w3,lsr#3
 add w21,w21,w16
 eor w28,w28,w23
 eor w17,w9,w22,ror#22
 eor w7,w7,w0,lsr#10
 add w2,w2,w11
 add w25,w25,w21
 add w21,w21,w28
 ldr w28,[x30],#4
 add w2,w2,w8
 add w21,w21,w17
 add w2,w2,w7
 ldr w7,[sp,#0]
 str w10,[sp,#12]
 ror w16,w25,#6
 add w20,w20,w28
 ror w9,w4,#7
 and w17,w26,w25
 ror w8,w1,#17
 bic w28,w27,w25
 ror w10,w21,#2
 add w20,w20,w2
 eor w16,w16,w25,ror#11
 eor w9,w9,w4,ror#18
 orr w17,w17,w28
 eor w28,w21,w22
 eor w16,w16,w25,ror#25
 eor w10,w10,w21,ror#13
 add w20,w20,w17
 and w19,w19,w28
 eor w8,w8,w1,ror#19
 eor w9,w9,w4,lsr#3
 add w20,w20,w16
 eor w19,w19,w22
 eor w17,w10,w21,ror#22
 eor w8,w8,w1,lsr#10
 add w3,w3,w12
 add w24,w24,w20
 add w20,w20,w19
 ldr w19,[x30],#4
 add w3,w3,w9
 add w20,w20,w17
 add w3,w3,w8
 cbnz w19,.Loop_16_xx

 ldp x0,x2,[x29,#96]
 ldr x1,[x29,#112]
 sub x30,x30,#260

 ldp w3,w4,[x0]
 ldp w5,w6,[x0,#2*4]
 add x1,x1,#14*4
 ldp w7,w8,[x0,#4*4]
 add w20,w20,w3
 ldp w9,w10,[x0,#6*4]
 add w21,w21,w4
 add w22,w22,w5
 add w23,w23,w6
 stp w20,w21,[x0]
 add w24,w24,w7
 add w25,w25,w8
 stp w22,w23,[x0,#2*4]
 add w26,w26,w9
 add w27,w27,w10
 cmp x1,x2
 stp w24,w25,[x0,#4*4]
 stp w26,w27,[x0,#6*4]
 b.ne .Loop

 ldp x19,x20,[x29,#16]
 add sp,sp,#4*4
 ldp x21,x22,[x29,#32]
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldp x29,x30,[sp],#128
.inst 0xd50323bf
 ret
.size sha256_block_data_order,.-sha256_block_data_order

.align 6
.type .LK256,%object
.LK256:
.long 0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5
.long 0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5
.long 0xd807aa98,0x12835b01,0x243185be,0x550c7dc3
.long 0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174
.long 0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc
.long 0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da
.long 0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7
.long 0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967
.long 0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13
.long 0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85
.long 0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3
.long 0xd192e819,0xd6990624,0xf40e3585,0x106aa070
.long 0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5
.long 0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3
.long 0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208
.long 0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
.long 0
.size .LK256,.-.LK256

.align 3
.L_gnutls_arm_cpuid_s:



.quad _gnutls_arm_cpuid_s-.


.byte 83,72,65,50,53,54,32,98,108,111,99,107,32,116,114,97,110,115,102,111,114,109,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
.align 2

.type sha256_block_armv8,%function
.align 6
sha256_block_armv8:
.Lv8_entry:
 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ld1 {v0.4s,v1.4s},[x0]
 adr x3,.LK256

.Loop_hw:
 ld1 {v4.16b,v5.16b,v6.16b,v7.16b},[x1],#64
 sub x2,x2,#1
 ld1 {v16.4s},[x3],#16
 rev32 v4.16b,v4.16b
 rev32 v5.16b,v5.16b
 rev32 v6.16b,v6.16b
 rev32 v7.16b,v7.16b
 orr v18.16b,v0.16b,v0.16b
 orr v19.16b,v1.16b,v1.16b
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v4.4s
.inst 0x5e2828a4
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e0760c4
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v5.4s
.inst 0x5e2828c5
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0460e5
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v6.4s
.inst 0x5e2828e6
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e056086
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v7.4s
.inst 0x5e282887
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0660a7
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v4.4s
.inst 0x5e2828a4
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e0760c4
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v5.4s
.inst 0x5e2828c5
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0460e5
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v6.4s
.inst 0x5e2828e6
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e056086
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v7.4s
.inst 0x5e282887
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0660a7
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v4.4s
.inst 0x5e2828a4
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e0760c4
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v5.4s
.inst 0x5e2828c5
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0460e5
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v6.4s
.inst 0x5e2828e6
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041
.inst 0x5e056086
 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v7.4s
.inst 0x5e282887
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041
.inst 0x5e0660a7
 ld1 {v17.4s},[x3],#16
 add v16.4s,v16.4s,v4.4s
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041

 ld1 {v16.4s},[x3],#16
 add v17.4s,v17.4s,v5.4s
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041

 ld1 {v17.4s},[x3]
 add v16.4s,v16.4s,v6.4s
 sub x3,x3,#64*4-16
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e104020
.inst 0x5e105041

 add v17.4s,v17.4s,v7.4s
 orr v2.16b,v0.16b,v0.16b
.inst 0x5e114020
.inst 0x5e115041

 add v0.4s,v0.4s,v18.4s
 add v1.4s,v1.4s,v19.4s

 cbnz x2,.Loop_hw

 st1 {v0.4s,v1.4s},[x0]

 ldr x29,[sp],#16
 ret
.size sha256_block_armv8,.-sha256_block_armv8




.type sha256_block_neon,%function
.align 4
sha256_block_neon:
.Lneon_entry:
 stp x29, x30, [sp, #-16]!
 mov x29, sp
 sub sp,sp,#16*4

 adr x16,.LK256
 add x2,x1,x2,lsl#6

 ld1 {v0.16b},[x1], #16
 ld1 {v1.16b},[x1], #16
 ld1 {v2.16b},[x1], #16
 ld1 {v3.16b},[x1], #16
 ld1 {v4.4s},[x16], #16
 ld1 {v5.4s},[x16], #16
 ld1 {v6.4s},[x16], #16
 ld1 {v7.4s},[x16], #16
 rev32 v0.16b,v0.16b
 rev32 v1.16b,v1.16b
 rev32 v2.16b,v2.16b
 rev32 v3.16b,v3.16b
 mov x17,sp
 add v4.4s,v4.4s,v0.4s
 add v5.4s,v5.4s,v1.4s
 add v6.4s,v6.4s,v2.4s
 st1 {v4.4s,v5.4s},[x17], #32
 add v7.4s,v7.4s,v3.4s
 st1 {v6.4s,v7.4s},[x17]
 sub x17,x17,#32

 ldp w3,w4,[x0]
 ldp w5,w6,[x0,#8]
 ldp w7,w8,[x0,#16]
 ldp w9,w10,[x0,#24]
 ldr w12,[sp,#0]
 mov w13,wzr
 eor w14,w4,w5
 mov w15,wzr
 b .L_00_48

.align 4
.L_00_48:
 ext v4.16b,v0.16b,v1.16b,#4
 add w10,w10,w12
 add w3,w3,w15
 and w12,w8,w7
 bic w15,w9,w7
 ext v7.16b,v2.16b,v3.16b,#4
 eor w11,w7,w7,ror#5
 add w3,w3,w13
 mov d19,v3.d[1]
 orr w12,w12,w15
 eor w11,w11,w7,ror#19
 ushr v6.4s,v4.4s,#7
 eor w15,w3,w3,ror#11
 ushr v5.4s,v4.4s,#3
 add w10,w10,w12
 add v0.4s,v0.4s,v7.4s
 ror w11,w11,#6
 sli v6.4s,v4.4s,#25
 eor w13,w3,w4
 eor w15,w15,w3,ror#20
 ushr v7.4s,v4.4s,#18
 add w10,w10,w11
 ldr w12,[sp,#4]
 and w14,w14,w13
 eor v5.16b,v5.16b,v6.16b
 ror w15,w15,#2
 add w6,w6,w10
 sli v7.4s,v4.4s,#14
 eor w14,w14,w4
 ushr v16.4s,v19.4s,#17
 add w9,w9,w12
 add w10,w10,w15
 and w12,w7,w6
 eor v5.16b,v5.16b,v7.16b
 bic w15,w8,w6
 eor w11,w6,w6,ror#5
 sli v16.4s,v19.4s,#15
 add w10,w10,w14
 orr w12,w12,w15
 ushr v17.4s,v19.4s,#10
 eor w11,w11,w6,ror#19
 eor w15,w10,w10,ror#11
 ushr v7.4s,v19.4s,#19
 add w9,w9,w12
 ror w11,w11,#6
 add v0.4s,v0.4s,v5.4s
 eor w14,w10,w3
 eor w15,w15,w10,ror#20
 sli v7.4s,v19.4s,#13
 add w9,w9,w11
 ldr w12,[sp,#8]
 and w13,w13,w14
 eor v17.16b,v17.16b,v16.16b
 ror w15,w15,#2
 add w5,w5,w9
 eor w13,w13,w3
 eor v17.16b,v17.16b,v7.16b
 add w8,w8,w12
 add w9,w9,w15
 and w12,w6,w5
 add v0.4s,v0.4s,v17.4s
 bic w15,w7,w5
 eor w11,w5,w5,ror#5
 add w9,w9,w13
 ushr v18.4s,v0.4s,#17
 orr w12,w12,w15
 ushr v19.4s,v0.4s,#10
 eor w11,w11,w5,ror#19
 eor w15,w9,w9,ror#11
 sli v18.4s,v0.4s,#15
 add w8,w8,w12
 ushr v17.4s,v0.4s,#19
 ror w11,w11,#6
 eor w13,w9,w10
 eor v19.16b,v19.16b,v18.16b
 eor w15,w15,w9,ror#20
 add w8,w8,w11
 sli v17.4s,v0.4s,#13
 ldr w12,[sp,#12]
 and w14,w14,w13
 ror w15,w15,#2
 ld1 {v4.4s},[x16], #16
 add w4,w4,w8
 eor v19.16b,v19.16b,v17.16b
 eor w14,w14,w10
 eor v17.16b,v17.16b,v17.16b
 add w7,w7,w12
 add w8,w8,w15
 and w12,w5,w4
 mov v17.d[1],v19.d[0]
 bic w15,w6,w4
 eor w11,w4,w4,ror#5
 add w8,w8,w14
 add v0.4s,v0.4s,v17.4s
 orr w12,w12,w15
 eor w11,w11,w4,ror#19
 eor w15,w8,w8,ror#11
 add v4.4s,v4.4s,v0.4s
 add w7,w7,w12
 ror w11,w11,#6
 eor w14,w8,w9
 eor w15,w15,w8,ror#20
 add w7,w7,w11
 ldr w12,[sp,#16]
 and w13,w13,w14
 ror w15,w15,#2
 add w3,w3,w7
 eor w13,w13,w9
 st1 {v4.4s},[x17], #16
 ext v4.16b,v1.16b,v2.16b,#4
 add w6,w6,w12
 add w7,w7,w15
 and w12,w4,w3
 bic w15,w5,w3
 ext v7.16b,v3.16b,v0.16b,#4
 eor w11,w3,w3,ror#5
 add w7,w7,w13
 mov d19,v0.d[1]
 orr w12,w12,w15
 eor w11,w11,w3,ror#19
 ushr v6.4s,v4.4s,#7
 eor w15,w7,w7,ror#11
 ushr v5.4s,v4.4s,#3
 add w6,w6,w12
 add v1.4s,v1.4s,v7.4s
 ror w11,w11,#6
 sli v6.4s,v4.4s,#25
 eor w13,w7,w8
 eor w15,w15,w7,ror#20
 ushr v7.4s,v4.4s,#18
 add w6,w6,w11
 ldr w12,[sp,#20]
 and w14,w14,w13
 eor v5.16b,v5.16b,v6.16b
 ror w15,w15,#2
 add w10,w10,w6
 sli v7.4s,v4.4s,#14
 eor w14,w14,w8
 ushr v16.4s,v19.4s,#17
 add w5,w5,w12
 add w6,w6,w15
 and w12,w3,w10
 eor v5.16b,v5.16b,v7.16b
 bic w15,w4,w10
 eor w11,w10,w10,ror#5
 sli v16.4s,v19.4s,#15
 add w6,w6,w14
 orr w12,w12,w15
 ushr v17.4s,v19.4s,#10
 eor w11,w11,w10,ror#19
 eor w15,w6,w6,ror#11
 ushr v7.4s,v19.4s,#19
 add w5,w5,w12
 ror w11,w11,#6
 add v1.4s,v1.4s,v5.4s
 eor w14,w6,w7
 eor w15,w15,w6,ror#20
 sli v7.4s,v19.4s,#13
 add w5,w5,w11
 ldr w12,[sp,#24]
 and w13,w13,w14
 eor v17.16b,v17.16b,v16.16b
 ror w15,w15,#2
 add w9,w9,w5
 eor w13,w13,w7
 eor v17.16b,v17.16b,v7.16b
 add w4,w4,w12
 add w5,w5,w15
 and w12,w10,w9
 add v1.4s,v1.4s,v17.4s
 bic w15,w3,w9
 eor w11,w9,w9,ror#5
 add w5,w5,w13
 ushr v18.4s,v1.4s,#17
 orr w12,w12,w15
 ushr v19.4s,v1.4s,#10
 eor w11,w11,w9,ror#19
 eor w15,w5,w5,ror#11
 sli v18.4s,v1.4s,#15
 add w4,w4,w12
 ushr v17.4s,v1.4s,#19
 ror w11,w11,#6
 eor w13,w5,w6
 eor v19.16b,v19.16b,v18.16b
 eor w15,w15,w5,ror#20
 add w4,w4,w11
 sli v17.4s,v1.4s,#13
 ldr w12,[sp,#28]
 and w14,w14,w13
 ror w15,w15,#2
 ld1 {v4.4s},[x16], #16
 add w8,w8,w4
 eor v19.16b,v19.16b,v17.16b
 eor w14,w14,w6
 eor v17.16b,v17.16b,v17.16b
 add w3,w3,w12
 add w4,w4,w15
 and w12,w9,w8
 mov v17.d[1],v19.d[0]
 bic w15,w10,w8
 eor w11,w8,w8,ror#5
 add w4,w4,w14
 add v1.4s,v1.4s,v17.4s
 orr w12,w12,w15
 eor w11,w11,w8,ror#19
 eor w15,w4,w4,ror#11
 add v4.4s,v4.4s,v1.4s
 add w3,w3,w12
 ror w11,w11,#6
 eor w14,w4,w5
 eor w15,w15,w4,ror#20
 add w3,w3,w11
 ldr w12,[sp,#32]
 and w13,w13,w14
 ror w15,w15,#2
 add w7,w7,w3
 eor w13,w13,w5
 st1 {v4.4s},[x17], #16
 ext v4.16b,v2.16b,v3.16b,#4
 add w10,w10,w12
 add w3,w3,w15
 and w12,w8,w7
 bic w15,w9,w7
 ext v7.16b,v0.16b,v1.16b,#4
 eor w11,w7,w7,ror#5
 add w3,w3,w13
 mov d19,v1.d[1]
 orr w12,w12,w15
 eor w11,w11,w7,ror#19
 ushr v6.4s,v4.4s,#7
 eor w15,w3,w3,ror#11
 ushr v5.4s,v4.4s,#3
 add w10,w10,w12
 add v2.4s,v2.4s,v7.4s
 ror w11,w11,#6
 sli v6.4s,v4.4s,#25
 eor w13,w3,w4
 eor w15,w15,w3,ror#20
 ushr v7.4s,v4.4s,#18
 add w10,w10,w11
 ldr w12,[sp,#36]
 and w14,w14,w13
 eor v5.16b,v5.16b,v6.16b
 ror w15,w15,#2
 add w6,w6,w10
 sli v7.4s,v4.4s,#14
 eor w14,w14,w4
 ushr v16.4s,v19.4s,#17
 add w9,w9,w12
 add w10,w10,w15
 and w12,w7,w6
 eor v5.16b,v5.16b,v7.16b
 bic w15,w8,w6
 eor w11,w6,w6,ror#5
 sli v16.4s,v19.4s,#15
 add w10,w10,w14
 orr w12,w12,w15
 ushr v17.4s,v19.4s,#10
 eor w11,w11,w6,ror#19
 eor w15,w10,w10,ror#11
 ushr v7.4s,v19.4s,#19
 add w9,w9,w12
 ror w11,w11,#6
 add v2.4s,v2.4s,v5.4s
 eor w14,w10,w3
 eor w15,w15,w10,ror#20
 sli v7.4s,v19.4s,#13
 add w9,w9,w11
 ldr w12,[sp,#40]
 and w13,w13,w14
 eor v17.16b,v17.16b,v16.16b
 ror w15,w15,#2
 add w5,w5,w9
 eor w13,w13,w3
 eor v17.16b,v17.16b,v7.16b
 add w8,w8,w12
 add w9,w9,w15
 and w12,w6,w5
 add v2.4s,v2.4s,v17.4s
 bic w15,w7,w5
 eor w11,w5,w5,ror#5
 add w9,w9,w13
 ushr v18.4s,v2.4s,#17
 orr w12,w12,w15
 ushr v19.4s,v2.4s,#10
 eor w11,w11,w5,ror#19
 eor w15,w9,w9,ror#11
 sli v18.4s,v2.4s,#15
 add w8,w8,w12
 ushr v17.4s,v2.4s,#19
 ror w11,w11,#6
 eor w13,w9,w10
 eor v19.16b,v19.16b,v18.16b
 eor w15,w15,w9,ror#20
 add w8,w8,w11
 sli v17.4s,v2.4s,#13
 ldr w12,[sp,#44]
 and w14,w14,w13
 ror w15,w15,#2
 ld1 {v4.4s},[x16], #16
 add w4,w4,w8
 eor v19.16b,v19.16b,v17.16b
 eor w14,w14,w10
 eor v17.16b,v17.16b,v17.16b
 add w7,w7,w12
 add w8,w8,w15
 and w12,w5,w4
 mov v17.d[1],v19.d[0]
 bic w15,w6,w4
 eor w11,w4,w4,ror#5
 add w8,w8,w14
 add v2.4s,v2.4s,v17.4s
 orr w12,w12,w15
 eor w11,w11,w4,ror#19
 eor w15,w8,w8,ror#11
 add v4.4s,v4.4s,v2.4s
 add w7,w7,w12
 ror w11,w11,#6
 eor w14,w8,w9
 eor w15,w15,w8,ror#20
 add w7,w7,w11
 ldr w12,[sp,#48]
 and w13,w13,w14
 ror w15,w15,#2
 add w3,w3,w7
 eor w13,w13,w9
 st1 {v4.4s},[x17], #16
 ext v4.16b,v3.16b,v0.16b,#4
 add w6,w6,w12
 add w7,w7,w15
 and w12,w4,w3
 bic w15,w5,w3
 ext v7.16b,v1.16b,v2.16b,#4
 eor w11,w3,w3,ror#5
 add w7,w7,w13
 mov d19,v2.d[1]
 orr w12,w12,w15
 eor w11,w11,w3,ror#19
 ushr v6.4s,v4.4s,#7
 eor w15,w7,w7,ror#11
 ushr v5.4s,v4.4s,#3
 add w6,w6,w12
 add v3.4s,v3.4s,v7.4s
 ror w11,w11,#6
 sli v6.4s,v4.4s,#25
 eor w13,w7,w8
 eor w15,w15,w7,ror#20
 ushr v7.4s,v4.4s,#18
 add w6,w6,w11
 ldr w12,[sp,#52]
 and w14,w14,w13
 eor v5.16b,v5.16b,v6.16b
 ror w15,w15,#2
 add w10,w10,w6
 sli v7.4s,v4.4s,#14
 eor w14,w14,w8
 ushr v16.4s,v19.4s,#17
 add w5,w5,w12
 add w6,w6,w15
 and w12,w3,w10
 eor v5.16b,v5.16b,v7.16b
 bic w15,w4,w10
 eor w11,w10,w10,ror#5
 sli v16.4s,v19.4s,#15
 add w6,w6,w14
 orr w12,w12,w15
 ushr v17.4s,v19.4s,#10
 eor w11,w11,w10,ror#19
 eor w15,w6,w6,ror#11
 ushr v7.4s,v19.4s,#19
 add w5,w5,w12
 ror w11,w11,#6
 add v3.4s,v3.4s,v5.4s
 eor w14,w6,w7
 eor w15,w15,w6,ror#20
 sli v7.4s,v19.4s,#13
 add w5,w5,w11
 ldr w12,[sp,#56]
 and w13,w13,w14
 eor v17.16b,v17.16b,v16.16b
 ror w15,w15,#2
 add w9,w9,w5
 eor w13,w13,w7
 eor v17.16b,v17.16b,v7.16b
 add w4,w4,w12
 add w5,w5,w15
 and w12,w10,w9
 add v3.4s,v3.4s,v17.4s
 bic w15,w3,w9
 eor w11,w9,w9,ror#5
 add w5,w5,w13
 ushr v18.4s,v3.4s,#17
 orr w12,w12,w15
 ushr v19.4s,v3.4s,#10
 eor w11,w11,w9,ror#19
 eor w15,w5,w5,ror#11
 sli v18.4s,v3.4s,#15
 add w4,w4,w12
 ushr v17.4s,v3.4s,#19
 ror w11,w11,#6
 eor w13,w5,w6
 eor v19.16b,v19.16b,v18.16b
 eor w15,w15,w5,ror#20
 add w4,w4,w11
 sli v17.4s,v3.4s,#13
 ldr w12,[sp,#60]
 and w14,w14,w13
 ror w15,w15,#2
 ld1 {v4.4s},[x16], #16
 add w8,w8,w4
 eor v19.16b,v19.16b,v17.16b
 eor w14,w14,w6
 eor v17.16b,v17.16b,v17.16b
 add w3,w3,w12
 add w4,w4,w15
 and w12,w9,w8
 mov v17.d[1],v19.d[0]
 bic w15,w10,w8
 eor w11,w8,w8,ror#5
 add w4,w4,w14
 add v3.4s,v3.4s,v17.4s
 orr w12,w12,w15
 eor w11,w11,w8,ror#19
 eor w15,w4,w4,ror#11
 add v4.4s,v4.4s,v3.4s
 add w3,w3,w12
 ror w11,w11,#6
 eor w14,w4,w5
 eor w15,w15,w4,ror#20
 add w3,w3,w11
 ldr w12,[x16]
 and w13,w13,w14
 ror w15,w15,#2
 add w7,w7,w3
 eor w13,w13,w5
 st1 {v4.4s},[x17], #16
 cmp w12,#0
 ldr w12,[sp,#0]
 sub x17,x17,#64
 bne .L_00_48

 sub x16,x16,#256
 cmp x1,x2
 mov x17, #64
 csel x17, x17, xzr, eq
 sub x1,x1,x17
 mov x17,sp
 add w10,w10,w12
 add w3,w3,w15
 and w12,w8,w7
 ld1 {v0.16b},[x1],#16
 bic w15,w9,w7
 eor w11,w7,w7,ror#5
 ld1 {v4.4s},[x16],#16
 add w3,w3,w13
 orr w12,w12,w15
 eor w11,w11,w7,ror#19
 eor w15,w3,w3,ror#11
 rev32 v0.16b,v0.16b
 add w10,w10,w12
 ror w11,w11,#6
 eor w13,w3,w4
 eor w15,w15,w3,ror#20
 add v4.4s,v4.4s,v0.4s
 add w10,w10,w11
 ldr w12,[sp,#4]
 and w14,w14,w13
 ror w15,w15,#2
 add w6,w6,w10
 eor w14,w14,w4
 add w9,w9,w12
 add w10,w10,w15
 and w12,w7,w6
 bic w15,w8,w6
 eor w11,w6,w6,ror#5
 add w10,w10,w14
 orr w12,w12,w15
 eor w11,w11,w6,ror#19
 eor w15,w10,w10,ror#11
 add w9,w9,w12
 ror w11,w11,#6
 eor w14,w10,w3
 eor w15,w15,w10,ror#20
 add w9,w9,w11
 ldr w12,[sp,#8]
 and w13,w13,w14
 ror w15,w15,#2
 add w5,w5,w9
 eor w13,w13,w3
 add w8,w8,w12
 add w9,w9,w15
 and w12,w6,w5
 bic w15,w7,w5
 eor w11,w5,w5,ror#5
 add w9,w9,w13
 orr w12,w12,w15
 eor w11,w11,w5,ror#19
 eor w15,w9,w9,ror#11
 add w8,w8,w12
 ror w11,w11,#6
 eor w13,w9,w10
 eor w15,w15,w9,ror#20
 add w8,w8,w11
 ldr w12,[sp,#12]
 and w14,w14,w13
 ror w15,w15,#2
 add w4,w4,w8
 eor w14,w14,w10
 add w7,w7,w12
 add w8,w8,w15
 and w12,w5,w4
 bic w15,w6,w4
 eor w11,w4,w4,ror#5
 add w8,w8,w14
 orr w12,w12,w15
 eor w11,w11,w4,ror#19
 eor w15,w8,w8,ror#11
 add w7,w7,w12
 ror w11,w11,#6
 eor w14,w8,w9
 eor w15,w15,w8,ror#20
 add w7,w7,w11
 ldr w12,[sp,#16]
 and w13,w13,w14
 ror w15,w15,#2
 add w3,w3,w7
 eor w13,w13,w9
 st1 {v4.4s},[x17], #16
 add w6,w6,w12
 add w7,w7,w15
 and w12,w4,w3
 ld1 {v1.16b},[x1],#16
 bic w15,w5,w3
 eor w11,w3,w3,ror#5
 ld1 {v4.4s},[x16],#16
 add w7,w7,w13
 orr w12,w12,w15
 eor w11,w11,w3,ror#19
 eor w15,w7,w7,ror#11
 rev32 v1.16b,v1.16b
 add w6,w6,w12
 ror w11,w11,#6
 eor w13,w7,w8
 eor w15,w15,w7,ror#20
 add v4.4s,v4.4s,v1.4s
 add w6,w6,w11
 ldr w12,[sp,#20]
 and w14,w14,w13
 ror w15,w15,#2
 add w10,w10,w6
 eor w14,w14,w8
 add w5,w5,w12
 add w6,w6,w15
 and w12,w3,w10
 bic w15,w4,w10
 eor w11,w10,w10,ror#5
 add w6,w6,w14
 orr w12,w12,w15
 eor w11,w11,w10,ror#19
 eor w15,w6,w6,ror#11
 add w5,w5,w12
 ror w11,w11,#6
 eor w14,w6,w7
 eor w15,w15,w6,ror#20
 add w5,w5,w11
 ldr w12,[sp,#24]
 and w13,w13,w14
 ror w15,w15,#2
 add w9,w9,w5
 eor w13,w13,w7
 add w4,w4,w12
 add w5,w5,w15
 and w12,w10,w9
 bic w15,w3,w9
 eor w11,w9,w9,ror#5
 add w5,w5,w13
 orr w12,w12,w15
 eor w11,w11,w9,ror#19
 eor w15,w5,w5,ror#11
 add w4,w4,w12
 ror w11,w11,#6
 eor w13,w5,w6
 eor w15,w15,w5,ror#20
 add w4,w4,w11
 ldr w12,[sp,#28]
 and w14,w14,w13
 ror w15,w15,#2
 add w8,w8,w4
 eor w14,w14,w6
 add w3,w3,w12
 add w4,w4,w15
 and w12,w9,w8
 bic w15,w10,w8
 eor w11,w8,w8,ror#5
 add w4,w4,w14
 orr w12,w12,w15
 eor w11,w11,w8,ror#19
 eor w15,w4,w4,ror#11
 add w3,w3,w12
 ror w11,w11,#6
 eor w14,w4,w5
 eor w15,w15,w4,ror#20
 add w3,w3,w11
 ldr w12,[sp,#32]
 and w13,w13,w14
 ror w15,w15,#2
 add w7,w7,w3
 eor w13,w13,w5
 st1 {v4.4s},[x17], #16
 add w10,w10,w12
 add w3,w3,w15
 and w12,w8,w7
 ld1 {v2.16b},[x1],#16
 bic w15,w9,w7
 eor w11,w7,w7,ror#5
 ld1 {v4.4s},[x16],#16
 add w3,w3,w13
 orr w12,w12,w15
 eor w11,w11,w7,ror#19
 eor w15,w3,w3,ror#11
 rev32 v2.16b,v2.16b
 add w10,w10,w12
 ror w11,w11,#6
 eor w13,w3,w4
 eor w15,w15,w3,ror#20
 add v4.4s,v4.4s,v2.4s
 add w10,w10,w11
 ldr w12,[sp,#36]
 and w14,w14,w13
 ror w15,w15,#2
 add w6,w6,w10
 eor w14,w14,w4
 add w9,w9,w12
 add w10,w10,w15
 and w12,w7,w6
 bic w15,w8,w6
 eor w11,w6,w6,ror#5
 add w10,w10,w14
 orr w12,w12,w15
 eor w11,w11,w6,ror#19
 eor w15,w10,w10,ror#11
 add w9,w9,w12
 ror w11,w11,#6
 eor w14,w10,w3
 eor w15,w15,w10,ror#20
 add w9,w9,w11
 ldr w12,[sp,#40]
 and w13,w13,w14
 ror w15,w15,#2
 add w5,w5,w9
 eor w13,w13,w3
 add w8,w8,w12
 add w9,w9,w15
 and w12,w6,w5
 bic w15,w7,w5
 eor w11,w5,w5,ror#5
 add w9,w9,w13
 orr w12,w12,w15
 eor w11,w11,w5,ror#19
 eor w15,w9,w9,ror#11
 add w8,w8,w12
 ror w11,w11,#6
 eor w13,w9,w10
 eor w15,w15,w9,ror#20
 add w8,w8,w11
 ldr w12,[sp,#44]
 and w14,w14,w13
 ror w15,w15,#2
 add w4,w4,w8
 eor w14,w14,w10
 add w7,w7,w12
 add w8,w8,w15
 and w12,w5,w4
 bic w15,w6,w4
 eor w11,w4,w4,ror#5
 add w8,w8,w14
 orr w12,w12,w15
 eor w11,w11,w4,ror#19
 eor w15,w8,w8,ror#11
 add w7,w7,w12
 ror w11,w11,#6
 eor w14,w8,w9
 eor w15,w15,w8,ror#20
 add w7,w7,w11
 ldr w12,[sp,#48]
 and w13,w13,w14
 ror w15,w15,#2
 add w3,w3,w7
 eor w13,w13,w9
 st1 {v4.4s},[x17], #16
 add w6,w6,w12
 add w7,w7,w15
 and w12,w4,w3
 ld1 {v3.16b},[x1],#16
 bic w15,w5,w3
 eor w11,w3,w3,ror#5
 ld1 {v4.4s},[x16],#16
 add w7,w7,w13
 orr w12,w12,w15
 eor w11,w11,w3,ror#19
 eor w15,w7,w7,ror#11
 rev32 v3.16b,v3.16b
 add w6,w6,w12
 ror w11,w11,#6
 eor w13,w7,w8
 eor w15,w15,w7,ror#20
 add v4.4s,v4.4s,v3.4s
 add w6,w6,w11
 ldr w12,[sp,#52]
 and w14,w14,w13
 ror w15,w15,#2
 add w10,w10,w6
 eor w14,w14,w8
 add w5,w5,w12
 add w6,w6,w15
 and w12,w3,w10
 bic w15,w4,w10
 eor w11,w10,w10,ror#5
 add w6,w6,w14
 orr w12,w12,w15
 eor w11,w11,w10,ror#19
 eor w15,w6,w6,ror#11
 add w5,w5,w12
 ror w11,w11,#6
 eor w14,w6,w7
 eor w15,w15,w6,ror#20
 add w5,w5,w11
 ldr w12,[sp,#56]
 and w13,w13,w14
 ror w15,w15,#2
 add w9,w9,w5
 eor w13,w13,w7
 add w4,w4,w12
 add w5,w5,w15
 and w12,w10,w9
 bic w15,w3,w9
 eor w11,w9,w9,ror#5
 add w5,w5,w13
 orr w12,w12,w15
 eor w11,w11,w9,ror#19
 eor w15,w5,w5,ror#11
 add w4,w4,w12
 ror w11,w11,#6
 eor w13,w5,w6
 eor w15,w15,w5,ror#20
 add w4,w4,w11
 ldr w12,[sp,#60]
 and w14,w14,w13
 ror w15,w15,#2
 add w8,w8,w4
 eor w14,w14,w6
 add w3,w3,w12
 add w4,w4,w15
 and w12,w9,w8
 bic w15,w10,w8
 eor w11,w8,w8,ror#5
 add w4,w4,w14
 orr w12,w12,w15
 eor w11,w11,w8,ror#19
 eor w15,w4,w4,ror#11
 add w3,w3,w12
 ror w11,w11,#6
 eor w14,w4,w5
 eor w15,w15,w4,ror#20
 add w3,w3,w11
 and w13,w13,w14
 ror w15,w15,#2
 add w7,w7,w3
 eor w13,w13,w5
 st1 {v4.4s},[x17], #16
 add w3,w3,w15
 ldp w11,w12,[x0,#0]
 add w3,w3,w13
 ldp w13,w14,[x0,#8]
 add w3,w3,w11
 add w4,w4,w12
 ldp w11,w12,[x0,#16]
 add w5,w5,w13
 add w6,w6,w14
 ldp w13,w14,[x0,#24]
 add w7,w7,w11
 add w8,w8,w12
 ldr w12,[sp,#0]
 stp w3,w4,[x0,#0]
 add w9,w9,w13
 mov w13,wzr
 stp w5,w6,[x0,#8]
 add w10,w10,w14
 stp w7,w8,[x0,#16]
 eor w14,w4,w5
 stp w9,w10,[x0,#24]
 mov w15,wzr
 mov x17,sp
 b.ne .L_00_48

 ldr x29,[x29]
 add sp,sp,#16*4+16
 ret
.size sha256_block_neon,.-sha256_block_neon
.section .note.GNU-stack,"",%progbits
