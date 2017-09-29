   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L3_SEG_16N:
  22  0000 00ff          	dc.w	255
  23  0002 000c          	dc.w	12
  24  0004 0377          	dc.w	887
  25  0006 033f          	dc.w	831
  26  0008 038c          	dc.w	908
  27  000a 03bb          	dc.w	955
  28  000c 03fb          	dc.w	1019
  29  000e 000f          	dc.w	15
  30  0010 03ff          	dc.w	1023
  31  0012 03bf          	dc.w	959
  32  0014               L5_SEG_16A:
  33  0014 03cf          	dc.w	975
  34  0016 4a3f          	dc.w	19007
  35  0018 00f3          	dc.w	243
  36  001a 483f          	dc.w	18495
  37  001c 03f3          	dc.w	1011
  38  001e 01c3          	dc.w	451
  39  0020 02fb          	dc.w	763
  40  0022 03cc          	dc.w	972
  41  0024 4833          	dc.w	18483
  42  0026 007c          	dc.w	124
  43  0028 31c0          	dc.w	12736
  44  002a 00f0          	dc.w	240
  45  002c 14cc          	dc.w	5324
  46  002e 24cc          	dc.w	9420
  47  0030 00ff          	dc.w	255
  48  0032 03c7          	dc.w	967
  49  0034 20ff          	dc.w	8447
  50  0036 23c7          	dc.w	9159
  51  0038 03bb          	dc.w	955
  52  003a 4803          	dc.w	18435
  53  003c 00fc          	dc.w	252
  54  003e 90c0          	dc.w	-28480
  55  0040 a0cc          	dc.w	-24372
  56  0042 b400          	dc.w	-19456
  57  0044 5400          	dc.w	21504
  58  0046 9033          	dc.w	-28621
  59  0048               L7_SEG_7N:
  60  0048 3f            	dc.b	63
  61  0049 06            	dc.b	6
  62  004a 5b            	dc.b	91
  63  004b 4f            	dc.b	79
  64  004c 66            	dc.b	102
  65  004d 6d            	dc.b	109
  66  004e 7d            	dc.b	125
  67  004f 07            	dc.b	7
  68  0050 7f            	dc.b	127
  69  0051 6f            	dc.b	111
  70  0052               L11_SEG_7A:
  71  0052 77            	dc.b	119
  72  0053 7c            	dc.b	124
  73  0054 39            	dc.b	57
  74  0055 5e            	dc.b	94
  75  0056 79            	dc.b	121
  76  0057 71            	dc.b	113
  77  0058 3d            	dc.b	61
  78  0059 76            	dc.b	118
  79  005a 06            	dc.b	6
  80  005b 1e            	dc.b	30
  81  005c 72            	dc.b	114
  82  005d 38            	dc.b	56
  83  005e 55            	dc.b	85
  84  005f 54            	dc.b	84
  85  0060 3f            	dc.b	63
  86  0061 73            	dc.b	115
  87  0062 67            	dc.b	103
  88  0063 50            	dc.b	80
  89  0064 6d            	dc.b	109
  90  0065 78            	dc.b	120
  91  0066 3e            	dc.b	62
  92  0067 1c            	dc.b	28
  93  0068 49            	dc.b	73
  94  0069 49            	dc.b	73
  95  006a 6e            	dc.b	110
  96  006b 48            	dc.b	72
  97                     	switch	.data
  98  0000               L31_DisplayType:
  99  0000 0000          	dc.w	_DispInfoT16x5B8x4
 100  0002 0000          	dc.w	_DispInfoT16x7B8x4
 101  0004 0000          	dc.w	_DispInfoT8x5B8x3
 102  0006               _pDisp:
 103  0006 0000          	dc.w	0
 104                     ; 176 static uint16_t S16_CalcSegments(uint8_t ch)
 104                     ; 177 {
 105                     	scross	off
 106                     	switch	.text
 107  0000               L52_S16_CalcSegments:
 108       00000000      OFST:	set	0
 110                     ; 178   if((ch >= 'A') && (ch <= 'Z'))
 111  0000 a141          	cp	a,#65
 112  0002 250e          	jrult	L72
 114  0004 a15b          	cp	a,#91
 115  0006 240a          	jruge	L72
 116                     ; 180     return SEG_16A[ch - 'A'];  /* A-Z */
 117  0008 5f            	clrw	x
 118  0009 97            	ld	xl,a
 119  000a 58            	sllw	x
 120  000b 1d0082        	subw	x,#130
 121  000e de0014        	ldw	x,(L5_SEG_16A,x)
 123  0011 81            	ret	
 124  0012               L72:
 125                     ; 182   else if((ch >= 'a') && (ch <= 'z'))
 126  0012 a161          	cp	a,#97
 127  0014 250e          	jrult	L33
 129  0016 a17b          	cp	a,#123
 130  0018 240a          	jruge	L33
 131                     ; 184     return SEG_16A[ch - 'a'];  /* a-z */
 132  001a 5f            	clrw	x
 133  001b 97            	ld	xl,a
 134  001c 58            	sllw	x
 135  001d 1d00c2        	subw	x,#194
 136  0020 de0014        	ldw	x,(L5_SEG_16A,x)
 138  0023 81            	ret	
 139  0024               L33:
 140                     ; 186   else if((ch >= '0') && (ch <= '9'))
 141  0024 a130          	cp	a,#48
 142  0026 250e          	jrult	L73
 144  0028 a13a          	cp	a,#58
 145  002a 240a          	jruge	L73
 146                     ; 188     return SEG_16N[ch - '0'];  /* 0-9 */
 147  002c 5f            	clrw	x
 148  002d 97            	ld	xl,a
 149  002e 58            	sllw	x
 150  002f 1d0060        	subw	x,#96
 151  0032 de0000        	ldw	x,(L3_SEG_16N,x)
 153  0035 81            	ret	
 154  0036               L73:
 155                     ; 190   else if(ch == '-')
 156  0036 a12d          	cp	a,#45
 157  0038 2604          	jrne	L34
 158                     ; 192     return S16_G1 + S16_G2;
 159  003a ae0300        	ldw	x,#768
 161  003d 81            	ret	
 162  003e               L34:
 163                     ; 194   else if(ch == '+')
 164  003e a12b          	cp	a,#43
 165  0040 2604          	jrne	L74
 166                     ; 196     return S16_G1 + S16_G2 + S16_I + S16_L;
 167  0042 ae4b00        	ldw	x,#19200
 169  0045 81            	ret	
 170  0046               L74:
 171                     ; 198   else if(ch == '<')
 172  0046 a13c          	cp	a,#60
 173  0048 2604          	jrne	L35
 174                     ; 200     return S16_J + S16_K;
 175  004a ae3000        	ldw	x,#12288
 177  004d 81            	ret	
 178  004e               L35:
 179                     ; 202   else if(ch == '>')
 180  004e a13e          	cp	a,#62
 181  0050 2604          	jrne	L75
 182                     ; 204     return S16_H + S16_M;
 183  0052 ae8400        	ldw	x,#33792
 185  0055 81            	ret	
 186  0056               L75:
 187                     ; 206   else if(ch == '/')
 188  0056 a12f          	cp	a,#47
 189  0058 2604          	jrne	L36
 190                     ; 208     return S16_J + S16_M;
 191  005a ae9000        	ldw	x,#36864
 193  005d 81            	ret	
 194  005e               L36:
 195                     ; 212     return 0;  /* blank */
 196  005e 5f            	clrw	x
 198  005f 81            	ret	
 200                     ; 221 static uint16_t S7_CalcSegments(uint8_t ch)
 200                     ; 222 {
 201  0060               L76_S7_CalcSegments:
 202       00000000      OFST:	set	0
 204                     ; 223   if((ch >= 'A') && (ch <= 'Z'))
 205  0060 a141          	cp	a,#65
 206  0062 250f          	jrult	L17
 208  0064 a15b          	cp	a,#91
 209  0066 240b          	jruge	L17
 210                     ; 225     return SEG_7A[ch - 'A'];  /* A-Z */
 211  0068 5f            	clrw	x
 212  0069 97            	ld	xl,a
 213  006a 1d0041        	subw	x,#65
 214  006d d60052        	ld	a,(L11_SEG_7A,x)
 215  0070 5f            	clrw	x
 216  0071 97            	ld	xl,a
 218  0072 81            	ret	
 219  0073               L17:
 220                     ; 227   else if((ch >= 'a') && (ch <= 'z'))
 221  0073 a161          	cp	a,#97
 222  0075 250f          	jrult	L57
 224  0077 a17b          	cp	a,#123
 225  0079 240b          	jruge	L57
 226                     ; 229     return SEG_7A[ch - 'a'];  /* a-z */
 227  007b 5f            	clrw	x
 228  007c 97            	ld	xl,a
 229  007d 1d0061        	subw	x,#97
 230  0080 d60052        	ld	a,(L11_SEG_7A,x)
 231  0083 5f            	clrw	x
 232  0084 97            	ld	xl,a
 234  0085 81            	ret	
 235  0086               L57:
 236                     ; 231   else if((ch >= '0') && (ch <= '9'))
 237  0086 a130          	cp	a,#48
 238  0088 250f          	jrult	L101
 240  008a a13a          	cp	a,#58
 241  008c 240b          	jruge	L101
 242                     ; 233     return SEG_7N[ch - '0'];  /* 0-9 */
 243  008e 5f            	clrw	x
 244  008f 97            	ld	xl,a
 245  0090 1d0030        	subw	x,#48
 246  0093 d60048        	ld	a,(L7_SEG_7N,x)
 247  0096 5f            	clrw	x
 248  0097 97            	ld	xl,a
 250  0098 81            	ret	
 251  0099               L101:
 252                     ; 235   else if(ch == '-')
 253  0099 a12d          	cp	a,#45
 254  009b 2604          	jrne	L501
 255                     ; 237     return S7_G;
 256  009d ae0040        	ldw	x,#64
 258  00a0 81            	ret	
 259  00a1               L501:
 260                     ; 239   else if(ch == '_')
 261  00a1 a15f          	cp	a,#95
 262  00a3 2604          	jrne	L111
 263                     ; 241     return S7_D;
 264  00a5 ae0008        	ldw	x,#8
 266  00a8 81            	ret	
 267  00a9               L111:
 268                     ; 245     return 0;
 269  00a9 5f            	clrw	x
 271  00aa 81            	ret	
 277                     ; 255 void DISP_Init(uint8_t dispIndex)
 277                     ; 256 {
 278  00ab               _DISP_Init:
 280                     ; 257   if(dispIndex < DISP_TYPE_MAX_NB)
 281  00ab a103          	cp	a,#3
 282  00ad 2444          	jruge	L511
 283                     ; 259     pDisp = DisplayType[dispIndex];
 284  00af 5f            	clrw	x
 285  00b0 97            	ld	xl,a
 286  00b1 58            	sllw	x
 287  00b2 de0000        	ldw	x,(L31_DisplayType,x)
 288  00b5 cf0006        	ldw	_pDisp,x
 289                     ; 260     pDisp->dispInit();
 290  00b8 ee0a          	ldw	x,(10,x)
 291  00ba fd            	call	(x)
 293                     ; 262     if(pDisp->lowSegType == DISP_SEVEN_SEG)
 294  00bb ce0006        	ldw	x,_pDisp
 295  00be e602          	ld	a,(2,x)
 296  00c0 2605          	jrne	L711
 297                     ; 264       LowDispCalcSegment = S7_CalcSegments;
 298  00c2 ae0060        	ldw	x,#L76_S7_CalcSegments
 300  00c5 2003          	jra	L121
 301  00c7               L711:
 302                     ; 268       LowDispCalcSegment = S16_CalcSegments;
 303  00c7 ae0000        	ldw	x,#L52_S16_CalcSegments
 304  00ca               L121:
 305  00ca cf0002        	ldw	L12_LowDispCalcSegment,x
 306                     ; 271     if(pDisp->uppSegType == DISP_SEVEN_SEG)
 307  00cd 72c60006      	ld	a,[_pDisp.w]
 308  00d1 2605          	jrne	L321
 309                     ; 273       UppDispCalcSegment = S7_CalcSegments;
 310  00d3 ae0060        	ldw	x,#L76_S7_CalcSegments
 312  00d6 2003          	jra	L521
 313  00d8               L321:
 314                     ; 277       UppDispCalcSegment = S16_CalcSegments;
 315  00d8 ae0000        	ldw	x,#L52_S16_CalcSegments
 316  00db               L521:
 317  00db cf0000        	ldw	L32_UppDispCalcSegment,x
 318                     ; 280     DispMaxSel = pDisp->uppMaxSel + pDisp->lowMaxSel + DISP_LED_MAX_SEL + DISP_TURRET_MAX_SEL; 
 319  00de ce0006        	ldw	x,_pDisp
 320  00e1 e603          	ld	a,(3,x)
 321  00e3 90ce0006      	ldw	y,_pDisp
 322  00e7 5f            	clrw	x
 323  00e8 90eb01        	add	a,(1,y)
 324  00eb 59            	rlcw	x
 325  00ec 02            	rlwa	x,a
 326  00ed 1c0005        	addw	x,#5
 327  00f0 cf0004        	ldw	L71_DispMaxSel,x
 328  00f3               L511:
 329                     ; 283   memset(&DisplayBuff, 0x00, sizeof(DisplayBuff));
 330  00f3 ae0040        	ldw	x,#64
 331  00f6 89            	pushw	x
 332  00f7 4b00          	push	#0
 333  00f9 ae0006        	ldw	x,#L51_DisplayBuff
 334  00fc cd0000        	call	_memset
 336  00ff 5b03          	addw	sp,#3
 337                     ; 284 }
 338  0101 81            	ret	
 340                     ; 291 void DISP_LowerClear(void)
 340                     ; 292 {
 341  0102               _DISP_LowerClear:
 342  0102 89            	pushw	x
 343       00000002      OFST:	set	2
 345                     ; 294   uint8_t dispBuffOffset = LOWER_DISP_BUFF_OFFSET;
 346  0103 ce0006        	ldw	x,_pDisp
 347  0106 e601          	ld	a,(1,x)
 348  0108 6b01          	ld	(OFST-1,sp),a
 349                     ; 296   for(count = 0; count < pDisp->lowMaxSel; count++)
 350  010a 0f02          	clr	(OFST+0,sp)
 352  010c 200f          	jra	L331
 353  010e               L721:
 354                     ; 298     DisplayBuff[dispBuffOffset + count] = 0x00;
 355  010e 7b01          	ld	a,(OFST-1,sp)
 356  0110 5f            	clrw	x
 357  0111 1b02          	add	a,(OFST+0,sp)
 358  0113 59            	rlcw	x
 359  0114 02            	rlwa	x,a
 360  0115 58            	sllw	x
 361  0116 905f          	clrw	y
 362  0118 df0006        	ldw	(L51_DisplayBuff,x),y
 363                     ; 296   for(count = 0; count < pDisp->lowMaxSel; count++)
 364  011b 0c02          	inc	(OFST+0,sp)
 365  011d               L331:
 367  011d ce0006        	ldw	x,_pDisp
 368  0120 e603          	ld	a,(3,x)
 369  0122 1102          	cp	a,(OFST+0,sp)
 370  0124 22e8          	jrugt	L721
 371                     ; 300 }
 372  0126 85            	popw	x
 373  0127 81            	ret	
 375                     ; 308 void DISP_LowerPutStr(char *pStr, uint8_t startDispNo)
 375                     ; 309 {
 376  0128               _DISP_LowerPutStr:
 377  0128 89            	pushw	x
 378       00000005      OFST:	set	5
 380                     ; 310   if(startDispNo < pDisp->lowMaxSel)
 381  0129 ce0006        	ldw	x,_pDisp
 382  012c 5205          	subw	sp,#5
 383  012e e603          	ld	a,(3,x)
 384  0130 110a          	cp	a,(OFST+5,sp)
 385  0132 235d          	jrule	L731
 386                     ; 312     uint8_t count = 0;
 387                     ; 313     uint8_t strlength = (uint8_t)strlen(pStr);
 388  0134 1e06          	ldw	x,(OFST+1,sp)
 389  0136 cd0000        	call	_strlen
 391  0139 9f            	ld	a,xl
 392  013a 6b04          	ld	(OFST-1,sp),a
 393                     ; 314     uint8_t maxChar = (uint8_t)(((pDisp->lowMaxSel - startDispNo) < strlength) ?
 393                     ; 315                                 (pDisp->lowMaxSel - startDispNo) :
 393                     ; 316                                 (strlength));
 394  013c 5f            	clrw	x
 395  013d 97            	ld	xl,a
 396  013e 1f01          	ldw	(OFST-4,sp),x
 397  0140 ce0006        	ldw	x,_pDisp
 398  0143 e603          	ld	a,(3,x)
 399  0145 5f            	clrw	x
 400  0146 100a          	sub	a,(OFST+5,sp)
 401  0148 2401          	jrnc	L03
 402  014a 5a            	decw	x
 403  014b               L03:
 404  014b 02            	rlwa	x,a
 405  014c 1301          	cpw	x,(OFST-4,sp)
 406  014e 2e09          	jrsge	L62
 407  0150 ce0006        	ldw	x,_pDisp
 408  0153 e603          	ld	a,(3,x)
 409  0155 100a          	sub	a,(OFST+5,sp)
 410  0157 2002          	jra	L23
 411  0159               L62:
 412  0159 7b04          	ld	a,(OFST-1,sp)
 413  015b               L23:
 414  015b 6b04          	ld	(OFST-1,sp),a
 415                     ; 317     uint8_t dispBuffOffset = LOWER_DISP_BUFF_OFFSET + startDispNo;
 416  015d ce0006        	ldw	x,_pDisp
 417  0160 e601          	ld	a,(1,x)
 418  0162 1b0a          	add	a,(OFST+5,sp)
 419  0164 6b03          	ld	(OFST-2,sp),a
 420                     ; 319     for(count = 0; count < maxChar; count++)
 421  0166 0f05          	clr	(OFST+0,sp)
 423  0168 2021          	jra	L541
 424  016a               L141:
 425                     ; 321       DisplayBuff[dispBuffOffset + count] = LowDispCalcSegment(pStr[count]);
 426  016a 7b06          	ld	a,(OFST+1,sp)
 427  016c 97            	ld	xl,a
 428  016d 7b07          	ld	a,(OFST+2,sp)
 429  016f 1b05          	add	a,(OFST+0,sp)
 430  0171 2401          	jrnc	L63
 431  0173 5c            	incw	x
 432  0174               L63:
 433  0174 02            	rlwa	x,a
 434  0175 f6            	ld	a,(x)
 435  0176 72cd0002      	call	[L12_LowDispCalcSegment.w]
 437  017a 1f01          	ldw	(OFST-4,sp),x
 438  017c 5f            	clrw	x
 439  017d 7b03          	ld	a,(OFST-2,sp)
 440  017f 1b05          	add	a,(OFST+0,sp)
 441  0181 59            	rlcw	x
 442  0182 02            	rlwa	x,a
 443  0183 58            	sllw	x
 444  0184 1601          	ldw	y,(OFST-4,sp)
 445  0186 df0006        	ldw	(L51_DisplayBuff,x),y
 446                     ; 319     for(count = 0; count < maxChar; count++)
 447  0189 0c05          	inc	(OFST+0,sp)
 448  018b               L541:
 450  018b 7b05          	ld	a,(OFST+0,sp)
 451  018d 1104          	cp	a,(OFST-1,sp)
 452  018f 25d9          	jrult	L141
 453  0191               L731:
 454                     ; 324 }
 455  0191 5b07          	addw	sp,#7
 456  0193 81            	ret	
 458                     ; 331 void DISP_UpperClear(void)
 458                     ; 332 {
 459  0194               _DISP_UpperClear:
 460  0194 89            	pushw	x
 461       00000002      OFST:	set	2
 463                     ; 334   uint8_t dispBuffOffset = UPPER_DISP_BUFF_OFFSET;
 464  0195 0f01          	clr	(OFST-1,sp)
 465                     ; 336   for(count = 0; count < pDisp->uppMaxSel; count++)
 466  0197 0f02          	clr	(OFST+0,sp)
 468  0199 200f          	jra	L551
 469  019b               L151:
 470                     ; 338     DisplayBuff[dispBuffOffset + count] = 0;
 471  019b 7b01          	ld	a,(OFST-1,sp)
 472  019d 5f            	clrw	x
 473  019e 1b02          	add	a,(OFST+0,sp)
 474  01a0 59            	rlcw	x
 475  01a1 02            	rlwa	x,a
 476  01a2 58            	sllw	x
 477  01a3 905f          	clrw	y
 478  01a5 df0006        	ldw	(L51_DisplayBuff,x),y
 479                     ; 336   for(count = 0; count < pDisp->uppMaxSel; count++)
 480  01a8 0c02          	inc	(OFST+0,sp)
 481  01aa               L551:
 483  01aa ce0006        	ldw	x,_pDisp
 484  01ad e601          	ld	a,(1,x)
 485  01af 1102          	cp	a,(OFST+0,sp)
 486  01b1 22e8          	jrugt	L151
 487                     ; 340 }
 488  01b3 85            	popw	x
 489  01b4 81            	ret	
 491                     ; 348 void DISP_UpperPutStr(char *pStr, uint8_t startDispNo)
 491                     ; 349 {
 492  01b5               _DISP_UpperPutStr:
 493  01b5 89            	pushw	x
 494       00000005      OFST:	set	5
 496                     ; 350   if(startDispNo < pDisp->uppMaxSel)
 497  01b6 ce0006        	ldw	x,_pDisp
 498  01b9 5205          	subw	sp,#5
 499  01bb e601          	ld	a,(1,x)
 500  01bd 110a          	cp	a,(OFST+5,sp)
 501  01bf 2358          	jrule	L161
 502                     ; 352     uint8_t count = 0;
 503                     ; 353     uint8_t strlength = (uint8_t)strlen(pStr);
 504  01c1 1e06          	ldw	x,(OFST+1,sp)
 505  01c3 cd0000        	call	_strlen
 507  01c6 9f            	ld	a,xl
 508  01c7 6b04          	ld	(OFST-1,sp),a
 509                     ; 354     uint8_t maxChar = (uint8_t)(((pDisp->uppMaxSel - startDispNo) < strlength) ?
 509                     ; 355                                 (pDisp->uppMaxSel - startDispNo) :
 509                     ; 356                                 (strlength));
 510  01c9 5f            	clrw	x
 511  01ca 97            	ld	xl,a
 512  01cb 1f01          	ldw	(OFST-4,sp),x
 513  01cd ce0006        	ldw	x,_pDisp
 514  01d0 e601          	ld	a,(1,x)
 515  01d2 5f            	clrw	x
 516  01d3 100a          	sub	a,(OFST+5,sp)
 517  01d5 2401          	jrnc	L45
 518  01d7 5a            	decw	x
 519  01d8               L45:
 520  01d8 02            	rlwa	x,a
 521  01d9 1301          	cpw	x,(OFST-4,sp)
 522  01db 2e09          	jrsge	L25
 523  01dd ce0006        	ldw	x,_pDisp
 524  01e0 e601          	ld	a,(1,x)
 525  01e2 100a          	sub	a,(OFST+5,sp)
 526  01e4 2002          	jra	L65
 527  01e6               L25:
 528  01e6 7b04          	ld	a,(OFST-1,sp)
 529  01e8               L65:
 530  01e8 6b04          	ld	(OFST-1,sp),a
 531                     ; 357     uint8_t dispBuffOffset = UPPER_DISP_BUFF_OFFSET + startDispNo;
 532  01ea 7b0a          	ld	a,(OFST+5,sp)
 533  01ec 6b03          	ld	(OFST-2,sp),a
 534                     ; 359     for(count = 0; count < maxChar; count++)
 535  01ee 0f05          	clr	(OFST+0,sp)
 537  01f0 2021          	jra	L761
 538  01f2               L361:
 539                     ; 361       DisplayBuff[dispBuffOffset + count] = UppDispCalcSegment(pStr[count]);
 540  01f2 7b06          	ld	a,(OFST+1,sp)
 541  01f4 97            	ld	xl,a
 542  01f5 7b07          	ld	a,(OFST+2,sp)
 543  01f7 1b05          	add	a,(OFST+0,sp)
 544  01f9 2401          	jrnc	L26
 545  01fb 5c            	incw	x
 546  01fc               L26:
 547  01fc 02            	rlwa	x,a
 548  01fd f6            	ld	a,(x)
 549  01fe 72cd0000      	call	[L32_UppDispCalcSegment.w]
 551  0202 1f01          	ldw	(OFST-4,sp),x
 552  0204 5f            	clrw	x
 553  0205 7b03          	ld	a,(OFST-2,sp)
 554  0207 1b05          	add	a,(OFST+0,sp)
 555  0209 59            	rlcw	x
 556  020a 02            	rlwa	x,a
 557  020b 58            	sllw	x
 558  020c 1601          	ldw	y,(OFST-4,sp)
 559  020e df0006        	ldw	(L51_DisplayBuff,x),y
 560                     ; 359     for(count = 0; count < maxChar; count++)
 561  0211 0c05          	inc	(OFST+0,sp)
 562  0213               L761:
 564  0213 7b05          	ld	a,(OFST+0,sp)
 565  0215 1104          	cp	a,(OFST-1,sp)
 566  0217 25d9          	jrult	L361
 567  0219               L161:
 568                     ; 364   printf("\n\r%s", pStr);
 569  0219 1e06          	ldw	x,(OFST+1,sp)
 570  021b 89            	pushw	x
 571  021c ae006c        	ldw	x,#L371
 572  021f cd0000        	call	_printf
 574  0222 85            	popw	x
 575                     ; 365 }
 576  0223 5b07          	addw	sp,#7
 577  0225 81            	ret	
 579                     ; 372 void DISP_TurrClear(void)
 579                     ; 373 {
 580  0226               _DISP_TurrClear:
 581  0226 89            	pushw	x
 582       00000002      OFST:	set	2
 584                     ; 375   uint8_t dispBuffOffset = TURRET_DISP_BUFF_OFFSET;
 585  0227 ce0006        	ldw	x,_pDisp
 586  022a e603          	ld	a,(3,x)
 587  022c eb01          	add	a,(1,x)
 588  022e 4c            	inc	a
 589  022f 6b01          	ld	(OFST-1,sp),a
 590                     ; 377   for(count = 0; count < DISP_TURRET_MAX_SEL; count++)
 591  0231 0f02          	clr	(OFST+0,sp)
 592  0233               L571:
 593                     ; 379     DisplayBuff[dispBuffOffset + count] = 0;
 594  0233 7b01          	ld	a,(OFST-1,sp)
 595  0235 5f            	clrw	x
 596  0236 1b02          	add	a,(OFST+0,sp)
 597  0238 59            	rlcw	x
 598  0239 02            	rlwa	x,a
 599  023a 58            	sllw	x
 600  023b 905f          	clrw	y
 601  023d df0006        	ldw	(L51_DisplayBuff,x),y
 602                     ; 377   for(count = 0; count < DISP_TURRET_MAX_SEL; count++)
 603  0240 0c02          	inc	(OFST+0,sp)
 605  0242 7b02          	ld	a,(OFST+0,sp)
 606  0244 a104          	cp	a,#4
 607  0246 25eb          	jrult	L571
 608                     ; 381 }
 609  0248 85            	popw	x
 610  0249 81            	ret	
 612                     ; 389 void DISP_TurrPutStr(char *pStr, uint8_t startDispNo)
 612                     ; 390 {
 613  024a               _DISP_TurrPutStr:
 614  024a 89            	pushw	x
 615  024b 5205          	subw	sp,#5
 616       00000005      OFST:	set	5
 618                     ; 391   if(startDispNo < DISP_TURRET_MAX_SEL)
 619  024d 7b0a          	ld	a,(OFST+5,sp)
 620  024f a104          	cp	a,#4
 621  0251 2458          	jruge	L302
 622                     ; 393     uint8_t count = 0;
 623                     ; 394     uint8_t strlength = (uint8_t)strlen(pStr);
 624  0253 cd0000        	call	_strlen
 626  0256 9f            	ld	a,xl
 627  0257 6b04          	ld	(OFST-1,sp),a
 628                     ; 395     uint8_t maxChar = (uint8_t)(((DISP_TURRET_MAX_SEL - startDispNo) < strlength) ?
 628                     ; 396                                 (DISP_TURRET_MAX_SEL - startDispNo) :
 628                     ; 397                                 (strlength));
 629  0259 5f            	clrw	x
 630  025a 97            	ld	xl,a
 631  025b 1f01          	ldw	(OFST-4,sp),x
 632  025d 4f            	clr	a
 633  025e 97            	ld	xl,a
 634  025f a604          	ld	a,#4
 635  0261 100a          	sub	a,(OFST+5,sp)
 636  0263 2401          	jrnc	L201
 637  0265 5a            	decw	x
 638  0266               L201:
 639  0266 02            	rlwa	x,a
 640  0267 1301          	cpw	x,(OFST-4,sp)
 641  0269 2e06          	jrsge	L001
 642  026b a604          	ld	a,#4
 643  026d 100a          	sub	a,(OFST+5,sp)
 644  026f 2002          	jra	L401
 645  0271               L001:
 646  0271 7b04          	ld	a,(OFST-1,sp)
 647  0273               L401:
 648  0273 6b04          	ld	(OFST-1,sp),a
 649                     ; 398     uint8_t dispBuffOffset = TURRET_DISP_BUFF_OFFSET + startDispNo;
 650  0275 ce0006        	ldw	x,_pDisp
 651  0278 e603          	ld	a,(3,x)
 652  027a eb01          	add	a,(1,x)
 653  027c 1b0a          	add	a,(OFST+5,sp)
 654  027e 4c            	inc	a
 655  027f 6b03          	ld	(OFST-2,sp),a
 656                     ; 400     for(count = 0; count < maxChar; count++)
 657  0281 0f05          	clr	(OFST+0,sp)
 659  0283 2020          	jra	L112
 660  0285               L502:
 661                     ; 402       DisplayBuff[dispBuffOffset + count] = S7_CalcSegments(pStr[count]);
 662  0285 7b06          	ld	a,(OFST+1,sp)
 663  0287 97            	ld	xl,a
 664  0288 7b07          	ld	a,(OFST+2,sp)
 665  028a 1b05          	add	a,(OFST+0,sp)
 666  028c 2401          	jrnc	L011
 667  028e 5c            	incw	x
 668  028f               L011:
 669  028f 02            	rlwa	x,a
 670  0290 f6            	ld	a,(x)
 671  0291 cd0060        	call	L76_S7_CalcSegments
 673  0294 1f01          	ldw	(OFST-4,sp),x
 674  0296 5f            	clrw	x
 675  0297 7b03          	ld	a,(OFST-2,sp)
 676  0299 1b05          	add	a,(OFST+0,sp)
 677  029b 59            	rlcw	x
 678  029c 02            	rlwa	x,a
 679  029d 58            	sllw	x
 680  029e 1601          	ldw	y,(OFST-4,sp)
 681  02a0 df0006        	ldw	(L51_DisplayBuff,x),y
 682                     ; 400     for(count = 0; count < maxChar; count++)
 683  02a3 0c05          	inc	(OFST+0,sp)
 684  02a5               L112:
 686  02a5 7b05          	ld	a,(OFST+0,sp)
 687  02a7 1104          	cp	a,(OFST-1,sp)
 688  02a9 25da          	jrult	L502
 689  02ab               L302:
 690                     ; 405 }
 691  02ab 5b07          	addw	sp,#7
 692  02ad 81            	ret	
 694                     ; 413 void DISP_Led(uint8_t ledNo, uint8_t enable)
 694                     ; 414 {
 695  02ae               _DISP_Led:
 696  02ae 89            	pushw	x
 697       00000000      OFST:	set	0
 699                     ; 415   if(ledNo < DISP_LED_MAX_NB)
 700  02af 9e            	ld	a,xh
 701  02b0 a10f          	cp	a,#15
 702  02b2 2432          	jruge	L512
 703                     ; 417     if(enable == TRUE)
 704  02b4 9f            	ld	a,xl
 705  02b5 4a            	dec	a
 706  02b6 2615          	jrne	L712
 707                     ; 419       DisplayBuff[LED_DISP_BUFF_OFFSET] |= (uint16_t)(pDisp->pLedBitmap[ledNo]);
 708  02b8 ad2e          	call	LC002
 709  02ba 89            	pushw	x
 710  02bb 7b03          	ld	a,(OFST+3,sp)
 711  02bd ad3a          	call	LC003
 712  02bf 9085          	popw	y
 713  02c1 01            	rrwa	x,a
 714  02c2 90da0007      	or	a,(L51_DisplayBuff+1,y)
 715  02c6 01            	rrwa	x,a
 716  02c7 90da0006      	or	a,(L51_DisplayBuff,y)
 718  02cb 2014          	jp	LC001
 719  02cd               L712:
 720                     ; 423       DisplayBuff[LED_DISP_BUFF_OFFSET] &= (uint16_t)(~pDisp->pLedBitmap[ledNo]);
 721  02cd ad19          	call	LC002
 722  02cf 89            	pushw	x
 723  02d0 7b03          	ld	a,(OFST+3,sp)
 724  02d2 ad25          	call	LC003
 725  02d4 53            	cplw	x
 726  02d5 9085          	popw	y
 727  02d7 01            	rrwa	x,a
 728  02d8 90d40007      	and	a,(L51_DisplayBuff+1,y)
 729  02dc 01            	rrwa	x,a
 730  02dd 90d40006      	and	a,(L51_DisplayBuff,y)
 731  02e1               LC001:
 732  02e1 01            	rrwa	x,a
 733  02e2 90df0006      	ldw	(L51_DisplayBuff,y),x
 734  02e6               L512:
 735                     ; 426 }
 736  02e6 85            	popw	x
 737  02e7 81            	ret	
 738  02e8               LC002:
 739  02e8 ce0006        	ldw	x,_pDisp
 740  02eb e603          	ld	a,(3,x)
 741  02ed 90ce0006      	ldw	y,_pDisp
 742  02f1 5f            	clrw	x
 743  02f2 90eb01        	add	a,(1,y)
 744  02f5 59            	rlcw	x
 745  02f6 02            	rlwa	x,a
 746  02f7 58            	sllw	x
 747  02f8 81            	ret	
 748  02f9               LC003:
 749  02f9 5f            	clrw	x
 750  02fa 97            	ld	xl,a
 751  02fb 58            	sllw	x
 752  02fc 90ee04        	ldw	y,(4,y)
 753  02ff 90bf00        	ldw	c_x,y
 754  0302 92de00        	ldw	x,([c_x.w],x)
 755  0305 81            	ret	
 757                     ; 433 void DISP_SetAll(void)
 757                     ; 434 {
 758  0306               _DISP_SetAll:
 760                     ; 435   memset(&DisplayBuff[0], 0xFF, sizeof(DisplayBuff));
 761  0306 ae0040        	ldw	x,#64
 762  0309 89            	pushw	x
 763  030a 4bff          	push	#255
 764  030c ae0006        	ldw	x,#L51_DisplayBuff
 765  030f cd0000        	call	_memset
 767  0312 5b03          	addw	sp,#3
 768                     ; 436 }
 769  0314 81            	ret	
 771                     ; 443 void DISP_ClearAll(void)
 771                     ; 444 {
 772  0315               _DISP_ClearAll:
 774                     ; 445   memset(&DisplayBuff[0], 0x00, sizeof(DisplayBuff));
 775  0315 ae0040        	ldw	x,#64
 776  0318 89            	pushw	x
 777  0319 4b00          	push	#0
 778  031b ae0006        	ldw	x,#L51_DisplayBuff
 779  031e cd0000        	call	_memset
 781  0321 5b03          	addw	sp,#3
 782                     ; 446 }
 783  0323 81            	ret	
 785                     	switch	.data
 786  0008               L322_DispNo:
 787  0008 00            	dc.b	0
 788                     ; 453 void DISP_Exec(void)
 788                     ; 454 {
 789                     	switch	.text
 790  0324               _DISP_Exec:
 791  0324 89            	pushw	x
 792       00000002      OFST:	set	2
 794                     ; 457   uint16_t *pDisplayBuff = (uint16_t *)&DisplayBuff;
 795                     ; 459   pDisp->dispWrite(DispNo, pDisplayBuff[DispNo]);
 796  0325 c60008        	ld	a,L322_DispNo
 797  0328 5f            	clrw	x
 798  0329 97            	ld	xl,a
 799  032a 58            	sllw	x
 800  032b de0006        	ldw	x,(L51_DisplayBuff,x)
 801  032e 89            	pushw	x
 802  032f ce0006        	ldw	x,_pDisp
 803  0332 ee0c          	ldw	x,(12,x)
 804  0334 fd            	call	(x)
 806  0335 725c0008      	inc	L322_DispNo
 807  0339 90ce0004      	ldw	y,L71_DispMaxSel
 808  033d c60008        	ld	a,L322_DispNo
 809  0340 85            	popw	x
 810                     ; 460   DispNo++;
 811                     ; 461   DispNo %= DispMaxSel;
 812  0341 5f            	clrw	x
 813  0342 97            	ld	xl,a
 814  0343 65            	divw	x,y
 815  0344 909f          	ld	a,yl
 816  0346 c70008        	ld	L322_DispNo,a
 817                     ; 462 }
 818  0349 85            	popw	x
 819  034a 81            	ret	
 821                     	switch	.bss
 822  0000               L32_UppDispCalcSegment:
 823  0000 0000          	ds.b	2
 824  0002               L12_LowDispCalcSegment:
 825  0002 0000          	ds.b	2
 826  0004               L71_DispMaxSel:
 827  0004 0000          	ds.b	2
 828  0006               L51_DisplayBuff:
 829  0006 000000000000  	ds.b	64
 830                     	xref	_DispInfoT8x5B8x3
 831                     	xref	_DispInfoT16x7B8x4
 832                     	xref	_DispInfoT16x5B8x4
 833                     	xref	_TurretExecute
 834                     	xdef	_DISP_Exec
 835                     	xdef	_DISP_ClearAll
 836                     	xdef	_DISP_SetAll
 837                     	xdef	_DISP_Led
 838                     	xdef	_DISP_TurrPutStr
 839                     	xdef	_DISP_TurrClear
 840                     	xdef	_DISP_UpperPutStr
 841                     	xdef	_DISP_UpperClear
 842                     	xdef	_DISP_LowerPutStr
 843                     	xdef	_DISP_LowerClear
 844                     	xdef	_DISP_Init
 845                     	xdef	_pDisp
 846                     	xref	_SensorCounter
 847                     	xref	_CounterMode
 848                     	xref	_FlagSensorEn
 849                     	xref	_FlagUvDetect
 850                     	xref	_FlagAddCount
 851                     	xref	_FlagAutoCount
 852                     	xref	_FlagValueCount
 853                     	xref	_SystemTimer
 854                     	xref	_AdcValue
 855                     	xref	_BuzzerOnTime
 856                     	xref	_memset
 857                     	xref	_strlen
 858                     	xref	_printf
 859                     	switch	.const
 860  006c               L371:
 861  006c 0a0d257300    	dc.b	10,13,37,115,0
 862                     	xref.b	c_x
 863                     	end
