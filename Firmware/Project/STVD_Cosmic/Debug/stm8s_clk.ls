   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  35                     ; 72 void CLK_DeInit(void)
  35                     ; 73 {
  36                     	scross	off
  37                     	switch	.text
  38  0000               _CLK_DeInit:
  40                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  41  0000 350150c0      	mov	20672,#1
  42                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  43  0004 725f50c1      	clr	20673
  44                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  45  0008 35e150c4      	mov	20676,#225
  46                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  47  000c 725f50c5      	clr	20677
  48                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  49  0010 351850c6      	mov	20678,#24
  50                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  51  0014 35ff50c7      	mov	20679,#255
  52                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  53  0018 35ff50ca      	mov	20682,#255
  54                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  55  001c 725f50c8      	clr	20680
  56                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  57  0020 725f50c9      	clr	20681
  59  0024               L7:
  60                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  61  0024 720050c9fb    	btjt	20681,#0,L7
  62                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  63  0029 725f50c9      	clr	20681
  64                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  65  002d 725f50cc      	clr	20684
  66                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  67  0031 725f50cd      	clr	20685
  68                     ; 88 }
  69  0035 81            	ret	
  71                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
  71                     ; 100 {
  72  0036               _CLK_FastHaltWakeUpCmd:
  73  0036 88            	push	a
  74       00000000      OFST:	set	0
  76                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  77  0037 4d            	tnz	a
  78  0038 2711          	jreq	L21
  79  003a 4a            	dec	a
  80  003b 270e          	jreq	L21
  81  003d ae0066        	ldw	x,#102
  82  0040 89            	pushw	x
  83  0041 5f            	clrw	x
  84  0042 89            	pushw	x
  85  0043 ae000c        	ldw	x,#L31
  86  0046 cd0000        	call	_assert_failed
  88  0049 5b04          	addw	sp,#4
  89  004b               L21:
  90                     ; 104   if (NewState != DISABLE)
  91  004b 7b01          	ld	a,(OFST+1,sp)
  92  004d 2706          	jreq	L51
  93                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
  94  004f 721450c0      	bset	20672,#2
  96  0053 2004          	jra	L71
  97  0055               L51:
  98                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
  99  0055 721550c0      	bres	20672,#2
 100  0059               L71:
 101                     ; 114 }
 102  0059 84            	pop	a
 103  005a 81            	ret	
 105                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 105                     ; 122 {
 106  005b               _CLK_HSECmd:
 107  005b 88            	push	a
 108       00000000      OFST:	set	0
 110                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 111  005c 4d            	tnz	a
 112  005d 2711          	jreq	L42
 113  005f 4a            	dec	a
 114  0060 270e          	jreq	L42
 115  0062 ae007c        	ldw	x,#124
 116  0065 89            	pushw	x
 117  0066 5f            	clrw	x
 118  0067 89            	pushw	x
 119  0068 ae000c        	ldw	x,#L31
 120  006b cd0000        	call	_assert_failed
 122  006e 5b04          	addw	sp,#4
 123  0070               L42:
 124                     ; 126   if (NewState != DISABLE)
 125  0070 7b01          	ld	a,(OFST+1,sp)
 126  0072 2706          	jreq	L12
 127                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 128  0074 721050c1      	bset	20673,#0
 130  0078 2004          	jra	L32
 131  007a               L12:
 132                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 133  007a 721150c1      	bres	20673,#0
 134  007e               L32:
 135                     ; 136 }
 136  007e 84            	pop	a
 137  007f 81            	ret	
 139                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 139                     ; 144 {
 140  0080               _CLK_HSICmd:
 141  0080 88            	push	a
 142       00000000      OFST:	set	0
 144                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 145  0081 4d            	tnz	a
 146  0082 2711          	jreq	L63
 147  0084 4a            	dec	a
 148  0085 270e          	jreq	L63
 149  0087 ae0092        	ldw	x,#146
 150  008a 89            	pushw	x
 151  008b 5f            	clrw	x
 152  008c 89            	pushw	x
 153  008d ae000c        	ldw	x,#L31
 154  0090 cd0000        	call	_assert_failed
 156  0093 5b04          	addw	sp,#4
 157  0095               L63:
 158                     ; 148   if (NewState != DISABLE)
 159  0095 7b01          	ld	a,(OFST+1,sp)
 160  0097 2706          	jreq	L52
 161                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 162  0099 721050c0      	bset	20672,#0
 164  009d 2004          	jra	L72
 165  009f               L52:
 166                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 167  009f 721150c0      	bres	20672,#0
 168  00a3               L72:
 169                     ; 158 }
 170  00a3 84            	pop	a
 171  00a4 81            	ret	
 173                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 173                     ; 167 {
 174  00a5               _CLK_LSICmd:
 175  00a5 88            	push	a
 176       00000000      OFST:	set	0
 178                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 179  00a6 4d            	tnz	a
 180  00a7 2711          	jreq	L05
 181  00a9 4a            	dec	a
 182  00aa 270e          	jreq	L05
 183  00ac ae00a9        	ldw	x,#169
 184  00af 89            	pushw	x
 185  00b0 5f            	clrw	x
 186  00b1 89            	pushw	x
 187  00b2 ae000c        	ldw	x,#L31
 188  00b5 cd0000        	call	_assert_failed
 190  00b8 5b04          	addw	sp,#4
 191  00ba               L05:
 192                     ; 171   if (NewState != DISABLE)
 193  00ba 7b01          	ld	a,(OFST+1,sp)
 194  00bc 2706          	jreq	L13
 195                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 196  00be 721650c0      	bset	20672,#3
 198  00c2 2004          	jra	L33
 199  00c4               L13:
 200                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 201  00c4 721750c0      	bres	20672,#3
 202  00c8               L33:
 203                     ; 181 }
 204  00c8 84            	pop	a
 205  00c9 81            	ret	
 207                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 207                     ; 190 {
 208  00ca               _CLK_CCOCmd:
 209  00ca 88            	push	a
 210       00000000      OFST:	set	0
 212                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 213  00cb 4d            	tnz	a
 214  00cc 2711          	jreq	L26
 215  00ce 4a            	dec	a
 216  00cf 270e          	jreq	L26
 217  00d1 ae00c0        	ldw	x,#192
 218  00d4 89            	pushw	x
 219  00d5 5f            	clrw	x
 220  00d6 89            	pushw	x
 221  00d7 ae000c        	ldw	x,#L31
 222  00da cd0000        	call	_assert_failed
 224  00dd 5b04          	addw	sp,#4
 225  00df               L26:
 226                     ; 194   if (NewState != DISABLE)
 227  00df 7b01          	ld	a,(OFST+1,sp)
 228  00e1 2706          	jreq	L53
 229                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 230  00e3 721050c9      	bset	20681,#0
 232  00e7 2004          	jra	L73
 233  00e9               L53:
 234                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 235  00e9 721150c9      	bres	20681,#0
 236  00ed               L73:
 237                     ; 204 }
 238  00ed 84            	pop	a
 239  00ee 81            	ret	
 241                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 241                     ; 214 {
 242  00ef               _CLK_ClockSwitchCmd:
 243  00ef 88            	push	a
 244       00000000      OFST:	set	0
 246                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 247  00f0 4d            	tnz	a
 248  00f1 2711          	jreq	L47
 249  00f3 4a            	dec	a
 250  00f4 270e          	jreq	L47
 251  00f6 ae00d8        	ldw	x,#216
 252  00f9 89            	pushw	x
 253  00fa 5f            	clrw	x
 254  00fb 89            	pushw	x
 255  00fc ae000c        	ldw	x,#L31
 256  00ff cd0000        	call	_assert_failed
 258  0102 5b04          	addw	sp,#4
 259  0104               L47:
 260                     ; 218   if (NewState != DISABLE )
 261  0104 7b01          	ld	a,(OFST+1,sp)
 262  0106 2706          	jreq	L14
 263                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 264  0108 721250c5      	bset	20677,#1
 266  010c 2004          	jra	L34
 267  010e               L14:
 268                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 269  010e 721350c5      	bres	20677,#1
 270  0112               L34:
 271                     ; 228 }
 272  0112 84            	pop	a
 273  0113 81            	ret	
 275                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 275                     ; 239 {
 276  0114               _CLK_SlowActiveHaltWakeUpCmd:
 277  0114 88            	push	a
 278       00000000      OFST:	set	0
 280                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 281  0115 4d            	tnz	a
 282  0116 2711          	jreq	L601
 283  0118 4a            	dec	a
 284  0119 270e          	jreq	L601
 285  011b ae00f1        	ldw	x,#241
 286  011e 89            	pushw	x
 287  011f 5f            	clrw	x
 288  0120 89            	pushw	x
 289  0121 ae000c        	ldw	x,#L31
 290  0124 cd0000        	call	_assert_failed
 292  0127 5b04          	addw	sp,#4
 293  0129               L601:
 294                     ; 243   if (NewState != DISABLE)
 295  0129 7b01          	ld	a,(OFST+1,sp)
 296  012b 2706          	jreq	L54
 297                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 298  012d 721a50c0      	bset	20672,#5
 300  0131 2004          	jra	L74
 301  0133               L54:
 302                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 303  0133 721b50c0      	bres	20672,#5
 304  0137               L74:
 305                     ; 253 }
 306  0137 84            	pop	a
 307  0138 81            	ret	
 309                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 309                     ; 264 {
 310  0139               _CLK_PeripheralClockConfig:
 311  0139 89            	pushw	x
 312       00000000      OFST:	set	0
 314                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 315  013a 9f            	ld	a,xl
 316  013b 4d            	tnz	a
 317  013c 270a          	jreq	L021
 318  013e 9f            	ld	a,xl
 319  013f 4a            	dec	a
 320  0140 2706          	jreq	L021
 321  0142 ae010a        	ldw	x,#266
 322  0145 cd01cf        	call	LC004
 323  0148               L021:
 324                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 325  0148 7b01          	ld	a,(OFST+1,sp)
 326  014a 2733          	jreq	L031
 327  014c a101          	cp	a,#1
 328  014e 272f          	jreq	L031
 329  0150 a103          	cp	a,#3
 330  0152 272b          	jreq	L031
 331  0154 a102          	cp	a,#2
 332  0156 2727          	jreq	L031
 333  0158 a104          	cp	a,#4
 334  015a 2723          	jreq	L031
 335  015c a105          	cp	a,#5
 336  015e 271f          	jreq	L031
 337  0160 a104          	cp	a,#4
 338  0162 271b          	jreq	L031
 339  0164 a106          	cp	a,#6
 340  0166 2717          	jreq	L031
 341  0168 a107          	cp	a,#7
 342  016a 2713          	jreq	L031
 343  016c a117          	cp	a,#23
 344  016e 270f          	jreq	L031
 345  0170 a113          	cp	a,#19
 346  0172 270b          	jreq	L031
 347  0174 a112          	cp	a,#18
 348  0176 2707          	jreq	L031
 349  0178 ae010b        	ldw	x,#267
 350  017b ad52          	call	LC004
 351  017d 7b01          	ld	a,(OFST+1,sp)
 352  017f               L031:
 353                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 354  017f a510          	bcp	a,#16
 355  0181 2622          	jrne	L15
 356                     ; 271     if (NewState != DISABLE)
 357  0183 0d02          	tnz	(OFST+2,sp)
 358  0185 270d          	jreq	L35
 359                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 360  0187 ad3e          	call	LC003
 361  0189 2704          	jreq	L431
 362  018b               L631:
 363  018b 48            	sll	a
 364  018c 5a            	decw	x
 365  018d 26fc          	jrne	L631
 366  018f               L431:
 367  018f ca50c7        	or	a,20679
 369  0192 200c          	jp	LC002
 370  0194               L35:
 371                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 372  0194 ad31          	call	LC003
 373  0196 2704          	jreq	L041
 374  0198               L241:
 375  0198 48            	sll	a
 376  0199 5a            	decw	x
 377  019a 26fc          	jrne	L241
 378  019c               L041:
 379  019c 43            	cpl	a
 380  019d c450c7        	and	a,20679
 381  01a0               LC002:
 382  01a0 c750c7        	ld	20679,a
 383  01a3 2020          	jra	L75
 384  01a5               L15:
 385                     ; 284     if (NewState != DISABLE)
 386  01a5 0d02          	tnz	(OFST+2,sp)
 387  01a7 270d          	jreq	L16
 388                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 389  01a9 ad1c          	call	LC003
 390  01ab 2704          	jreq	L441
 391  01ad               L641:
 392  01ad 48            	sll	a
 393  01ae 5a            	decw	x
 394  01af 26fc          	jrne	L641
 395  01b1               L441:
 396  01b1 ca50ca        	or	a,20682
 398  01b4 200c          	jp	LC001
 399  01b6               L16:
 400                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 401  01b6 ad0f          	call	LC003
 402  01b8 2704          	jreq	L051
 403  01ba               L251:
 404  01ba 48            	sll	a
 405  01bb 5a            	decw	x
 406  01bc 26fc          	jrne	L251
 407  01be               L051:
 408  01be 43            	cpl	a
 409  01bf c450ca        	and	a,20682
 410  01c2               LC001:
 411  01c2 c750ca        	ld	20682,a
 412  01c5               L75:
 413                     ; 295 }
 414  01c5 85            	popw	x
 415  01c6 81            	ret	
 416  01c7               LC003:
 417  01c7 a40f          	and	a,#15
 418  01c9 5f            	clrw	x
 419  01ca 97            	ld	xl,a
 420  01cb a601          	ld	a,#1
 421  01cd 5d            	tnzw	x
 422  01ce 81            	ret	
 423  01cf               LC004:
 424  01cf 89            	pushw	x
 425  01d0 5f            	clrw	x
 426  01d1 89            	pushw	x
 427  01d2 ae000c        	ldw	x,#L31
 428  01d5 cd0000        	call	_assert_failed
 430  01d8 5b04          	addw	sp,#4
 431  01da 81            	ret	
 433                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 433                     ; 310 {
 434  01db               _CLK_ClockSwitchConfig:
 435  01db 89            	pushw	x
 436  01dc 5204          	subw	sp,#4
 437       00000004      OFST:	set	4
 439                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
 440  01de aeffff        	ldw	x,#65535
 441  01e1 1f03          	ldw	(OFST-1,sp),x
 442                     ; 313   ErrorStatus Swif = ERROR;
 443                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
 444  01e3 7b06          	ld	a,(OFST+2,sp)
 445  01e5 a1e1          	cp	a,#225
 446  01e7 270e          	jreq	L261
 447  01e9 a1d2          	cp	a,#210
 448  01eb 270a          	jreq	L261
 449  01ed a1b4          	cp	a,#180
 450  01ef 2706          	jreq	L261
 451  01f1 ae013c        	ldw	x,#316
 452  01f4 cd02b7        	call	LC007
 453  01f7               L261:
 454                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
 455  01f7 7b05          	ld	a,(OFST+1,sp)
 456  01f9 2709          	jreq	L271
 457  01fb 4a            	dec	a
 458  01fc 2706          	jreq	L271
 459  01fe ae013d        	ldw	x,#317
 460  0201 cd02b7        	call	LC007
 461  0204               L271:
 462                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
 463  0204 7b09          	ld	a,(OFST+5,sp)
 464  0206 2709          	jreq	L202
 465  0208 4a            	dec	a
 466  0209 2706          	jreq	L202
 467  020b ae013e        	ldw	x,#318
 468  020e cd02b7        	call	LC007
 469  0211               L202:
 470                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
 471  0211 7b0a          	ld	a,(OFST+6,sp)
 472  0213 2709          	jreq	L212
 473  0215 4a            	dec	a
 474  0216 2706          	jreq	L212
 475  0218 ae013f        	ldw	x,#319
 476  021b cd02b7        	call	LC007
 477  021e               L212:
 478                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
 479  021e c650c3        	ld	a,20675
 480  0221 6b01          	ld	(OFST-3,sp),a
 481                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
 482  0223 7b05          	ld	a,(OFST+1,sp)
 483  0225 4a            	dec	a
 484  0226 263d          	jrne	L56
 485                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
 486  0228 721250c5      	bset	20677,#1
 487                     ; 331     if (ITState != DISABLE)
 488  022c 7b09          	ld	a,(OFST+5,sp)
 489  022e 2706          	jreq	L76
 490                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
 491  0230 721450c5      	bset	20677,#2
 493  0234 2004          	jra	L17
 494  0236               L76:
 495                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
 496  0236 721550c5      	bres	20677,#2
 497  023a               L17:
 498                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
 499  023a 7b06          	ld	a,(OFST+2,sp)
 500  023c c750c4        	ld	20676,a
 502  023f 2003          	jra	L77
 503  0241               L37:
 504                     ; 346       DownCounter--;
 505  0241 5a            	decw	x
 506  0242 1f03          	ldw	(OFST-1,sp),x
 507  0244               L77:
 508                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
 509  0244 720150c504    	btjf	20677,#0,L301
 511  0249 1e03          	ldw	x,(OFST-1,sp)
 512  024b 26f4          	jrne	L37
 513  024d               L301:
 514                     ; 349     if(DownCounter != 0)
 515  024d 1e03          	ldw	x,(OFST-1,sp)
 516                     ; 351       Swif = SUCCESS;
 518  024f 263d          	jrne	LC006
 519  0251               L501:
 520                     ; 355       Swif = ERROR;
 521  0251 0f02          	clr	(OFST-2,sp)
 522  0253               L111:
 523                     ; 390   if(Swif != ERROR)
 524  0253 275d          	jreq	L531
 525                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
 526  0255 7b0a          	ld	a,(OFST+6,sp)
 527  0257 263b          	jrne	L731
 529  0259 7b01          	ld	a,(OFST-3,sp)
 530  025b a1e1          	cp	a,#225
 531  025d 2635          	jrne	L731
 532                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 533  025f 721150c0      	bres	20672,#0
 535  0263 204d          	jra	L531
 536  0265               L56:
 537                     ; 361     if (ITState != DISABLE)
 538  0265 7b09          	ld	a,(OFST+5,sp)
 539  0267 2706          	jreq	L311
 540                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
 541  0269 721450c5      	bset	20677,#2
 543  026d 2004          	jra	L511
 544  026f               L311:
 545                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
 546  026f 721550c5      	bres	20677,#2
 547  0273               L511:
 548                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
 549  0273 7b06          	ld	a,(OFST+2,sp)
 550  0275 c750c4        	ld	20676,a
 552  0278 2003          	jra	L321
 553  027a               L711:
 554                     ; 376       DownCounter--;
 555  027a 5a            	decw	x
 556  027b 1f03          	ldw	(OFST-1,sp),x
 557  027d               L321:
 558                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
 559  027d 720750c504    	btjf	20677,#3,L721
 561  0282 1e03          	ldw	x,(OFST-1,sp)
 562  0284 26f4          	jrne	L711
 563  0286               L721:
 564                     ; 379     if(DownCounter != 0)
 565  0286 1e03          	ldw	x,(OFST-1,sp)
 566  0288 27c7          	jreq	L501
 567                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
 568  028a 721250c5      	bset	20677,#1
 569                     ; 383       Swif = SUCCESS;
 570  028e               LC006:
 571  028e a601          	ld	a,#1
 572  0290 6b02          	ld	(OFST-2,sp),a
 574  0292 20bf          	jra	L111
 575                     ; 387       Swif = ERROR;
 576  0294               L731:
 577                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
 578  0294 7b0a          	ld	a,(OFST+6,sp)
 579  0296 260c          	jrne	L341
 581  0298 7b01          	ld	a,(OFST-3,sp)
 582  029a a1d2          	cp	a,#210
 583  029c 2606          	jrne	L341
 584                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 585  029e 721750c0      	bres	20672,#3
 587  02a2 200e          	jra	L531
 588  02a4               L341:
 589                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
 590  02a4 7b0a          	ld	a,(OFST+6,sp)
 591  02a6 260a          	jrne	L531
 593  02a8 7b01          	ld	a,(OFST-3,sp)
 594  02aa a1b4          	cp	a,#180
 595  02ac 2604          	jrne	L531
 596                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 597  02ae 721150c1      	bres	20673,#0
 598  02b2               L531:
 599                     ; 406   return(Swif);
 600  02b2 7b02          	ld	a,(OFST-2,sp)
 602  02b4 5b06          	addw	sp,#6
 603  02b6 81            	ret	
 604  02b7               LC007:
 605  02b7 89            	pushw	x
 606  02b8 5f            	clrw	x
 607  02b9 89            	pushw	x
 608  02ba ae000c        	ldw	x,#L31
 609  02bd cd0000        	call	_assert_failed
 611  02c0 5b04          	addw	sp,#4
 612  02c2 81            	ret	
 614                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
 614                     ; 416 {
 615  02c3               _CLK_HSIPrescalerConfig:
 616  02c3 88            	push	a
 617       00000000      OFST:	set	0
 619                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
 620  02c4 4d            	tnz	a
 621  02c5 271a          	jreq	L422
 622  02c7 a108          	cp	a,#8
 623  02c9 2716          	jreq	L422
 624  02cb a110          	cp	a,#16
 625  02cd 2712          	jreq	L422
 626  02cf a118          	cp	a,#24
 627  02d1 270e          	jreq	L422
 628  02d3 ae01a2        	ldw	x,#418
 629  02d6 89            	pushw	x
 630  02d7 5f            	clrw	x
 631  02d8 89            	pushw	x
 632  02d9 ae000c        	ldw	x,#L31
 633  02dc cd0000        	call	_assert_failed
 635  02df 5b04          	addw	sp,#4
 636  02e1               L422:
 637                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 638  02e1 c650c6        	ld	a,20678
 639  02e4 a4e7          	and	a,#231
 640  02e6 c750c6        	ld	20678,a
 641                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
 642  02e9 c650c6        	ld	a,20678
 643  02ec 1a01          	or	a,(OFST+1,sp)
 644  02ee c750c6        	ld	20678,a
 645                     ; 425 }
 646  02f1 84            	pop	a
 647  02f2 81            	ret	
 649                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
 649                     ; 437 {
 650  02f3               _CLK_CCOConfig:
 651  02f3 88            	push	a
 652       00000000      OFST:	set	0
 654                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
 655  02f4 4d            	tnz	a
 656  02f5 273e          	jreq	L632
 657  02f7 a104          	cp	a,#4
 658  02f9 273a          	jreq	L632
 659  02fb a102          	cp	a,#2
 660  02fd 2736          	jreq	L632
 661  02ff a108          	cp	a,#8
 662  0301 2732          	jreq	L632
 663  0303 a10a          	cp	a,#10
 664  0305 272e          	jreq	L632
 665  0307 a10c          	cp	a,#12
 666  0309 272a          	jreq	L632
 667  030b a10e          	cp	a,#14
 668  030d 2726          	jreq	L632
 669  030f a110          	cp	a,#16
 670  0311 2722          	jreq	L632
 671  0313 a112          	cp	a,#18
 672  0315 271e          	jreq	L632
 673  0317 a114          	cp	a,#20
 674  0319 271a          	jreq	L632
 675  031b a116          	cp	a,#22
 676  031d 2716          	jreq	L632
 677  031f a118          	cp	a,#24
 678  0321 2712          	jreq	L632
 679  0323 a11a          	cp	a,#26
 680  0325 270e          	jreq	L632
 681  0327 ae01b7        	ldw	x,#439
 682  032a 89            	pushw	x
 683  032b 5f            	clrw	x
 684  032c 89            	pushw	x
 685  032d ae000c        	ldw	x,#L31
 686  0330 cd0000        	call	_assert_failed
 688  0333 5b04          	addw	sp,#4
 689  0335               L632:
 690                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 691  0335 c650c9        	ld	a,20681
 692  0338 a4e1          	and	a,#225
 693  033a c750c9        	ld	20681,a
 694                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
 695  033d c650c9        	ld	a,20681
 696  0340 1a01          	or	a,(OFST+1,sp)
 697  0342 c750c9        	ld	20681,a
 698                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
 699  0345 721050c9      	bset	20681,#0
 700                     ; 449 }
 701  0349 84            	pop	a
 702  034a 81            	ret	
 704                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
 704                     ; 460 {
 705  034b               _CLK_ITConfig:
 706  034b 89            	pushw	x
 707       00000000      OFST:	set	0
 709                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 710  034c 9f            	ld	a,xl
 711  034d 4d            	tnz	a
 712  034e 2709          	jreq	L052
 713  0350 9f            	ld	a,xl
 714  0351 4a            	dec	a
 715  0352 2705          	jreq	L052
 716  0354 ae01ce        	ldw	x,#462
 717  0357 ad3f          	call	LC008
 718  0359               L052:
 719                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
 720  0359 7b01          	ld	a,(OFST+1,sp)
 721  035b a10c          	cp	a,#12
 722  035d 2709          	jreq	L062
 723  035f a11c          	cp	a,#28
 724  0361 2705          	jreq	L062
 725  0363 ae01cf        	ldw	x,#463
 726  0366 ad30          	call	LC008
 727  0368               L062:
 728                     ; 465   if (NewState != DISABLE)
 729  0368 7b02          	ld	a,(OFST+2,sp)
 730  036a 2716          	jreq	L561
 731                     ; 467     switch (CLK_IT)
 732  036c 7b01          	ld	a,(OFST+1,sp)
 734                     ; 475     default:
 734                     ; 476       break;
 735  036e a00c          	sub	a,#12
 736  0370 270a          	jreq	L351
 737  0372 a010          	sub	a,#16
 738  0374 2620          	jrne	L371
 739                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
 739                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
 740  0376 721450c5      	bset	20677,#2
 741                     ; 471       break;
 742  037a 201a          	jra	L371
 743  037c               L351:
 744                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
 744                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
 745  037c 721450c8      	bset	20680,#2
 746                     ; 474       break;
 747  0380 2014          	jra	L371
 748                     ; 475     default:
 748                     ; 476       break;
 750  0382               L561:
 751                     ; 481     switch (CLK_IT)
 752  0382 7b01          	ld	a,(OFST+1,sp)
 754                     ; 489     default:
 754                     ; 490       break;
 755  0384 a00c          	sub	a,#12
 756  0386 270a          	jreq	L161
 757  0388 a010          	sub	a,#16
 758  038a 260a          	jrne	L371
 759                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
 759                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
 760  038c 721550c5      	bres	20677,#2
 761                     ; 485       break;
 762  0390 2004          	jra	L371
 763  0392               L161:
 764                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
 764                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
 765  0392 721550c8      	bres	20680,#2
 766                     ; 488       break;
 767  0396               L371:
 768                     ; 493 }
 769  0396 85            	popw	x
 770  0397 81            	ret	
 771                     ; 489     default:
 771                     ; 490       break;
 772  0398               LC008:
 773  0398 89            	pushw	x
 774  0399 5f            	clrw	x
 775  039a 89            	pushw	x
 776  039b ae000c        	ldw	x,#L31
 777  039e cd0000        	call	_assert_failed
 779  03a1 5b04          	addw	sp,#4
 780  03a3 81            	ret	
 782                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
 782                     ; 501 {
 783  03a4               _CLK_SYSCLKConfig:
 784  03a4 88            	push	a
 785       00000000      OFST:	set	0
 787                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
 788  03a5 4d            	tnz	a
 789  03a6 273a          	jreq	L272
 790  03a8 a108          	cp	a,#8
 791  03aa 2736          	jreq	L272
 792  03ac a110          	cp	a,#16
 793  03ae 2732          	jreq	L272
 794  03b0 a118          	cp	a,#24
 795  03b2 272e          	jreq	L272
 796  03b4 a180          	cp	a,#128
 797  03b6 272a          	jreq	L272
 798  03b8 a181          	cp	a,#129
 799  03ba 2726          	jreq	L272
 800  03bc a182          	cp	a,#130
 801  03be 2722          	jreq	L272
 802  03c0 a183          	cp	a,#131
 803  03c2 271e          	jreq	L272
 804  03c4 a184          	cp	a,#132
 805  03c6 271a          	jreq	L272
 806  03c8 a185          	cp	a,#133
 807  03ca 2716          	jreq	L272
 808  03cc a186          	cp	a,#134
 809  03ce 2712          	jreq	L272
 810  03d0 a187          	cp	a,#135
 811  03d2 270e          	jreq	L272
 812  03d4 ae01f7        	ldw	x,#503
 813  03d7 89            	pushw	x
 814  03d8 5f            	clrw	x
 815  03d9 89            	pushw	x
 816  03da ae000c        	ldw	x,#L31
 817  03dd cd0000        	call	_assert_failed
 819  03e0 5b04          	addw	sp,#4
 820  03e2               L272:
 821                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
 822  03e2 7b01          	ld	a,(OFST+1,sp)
 823  03e4 2b0e          	jrmi	L102
 824                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 825  03e6 c650c6        	ld	a,20678
 826  03e9 a4e7          	and	a,#231
 827  03eb c750c6        	ld	20678,a
 828                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
 829  03ee 7b01          	ld	a,(OFST+1,sp)
 830  03f0 a418          	and	a,#24
 832  03f2 200c          	jra	L302
 833  03f4               L102:
 834                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
 835  03f4 c650c6        	ld	a,20678
 836  03f7 a4f8          	and	a,#248
 837  03f9 c750c6        	ld	20678,a
 838                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
 839  03fc 7b01          	ld	a,(OFST+1,sp)
 840  03fe a407          	and	a,#7
 841  0400               L302:
 842  0400 ca50c6        	or	a,20678
 843  0403 c750c6        	ld	20678,a
 844                     ; 515 }
 845  0406 84            	pop	a
 846  0407 81            	ret	
 848                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
 848                     ; 524 {
 849  0408               _CLK_SWIMConfig:
 850  0408 88            	push	a
 851       00000000      OFST:	set	0
 853                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
 854  0409 4d            	tnz	a
 855  040a 2711          	jreq	L403
 856  040c 4a            	dec	a
 857  040d 270e          	jreq	L403
 858  040f ae020e        	ldw	x,#526
 859  0412 89            	pushw	x
 860  0413 5f            	clrw	x
 861  0414 89            	pushw	x
 862  0415 ae000c        	ldw	x,#L31
 863  0418 cd0000        	call	_assert_failed
 865  041b 5b04          	addw	sp,#4
 866  041d               L403:
 867                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
 868  041d 7b01          	ld	a,(OFST+1,sp)
 869  041f 2706          	jreq	L502
 870                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
 871  0421 721050cd      	bset	20685,#0
 873  0425 2004          	jra	L702
 874  0427               L502:
 875                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
 876  0427 721150cd      	bres	20685,#0
 877  042b               L702:
 878                     ; 538 }
 879  042b 84            	pop	a
 880  042c 81            	ret	
 882                     ; 547 void CLK_ClockSecuritySystemEnable(void)
 882                     ; 548 {
 883  042d               _CLK_ClockSecuritySystemEnable:
 885                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
 886  042d 721050c8      	bset	20680,#0
 887                     ; 551 }
 888  0431 81            	ret	
 890                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
 890                     ; 560 {
 891  0432               _CLK_GetSYSCLKSource:
 893                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
 894  0432 c650c3        	ld	a,20675
 896  0435 81            	ret	
 898                     ; 569 uint32_t CLK_GetClockFreq(void)
 898                     ; 570 {
 899  0436               _CLK_GetClockFreq:
 900  0436 5209          	subw	sp,#9
 901       00000009      OFST:	set	9
 903                     ; 571   uint32_t clockfrequency = 0;
 904                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
 905                     ; 573   uint8_t tmp = 0, presc = 0;
 907                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
 908  0438 c650c3        	ld	a,20675
 909  043b 6b09          	ld	(OFST+0,sp),a
 910                     ; 578   if (clocksource == CLK_SOURCE_HSI)
 911  043d a1e1          	cp	a,#225
 912  043f 2634          	jrne	L112
 913                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 914  0441 c650c6        	ld	a,20678
 915  0444 a418          	and	a,#24
 916  0446 44            	srl	a
 917  0447 44            	srl	a
 918  0448 44            	srl	a
 919                     ; 581     tmp = (uint8_t)(tmp >> 3);
 920                     ; 582     presc = HSIDivFactor[tmp];
 921  0449 5f            	clrw	x
 922  044a 97            	ld	xl,a
 923  044b d60000        	ld	a,(_HSIDivFactor,x)
 924  044e 6b09          	ld	(OFST+0,sp),a
 925                     ; 583     clockfrequency = HSI_VALUE / presc;
 926  0450 b703          	ld	c_lreg+3,a
 927  0452 3f02          	clr	c_lreg+2
 928  0454 3f01          	clr	c_lreg+1
 929  0456 3f00          	clr	c_lreg
 930  0458 96            	ldw	x,sp
 931  0459 5c            	incw	x
 932  045a cd0000        	call	c_rtol
 934  045d ae2400        	ldw	x,#9216
 935  0460 bf02          	ldw	c_lreg+2,x
 936  0462 ae00f4        	ldw	x,#244
 937  0465 bf00          	ldw	c_lreg,x
 938  0467 96            	ldw	x,sp
 939  0468 5c            	incw	x
 940  0469 cd0000        	call	c_ludv
 942  046c 96            	ldw	x,sp
 943  046d 1c0005        	addw	x,#OFST-4
 944  0470 cd0000        	call	c_rtol
 947  0473 2018          	jra	L312
 948  0475               L112:
 949                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
 950  0475 a1d2          	cp	a,#210
 951  0477 260a          	jrne	L512
 952                     ; 587     clockfrequency = LSI_VALUE;
 953  0479 aef400        	ldw	x,#62464
 954  047c 1f07          	ldw	(OFST-2,sp),x
 955  047e ae0001        	ldw	x,#1
 957  0481 2008          	jp	LC009
 958  0483               L512:
 959                     ; 591     clockfrequency = HSE_VALUE;
 960  0483 ae3600        	ldw	x,#13824
 961  0486 1f07          	ldw	(OFST-2,sp),x
 962  0488 ae016e        	ldw	x,#366
 963  048b               LC009:
 964  048b 1f05          	ldw	(OFST-4,sp),x
 965  048d               L312:
 966                     ; 594   return((uint32_t)clockfrequency);
 967  048d 96            	ldw	x,sp
 968  048e 1c0005        	addw	x,#OFST-4
 969  0491 cd0000        	call	c_ltor
 972  0494 5b09          	addw	sp,#9
 973  0496 81            	ret	
 975                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
 975                     ; 605 {
 976  0497               _CLK_AdjustHSICalibrationValue:
 977  0497 88            	push	a
 978       00000000      OFST:	set	0
 980                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
 981  0498 4d            	tnz	a
 982  0499 272a          	jreq	L423
 983  049b a101          	cp	a,#1
 984  049d 2726          	jreq	L423
 985  049f a102          	cp	a,#2
 986  04a1 2722          	jreq	L423
 987  04a3 a103          	cp	a,#3
 988  04a5 271e          	jreq	L423
 989  04a7 a104          	cp	a,#4
 990  04a9 271a          	jreq	L423
 991  04ab a105          	cp	a,#5
 992  04ad 2716          	jreq	L423
 993  04af a106          	cp	a,#6
 994  04b1 2712          	jreq	L423
 995  04b3 a107          	cp	a,#7
 996  04b5 270e          	jreq	L423
 997  04b7 ae025f        	ldw	x,#607
 998  04ba 89            	pushw	x
 999  04bb 5f            	clrw	x
1000  04bc 89            	pushw	x
1001  04bd ae000c        	ldw	x,#L31
1002  04c0 cd0000        	call	_assert_failed
1004  04c3 5b04          	addw	sp,#4
1005  04c5               L423:
1006                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
1007  04c5 c650cc        	ld	a,20684
1008  04c8 a4f8          	and	a,#248
1009  04ca 1a01          	or	a,(OFST+1,sp)
1010  04cc c750cc        	ld	20684,a
1011                     ; 611 }
1012  04cf 84            	pop	a
1013  04d0 81            	ret	
1015                     ; 622 void CLK_SYSCLKEmergencyClear(void)
1015                     ; 623 {
1016  04d1               _CLK_SYSCLKEmergencyClear:
1018                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
1019  04d1 721150c5      	bres	20677,#0
1020                     ; 625 }
1021  04d5 81            	ret	
1023                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
1023                     ; 635 {
1024  04d6               _CLK_GetFlagStatus:
1025  04d6 89            	pushw	x
1026  04d7 5203          	subw	sp,#3
1027       00000003      OFST:	set	3
1029                     ; 636   uint16_t statusreg = 0;
1030                     ; 637   uint8_t tmpreg = 0;
1031                     ; 638   FlagStatus bitstatus = RESET;
1032                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
1033  04d9 a30110        	cpw	x,#272
1034  04dc 2736          	jreq	L043
1035  04de a30102        	cpw	x,#258
1036  04e1 2731          	jreq	L043
1037  04e3 a30202        	cpw	x,#514
1038  04e6 272c          	jreq	L043
1039  04e8 a30308        	cpw	x,#776
1040  04eb 2727          	jreq	L043
1041  04ed a30301        	cpw	x,#769
1042  04f0 2722          	jreq	L043
1043  04f2 a30408        	cpw	x,#1032
1044  04f5 271d          	jreq	L043
1045  04f7 a30402        	cpw	x,#1026
1046  04fa 2718          	jreq	L043
1047  04fc a30504        	cpw	x,#1284
1048  04ff 2713          	jreq	L043
1049  0501 a30502        	cpw	x,#1282
1050  0504 270e          	jreq	L043
1051  0506 ae0281        	ldw	x,#641
1052  0509 89            	pushw	x
1053  050a 5f            	clrw	x
1054  050b 89            	pushw	x
1055  050c ae000c        	ldw	x,#L31
1056  050f cd0000        	call	_assert_failed
1058  0512 5b04          	addw	sp,#4
1059  0514               L043:
1060                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
1061  0514 7b04          	ld	a,(OFST+1,sp)
1062  0516 97            	ld	xl,a
1063  0517 4f            	clr	a
1064  0518 02            	rlwa	x,a
1065  0519 1f01          	ldw	(OFST-2,sp),x
1066                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
1067  051b a30100        	cpw	x,#256
1068  051e 2605          	jrne	L122
1069                     ; 649     tmpreg = CLK->ICKR;
1070  0520 c650c0        	ld	a,20672
1072  0523 2021          	jra	L322
1073  0525               L122:
1074                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
1075  0525 a30200        	cpw	x,#512
1076  0528 2605          	jrne	L522
1077                     ; 653     tmpreg = CLK->ECKR;
1078  052a c650c1        	ld	a,20673
1080  052d 2017          	jra	L322
1081  052f               L522:
1082                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
1083  052f a30300        	cpw	x,#768
1084  0532 2605          	jrne	L132
1085                     ; 657     tmpreg = CLK->SWCR;
1086  0534 c650c5        	ld	a,20677
1088  0537 200d          	jra	L322
1089  0539               L132:
1090                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
1091  0539 a30400        	cpw	x,#1024
1092  053c 2605          	jrne	L532
1093                     ; 661     tmpreg = CLK->CSSR;
1094  053e c650c8        	ld	a,20680
1096  0541 2003          	jra	L322
1097  0543               L532:
1098                     ; 665     tmpreg = CLK->CCOR;
1099  0543 c650c9        	ld	a,20681
1100  0546               L322:
1101  0546 6b03          	ld	(OFST+0,sp),a
1102                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
1103  0548 7b05          	ld	a,(OFST+2,sp)
1104  054a 1503          	bcp	a,(OFST+0,sp)
1105  054c 2704          	jreq	L142
1106                     ; 670     bitstatus = SET;
1107  054e a601          	ld	a,#1
1109  0550 2001          	jra	L342
1110  0552               L142:
1111                     ; 674     bitstatus = RESET;
1112  0552 4f            	clr	a
1113  0553               L342:
1114                     ; 678   return((FlagStatus)bitstatus);
1116  0553 5b05          	addw	sp,#5
1117  0555 81            	ret	
1119                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
1119                     ; 688 {
1120  0556               _CLK_GetITStatus:
1121  0556 88            	push	a
1122  0557 88            	push	a
1123       00000001      OFST:	set	1
1125                     ; 689   ITStatus bitstatus = RESET;
1126                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
1127  0558 a10c          	cp	a,#12
1128  055a 2712          	jreq	L253
1129  055c a11c          	cp	a,#28
1130  055e 270e          	jreq	L253
1131  0560 ae02b4        	ldw	x,#692
1132  0563 89            	pushw	x
1133  0564 5f            	clrw	x
1134  0565 89            	pushw	x
1135  0566 ae000c        	ldw	x,#L31
1136  0569 cd0000        	call	_assert_failed
1138  056c 5b04          	addw	sp,#4
1139  056e               L253:
1140                     ; 694   if (CLK_IT == CLK_IT_SWIF)
1141  056e 7b02          	ld	a,(OFST+1,sp)
1142  0570 a11c          	cp	a,#28
1143  0572 260b          	jrne	L542
1144                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
1145  0574 c650c5        	ld	a,20677
1146  0577 1402          	and	a,(OFST+1,sp)
1147  0579 a10c          	cp	a,#12
1148  057b 260f          	jrne	L552
1149                     ; 699       bitstatus = SET;
1151  057d 2009          	jp	LC011
1152                     ; 703       bitstatus = RESET;
1153  057f               L542:
1154                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
1155  057f c650c8        	ld	a,20680
1156  0582 1402          	and	a,(OFST+1,sp)
1157  0584 a10c          	cp	a,#12
1158  0586 2604          	jrne	L552
1159                     ; 711       bitstatus = SET;
1160  0588               LC011:
1161  0588 a601          	ld	a,#1
1163  058a 2001          	jra	L352
1164  058c               L552:
1165                     ; 715       bitstatus = RESET;
1166  058c 4f            	clr	a
1167  058d               L352:
1168                     ; 720   return bitstatus;
1170  058d 85            	popw	x
1171  058e 81            	ret	
1173                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
1173                     ; 730 {
1174  058f               _CLK_ClearITPendingBit:
1175  058f 88            	push	a
1176       00000000      OFST:	set	0
1178                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
1179  0590 a10c          	cp	a,#12
1180  0592 2712          	jreq	L463
1181  0594 a11c          	cp	a,#28
1182  0596 270e          	jreq	L463
1183  0598 ae02dc        	ldw	x,#732
1184  059b 89            	pushw	x
1185  059c 5f            	clrw	x
1186  059d 89            	pushw	x
1187  059e ae000c        	ldw	x,#L31
1188  05a1 cd0000        	call	_assert_failed
1190  05a4 5b04          	addw	sp,#4
1191  05a6               L463:
1192                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
1193  05a6 7b01          	ld	a,(OFST+1,sp)
1194  05a8 a10c          	cp	a,#12
1195  05aa 2606          	jrne	L162
1196                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
1197  05ac 721750c8      	bres	20680,#3
1199  05b0 2004          	jra	L362
1200  05b2               L162:
1201                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
1202  05b2 721750c5      	bres	20677,#3
1203  05b6               L362:
1204                     ; 745 }
1205  05b6 84            	pop	a
1206  05b7 81            	ret	
1208                     	xdef	_CLKPrescTable
1209                     	xdef	_HSIDivFactor
1210                     	xdef	_CLK_ClearITPendingBit
1211                     	xdef	_CLK_GetITStatus
1212                     	xdef	_CLK_GetFlagStatus
1213                     	xdef	_CLK_GetSYSCLKSource
1214                     	xdef	_CLK_GetClockFreq
1215                     	xdef	_CLK_AdjustHSICalibrationValue
1216                     	xdef	_CLK_SYSCLKEmergencyClear
1217                     	xdef	_CLK_ClockSecuritySystemEnable
1218                     	xdef	_CLK_SWIMConfig
1219                     	xdef	_CLK_SYSCLKConfig
1220                     	xdef	_CLK_ITConfig
1221                     	xdef	_CLK_CCOConfig
1222                     	xdef	_CLK_HSIPrescalerConfig
1223                     	xdef	_CLK_ClockSwitchConfig
1224                     	xdef	_CLK_PeripheralClockConfig
1225                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
1226                     	xdef	_CLK_FastHaltWakeUpCmd
1227                     	xdef	_CLK_ClockSwitchCmd
1228                     	xdef	_CLK_CCOCmd
1229                     	xdef	_CLK_LSICmd
1230                     	xdef	_CLK_HSICmd
1231                     	xdef	_CLK_HSECmd
1232                     	xdef	_CLK_DeInit
1233                     	xref	_assert_failed
1234                     	switch	.const
1235  000c               L31:
1236  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1237  001e 6970685f6472  	dc.b	"iph_driver\src\stm"
1238  0030 38735f636c6b  	dc.b	"8s_clk.c",0
1239                     	xref.b	c_lreg
1240                     	xref.b	c_x
1241                     	xref	c_ltor
1242                     	xref	c_ludv
1243                     	xref	c_rtol
1244                     	end
