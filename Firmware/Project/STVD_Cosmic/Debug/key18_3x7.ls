   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L7_SCAN_GPIO_PORT:
  22  0000 500a          	dc.w	20490
  23  0002 500a          	dc.w	20490
  24  0004 500a          	dc.w	20490
  25                     .const:	section	.text
  26  0000               L11_SCAN_GPIO_PIN:
  27  0000 0080          	dc.w	128
  28  0002 0040          	dc.w	64
  29  0004 0020          	dc.w	32
  30  0006               L31_NB_SC_4_RT:
  31  0006 03            	dc.b	3
  32  0007 03            	dc.b	3
  33  0008 03            	dc.b	3
  34  0009 03            	dc.b	3
  35  000a 02            	dc.b	2
  36  000b 02            	dc.b	2
  37  000c 02            	dc.b	2
  38  000d               L51_NB_SC_4_RT_ACC:
  39  000d 00            	dc.b	0
  40  000e 03            	dc.b	3
  41  000f 06            	dc.b	6
  42  0010 09            	dc.b	9
  43  0011 0c            	dc.b	12
  44  0012 0e            	dc.b	14
  45  0013 10            	dc.b	16
  46  0014               L71_NB_RT_4_SC:
  47  0014 07            	dc.b	7
  48  0015 07            	dc.b	7
  49  0016 04            	dc.b	4
  50  0017               L12_NB_RT_4_SC_ACC:
  51  0017 00            	dc.b	0
  52  0018 07            	dc.b	7
  53  0019 0e            	dc.b	14
  54  001a               L32_KEY_VALUE_MAP:
  55  001a 01            	dc.b	1
  56  001b 02            	dc.b	2
  57  001c 03            	dc.b	3
  58  001d 04            	dc.b	4
  59  001e 05            	dc.b	5
  60  001f 06            	dc.b	6
  61  0020 07            	dc.b	7
  62  0021 08            	dc.b	8
  63  0022 09            	dc.b	9
  64  0023 00            	dc.b	0
  65  0024 0a            	dc.b	10
  66  0025 0d            	dc.b	13
  67  0026 0e            	dc.b	14
  68  0027 12            	dc.b	18
  69  0028 16            	dc.b	22
  70  0029 13            	dc.b	19
  71  002a 17            	dc.b	23
  72  002b 10            	dc.b	16
  73  002c               _KeypadType_18_3x7:
  74  002c 03            	dc.b	3
  75  002d 07            	dc.b	7
  76  002e 12            	dc.b	18
  77  002f 001a          	dc.w	L32_KEY_VALUE_MAP
  79  0031 0000          	dc.w	L3_KpdInit
  81  0033 0043          	dc.w	L5_KpdScan
  82                     ; 242 static void KpdInit(void)
  82                     ; 243 {
  83                     	scross	off
  84                     	switch	.text
  85  0000               L3_KpdInit:
  87                     ; 177   GPIO_Init(KPD_SCA0_GPIO_PORT, KPD_SCA0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  88  0000 4bd0          	push	#208
  89  0002 4b80          	push	#128
  90  0004 ae500a        	ldw	x,#20490
  91  0007 cd0000        	call	_GPIO_Init
  93  000a 85            	popw	x
  94                     ; 178   GPIO_Init(KPD_SCA1_GPIO_PORT, KPD_SCA1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  95  000b 4bd0          	push	#208
  96  000d 4b40          	push	#64
  97  000f ae500a        	ldw	x,#20490
  98  0012 cd0000        	call	_GPIO_Init
 100  0015 85            	popw	x
 101                     ; 179   GPIO_Init(KPD_SCA2_GPIO_PORT, KPD_SCA2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 102  0016 4bd0          	push	#208
 103  0018 4b20          	push	#32
 104  001a ae500a        	ldw	x,#20490
 105  001d cd0000        	call	_GPIO_Init
 107  0020 85            	popw	x
 108                     ; 193   GPIO_Init(KPD_MUXA_GPIO_PORT, KPD_MUXA_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 109  0021 4b40          	push	#64
 110  0023 4b80          	push	#128
 111  0025 ae501e        	ldw	x,#20510
 112  0028 cd0000        	call	_GPIO_Init
 114  002b 85            	popw	x
 115                     ; 194   GPIO_Init(KPD_MUXB_GPIO_PORT, KPD_MUXB_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 116  002c 4b40          	push	#64
 117  002e 4b40          	push	#64
 118  0030 ae501e        	ldw	x,#20510
 119  0033 cd0000        	call	_GPIO_Init
 121  0036 85            	popw	x
 122                     ; 195   GPIO_Init(KPD_MUXC_GPIO_PORT, KPD_MUXC_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 123  0037 4b40          	push	#64
 124  0039 4b20          	push	#32
 125  003b ae501e        	ldw	x,#20510
 126  003e cd0000        	call	_GPIO_Init
 128  0041 85            	popw	x
 129                     ; 246 }
 130  0042 81            	ret	
 132                     	switch	.data
 133  0006               L34_KeyScanLineNb:
 134  0006 00            	dc.b	0
 135                     ; 255 static void KpdScan(KEY_INFO_T * pKeyInfo)
 135                     ; 256 {
 136                     	switch	.text
 137  0043               L5_KpdScan:
 138  0043 89            	pushw	x
 139  0044 520b          	subw	sp,#11
 140       0000000b      OFST:	set	11
 142                     ; 328   return SystemTimer;
 143  0046 ce0002        	ldw	x,_SystemTimer+2
 144  0049 1f09          	ldw	(OFST-2,sp),x
 145  004b ce0000        	ldw	x,_SystemTimer
 146  004e 1f07          	ldw	(OFST-4,sp),x
 149  0050 96            	ldw	x,sp
 150  0051 1c0007        	addw	x,#OFST-4
 151  0054 cd0000        	call	c_ltor
 153                     ; 259   uint8_t  keyRetLineNb = 0;
 154  0057 0f0b          	clr	(OFST+0,sp)
 155                     ; 261   ClrScanLine(KeyScanLineNb);
 156  0059 c60006        	ld	a,L34_KeyScanLineNb
 157  005c 6b06          	ld	(OFST-5,sp),a
 158                     ; 215   ((GPIO_TypeDef *)(SCAN_GPIO_PORT[nb]))->ODR &= ~SCAN_GPIO_PIN[nb];
 159  005e cd019c        	call	LC002
 160  0061 90d60001      	ld	a,(L11_SCAN_GPIO_PIN+1,y)
 161  0065 43            	cpl	a
 162  0066 f4            	and	a,(x)
 163  0067 f7            	ld	(x),a
 164  0068 cc0164        	jra	L36
 165  006b               L75:
 166                     ; 226   int8_t logicVal = 0;
 167  006b 0f04          	clr	(OFST-7,sp)
 168                     ; 228   logicVal |= (int8_t)((KPD_MUXA_GPIO_PORT->IDR & KPD_MUXA_GPIO_PIN) ? 0: 1<<0);
 169  006d 720f501f03    	btjf	20511,#7,L22
 170  0072 4f            	clr	a
 171  0073 2002          	jra	L42
 172  0075               L22:
 173  0075 a601          	ld	a,#1
 174  0077               L42:
 175  0077 1a04          	or	a,(OFST-7,sp)
 176  0079 6b04          	ld	(OFST-7,sp),a
 177                     ; 229   logicVal |= (int8_t)((KPD_MUXB_GPIO_PORT->IDR & KPD_MUXB_GPIO_PIN) ? 0: 1<<1);
 178  007b 720d501f03    	btjf	20511,#6,L62
 179  0080 4f            	clr	a
 180  0081 2002          	jra	L03
 181  0083               L62:
 182  0083 a602          	ld	a,#2
 183  0085               L03:
 184  0085 1a04          	or	a,(OFST-7,sp)
 185  0087 6b04          	ld	(OFST-7,sp),a
 186                     ; 230   logicVal |= (int8_t)((KPD_MUXC_GPIO_PORT->IDR & KPD_MUXC_GPIO_PIN) ? 0: 1<<2);
 187  0089 720b501f03    	btjf	20511,#5,L23
 188  008e 4f            	clr	a
 189  008f 2002          	jra	L43
 190  0091               L23:
 191  0091 a604          	ld	a,#4
 192  0093               L43:
 193  0093 1a04          	or	a,(OFST-7,sp)
 194  0095 6b04          	ld	(OFST-7,sp),a
 195                     ; 231   val = (uint8_t)((logicVal - 1) == nb ? LOW : HIGH);
 196  0097 5f            	clrw	x
 197  0098 4d            	tnz	a
 198  0099 2a01          	jrpl	L04
 199  009b 53            	cplw	x
 200  009c               L04:
 201  009c 97            	ld	xl,a
 202  009d 5a            	decw	x
 203  009e 7b0b          	ld	a,(OFST+0,sp)
 204  00a0 905f          	clrw	y
 205  00a2 9097          	ld	yl,a
 206  00a4 90bf00        	ldw	c_y,y
 207  00a7 b300          	cpw	x,c_y
 208  00a9 2603          	jrne	L63
 209  00ab 4f            	clr	a
 210  00ac 2002          	jra	L24
 211  00ae               L63:
 212  00ae a601          	ld	a,#1
 213  00b0               L24:
 214  00b0 6b03          	ld	(OFST-8,sp),a
 215                     ; 233   return val;
 216  00b2 6b05          	ld	(OFST-6,sp),a
 219  00b4 2603          	jrne	L44
 220  00b6 4c            	inc	a
 221  00b7 2001          	jra	L64
 222  00b9               L44:
 223  00b9 4f            	clr	a
 224  00ba               L64:
 225  00ba 6b05          	ld	(OFST-6,sp),a
 226                     ; 271     keyScanNo = KEY_VALUE_MAP[(uint8_t)(NB_RT_4_SC_ACC[KeyScanLineNb] + keyRetLineNb)];
 227  00bc 5f            	clrw	x
 228  00bd c60006        	ld	a,L34_KeyScanLineNb
 229  00c0 97            	ld	xl,a
 230  00c1 d60017        	ld	a,(L12_NB_RT_4_SC_ACC,x)
 231  00c4 1b0b          	add	a,(OFST+0,sp)
 232  00c6 5f            	clrw	x
 233  00c7 97            	ld	xl,a
 234  00c8 d6001a        	ld	a,(L32_KEY_VALUE_MAP,x)
 235  00cb 6b06          	ld	(OFST-5,sp),a
 236                     ; 274     if(keyPressState != pKeyInfo[keyScanNo].press)
 237  00cd cd01a9        	call	LC003
 238  00d0 72fb0c        	addw	x,(OFST+1,sp)
 239  00d3 e601          	ld	a,(1,x)
 240  00d5 1105          	cp	a,(OFST-6,sp)
 241  00d7 2777          	jreq	L76
 242                     ; 277       if(pKeyInfo[keyScanNo].debounce == TRUE)
 243  00d9 e602          	ld	a,(2,x)
 244  00db 4a            	dec	a
 245  00dc 265c          	jrne	L17
 246                     ; 279         int32_t debounce = (int32_t)KPD_GetDebounceTime();
 247  00de cd0000        	call	_KPD_GetDebounceTime
 249  00e1 b703          	ld	c_lreg+3,a
 250  00e3 3f02          	clr	c_lreg+2
 251  00e5 3f01          	clr	c_lreg+1
 252  00e7 3f00          	clr	c_lreg
 253  00e9 96            	ldw	x,sp
 254  00ea 5c            	incw	x
 255  00eb cd0000        	call	c_rtol
 257                     ; 281         if(absolute((int32_t)(bspSysTime - pKeyInfo[keyScanNo].backuptime)) >= debounce)
 258  00ee 96            	ldw	x,sp
 259  00ef 1c0007        	addw	x,#OFST-4
 260  00f2 cd0000        	call	c_ltor
 262  00f5 7b06          	ld	a,(OFST-5,sp)
 263  00f7 cd01a9        	call	LC003
 264  00fa 72fb0c        	addw	x,(OFST+1,sp)
 265  00fd 1c0003        	addw	x,#3
 266  0100 cd0000        	call	c_lsub
 268  0103 be02          	ldw	x,c_lreg+2
 269  0105 89            	pushw	x
 270  0106 be00          	ldw	x,c_lreg
 271  0108 89            	pushw	x
 272  0109 cd0000        	call	_absolute
 274  010c 5b04          	addw	sp,#4
 275  010e 96            	ldw	x,sp
 276  010f 5c            	incw	x
 277  0110 cd0000        	call	c_lcmp
 279  0113 2f3d          	jrslt	L77
 280                     ; 284           pKeyInfo[keyScanNo].press = (uint8_t)(
 280                     ; 285             pKeyInfo[keyScanNo].press == OPEN ? CLOSED : OPEN);
 281  0115 7b06          	ld	a,(OFST-5,sp)
 282  0117 cd01a9        	call	LC003
 283  011a 72fb0c        	addw	x,(OFST+1,sp)
 284  011d 89            	pushw	x
 285  011e 7b08          	ld	a,(OFST-3,sp)
 286  0120 cd01a9        	call	LC003
 287  0123 72fb0e        	addw	x,(OFST+3,sp)
 288  0126 e601          	ld	a,(1,x)
 289  0128 2603          	jrne	L45
 290  012a 4c            	inc	a
 291  012b 2001          	jra	L65
 292  012d               L45:
 293  012d 4f            	clr	a
 294  012e               L65:
 295  012e 85            	popw	x
 296  012f e701          	ld	(1,x),a
 297                     ; 286           pKeyInfo[keyScanNo].debounce = FALSE;
 298  0131 7b06          	ld	a,(OFST-5,sp)
 299  0133 ad74          	call	LC003
 300  0135 72fb0c        	addw	x,(OFST+1,sp)
 301  0138 2016          	jp	L76
 302  013a               L17:
 303                     ; 295         pKeyInfo[keyScanNo].backuptime = bspSysTime;
 304  013a 7b0a          	ld	a,(OFST-1,sp)
 305  013c e706          	ld	(6,x),a
 306  013e 7b09          	ld	a,(OFST-2,sp)
 307  0140 e705          	ld	(5,x),a
 308  0142 7b08          	ld	a,(OFST-3,sp)
 309  0144 e704          	ld	(4,x),a
 310  0146 7b07          	ld	a,(OFST-4,sp)
 311  0148 e703          	ld	(3,x),a
 312                     ; 296         pKeyInfo[keyScanNo].debounce = TRUE;
 313  014a a601          	ld	a,#1
 314  014c e702          	ld	(2,x),a
 315  014e 2002          	jra	L77
 316  0150               L76:
 317                     ; 301       pKeyInfo[keyScanNo].debounce = FALSE;
 318  0150 6f02          	clr	(2,x)
 319  0152               L77:
 320                     ; 304     KPD_SetState(keyScanNo, pKeyInfo[keyScanNo].press);
 321  0152 7b06          	ld	a,(OFST-5,sp)
 322  0154 ad53          	call	LC003
 323  0156 72fb0c        	addw	x,(OFST+1,sp)
 324  0159 e601          	ld	a,(1,x)
 325  015b 97            	ld	xl,a
 326  015c 7b06          	ld	a,(OFST-5,sp)
 327  015e 95            	ld	xh,a
 328  015f cd0000        	call	_KPD_SetState
 330                     ; 263   for(; keyRetLineNb < NB_RT_4_SC[KeyScanLineNb]; keyRetLineNb++)
 331  0162 0c0b          	inc	(OFST+0,sp)
 332  0164               L36:
 334  0164 c60006        	ld	a,L34_KeyScanLineNb
 335  0167 5f            	clrw	x
 336  0168 97            	ld	xl,a
 337  0169 d60014        	ld	a,(L71_NB_RT_4_SC,x)
 338  016c 110b          	cp	a,(OFST+0,sp)
 339  016e 2303cc006b    	jrugt	L75
 340                     ; 307   SetScanLine(KeyScanLineNb);
 341  0173 c60006        	ld	a,L34_KeyScanLineNb
 342                     ; 205   ((GPIO_TypeDef *)(SCAN_GPIO_PORT[nb]))->ODR |= SCAN_GPIO_PIN[nb];
 343  0176 ad24          	call	LC002
 344  0178 f6            	ld	a,(x)
 345  0179 90da0001      	or	a,(L11_SCAN_GPIO_PIN+1,y)
 346  017d f7            	ld	(x),a
 347                     ; 309   KeyScanLineNb++;
 348  017e 725c0006      	inc	L34_KeyScanLineNb
 349                     ; 310   KeyScanLineNb %= MAX_SC_LINES;
 350  0182 5f            	clrw	x
 351  0183 c60006        	ld	a,L34_KeyScanLineNb
 352  0186 97            	ld	xl,a
 353  0187 a603          	ld	a,#3
 354  0189 62            	div	x,a
 355  018a 5f            	clrw	x
 356  018b 97            	ld	xl,a
 357  018c 01            	rrwa	x,a
 358  018d c70006        	ld	L34_KeyScanLineNb,a
 359                     ; 312   ClrScanLine(KeyScanLineNb);
 360                     ; 215   ((GPIO_TypeDef *)(SCAN_GPIO_PORT[nb]))->ODR &= ~SCAN_GPIO_PIN[nb];
 361  0190 ad0a          	call	LC002
 362  0192 90d60001      	ld	a,(L11_SCAN_GPIO_PIN+1,y)
 363  0196 43            	cpl	a
 364  0197 f4            	and	a,(x)
 365  0198 f7            	ld	(x),a
 367  0199 5b0d          	addw	sp,#13
 368  019b 81            	ret	
 369  019c               LC002:
 370  019c 5f            	clrw	x
 371  019d 97            	ld	xl,a
 372  019e 58            	sllw	x
 373  019f 905f          	clrw	y
 374  01a1 de0000        	ldw	x,(L7_SCAN_GPIO_PORT,x)
 375  01a4 9097          	ld	yl,a
 376  01a6 9058          	sllw	y
 377  01a8 81            	ret	
 378  01a9               LC003:
 379  01a9 97            	ld	xl,a
 380  01aa a607          	ld	a,#7
 381  01ac 42            	mul	x,a
 382  01ad 81            	ret	
 384                     	xdef	_KeypadType_18_3x7
 385                     	xref	_TurretExecute
 386                     	xref	_KPD_GetDebounceTime
 387                     	xref	_KPD_SetState
 388                     	xref	_absolute
 389                     	xref	_SensorCounter
 390                     	xref	_CounterMode
 391                     	xref	_FlagSensorEn
 392                     	xref	_FlagUvDetect
 393                     	xref	_FlagAddCount
 394                     	xref	_FlagAutoCount
 395                     	xref	_FlagValueCount
 396                     	xref	_SystemTimer
 397                     	xref	_AdcValue
 398                     	xref	_BuzzerOnTime
 399                     	xref	_GPIO_Init
 400                     	xref.b	c_lreg
 401                     	xref.b	c_y
 402                     	xref	c_lcmp
 403                     	xref	c_lsub
 404                     	xref	c_rtol
 405                     	xref	c_ltor
 406                     	end
