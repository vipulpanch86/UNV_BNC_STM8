   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               _APR_Array:
  22  0000 00            	dc.b	0
  23  0001 1e            	dc.b	30
  24  0002 1e            	dc.b	30
  25  0003 1e            	dc.b	30
  26  0004 1e            	dc.b	30
  27  0005 1e            	dc.b	30
  28  0006 1e            	dc.b	30
  29  0007 1e            	dc.b	30
  30  0008 1e            	dc.b	30
  31  0009 1e            	dc.b	30
  32  000a 1e            	dc.b	30
  33  000b 1e            	dc.b	30
  34  000c 1e            	dc.b	30
  35  000d 3d            	dc.b	61
  36  000e 17            	dc.b	23
  37  000f 17            	dc.b	23
  38  0010 3e            	dc.b	62
  39  0011               _TBR_Array:
  40  0011 00            	dc.b	0
  41  0012 01            	dc.b	1
  42  0013 02            	dc.b	2
  43  0014 03            	dc.b	3
  44  0015 04            	dc.b	4
  45  0016 05            	dc.b	5
  46  0017 06            	dc.b	6
  47  0018 07            	dc.b	7
  48  0019 08            	dc.b	8
  49  001a 09            	dc.b	9
  50  001b 0a            	dc.b	10
  51  001c 0b            	dc.b	11
  52  001d 0c            	dc.b	12
  53  001e 0c            	dc.b	12
  54  001f 0e            	dc.b	14
  55  0020 0f            	dc.b	15
  56  0021 0f            	dc.b	15
  57                     ; 73 void AWU_DeInit(void)
  57                     ; 74 {
  58                     	scross	off
  59                     	switch	.text
  60  0000               _AWU_DeInit:
  62                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  63  0000 725f50f0      	clr	20720
  64                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  65  0004 353f50f1      	mov	20721,#63
  66                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
  67  0008 725f50f2      	clr	20722
  68                     ; 78 }
  69  000c 81            	ret	
  71                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
  71                     ; 89 {
  72  000d               _AWU_Init:
  73  000d 88            	push	a
  74       00000000      OFST:	set	0
  76                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
  77  000e 4d            	tnz	a
  78  000f 274e          	jreq	L21
  79  0011 a101          	cp	a,#1
  80  0013 274a          	jreq	L21
  81  0015 a102          	cp	a,#2
  82  0017 2746          	jreq	L21
  83  0019 a103          	cp	a,#3
  84  001b 2742          	jreq	L21
  85  001d a104          	cp	a,#4
  86  001f 273e          	jreq	L21
  87  0021 a105          	cp	a,#5
  88  0023 273a          	jreq	L21
  89  0025 a106          	cp	a,#6
  90  0027 2736          	jreq	L21
  91  0029 a107          	cp	a,#7
  92  002b 2732          	jreq	L21
  93  002d a108          	cp	a,#8
  94  002f 272e          	jreq	L21
  95  0031 a109          	cp	a,#9
  96  0033 272a          	jreq	L21
  97  0035 a10a          	cp	a,#10
  98  0037 2726          	jreq	L21
  99  0039 a10b          	cp	a,#11
 100  003b 2722          	jreq	L21
 101  003d a10c          	cp	a,#12
 102  003f 271e          	jreq	L21
 103  0041 a10d          	cp	a,#13
 104  0043 271a          	jreq	L21
 105  0045 a10e          	cp	a,#14
 106  0047 2716          	jreq	L21
 107  0049 a10f          	cp	a,#15
 108  004b 2712          	jreq	L21
 109  004d a110          	cp	a,#16
 110  004f 270e          	jreq	L21
 111  0051 ae005b        	ldw	x,#91
 112  0054 89            	pushw	x
 113  0055 5f            	clrw	x
 114  0056 89            	pushw	x
 115  0057 ae002e        	ldw	x,#L3
 116  005a cd0000        	call	_assert_failed
 118  005d 5b04          	addw	sp,#4
 119  005f               L21:
 120                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 121  005f 721850f0      	bset	20720,#4
 122                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 123  0063 c650f2        	ld	a,20722
 124  0066 a4f0          	and	a,#240
 125  0068 c750f2        	ld	20722,a
 126                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 127  006b 7b01          	ld	a,(OFST+1,sp)
 128  006d 5f            	clrw	x
 129  006e 97            	ld	xl,a
 130  006f c650f2        	ld	a,20722
 131  0072 da0011        	or	a,(_TBR_Array,x)
 132  0075 c750f2        	ld	20722,a
 133                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 134  0078 c650f1        	ld	a,20721
 135  007b a4c0          	and	a,#192
 136  007d c750f1        	ld	20721,a
 137                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 138  0080 7b01          	ld	a,(OFST+1,sp)
 139  0082 5f            	clrw	x
 140  0083 97            	ld	xl,a
 141  0084 c650f1        	ld	a,20721
 142  0087 da0000        	or	a,(_APR_Array,x)
 143  008a c750f1        	ld	20721,a
 144                     ; 103 }
 145  008d 84            	pop	a
 146  008e 81            	ret	
 148                     ; 112 void AWU_Cmd(FunctionalState NewState)
 148                     ; 113 {
 149  008f               _AWU_Cmd:
 151                     ; 114   if (NewState != DISABLE)
 152  008f 4d            	tnz	a
 153  0090 2705          	jreq	L5
 154                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 155  0092 721850f0      	bset	20720,#4
 157  0096 81            	ret	
 158  0097               L5:
 159                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 160  0097 721950f0      	bres	20720,#4
 161                     ; 124 }
 162  009b 81            	ret	
 164                     	switch	.const
 165  0022               L42:
 166  0022 0001adb0      	dc.l	110000
 167  0026               L62:
 168  0026 000249f1      	dc.l	150001
 169  002a               L43:
 170  002a 000003e8      	dc.l	1000
 171                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 171                     ; 140 {
 172                     	switch	.text
 173  009c               _AWU_LSICalibrationConfig:
 174  009c 5206          	subw	sp,#6
 175       00000006      OFST:	set	6
 177                     ; 141   uint16_t lsifreqkhz = 0x0;
 178                     ; 142   uint16_t A = 0x0;
 179                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 180  009e 96            	ldw	x,sp
 181  009f 1c0009        	addw	x,#OFST+3
 182  00a2 cd0000        	call	c_ltor
 184  00a5 ae0022        	ldw	x,#L42
 185  00a8 cd0000        	call	c_lcmp
 187  00ab 250f          	jrult	L22
 188  00ad 96            	ldw	x,sp
 189  00ae 1c0009        	addw	x,#OFST+3
 190  00b1 cd0000        	call	c_ltor
 192  00b4 ae0026        	ldw	x,#L62
 193  00b7 cd0000        	call	c_lcmp
 195  00ba 250e          	jrult	L03
 196  00bc               L22:
 197  00bc ae0091        	ldw	x,#145
 198  00bf 89            	pushw	x
 199  00c0 5f            	clrw	x
 200  00c1 89            	pushw	x
 201  00c2 ae002e        	ldw	x,#L3
 202  00c5 cd0000        	call	_assert_failed
 204  00c8 5b04          	addw	sp,#4
 205  00ca               L03:
 206                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 207  00ca 96            	ldw	x,sp
 208  00cb 1c0009        	addw	x,#OFST+3
 209  00ce cd0000        	call	c_ltor
 211  00d1 ae002a        	ldw	x,#L43
 212  00d4 cd0000        	call	c_ludv
 214  00d7 be02          	ldw	x,c_lreg+2
 215  00d9 1f03          	ldw	(OFST-3,sp),x
 216                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 217  00db 54            	srlw	x
 218  00dc 54            	srlw	x
 219  00dd 1f05          	ldw	(OFST-1,sp),x
 220                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 221  00df 58            	sllw	x
 222  00e0 58            	sllw	x
 223  00e1 1f01          	ldw	(OFST-5,sp),x
 224  00e3 1e03          	ldw	x,(OFST-3,sp)
 225  00e5 72f001        	subw	x,(OFST-5,sp)
 226  00e8 1605          	ldw	y,(OFST-1,sp)
 227  00ea 9058          	sllw	y
 228  00ec 905c          	incw	y
 229  00ee cd0000        	call	c_imul
 231  00f1 1605          	ldw	y,(OFST-1,sp)
 232  00f3 9058          	sllw	y
 233  00f5 bf00          	ldw	c_x,x
 234  00f7 9058          	sllw	y
 235  00f9 90b300        	cpw	y,c_x
 236  00fc 7b06          	ld	a,(OFST+0,sp)
 237  00fe 2504          	jrult	L11
 238                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 239  0100 a002          	sub	a,#2
 241  0102 2001          	jra	L31
 242  0104               L11:
 243                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 244  0104 4a            	dec	a
 245  0105               L31:
 246  0105 c750f1        	ld	20721,a
 247                     ; 161 }
 248  0108 5b06          	addw	sp,#6
 249  010a 81            	ret	
 251                     ; 168 void AWU_IdleModeEnable(void)
 251                     ; 169 {
 252  010b               _AWU_IdleModeEnable:
 254                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 255  010b 721950f0      	bres	20720,#4
 256                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 257  010f 35f050f2      	mov	20722,#240
 258                     ; 175 }
 259  0113 81            	ret	
 261                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 261                     ; 184 {
 262  0114               _AWU_GetFlagStatus:
 264                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 265  0114 720a50f002    	btjt	20720,#5,L24
 266  0119 4f            	clr	a
 267  011a 81            	ret	
 268  011b               L24:
 269  011b a601          	ld	a,#1
 271  011d 81            	ret	
 273                     	xdef	_TBR_Array
 274                     	xdef	_APR_Array
 275                     	xdef	_AWU_GetFlagStatus
 276                     	xdef	_AWU_IdleModeEnable
 277                     	xdef	_AWU_LSICalibrationConfig
 278                     	xdef	_AWU_Cmd
 279                     	xdef	_AWU_Init
 280                     	xdef	_AWU_DeInit
 281                     	xref	_assert_failed
 282                     	switch	.const
 283  002e               L3:
 284  002e 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 285  0040 6970685f6472  	dc.b	"iph_driver\src\stm"
 286  0052 38735f617775  	dc.b	"8s_awu.c",0
 287                     	xref.b	c_lreg
 288                     	xref.b	c_x
 289                     	xref	c_imul
 290                     	xref	c_ludv
 291                     	xref	c_lcmp
 292                     	xref	c_ltor
 293                     	end
