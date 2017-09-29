   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 49 void TIM4_DeInit(void)
  20                     ; 50 {
  21                     	scross	off
  22  0000               _TIM4_DeInit:
  24                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  25  0000 725f5340      	clr	21312
  26                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  27  0004 725f5341      	clr	21313
  28                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  29  0008 725f5344      	clr	21316
  30                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  31  000c 725f5345      	clr	21317
  32                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  33  0010 35ff5346      	mov	21318,#255
  34                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  35  0014 725f5342      	clr	21314
  36                     ; 57 }
  37  0018 81            	ret	
  39                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
  39                     ; 66 {
  40  0019               _TIM4_TimeBaseInit:
  41  0019 89            	pushw	x
  42       00000000      OFST:	set	0
  44                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
  45  001a 9e            	ld	a,xh
  46  001b 4d            	tnz	a
  47  001c 2730          	jreq	L21
  48  001e 9e            	ld	a,xh
  49  001f 4a            	dec	a
  50  0020 272c          	jreq	L21
  51  0022 9e            	ld	a,xh
  52  0023 a102          	cp	a,#2
  53  0025 2727          	jreq	L21
  54  0027 9e            	ld	a,xh
  55  0028 a103          	cp	a,#3
  56  002a 2722          	jreq	L21
  57  002c 9e            	ld	a,xh
  58  002d a104          	cp	a,#4
  59  002f 271d          	jreq	L21
  60  0031 9e            	ld	a,xh
  61  0032 a105          	cp	a,#5
  62  0034 2718          	jreq	L21
  63  0036 9e            	ld	a,xh
  64  0037 a106          	cp	a,#6
  65  0039 2713          	jreq	L21
  66  003b 9e            	ld	a,xh
  67  003c a107          	cp	a,#7
  68  003e 270e          	jreq	L21
  69  0040 ae0044        	ldw	x,#68
  70  0043 89            	pushw	x
  71  0044 5f            	clrw	x
  72  0045 89            	pushw	x
  73  0046 ae0000        	ldw	x,#L3
  74  0049 cd0000        	call	_assert_failed
  76  004c 5b04          	addw	sp,#4
  77  004e               L21:
  78                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
  79  004e 7b01          	ld	a,(OFST+1,sp)
  80  0050 c75345        	ld	21317,a
  81                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
  82  0053 7b02          	ld	a,(OFST+2,sp)
  83  0055 c75346        	ld	21318,a
  84                     ; 73 }
  85  0058 85            	popw	x
  86  0059 81            	ret	
  88                     ; 81 void TIM4_Cmd(FunctionalState NewState)
  88                     ; 82 {
  89  005a               _TIM4_Cmd:
  90  005a 88            	push	a
  91       00000000      OFST:	set	0
  93                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  94  005b 4d            	tnz	a
  95  005c 2711          	jreq	L42
  96  005e 4a            	dec	a
  97  005f 270e          	jreq	L42
  98  0061 ae0054        	ldw	x,#84
  99  0064 89            	pushw	x
 100  0065 5f            	clrw	x
 101  0066 89            	pushw	x
 102  0067 ae0000        	ldw	x,#L3
 103  006a cd0000        	call	_assert_failed
 105  006d 5b04          	addw	sp,#4
 106  006f               L42:
 107                     ; 87   if (NewState != DISABLE)
 108  006f 7b01          	ld	a,(OFST+1,sp)
 109  0071 2706          	jreq	L5
 110                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 111  0073 72105340      	bset	21312,#0
 113  0077 2004          	jra	L7
 114  0079               L5:
 115                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 116  0079 72115340      	bres	21312,#0
 117  007d               L7:
 118                     ; 95 }
 119  007d 84            	pop	a
 120  007e 81            	ret	
 122                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 122                     ; 108 {
 123  007f               _TIM4_ITConfig:
 124  007f 89            	pushw	x
 125       00000000      OFST:	set	0
 127                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 128  0080 9e            	ld	a,xh
 129  0081 4a            	dec	a
 130  0082 2705          	jreq	L43
 131  0084 ae006e        	ldw	x,#110
 132  0087 ad22          	call	LC001
 133  0089               L43:
 134                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 135  0089 7b02          	ld	a,(OFST+2,sp)
 136  008b 2708          	jreq	L44
 137  008d 4a            	dec	a
 138  008e 2705          	jreq	L44
 139  0090 ae006f        	ldw	x,#111
 140  0093 ad16          	call	LC001
 141  0095               L44:
 142                     ; 113   if (NewState != DISABLE)
 143  0095 7b02          	ld	a,(OFST+2,sp)
 144  0097 2707          	jreq	L11
 145                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 146  0099 c65341        	ld	a,21313
 147  009c 1a01          	or	a,(OFST+1,sp)
 149  009e 2006          	jra	L31
 150  00a0               L11:
 151                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 152  00a0 7b01          	ld	a,(OFST+1,sp)
 153  00a2 43            	cpl	a
 154  00a3 c45341        	and	a,21313
 155  00a6               L31:
 156  00a6 c75341        	ld	21313,a
 157                     ; 123 }
 158  00a9 85            	popw	x
 159  00aa 81            	ret	
 160  00ab               LC001:
 161  00ab 89            	pushw	x
 162  00ac 5f            	clrw	x
 163  00ad 89            	pushw	x
 164  00ae ae0000        	ldw	x,#L3
 165  00b1 cd0000        	call	_assert_failed
 167  00b4 5b04          	addw	sp,#4
 168  00b6 81            	ret	
 170                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 170                     ; 132 {
 171  00b7               _TIM4_UpdateDisableConfig:
 172  00b7 88            	push	a
 173       00000000      OFST:	set	0
 175                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176  00b8 4d            	tnz	a
 177  00b9 2711          	jreq	L65
 178  00bb 4a            	dec	a
 179  00bc 270e          	jreq	L65
 180  00be ae0086        	ldw	x,#134
 181  00c1 89            	pushw	x
 182  00c2 5f            	clrw	x
 183  00c3 89            	pushw	x
 184  00c4 ae0000        	ldw	x,#L3
 185  00c7 cd0000        	call	_assert_failed
 187  00ca 5b04          	addw	sp,#4
 188  00cc               L65:
 189                     ; 137   if (NewState != DISABLE)
 190  00cc 7b01          	ld	a,(OFST+1,sp)
 191  00ce 2706          	jreq	L51
 192                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 193  00d0 72125340      	bset	21312,#1
 195  00d4 2004          	jra	L71
 196  00d6               L51:
 197                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 198  00d6 72135340      	bres	21312,#1
 199  00da               L71:
 200                     ; 145 }
 201  00da 84            	pop	a
 202  00db 81            	ret	
 204                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 204                     ; 156 {
 205  00dc               _TIM4_UpdateRequestConfig:
 206  00dc 88            	push	a
 207       00000000      OFST:	set	0
 209                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 210  00dd 4d            	tnz	a
 211  00de 2711          	jreq	L07
 212  00e0 4a            	dec	a
 213  00e1 270e          	jreq	L07
 214  00e3 ae009e        	ldw	x,#158
 215  00e6 89            	pushw	x
 216  00e7 5f            	clrw	x
 217  00e8 89            	pushw	x
 218  00e9 ae0000        	ldw	x,#L3
 219  00ec cd0000        	call	_assert_failed
 221  00ef 5b04          	addw	sp,#4
 222  00f1               L07:
 223                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 224  00f1 7b01          	ld	a,(OFST+1,sp)
 225  00f3 2706          	jreq	L12
 226                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 227  00f5 72145340      	bset	21312,#2
 229  00f9 2004          	jra	L32
 230  00fb               L12:
 231                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 232  00fb 72155340      	bres	21312,#2
 233  00ff               L32:
 234                     ; 169 }
 235  00ff 84            	pop	a
 236  0100 81            	ret	
 238                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 238                     ; 180 {
 239  0101               _TIM4_SelectOnePulseMode:
 240  0101 88            	push	a
 241       00000000      OFST:	set	0
 243                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 244  0102 a101          	cp	a,#1
 245  0104 2711          	jreq	L201
 246  0106 4d            	tnz	a
 247  0107 270e          	jreq	L201
 248  0109 ae00b6        	ldw	x,#182
 249  010c 89            	pushw	x
 250  010d 5f            	clrw	x
 251  010e 89            	pushw	x
 252  010f ae0000        	ldw	x,#L3
 253  0112 cd0000        	call	_assert_failed
 255  0115 5b04          	addw	sp,#4
 256  0117               L201:
 257                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 258  0117 7b01          	ld	a,(OFST+1,sp)
 259  0119 2706          	jreq	L52
 260                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 261  011b 72165340      	bset	21312,#3
 263  011f 2004          	jra	L72
 264  0121               L52:
 265                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 266  0121 72175340      	bres	21312,#3
 267  0125               L72:
 268                     ; 193 }
 269  0125 84            	pop	a
 270  0126 81            	ret	
 272                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 272                     ; 216 {
 273  0127               _TIM4_PrescalerConfig:
 274  0127 89            	pushw	x
 275       00000000      OFST:	set	0
 277                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 278  0128 9f            	ld	a,xl
 279  0129 4d            	tnz	a
 280  012a 2709          	jreq	L411
 281  012c 9f            	ld	a,xl
 282  012d 4a            	dec	a
 283  012e 2705          	jreq	L411
 284  0130 ae00da        	ldw	x,#218
 285  0133 ad31          	call	LC002
 286  0135               L411:
 287                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 288  0135 7b01          	ld	a,(OFST+1,sp)
 289  0137 2723          	jreq	L421
 290  0139 a101          	cp	a,#1
 291  013b 271f          	jreq	L421
 292  013d a102          	cp	a,#2
 293  013f 271b          	jreq	L421
 294  0141 a103          	cp	a,#3
 295  0143 2717          	jreq	L421
 296  0145 a104          	cp	a,#4
 297  0147 2713          	jreq	L421
 298  0149 a105          	cp	a,#5
 299  014b 270f          	jreq	L421
 300  014d a106          	cp	a,#6
 301  014f 270b          	jreq	L421
 302  0151 a107          	cp	a,#7
 303  0153 2707          	jreq	L421
 304  0155 ae00db        	ldw	x,#219
 305  0158 ad0c          	call	LC002
 306  015a 7b01          	ld	a,(OFST+1,sp)
 307  015c               L421:
 308                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 309  015c c75345        	ld	21317,a
 310                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 311  015f 7b02          	ld	a,(OFST+2,sp)
 312  0161 c75343        	ld	21315,a
 313                     ; 226 }
 314  0164 85            	popw	x
 315  0165 81            	ret	
 316  0166               LC002:
 317  0166 89            	pushw	x
 318  0167 5f            	clrw	x
 319  0168 89            	pushw	x
 320  0169 ae0000        	ldw	x,#L3
 321  016c cd0000        	call	_assert_failed
 323  016f 5b04          	addw	sp,#4
 324  0171 81            	ret	
 326                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 326                     ; 235 {
 327  0172               _TIM4_ARRPreloadConfig:
 328  0172 88            	push	a
 329       00000000      OFST:	set	0
 331                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 332  0173 4d            	tnz	a
 333  0174 2711          	jreq	L631
 334  0176 4a            	dec	a
 335  0177 270e          	jreq	L631
 336  0179 ae00ed        	ldw	x,#237
 337  017c 89            	pushw	x
 338  017d 5f            	clrw	x
 339  017e 89            	pushw	x
 340  017f ae0000        	ldw	x,#L3
 341  0182 cd0000        	call	_assert_failed
 343  0185 5b04          	addw	sp,#4
 344  0187               L631:
 345                     ; 240   if (NewState != DISABLE)
 346  0187 7b01          	ld	a,(OFST+1,sp)
 347  0189 2706          	jreq	L13
 348                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 349  018b 721e5340      	bset	21312,#7
 351  018f 2004          	jra	L33
 352  0191               L13:
 353                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 354  0191 721f5340      	bres	21312,#7
 355  0195               L33:
 356                     ; 248 }
 357  0195 84            	pop	a
 358  0196 81            	ret	
 360                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 360                     ; 258 {
 361  0197               _TIM4_GenerateEvent:
 362  0197 88            	push	a
 363       00000000      OFST:	set	0
 365                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 366  0198 4a            	dec	a
 367  0199 270e          	jreq	L641
 368  019b ae0104        	ldw	x,#260
 369  019e 89            	pushw	x
 370  019f 5f            	clrw	x
 371  01a0 89            	pushw	x
 372  01a1 ae0000        	ldw	x,#L3
 373  01a4 cd0000        	call	_assert_failed
 375  01a7 5b04          	addw	sp,#4
 376  01a9               L641:
 377                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 378  01a9 7b01          	ld	a,(OFST+1,sp)
 379  01ab c75343        	ld	21315,a
 380                     ; 264 }
 381  01ae 84            	pop	a
 382  01af 81            	ret	
 384                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 384                     ; 273 {
 385  01b0               _TIM4_SetCounter:
 387                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 388  01b0 c75344        	ld	21316,a
 389                     ; 276 }
 390  01b3 81            	ret	
 392                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 392                     ; 285 {
 393  01b4               _TIM4_SetAutoreload:
 395                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 396  01b4 c75346        	ld	21318,a
 397                     ; 288 }
 398  01b7 81            	ret	
 400                     ; 295 uint8_t TIM4_GetCounter(void)
 400                     ; 296 {
 401  01b8               _TIM4_GetCounter:
 403                     ; 298   return (uint8_t)(TIM4->CNTR);
 404  01b8 c65344        	ld	a,21316
 406  01bb 81            	ret	
 408                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 408                     ; 307 {
 409  01bc               _TIM4_GetPrescaler:
 411                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 412  01bc c65345        	ld	a,21317
 414  01bf 81            	ret	
 416                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
 416                     ; 320 {
 417  01c0               _TIM4_GetFlagStatus:
 418  01c0 88            	push	a
 419  01c1 88            	push	a
 420       00000001      OFST:	set	1
 422                     ; 321   FlagStatus bitstatus = RESET;
 423                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
 424  01c2 4a            	dec	a
 425  01c3 270e          	jreq	L661
 426  01c5 ae0144        	ldw	x,#324
 427  01c8 89            	pushw	x
 428  01c9 5f            	clrw	x
 429  01ca 89            	pushw	x
 430  01cb ae0000        	ldw	x,#L3
 431  01ce cd0000        	call	_assert_failed
 433  01d1 5b04          	addw	sp,#4
 434  01d3               L661:
 435                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
 436  01d3 c65342        	ld	a,21314
 437  01d6 1502          	bcp	a,(OFST+1,sp)
 438  01d8 2704          	jreq	L53
 439                     ; 328     bitstatus = SET;
 440  01da a601          	ld	a,#1
 442  01dc 2001          	jra	L73
 443  01de               L53:
 444                     ; 332     bitstatus = RESET;
 445  01de 4f            	clr	a
 446  01df               L73:
 447                     ; 334   return ((FlagStatus)bitstatus);
 449  01df 85            	popw	x
 450  01e0 81            	ret	
 452                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
 452                     ; 345 {
 453  01e1               _TIM4_ClearFlag:
 454  01e1 88            	push	a
 455       00000000      OFST:	set	0
 457                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
 458  01e2 4a            	dec	a
 459  01e3 270e          	jreq	L671
 460  01e5 ae015b        	ldw	x,#347
 461  01e8 89            	pushw	x
 462  01e9 5f            	clrw	x
 463  01ea 89            	pushw	x
 464  01eb ae0000        	ldw	x,#L3
 465  01ee cd0000        	call	_assert_failed
 467  01f1 5b04          	addw	sp,#4
 468  01f3               L671:
 469                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
 470  01f3 7b01          	ld	a,(OFST+1,sp)
 471  01f5 43            	cpl	a
 472  01f6 c75342        	ld	21314,a
 473                     ; 351 }
 474  01f9 84            	pop	a
 475  01fa 81            	ret	
 477                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
 477                     ; 361 {
 478  01fb               _TIM4_GetITStatus:
 479  01fb 88            	push	a
 480  01fc 89            	pushw	x
 481       00000002      OFST:	set	2
 483                     ; 362   ITStatus bitstatus = RESET;
 484                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
 486                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 487  01fd 4a            	dec	a
 488  01fe 270e          	jreq	L602
 489  0200 ae016f        	ldw	x,#367
 490  0203 89            	pushw	x
 491  0204 5f            	clrw	x
 492  0205 89            	pushw	x
 493  0206 ae0000        	ldw	x,#L3
 494  0209 cd0000        	call	_assert_failed
 496  020c 5b04          	addw	sp,#4
 497  020e               L602:
 498                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
 499  020e c65342        	ld	a,21314
 500  0211 1403          	and	a,(OFST+1,sp)
 501  0213 6b01          	ld	(OFST-1,sp),a
 502                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
 503  0215 c65341        	ld	a,21313
 504  0218 1403          	and	a,(OFST+1,sp)
 505  021a 6b02          	ld	(OFST+0,sp),a
 506                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
 507  021c 7b01          	ld	a,(OFST-1,sp)
 508  021e 2708          	jreq	L14
 510  0220 7b02          	ld	a,(OFST+0,sp)
 511  0222 2704          	jreq	L14
 512                     ; 375     bitstatus = (ITStatus)SET;
 513  0224 a601          	ld	a,#1
 515  0226 2001          	jra	L34
 516  0228               L14:
 517                     ; 379     bitstatus = (ITStatus)RESET;
 518  0228 4f            	clr	a
 519  0229               L34:
 520                     ; 381   return ((ITStatus)bitstatus);
 522  0229 5b03          	addw	sp,#3
 523  022b 81            	ret	
 525                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
 525                     ; 392 {
 526  022c               _TIM4_ClearITPendingBit:
 527  022c 88            	push	a
 528       00000000      OFST:	set	0
 530                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 531  022d 4a            	dec	a
 532  022e 270e          	jreq	L612
 533  0230 ae018a        	ldw	x,#394
 534  0233 89            	pushw	x
 535  0234 5f            	clrw	x
 536  0235 89            	pushw	x
 537  0236 ae0000        	ldw	x,#L3
 538  0239 cd0000        	call	_assert_failed
 540  023c 5b04          	addw	sp,#4
 541  023e               L612:
 542                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
 543  023e 7b01          	ld	a,(OFST+1,sp)
 544  0240 43            	cpl	a
 545  0241 c75342        	ld	21314,a
 546                     ; 398 }
 547  0244 84            	pop	a
 548  0245 81            	ret	
 550                     	xdef	_TIM4_ClearITPendingBit
 551                     	xdef	_TIM4_GetITStatus
 552                     	xdef	_TIM4_ClearFlag
 553                     	xdef	_TIM4_GetFlagStatus
 554                     	xdef	_TIM4_GetPrescaler
 555                     	xdef	_TIM4_GetCounter
 556                     	xdef	_TIM4_SetAutoreload
 557                     	xdef	_TIM4_SetCounter
 558                     	xdef	_TIM4_GenerateEvent
 559                     	xdef	_TIM4_ARRPreloadConfig
 560                     	xdef	_TIM4_PrescalerConfig
 561                     	xdef	_TIM4_SelectOnePulseMode
 562                     	xdef	_TIM4_UpdateRequestConfig
 563                     	xdef	_TIM4_UpdateDisableConfig
 564                     	xdef	_TIM4_ITConfig
 565                     	xdef	_TIM4_Cmd
 566                     	xdef	_TIM4_TimeBaseInit
 567                     	xdef	_TIM4_DeInit
 568                     	xref	_assert_failed
 569                     .const:	section	.text
 570  0000               L3:
 571  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 572  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 573  0024 38735f74696d  	dc.b	"8s_tim4.c",0
 574                     	end
