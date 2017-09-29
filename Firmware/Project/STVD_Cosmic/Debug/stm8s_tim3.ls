   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 51 void TIM3_DeInit(void)
  20                     ; 52 {
  21                     	scross	off
  22  0000               _TIM3_DeInit:
  24                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  25  0000 725f5320      	clr	21280
  26                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  27  0004 725f5321      	clr	21281
  28                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  29  0008 725f5323      	clr	21283
  30                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  31  000c 725f5327      	clr	21287
  32                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  33  0010 725f5327      	clr	21287
  34                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  35  0014 725f5325      	clr	21285
  36                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  37  0018 725f5326      	clr	21286
  38                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  39  001c 725f5328      	clr	21288
  40                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  41  0020 725f5329      	clr	21289
  42                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  43  0024 725f532a      	clr	21290
  44                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  45  0028 35ff532b      	mov	21291,#255
  46                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  47  002c 35ff532c      	mov	21292,#255
  48                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  49  0030 725f532d      	clr	21293
  50                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  51  0034 725f532e      	clr	21294
  52                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  53  0038 725f532f      	clr	21295
  54                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  55  003c 725f5330      	clr	21296
  56                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  57  0040 725f5322      	clr	21282
  58                     ; 74 }
  59  0044 81            	ret	
  61                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
  61                     ; 83                         uint16_t TIM3_Period)
  61                     ; 84 {
  62  0045               _TIM3_TimeBaseInit:
  63       ffffffff      OFST: set -1
  65                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
  66  0045 c7532a        	ld	21290,a
  67                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
  68  0048 7b03          	ld	a,(OFST+4,sp)
  69  004a c7532b        	ld	21291,a
  70                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
  71  004d 7b04          	ld	a,(OFST+5,sp)
  72  004f c7532c        	ld	21292,a
  73                     ; 90 }
  74  0052 81            	ret	
  76                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
  76                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
  76                     ; 102                   uint16_t TIM3_Pulse,
  76                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
  76                     ; 104 {
  77  0053               _TIM3_OC1Init:
  78  0053 89            	pushw	x
  79  0054 88            	push	a
  80       00000001      OFST:	set	1
  82                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
  83  0055 9e            	ld	a,xh
  84  0056 4d            	tnz	a
  85  0057 271e          	jreq	L41
  86  0059 9e            	ld	a,xh
  87  005a a110          	cp	a,#16
  88  005c 2719          	jreq	L41
  89  005e 9e            	ld	a,xh
  90  005f a120          	cp	a,#32
  91  0061 2714          	jreq	L41
  92  0063 9e            	ld	a,xh
  93  0064 a130          	cp	a,#48
  94  0066 270f          	jreq	L41
  95  0068 9e            	ld	a,xh
  96  0069 a160          	cp	a,#96
  97  006b 270a          	jreq	L41
  98  006d 9e            	ld	a,xh
  99  006e a170          	cp	a,#112
 100  0070 2705          	jreq	L41
 101  0072 ae006a        	ldw	x,#106
 102  0075 ad4b          	call	LC001
 103  0077               L41:
 104                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 105  0077 7b03          	ld	a,(OFST+2,sp)
 106  0079 2709          	jreq	L42
 107  007b a111          	cp	a,#17
 108  007d 2705          	jreq	L42
 109  007f ae006b        	ldw	x,#107
 110  0082 ad3e          	call	LC001
 111  0084               L42:
 112                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 113  0084 7b08          	ld	a,(OFST+7,sp)
 114  0086 2709          	jreq	L43
 115  0088 a122          	cp	a,#34
 116  008a 2705          	jreq	L43
 117  008c ae006c        	ldw	x,#108
 118  008f ad31          	call	LC001
 119  0091               L43:
 120                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 121  0091 c65327        	ld	a,21287
 122  0094 a4fc          	and	a,#252
 123  0096 c75327        	ld	21287,a
 124                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 125  0099 7b08          	ld	a,(OFST+7,sp)
 126  009b a402          	and	a,#2
 127  009d 6b01          	ld	(OFST+0,sp),a
 128  009f 7b03          	ld	a,(OFST+2,sp)
 129  00a1 a401          	and	a,#1
 130  00a3 1a01          	or	a,(OFST+0,sp)
 131  00a5 ca5327        	or	a,21287
 132  00a8 c75327        	ld	21287,a
 133                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 134  00ab c65325        	ld	a,21285
 135  00ae a48f          	and	a,#143
 136  00b0 1a02          	or	a,(OFST+1,sp)
 137  00b2 c75325        	ld	21285,a
 138                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 139  00b5 7b06          	ld	a,(OFST+5,sp)
 140  00b7 c7532d        	ld	21293,a
 141                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 142  00ba 7b07          	ld	a,(OFST+6,sp)
 143  00bc c7532e        	ld	21294,a
 144                     ; 121 }
 145  00bf 5b03          	addw	sp,#3
 146  00c1 81            	ret	
 147  00c2               LC001:
 148  00c2 89            	pushw	x
 149  00c3 5f            	clrw	x
 150  00c4 89            	pushw	x
 151  00c5 ae0000        	ldw	x,#L7
 152  00c8 cd0000        	call	_assert_failed
 154  00cb 5b04          	addw	sp,#4
 155  00cd 81            	ret	
 157                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 157                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 157                     ; 133                   uint16_t TIM3_Pulse,
 157                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 157                     ; 135 {
 158  00ce               _TIM3_OC2Init:
 159  00ce 89            	pushw	x
 160  00cf 88            	push	a
 161       00000001      OFST:	set	1
 163                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 164  00d0 9e            	ld	a,xh
 165  00d1 4d            	tnz	a
 166  00d2 271e          	jreq	L64
 167  00d4 9e            	ld	a,xh
 168  00d5 a110          	cp	a,#16
 169  00d7 2719          	jreq	L64
 170  00d9 9e            	ld	a,xh
 171  00da a120          	cp	a,#32
 172  00dc 2714          	jreq	L64
 173  00de 9e            	ld	a,xh
 174  00df a130          	cp	a,#48
 175  00e1 270f          	jreq	L64
 176  00e3 9e            	ld	a,xh
 177  00e4 a160          	cp	a,#96
 178  00e6 270a          	jreq	L64
 179  00e8 9e            	ld	a,xh
 180  00e9 a170          	cp	a,#112
 181  00eb 2705          	jreq	L64
 182  00ed ae0089        	ldw	x,#137
 183  00f0 ad4b          	call	LC002
 184  00f2               L64:
 185                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 186  00f2 7b03          	ld	a,(OFST+2,sp)
 187  00f4 2709          	jreq	L65
 188  00f6 a111          	cp	a,#17
 189  00f8 2705          	jreq	L65
 190  00fa ae008a        	ldw	x,#138
 191  00fd ad3e          	call	LC002
 192  00ff               L65:
 193                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 194  00ff 7b08          	ld	a,(OFST+7,sp)
 195  0101 2709          	jreq	L66
 196  0103 a122          	cp	a,#34
 197  0105 2705          	jreq	L66
 198  0107 ae008b        	ldw	x,#139
 199  010a ad31          	call	LC002
 200  010c               L66:
 201                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 202  010c c65327        	ld	a,21287
 203  010f a4cf          	and	a,#207
 204  0111 c75327        	ld	21287,a
 205                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 206  0114 7b08          	ld	a,(OFST+7,sp)
 207  0116 a420          	and	a,#32
 208  0118 6b01          	ld	(OFST+0,sp),a
 209  011a 7b03          	ld	a,(OFST+2,sp)
 210  011c a410          	and	a,#16
 211  011e 1a01          	or	a,(OFST+0,sp)
 212  0120 ca5327        	or	a,21287
 213  0123 c75327        	ld	21287,a
 214                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 215  0126 c65326        	ld	a,21286
 216  0129 a48f          	and	a,#143
 217  012b 1a02          	or	a,(OFST+1,sp)
 218  012d c75326        	ld	21286,a
 219                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 220  0130 7b06          	ld	a,(OFST+5,sp)
 221  0132 c7532f        	ld	21295,a
 222                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 223  0135 7b07          	ld	a,(OFST+6,sp)
 224  0137 c75330        	ld	21296,a
 225                     ; 155 }
 226  013a 5b03          	addw	sp,#3
 227  013c 81            	ret	
 228  013d               LC002:
 229  013d 89            	pushw	x
 230  013e 5f            	clrw	x
 231  013f 89            	pushw	x
 232  0140 ae0000        	ldw	x,#L7
 233  0143 cd0000        	call	_assert_failed
 235  0146 5b04          	addw	sp,#4
 236  0148 81            	ret	
 238                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 238                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 238                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 238                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 238                     ; 170                  uint8_t TIM3_ICFilter)
 238                     ; 171 {
 239  0149               _TIM3_ICInit:
 240  0149 89            	pushw	x
 241       00000000      OFST:	set	0
 243                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 244  014a 9e            	ld	a,xh
 245  014b 4d            	tnz	a
 246  014c 2709          	jreq	L001
 247  014e 9e            	ld	a,xh
 248  014f 4a            	dec	a
 249  0150 2705          	jreq	L001
 250  0152 ae00ad        	ldw	x,#173
 251  0155 ad6d          	call	LC003
 252  0157               L001:
 253                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 254  0157 7b02          	ld	a,(OFST+2,sp)
 255  0159 2709          	jreq	L011
 256  015b a144          	cp	a,#68
 257  015d 2705          	jreq	L011
 258  015f ae00ae        	ldw	x,#174
 259  0162 ad60          	call	LC003
 260  0164               L011:
 261                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 262  0164 7b05          	ld	a,(OFST+5,sp)
 263  0166 a101          	cp	a,#1
 264  0168 270d          	jreq	L021
 265  016a a102          	cp	a,#2
 266  016c 2709          	jreq	L021
 267  016e a103          	cp	a,#3
 268  0170 2705          	jreq	L021
 269  0172 ae00af        	ldw	x,#175
 270  0175 ad4d          	call	LC003
 271  0177               L021:
 272                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 273  0177 7b06          	ld	a,(OFST+6,sp)
 274  0179 2711          	jreq	L031
 275  017b a104          	cp	a,#4
 276  017d 270d          	jreq	L031
 277  017f a108          	cp	a,#8
 278  0181 2709          	jreq	L031
 279  0183 a10c          	cp	a,#12
 280  0185 2705          	jreq	L031
 281  0187 ae00b0        	ldw	x,#176
 282  018a ad38          	call	LC003
 283  018c               L031:
 284                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 285  018c 7b07          	ld	a,(OFST+7,sp)
 286  018e a110          	cp	a,#16
 287  0190 2505          	jrult	L631
 288  0192 ae00b1        	ldw	x,#177
 289  0195 ad2d          	call	LC003
 290  0197               L631:
 291                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 292  0197 7b01          	ld	a,(OFST+1,sp)
 293  0199 4a            	dec	a
 294  019a 2714          	jreq	L11
 295                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 295                     ; 183                (uint8_t)TIM3_ICSelection,
 295                     ; 184                (uint8_t)TIM3_ICFilter);
 296  019c 7b07          	ld	a,(OFST+7,sp)
 297  019e 88            	push	a
 298  019f 7b06          	ld	a,(OFST+6,sp)
 299  01a1 97            	ld	xl,a
 300  01a2 7b03          	ld	a,(OFST+3,sp)
 301  01a4 95            	ld	xh,a
 302  01a5 cd0725        	call	L3_TI1_Config
 304  01a8 84            	pop	a
 305                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 306  01a9 7b06          	ld	a,(OFST+6,sp)
 307  01ab cd05b8        	call	_TIM3_SetIC1Prescaler
 310  01ae 2012          	jra	L31
 311  01b0               L11:
 312                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 312                     ; 193                (uint8_t)TIM3_ICSelection,
 312                     ; 194                (uint8_t)TIM3_ICFilter);
 313  01b0 7b07          	ld	a,(OFST+7,sp)
 314  01b2 88            	push	a
 315  01b3 7b06          	ld	a,(OFST+6,sp)
 316  01b5 97            	ld	xl,a
 317  01b6 7b03          	ld	a,(OFST+3,sp)
 318  01b8 95            	ld	xh,a
 319  01b9 cd0755        	call	L5_TI2_Config
 321  01bc 84            	pop	a
 322                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 323  01bd 7b06          	ld	a,(OFST+6,sp)
 324  01bf cd05e2        	call	_TIM3_SetIC2Prescaler
 326  01c2               L31:
 327                     ; 199 }
 328  01c2 85            	popw	x
 329  01c3 81            	ret	
 330  01c4               LC003:
 331  01c4 89            	pushw	x
 332  01c5 5f            	clrw	x
 333  01c6 89            	pushw	x
 334  01c7 ae0000        	ldw	x,#L7
 335  01ca cd0000        	call	_assert_failed
 337  01cd 5b04          	addw	sp,#4
 338  01cf 81            	ret	
 340                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 340                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 340                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 340                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 340                     ; 214                      uint8_t TIM3_ICFilter)
 340                     ; 215 {
 341  01d0               _TIM3_PWMIConfig:
 342  01d0 89            	pushw	x
 343  01d1 89            	pushw	x
 344       00000002      OFST:	set	2
 346                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 347                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 348                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 349  01d2 9e            	ld	a,xh
 350  01d3 4d            	tnz	a
 351  01d4 270a          	jreq	L061
 352  01d6 9e            	ld	a,xh
 353  01d7 4a            	dec	a
 354  01d8 2706          	jreq	L061
 355  01da ae00dc        	ldw	x,#220
 356  01dd cd0284        	call	LC004
 357  01e0               L061:
 358                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 359  01e0 7b04          	ld	a,(OFST+2,sp)
 360  01e2 270a          	jreq	L071
 361  01e4 a144          	cp	a,#68
 362  01e6 2706          	jreq	L071
 363  01e8 ae00dd        	ldw	x,#221
 364  01eb cd0284        	call	LC004
 365  01ee               L071:
 366                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 367  01ee 7b07          	ld	a,(OFST+5,sp)
 368  01f0 a101          	cp	a,#1
 369  01f2 270e          	jreq	L002
 370  01f4 a102          	cp	a,#2
 371  01f6 270a          	jreq	L002
 372  01f8 a103          	cp	a,#3
 373  01fa 2706          	jreq	L002
 374  01fc ae00de        	ldw	x,#222
 375  01ff cd0284        	call	LC004
 376  0202               L002:
 377                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 378  0202 7b08          	ld	a,(OFST+6,sp)
 379  0204 2711          	jreq	L012
 380  0206 a104          	cp	a,#4
 381  0208 270d          	jreq	L012
 382  020a a108          	cp	a,#8
 383  020c 2709          	jreq	L012
 384  020e a10c          	cp	a,#12
 385  0210 2705          	jreq	L012
 386  0212 ae00df        	ldw	x,#223
 387  0215 ad6d          	call	LC004
 388  0217               L012:
 389                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 390  0217 7b04          	ld	a,(OFST+2,sp)
 391  0219 a144          	cp	a,#68
 392  021b 2706          	jreq	L51
 393                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 394  021d a644          	ld	a,#68
 395  021f 6b01          	ld	(OFST-1,sp),a
 397  0221 2002          	jra	L71
 398  0223               L51:
 399                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 400  0223 0f01          	clr	(OFST-1,sp)
 401  0225               L71:
 402                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 403  0225 7b07          	ld	a,(OFST+5,sp)
 404  0227 4a            	dec	a
 405  0228 2604          	jrne	L12
 406                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 407  022a a602          	ld	a,#2
 409  022c 2002          	jra	L32
 410  022e               L12:
 411                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 412  022e a601          	ld	a,#1
 413  0230               L32:
 414  0230 6b02          	ld	(OFST+0,sp),a
 415                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
 416  0232 7b03          	ld	a,(OFST+1,sp)
 417  0234 4a            	dec	a
 418  0235 2726          	jreq	L52
 419                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
 419                     ; 249                (uint8_t)TIM3_ICFilter);
 420  0237 7b09          	ld	a,(OFST+7,sp)
 421  0239 88            	push	a
 422  023a 7b08          	ld	a,(OFST+6,sp)
 423  023c 97            	ld	xl,a
 424  023d 7b05          	ld	a,(OFST+3,sp)
 425  023f 95            	ld	xh,a
 426  0240 cd0725        	call	L3_TI1_Config
 428  0243 84            	pop	a
 429                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 430  0244 7b08          	ld	a,(OFST+6,sp)
 431  0246 cd05b8        	call	_TIM3_SetIC1Prescaler
 433                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
 434  0249 7b09          	ld	a,(OFST+7,sp)
 435  024b 88            	push	a
 436  024c 7b03          	ld	a,(OFST+1,sp)
 437  024e 97            	ld	xl,a
 438  024f 7b02          	ld	a,(OFST+0,sp)
 439  0251 95            	ld	xh,a
 440  0252 cd0755        	call	L5_TI2_Config
 442  0255 84            	pop	a
 443                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 444  0256 7b08          	ld	a,(OFST+6,sp)
 445  0258 cd05e2        	call	_TIM3_SetIC2Prescaler
 448  025b 2024          	jra	L72
 449  025d               L52:
 450                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
 450                     ; 264                (uint8_t)TIM3_ICFilter);
 451  025d 7b09          	ld	a,(OFST+7,sp)
 452  025f 88            	push	a
 453  0260 7b08          	ld	a,(OFST+6,sp)
 454  0262 97            	ld	xl,a
 455  0263 7b05          	ld	a,(OFST+3,sp)
 456  0265 95            	ld	xh,a
 457  0266 cd0755        	call	L5_TI2_Config
 459  0269 84            	pop	a
 460                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 461  026a 7b08          	ld	a,(OFST+6,sp)
 462  026c cd05e2        	call	_TIM3_SetIC2Prescaler
 464                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
 465  026f 7b09          	ld	a,(OFST+7,sp)
 466  0271 88            	push	a
 467  0272 7b03          	ld	a,(OFST+1,sp)
 468  0274 97            	ld	xl,a
 469  0275 7b02          	ld	a,(OFST+0,sp)
 470  0277 95            	ld	xh,a
 471  0278 cd0725        	call	L3_TI1_Config
 473  027b 84            	pop	a
 474                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 475  027c 7b08          	ld	a,(OFST+6,sp)
 476  027e cd05b8        	call	_TIM3_SetIC1Prescaler
 478  0281               L72:
 479                     ; 275 }
 480  0281 5b04          	addw	sp,#4
 481  0283 81            	ret	
 482  0284               LC004:
 483  0284 89            	pushw	x
 484  0285 5f            	clrw	x
 485  0286 89            	pushw	x
 486  0287 ae0000        	ldw	x,#L7
 487  028a cd0000        	call	_assert_failed
 489  028d 5b04          	addw	sp,#4
 490  028f 81            	ret	
 492                     ; 283 void TIM3_Cmd(FunctionalState NewState)
 492                     ; 284 {
 493  0290               _TIM3_Cmd:
 494  0290 88            	push	a
 495       00000000      OFST:	set	0
 497                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 498  0291 4d            	tnz	a
 499  0292 2711          	jreq	L242
 500  0294 4a            	dec	a
 501  0295 270e          	jreq	L242
 502  0297 ae011e        	ldw	x,#286
 503  029a 89            	pushw	x
 504  029b 5f            	clrw	x
 505  029c 89            	pushw	x
 506  029d ae0000        	ldw	x,#L7
 507  02a0 cd0000        	call	_assert_failed
 509  02a3 5b04          	addw	sp,#4
 510  02a5               L242:
 511                     ; 289   if (NewState != DISABLE)
 512  02a5 7b01          	ld	a,(OFST+1,sp)
 513  02a7 2706          	jreq	L13
 514                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
 515  02a9 72105320      	bset	21280,#0
 517  02ad 2004          	jra	L33
 518  02af               L13:
 519                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
 520  02af 72115320      	bres	21280,#0
 521  02b3               L33:
 522                     ; 297 }
 523  02b3 84            	pop	a
 524  02b4 81            	ret	
 526                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
 526                     ; 312 {
 527  02b5               _TIM3_ITConfig:
 528  02b5 89            	pushw	x
 529       00000000      OFST:	set	0
 531                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
 532  02b6 9e            	ld	a,xh
 533  02b7 4d            	tnz	a
 534  02b8 2705          	jreq	L052
 535  02ba 9e            	ld	a,xh
 536  02bb a108          	cp	a,#8
 537  02bd 2505          	jrult	L252
 538  02bf               L052:
 539  02bf ae013a        	ldw	x,#314
 540  02c2 ad22          	call	LC005
 541  02c4               L252:
 542                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 543  02c4 7b02          	ld	a,(OFST+2,sp)
 544  02c6 2708          	jreq	L262
 545  02c8 4a            	dec	a
 546  02c9 2705          	jreq	L262
 547  02cb ae013b        	ldw	x,#315
 548  02ce ad16          	call	LC005
 549  02d0               L262:
 550                     ; 317   if (NewState != DISABLE)
 551  02d0 7b02          	ld	a,(OFST+2,sp)
 552  02d2 2707          	jreq	L53
 553                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
 554  02d4 c65321        	ld	a,21281
 555  02d7 1a01          	or	a,(OFST+1,sp)
 557  02d9 2006          	jra	L73
 558  02db               L53:
 559                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
 560  02db 7b01          	ld	a,(OFST+1,sp)
 561  02dd 43            	cpl	a
 562  02de c45321        	and	a,21281
 563  02e1               L73:
 564  02e1 c75321        	ld	21281,a
 565                     ; 327 }
 566  02e4 85            	popw	x
 567  02e5 81            	ret	
 568  02e6               LC005:
 569  02e6 89            	pushw	x
 570  02e7 5f            	clrw	x
 571  02e8 89            	pushw	x
 572  02e9 ae0000        	ldw	x,#L7
 573  02ec cd0000        	call	_assert_failed
 575  02ef 5b04          	addw	sp,#4
 576  02f1 81            	ret	
 578                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 578                     ; 336 {
 579  02f2               _TIM3_UpdateDisableConfig:
 580  02f2 88            	push	a
 581       00000000      OFST:	set	0
 583                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584  02f3 4d            	tnz	a
 585  02f4 2711          	jreq	L472
 586  02f6 4a            	dec	a
 587  02f7 270e          	jreq	L472
 588  02f9 ae0152        	ldw	x,#338
 589  02fc 89            	pushw	x
 590  02fd 5f            	clrw	x
 591  02fe 89            	pushw	x
 592  02ff ae0000        	ldw	x,#L7
 593  0302 cd0000        	call	_assert_failed
 595  0305 5b04          	addw	sp,#4
 596  0307               L472:
 597                     ; 341   if (NewState != DISABLE)
 598  0307 7b01          	ld	a,(OFST+1,sp)
 599  0309 2706          	jreq	L14
 600                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
 601  030b 72125320      	bset	21280,#1
 603  030f 2004          	jra	L34
 604  0311               L14:
 605                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
 606  0311 72135320      	bres	21280,#1
 607  0315               L34:
 608                     ; 349 }
 609  0315 84            	pop	a
 610  0316 81            	ret	
 612                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 612                     ; 360 {
 613  0317               _TIM3_UpdateRequestConfig:
 614  0317 88            	push	a
 615       00000000      OFST:	set	0
 617                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
 618  0318 4d            	tnz	a
 619  0319 2711          	jreq	L603
 620  031b 4a            	dec	a
 621  031c 270e          	jreq	L603
 622  031e ae016a        	ldw	x,#362
 623  0321 89            	pushw	x
 624  0322 5f            	clrw	x
 625  0323 89            	pushw	x
 626  0324 ae0000        	ldw	x,#L7
 627  0327 cd0000        	call	_assert_failed
 629  032a 5b04          	addw	sp,#4
 630  032c               L603:
 631                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
 632  032c 7b01          	ld	a,(OFST+1,sp)
 633  032e 2706          	jreq	L54
 634                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
 635  0330 72145320      	bset	21280,#2
 637  0334 2004          	jra	L74
 638  0336               L54:
 639                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
 640  0336 72155320      	bres	21280,#2
 641  033a               L74:
 642                     ; 373 }
 643  033a 84            	pop	a
 644  033b 81            	ret	
 646                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
 646                     ; 384 {
 647  033c               _TIM3_SelectOnePulseMode:
 648  033c 88            	push	a
 649       00000000      OFST:	set	0
 651                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
 652  033d a101          	cp	a,#1
 653  033f 2711          	jreq	L023
 654  0341 4d            	tnz	a
 655  0342 270e          	jreq	L023
 656  0344 ae0182        	ldw	x,#386
 657  0347 89            	pushw	x
 658  0348 5f            	clrw	x
 659  0349 89            	pushw	x
 660  034a ae0000        	ldw	x,#L7
 661  034d cd0000        	call	_assert_failed
 663  0350 5b04          	addw	sp,#4
 664  0352               L023:
 665                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
 666  0352 7b01          	ld	a,(OFST+1,sp)
 667  0354 2706          	jreq	L15
 668                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
 669  0356 72165320      	bset	21280,#3
 671  035a 2004          	jra	L35
 672  035c               L15:
 673                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
 674  035c 72175320      	bres	21280,#3
 675  0360               L35:
 676                     ; 397 }
 677  0360 84            	pop	a
 678  0361 81            	ret	
 680                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 680                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 680                     ; 429 {
 681  0362               _TIM3_PrescalerConfig:
 682  0362 89            	pushw	x
 683       00000000      OFST:	set	0
 685                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
 686  0363 9f            	ld	a,xl
 687  0364 4d            	tnz	a
 688  0365 2709          	jreq	L233
 689  0367 9f            	ld	a,xl
 690  0368 4a            	dec	a
 691  0369 2705          	jreq	L233
 692  036b ae01af        	ldw	x,#431
 693  036e ad51          	call	LC006
 694  0370               L233:
 695                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
 696  0370 7b01          	ld	a,(OFST+1,sp)
 697  0372 2743          	jreq	L243
 698  0374 a101          	cp	a,#1
 699  0376 273f          	jreq	L243
 700  0378 a102          	cp	a,#2
 701  037a 273b          	jreq	L243
 702  037c a103          	cp	a,#3
 703  037e 2737          	jreq	L243
 704  0380 a104          	cp	a,#4
 705  0382 2733          	jreq	L243
 706  0384 a105          	cp	a,#5
 707  0386 272f          	jreq	L243
 708  0388 a106          	cp	a,#6
 709  038a 272b          	jreq	L243
 710  038c a107          	cp	a,#7
 711  038e 2727          	jreq	L243
 712  0390 a108          	cp	a,#8
 713  0392 2723          	jreq	L243
 714  0394 a109          	cp	a,#9
 715  0396 271f          	jreq	L243
 716  0398 a10a          	cp	a,#10
 717  039a 271b          	jreq	L243
 718  039c a10b          	cp	a,#11
 719  039e 2717          	jreq	L243
 720  03a0 a10c          	cp	a,#12
 721  03a2 2713          	jreq	L243
 722  03a4 a10d          	cp	a,#13
 723  03a6 270f          	jreq	L243
 724  03a8 a10e          	cp	a,#14
 725  03aa 270b          	jreq	L243
 726  03ac a10f          	cp	a,#15
 727  03ae 2707          	jreq	L243
 728  03b0 ae01b0        	ldw	x,#432
 729  03b3 ad0c          	call	LC006
 730  03b5 7b01          	ld	a,(OFST+1,sp)
 731  03b7               L243:
 732                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
 733  03b7 c7532a        	ld	21290,a
 734                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
 735  03ba 7b02          	ld	a,(OFST+2,sp)
 736  03bc c75324        	ld	21284,a
 737                     ; 439 }
 738  03bf 85            	popw	x
 739  03c0 81            	ret	
 740  03c1               LC006:
 741  03c1 89            	pushw	x
 742  03c2 5f            	clrw	x
 743  03c3 89            	pushw	x
 744  03c4 ae0000        	ldw	x,#L7
 745  03c7 cd0000        	call	_assert_failed
 747  03ca 5b04          	addw	sp,#4
 748  03cc 81            	ret	
 750                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
 750                     ; 451 {
 751  03cd               _TIM3_ForcedOC1Config:
 752  03cd 88            	push	a
 753       00000000      OFST:	set	0
 755                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
 756  03ce a150          	cp	a,#80
 757  03d0 2712          	jreq	L453
 758  03d2 a140          	cp	a,#64
 759  03d4 270e          	jreq	L453
 760  03d6 ae01c5        	ldw	x,#453
 761  03d9 89            	pushw	x
 762  03da 5f            	clrw	x
 763  03db 89            	pushw	x
 764  03dc ae0000        	ldw	x,#L7
 765  03df cd0000        	call	_assert_failed
 767  03e2 5b04          	addw	sp,#4
 768  03e4               L453:
 769                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
 770  03e4 c65325        	ld	a,21285
 771  03e7 a48f          	and	a,#143
 772  03e9 1a01          	or	a,(OFST+1,sp)
 773  03eb c75325        	ld	21285,a
 774                     ; 457 }
 775  03ee 84            	pop	a
 776  03ef 81            	ret	
 778                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
 778                     ; 469 {
 779  03f0               _TIM3_ForcedOC2Config:
 780  03f0 88            	push	a
 781       00000000      OFST:	set	0
 783                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
 784  03f1 a150          	cp	a,#80
 785  03f3 2712          	jreq	L663
 786  03f5 a140          	cp	a,#64
 787  03f7 270e          	jreq	L663
 788  03f9 ae01d7        	ldw	x,#471
 789  03fc 89            	pushw	x
 790  03fd 5f            	clrw	x
 791  03fe 89            	pushw	x
 792  03ff ae0000        	ldw	x,#L7
 793  0402 cd0000        	call	_assert_failed
 795  0405 5b04          	addw	sp,#4
 796  0407               L663:
 797                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
 798  0407 c65326        	ld	a,21286
 799  040a a48f          	and	a,#143
 800  040c 1a01          	or	a,(OFST+1,sp)
 801  040e c75326        	ld	21286,a
 802                     ; 475 }
 803  0411 84            	pop	a
 804  0412 81            	ret	
 806                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 806                     ; 484 {
 807  0413               _TIM3_ARRPreloadConfig:
 808  0413 88            	push	a
 809       00000000      OFST:	set	0
 811                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 812  0414 4d            	tnz	a
 813  0415 2711          	jreq	L004
 814  0417 4a            	dec	a
 815  0418 270e          	jreq	L004
 816  041a ae01e6        	ldw	x,#486
 817  041d 89            	pushw	x
 818  041e 5f            	clrw	x
 819  041f 89            	pushw	x
 820  0420 ae0000        	ldw	x,#L7
 821  0423 cd0000        	call	_assert_failed
 823  0426 5b04          	addw	sp,#4
 824  0428               L004:
 825                     ; 489   if (NewState != DISABLE)
 826  0428 7b01          	ld	a,(OFST+1,sp)
 827  042a 2706          	jreq	L55
 828                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
 829  042c 721e5320      	bset	21280,#7
 831  0430 2004          	jra	L75
 832  0432               L55:
 833                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
 834  0432 721f5320      	bres	21280,#7
 835  0436               L75:
 836                     ; 497 }
 837  0436 84            	pop	a
 838  0437 81            	ret	
 840                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
 840                     ; 506 {
 841  0438               _TIM3_OC1PreloadConfig:
 842  0438 88            	push	a
 843       00000000      OFST:	set	0
 845                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 846  0439 4d            	tnz	a
 847  043a 2711          	jreq	L214
 848  043c 4a            	dec	a
 849  043d 270e          	jreq	L214
 850  043f ae01fc        	ldw	x,#508
 851  0442 89            	pushw	x
 852  0443 5f            	clrw	x
 853  0444 89            	pushw	x
 854  0445 ae0000        	ldw	x,#L7
 855  0448 cd0000        	call	_assert_failed
 857  044b 5b04          	addw	sp,#4
 858  044d               L214:
 859                     ; 511   if (NewState != DISABLE)
 860  044d 7b01          	ld	a,(OFST+1,sp)
 861  044f 2706          	jreq	L16
 862                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
 863  0451 72165325      	bset	21285,#3
 865  0455 2004          	jra	L36
 866  0457               L16:
 867                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
 868  0457 72175325      	bres	21285,#3
 869  045b               L36:
 870                     ; 519 }
 871  045b 84            	pop	a
 872  045c 81            	ret	
 874                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
 874                     ; 528 {
 875  045d               _TIM3_OC2PreloadConfig:
 876  045d 88            	push	a
 877       00000000      OFST:	set	0
 879                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 880  045e 4d            	tnz	a
 881  045f 2711          	jreq	L424
 882  0461 4a            	dec	a
 883  0462 270e          	jreq	L424
 884  0464 ae0212        	ldw	x,#530
 885  0467 89            	pushw	x
 886  0468 5f            	clrw	x
 887  0469 89            	pushw	x
 888  046a ae0000        	ldw	x,#L7
 889  046d cd0000        	call	_assert_failed
 891  0470 5b04          	addw	sp,#4
 892  0472               L424:
 893                     ; 533   if (NewState != DISABLE)
 894  0472 7b01          	ld	a,(OFST+1,sp)
 895  0474 2706          	jreq	L56
 896                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
 897  0476 72165326      	bset	21286,#3
 899  047a 2004          	jra	L76
 900  047c               L56:
 901                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
 902  047c 72175326      	bres	21286,#3
 903  0480               L76:
 904                     ; 541 }
 905  0480 84            	pop	a
 906  0481 81            	ret	
 908                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
 908                     ; 553 {
 909  0482               _TIM3_GenerateEvent:
 910  0482 88            	push	a
 911       00000000      OFST:	set	0
 913                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
 914  0483 4d            	tnz	a
 915  0484 260e          	jrne	L434
 916  0486 ae022b        	ldw	x,#555
 917  0489 89            	pushw	x
 918  048a 5f            	clrw	x
 919  048b 89            	pushw	x
 920  048c ae0000        	ldw	x,#L7
 921  048f cd0000        	call	_assert_failed
 923  0492 5b04          	addw	sp,#4
 924  0494               L434:
 925                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
 926  0494 7b01          	ld	a,(OFST+1,sp)
 927  0496 c75324        	ld	21284,a
 928                     ; 559 }
 929  0499 84            	pop	a
 930  049a 81            	ret	
 932                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 932                     ; 570 {
 933  049b               _TIM3_OC1PolarityConfig:
 934  049b 88            	push	a
 935       00000000      OFST:	set	0
 937                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 938  049c 4d            	tnz	a
 939  049d 2712          	jreq	L644
 940  049f a122          	cp	a,#34
 941  04a1 270e          	jreq	L644
 942  04a3 ae023c        	ldw	x,#572
 943  04a6 89            	pushw	x
 944  04a7 5f            	clrw	x
 945  04a8 89            	pushw	x
 946  04a9 ae0000        	ldw	x,#L7
 947  04ac cd0000        	call	_assert_failed
 949  04af 5b04          	addw	sp,#4
 950  04b1               L644:
 951                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
 952  04b1 7b01          	ld	a,(OFST+1,sp)
 953  04b3 2706          	jreq	L17
 954                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
 955  04b5 72125327      	bset	21287,#1
 957  04b9 2004          	jra	L37
 958  04bb               L17:
 959                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
 960  04bb 72135327      	bres	21287,#1
 961  04bf               L37:
 962                     ; 583 }
 963  04bf 84            	pop	a
 964  04c0 81            	ret	
 966                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 966                     ; 594 {
 967  04c1               _TIM3_OC2PolarityConfig:
 968  04c1 88            	push	a
 969       00000000      OFST:	set	0
 971                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 972  04c2 4d            	tnz	a
 973  04c3 2712          	jreq	L064
 974  04c5 a122          	cp	a,#34
 975  04c7 270e          	jreq	L064
 976  04c9 ae0254        	ldw	x,#596
 977  04cc 89            	pushw	x
 978  04cd 5f            	clrw	x
 979  04ce 89            	pushw	x
 980  04cf ae0000        	ldw	x,#L7
 981  04d2 cd0000        	call	_assert_failed
 983  04d5 5b04          	addw	sp,#4
 984  04d7               L064:
 985                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
 986  04d7 7b01          	ld	a,(OFST+1,sp)
 987  04d9 2706          	jreq	L57
 988                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
 989  04db 721a5327      	bset	21287,#5
 991  04df 2004          	jra	L77
 992  04e1               L57:
 993                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
 994  04e1 721b5327      	bres	21287,#5
 995  04e5               L77:
 996                     ; 607 }
 997  04e5 84            	pop	a
 998  04e6 81            	ret	
1000                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
1000                     ; 620 {
1001  04e7               _TIM3_CCxCmd:
1002  04e7 89            	pushw	x
1003       00000000      OFST:	set	0
1005                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
1006  04e8 9e            	ld	a,xh
1007  04e9 4d            	tnz	a
1008  04ea 2709          	jreq	L274
1009  04ec 9e            	ld	a,xh
1010  04ed 4a            	dec	a
1011  04ee 2705          	jreq	L274
1012  04f0 ae026e        	ldw	x,#622
1013  04f3 ad30          	call	LC007
1014  04f5               L274:
1015                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1016  04f5 7b02          	ld	a,(OFST+2,sp)
1017  04f7 2708          	jreq	L205
1018  04f9 4a            	dec	a
1019  04fa 2705          	jreq	L205
1020  04fc ae026f        	ldw	x,#623
1021  04ff ad24          	call	LC007
1022  0501               L205:
1023                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
1024  0501 7b01          	ld	a,(OFST+1,sp)
1025  0503 2610          	jrne	L101
1026                     ; 628     if (NewState != DISABLE)
1027  0505 7b02          	ld	a,(OFST+2,sp)
1028  0507 2706          	jreq	L301
1029                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
1030  0509 72105327      	bset	21287,#0
1032  050d 2014          	jra	L701
1033  050f               L301:
1034                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
1035  050f 72115327      	bres	21287,#0
1036  0513 200e          	jra	L701
1037  0515               L101:
1038                     ; 641     if (NewState != DISABLE)
1039  0515 7b02          	ld	a,(OFST+2,sp)
1040  0517 2706          	jreq	L111
1041                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
1042  0519 72185327      	bset	21287,#4
1044  051d 2004          	jra	L701
1045  051f               L111:
1046                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
1047  051f 72195327      	bres	21287,#4
1048  0523               L701:
1049                     ; 650 }
1050  0523 85            	popw	x
1051  0524 81            	ret	
1052  0525               LC007:
1053  0525 89            	pushw	x
1054  0526 5f            	clrw	x
1055  0527 89            	pushw	x
1056  0528 ae0000        	ldw	x,#L7
1057  052b cd0000        	call	_assert_failed
1059  052e 5b04          	addw	sp,#4
1060  0530 81            	ret	
1062                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
1062                     ; 672 {
1063  0531               _TIM3_SelectOCxM:
1064  0531 89            	pushw	x
1065       00000000      OFST:	set	0
1067                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
1068  0532 9e            	ld	a,xh
1069  0533 4d            	tnz	a
1070  0534 2709          	jreq	L415
1071  0536 9e            	ld	a,xh
1072  0537 4a            	dec	a
1073  0538 2705          	jreq	L415
1074  053a ae02a2        	ldw	x,#674
1075  053d ad49          	call	LC008
1076  053f               L415:
1077                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
1078  053f 7b02          	ld	a,(OFST+2,sp)
1079  0541 2721          	jreq	L425
1080  0543 a110          	cp	a,#16
1081  0545 271d          	jreq	L425
1082  0547 a120          	cp	a,#32
1083  0549 2719          	jreq	L425
1084  054b a130          	cp	a,#48
1085  054d 2715          	jreq	L425
1086  054f a160          	cp	a,#96
1087  0551 2711          	jreq	L425
1088  0553 a170          	cp	a,#112
1089  0555 270d          	jreq	L425
1090  0557 a150          	cp	a,#80
1091  0559 2709          	jreq	L425
1092  055b a140          	cp	a,#64
1093  055d 2705          	jreq	L425
1094  055f ae02a3        	ldw	x,#675
1095  0562 ad24          	call	LC008
1096  0564               L425:
1097                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
1098  0564 7b01          	ld	a,(OFST+1,sp)
1099  0566 2610          	jrne	L511
1100                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
1101  0568 72115327      	bres	21287,#0
1102                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
1103  056c c65325        	ld	a,21285
1104  056f a48f          	and	a,#143
1105  0571 1a02          	or	a,(OFST+2,sp)
1106  0573 c75325        	ld	21285,a
1108  0576 200e          	jra	L711
1109  0578               L511:
1110                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
1111  0578 72195327      	bres	21287,#4
1112                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
1113  057c c65326        	ld	a,21286
1114  057f a48f          	and	a,#143
1115  0581 1a02          	or	a,(OFST+2,sp)
1116  0583 c75326        	ld	21286,a
1117  0586               L711:
1118                     ; 693 }
1119  0586 85            	popw	x
1120  0587 81            	ret	
1121  0588               LC008:
1122  0588 89            	pushw	x
1123  0589 5f            	clrw	x
1124  058a 89            	pushw	x
1125  058b ae0000        	ldw	x,#L7
1126  058e cd0000        	call	_assert_failed
1128  0591 5b04          	addw	sp,#4
1129  0593 81            	ret	
1131                     ; 701 void TIM3_SetCounter(uint16_t Counter)
1131                     ; 702 {
1132  0594               _TIM3_SetCounter:
1134                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
1135  0594 9e            	ld	a,xh
1136  0595 c75328        	ld	21288,a
1137                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
1138  0598 9f            	ld	a,xl
1139  0599 c75329        	ld	21289,a
1140                     ; 706 }
1141  059c 81            	ret	
1143                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
1143                     ; 715 {
1144  059d               _TIM3_SetAutoreload:
1146                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
1147  059d 9e            	ld	a,xh
1148  059e c7532b        	ld	21291,a
1149                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
1150  05a1 9f            	ld	a,xl
1151  05a2 c7532c        	ld	21292,a
1152                     ; 719 }
1153  05a5 81            	ret	
1155                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
1155                     ; 728 {
1156  05a6               _TIM3_SetCompare1:
1158                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
1159  05a6 9e            	ld	a,xh
1160  05a7 c7532d        	ld	21293,a
1161                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
1162  05aa 9f            	ld	a,xl
1163  05ab c7532e        	ld	21294,a
1164                     ; 732 }
1165  05ae 81            	ret	
1167                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
1167                     ; 741 {
1168  05af               _TIM3_SetCompare2:
1170                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
1171  05af 9e            	ld	a,xh
1172  05b0 c7532f        	ld	21295,a
1173                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
1174  05b3 9f            	ld	a,xl
1175  05b4 c75330        	ld	21296,a
1176                     ; 745 }
1177  05b7 81            	ret	
1179                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
1179                     ; 758 {
1180  05b8               _TIM3_SetIC1Prescaler:
1181  05b8 88            	push	a
1182       00000000      OFST:	set	0
1184                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
1185  05b9 4d            	tnz	a
1186  05ba 271a          	jreq	L645
1187  05bc a104          	cp	a,#4
1188  05be 2716          	jreq	L645
1189  05c0 a108          	cp	a,#8
1190  05c2 2712          	jreq	L645
1191  05c4 a10c          	cp	a,#12
1192  05c6 270e          	jreq	L645
1193  05c8 ae02f8        	ldw	x,#760
1194  05cb 89            	pushw	x
1195  05cc 5f            	clrw	x
1196  05cd 89            	pushw	x
1197  05ce ae0000        	ldw	x,#L7
1198  05d1 cd0000        	call	_assert_failed
1200  05d4 5b04          	addw	sp,#4
1201  05d6               L645:
1202                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
1203  05d6 c65325        	ld	a,21285
1204  05d9 a4f3          	and	a,#243
1205  05db 1a01          	or	a,(OFST+1,sp)
1206  05dd c75325        	ld	21285,a
1207                     ; 764 }
1208  05e0 84            	pop	a
1209  05e1 81            	ret	
1211                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
1211                     ; 777 {
1212  05e2               _TIM3_SetIC2Prescaler:
1213  05e2 88            	push	a
1214       00000000      OFST:	set	0
1216                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
1217  05e3 4d            	tnz	a
1218  05e4 271a          	jreq	L065
1219  05e6 a104          	cp	a,#4
1220  05e8 2716          	jreq	L065
1221  05ea a108          	cp	a,#8
1222  05ec 2712          	jreq	L065
1223  05ee a10c          	cp	a,#12
1224  05f0 270e          	jreq	L065
1225  05f2 ae030b        	ldw	x,#779
1226  05f5 89            	pushw	x
1227  05f6 5f            	clrw	x
1228  05f7 89            	pushw	x
1229  05f8 ae0000        	ldw	x,#L7
1230  05fb cd0000        	call	_assert_failed
1232  05fe 5b04          	addw	sp,#4
1233  0600               L065:
1234                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
1235  0600 c65326        	ld	a,21286
1236  0603 a4f3          	and	a,#243
1237  0605 1a01          	or	a,(OFST+1,sp)
1238  0607 c75326        	ld	21286,a
1239                     ; 783 }
1240  060a 84            	pop	a
1241  060b 81            	ret	
1243                     ; 790 uint16_t TIM3_GetCapture1(void)
1243                     ; 791 {
1244  060c               _TIM3_GetCapture1:
1245  060c 5204          	subw	sp,#4
1246       00000004      OFST:	set	4
1248                     ; 793   uint16_t tmpccr1 = 0;
1249                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
1251                     ; 796   tmpccr1h = TIM3->CCR1H;
1252  060e c6532d        	ld	a,21293
1253  0611 6b02          	ld	(OFST-2,sp),a
1254                     ; 797   tmpccr1l = TIM3->CCR1L;
1255  0613 c6532e        	ld	a,21294
1256  0616 6b01          	ld	(OFST-3,sp),a
1257                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
1258  0618 5f            	clrw	x
1259  0619 97            	ld	xl,a
1260  061a 1f03          	ldw	(OFST-1,sp),x
1261                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
1262  061c 5f            	clrw	x
1263  061d 7b02          	ld	a,(OFST-2,sp)
1264  061f 97            	ld	xl,a
1265  0620 7b04          	ld	a,(OFST+0,sp)
1266  0622 01            	rrwa	x,a
1267  0623 1a03          	or	a,(OFST-1,sp)
1268  0625 01            	rrwa	x,a
1269                     ; 802   return (uint16_t)tmpccr1;
1271  0626 5b04          	addw	sp,#4
1272  0628 81            	ret	
1274                     ; 810 uint16_t TIM3_GetCapture2(void)
1274                     ; 811 {
1275  0629               _TIM3_GetCapture2:
1276  0629 5204          	subw	sp,#4
1277       00000004      OFST:	set	4
1279                     ; 813   uint16_t tmpccr2 = 0;
1280                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
1282                     ; 816   tmpccr2h = TIM3->CCR2H;
1283  062b c6532f        	ld	a,21295
1284  062e 6b02          	ld	(OFST-2,sp),a
1285                     ; 817   tmpccr2l = TIM3->CCR2L;
1286  0630 c65330        	ld	a,21296
1287  0633 6b01          	ld	(OFST-3,sp),a
1288                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
1289  0635 5f            	clrw	x
1290  0636 97            	ld	xl,a
1291  0637 1f03          	ldw	(OFST-1,sp),x
1292                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
1293  0639 5f            	clrw	x
1294  063a 7b02          	ld	a,(OFST-2,sp)
1295  063c 97            	ld	xl,a
1296  063d 7b04          	ld	a,(OFST+0,sp)
1297  063f 01            	rrwa	x,a
1298  0640 1a03          	or	a,(OFST-1,sp)
1299  0642 01            	rrwa	x,a
1300                     ; 822   return (uint16_t)tmpccr2;
1302  0643 5b04          	addw	sp,#4
1303  0645 81            	ret	
1305                     ; 830 uint16_t TIM3_GetCounter(void)
1305                     ; 831 {
1306  0646               _TIM3_GetCounter:
1307  0646 89            	pushw	x
1308       00000002      OFST:	set	2
1310                     ; 832   uint16_t tmpcntr = 0;
1311                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
1312  0647 c65328        	ld	a,21288
1313  064a 97            	ld	xl,a
1314  064b 4f            	clr	a
1315  064c 02            	rlwa	x,a
1316  064d 1f01          	ldw	(OFST-1,sp),x
1317                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
1318  064f c65329        	ld	a,21289
1319  0652 5f            	clrw	x
1320  0653 97            	ld	xl,a
1321  0654 01            	rrwa	x,a
1322  0655 1a02          	or	a,(OFST+0,sp)
1323  0657 01            	rrwa	x,a
1324  0658 1a01          	or	a,(OFST-1,sp)
1325  065a 01            	rrwa	x,a
1327  065b 5b02          	addw	sp,#2
1328  065d 81            	ret	
1330                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
1330                     ; 845 {
1331  065e               _TIM3_GetPrescaler:
1333                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
1334  065e c6532a        	ld	a,21290
1336  0661 81            	ret	
1338                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
1338                     ; 862 {
1339  0662               _TIM3_GetFlagStatus:
1340  0662 89            	pushw	x
1341  0663 89            	pushw	x
1342       00000002      OFST:	set	2
1344                     ; 863   FlagStatus bitstatus = RESET;
1345                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
1347                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
1348  0664 a30001        	cpw	x,#1
1349  0667 2722          	jreq	L206
1350  0669 a30002        	cpw	x,#2
1351  066c 271d          	jreq	L206
1352  066e a30004        	cpw	x,#4
1353  0671 2718          	jreq	L206
1354  0673 a30200        	cpw	x,#512
1355  0676 2713          	jreq	L206
1356  0678 a30400        	cpw	x,#1024
1357  067b 270e          	jreq	L206
1358  067d ae0363        	ldw	x,#867
1359  0680 89            	pushw	x
1360  0681 5f            	clrw	x
1361  0682 89            	pushw	x
1362  0683 ae0000        	ldw	x,#L7
1363  0686 cd0000        	call	_assert_failed
1365  0689 5b04          	addw	sp,#4
1366  068b               L206:
1367                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
1368  068b c65322        	ld	a,21282
1369  068e 1404          	and	a,(OFST+2,sp)
1370  0690 6b01          	ld	(OFST-1,sp),a
1371                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
1372  0692 7b03          	ld	a,(OFST+1,sp)
1373  0694 6b02          	ld	(OFST+0,sp),a
1374                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
1375  0696 c45323        	and	a,21283
1376  0699 1a01          	or	a,(OFST-1,sp)
1377  069b 2702          	jreq	L121
1378                     ; 874     bitstatus = SET;
1379  069d a601          	ld	a,#1
1381  069f               L121:
1382                     ; 878     bitstatus = RESET;
1383                     ; 880   return (FlagStatus)bitstatus;
1385  069f 5b04          	addw	sp,#4
1386  06a1 81            	ret	
1388                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
1388                     ; 895 {
1389  06a2               _TIM3_ClearFlag:
1390  06a2 89            	pushw	x
1391       00000000      OFST:	set	0
1393                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
1394  06a3 01            	rrwa	x,a
1395  06a4 a4f8          	and	a,#248
1396  06a6 01            	rrwa	x,a
1397  06a7 a4f9          	and	a,#249
1398  06a9 01            	rrwa	x,a
1399  06aa 5d            	tnzw	x
1400  06ab 2604          	jrne	L016
1401  06ad 1e01          	ldw	x,(OFST+1,sp)
1402  06af 260e          	jrne	L216
1403  06b1               L016:
1404  06b1 ae0381        	ldw	x,#897
1405  06b4 89            	pushw	x
1406  06b5 5f            	clrw	x
1407  06b6 89            	pushw	x
1408  06b7 ae0000        	ldw	x,#L7
1409  06ba cd0000        	call	_assert_failed
1411  06bd 5b04          	addw	sp,#4
1412  06bf               L216:
1413                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
1414  06bf 7b02          	ld	a,(OFST+2,sp)
1415  06c1 43            	cpl	a
1416  06c2 c75322        	ld	21282,a
1417                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
1418  06c5 7b01          	ld	a,(OFST+1,sp)
1419  06c7 43            	cpl	a
1420  06c8 c75323        	ld	21283,a
1421                     ; 902 }
1422  06cb 85            	popw	x
1423  06cc 81            	ret	
1425                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
1425                     ; 914 {
1426  06cd               _TIM3_GetITStatus:
1427  06cd 88            	push	a
1428  06ce 89            	pushw	x
1429       00000002      OFST:	set	2
1431                     ; 915   ITStatus bitstatus = RESET;
1432                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
1434                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
1435  06cf a101          	cp	a,#1
1436  06d1 2716          	jreq	L426
1437  06d3 a102          	cp	a,#2
1438  06d5 2712          	jreq	L426
1439  06d7 a104          	cp	a,#4
1440  06d9 270e          	jreq	L426
1441  06db ae0397        	ldw	x,#919
1442  06de 89            	pushw	x
1443  06df 5f            	clrw	x
1444  06e0 89            	pushw	x
1445  06e1 ae0000        	ldw	x,#L7
1446  06e4 cd0000        	call	_assert_failed
1448  06e7 5b04          	addw	sp,#4
1449  06e9               L426:
1450                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
1451  06e9 c65322        	ld	a,21282
1452  06ec 1403          	and	a,(OFST+1,sp)
1453  06ee 6b01          	ld	(OFST-1,sp),a
1454                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
1455  06f0 c65321        	ld	a,21281
1456  06f3 1403          	and	a,(OFST+1,sp)
1457  06f5 6b02          	ld	(OFST+0,sp),a
1458                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
1459  06f7 7b01          	ld	a,(OFST-1,sp)
1460  06f9 2708          	jreq	L521
1462  06fb 7b02          	ld	a,(OFST+0,sp)
1463  06fd 2704          	jreq	L521
1464                     ; 927     bitstatus = SET;
1465  06ff a601          	ld	a,#1
1467  0701 2001          	jra	L721
1468  0703               L521:
1469                     ; 931     bitstatus = RESET;
1470  0703 4f            	clr	a
1471  0704               L721:
1472                     ; 933   return (ITStatus)(bitstatus);
1474  0704 5b03          	addw	sp,#3
1475  0706 81            	ret	
1477                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
1477                     ; 946 {
1478  0707               _TIM3_ClearITPendingBit:
1479  0707 88            	push	a
1480       00000000      OFST:	set	0
1482                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1483  0708 4d            	tnz	a
1484  0709 2704          	jreq	L236
1485  070b a108          	cp	a,#8
1486  070d 250e          	jrult	L436
1487  070f               L236:
1488  070f ae03b4        	ldw	x,#948
1489  0712 89            	pushw	x
1490  0713 5f            	clrw	x
1491  0714 89            	pushw	x
1492  0715 ae0000        	ldw	x,#L7
1493  0718 cd0000        	call	_assert_failed
1495  071b 5b04          	addw	sp,#4
1496  071d               L436:
1497                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
1498  071d 7b01          	ld	a,(OFST+1,sp)
1499  071f 43            	cpl	a
1500  0720 c75322        	ld	21282,a
1501                     ; 952 }
1502  0723 84            	pop	a
1503  0724 81            	ret	
1505                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
1505                     ; 971                        uint8_t TIM3_ICSelection,
1505                     ; 972                        uint8_t TIM3_ICFilter)
1505                     ; 973 {
1506  0725               L3_TI1_Config:
1507  0725 89            	pushw	x
1508  0726 88            	push	a
1509       00000001      OFST:	set	1
1511                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
1512  0727 72115327      	bres	21287,#0
1513                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
1514  072b 7b06          	ld	a,(OFST+5,sp)
1515  072d 97            	ld	xl,a
1516  072e a610          	ld	a,#16
1517  0730 42            	mul	x,a
1518  0731 9f            	ld	a,xl
1519  0732 1a03          	or	a,(OFST+2,sp)
1520  0734 6b01          	ld	(OFST+0,sp),a
1521  0736 c65325        	ld	a,21285
1522  0739 a40c          	and	a,#12
1523  073b 1a01          	or	a,(OFST+0,sp)
1524  073d c75325        	ld	21285,a
1525                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
1526  0740 7b02          	ld	a,(OFST+1,sp)
1527  0742 2706          	jreq	L131
1528                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
1529  0744 72125327      	bset	21287,#1
1531  0748 2004          	jra	L331
1532  074a               L131:
1533                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
1534  074a 72135327      	bres	21287,#1
1535  074e               L331:
1536                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
1537  074e 72105327      	bset	21287,#0
1538                     ; 991 }
1539  0752 5b03          	addw	sp,#3
1540  0754 81            	ret	
1542                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
1542                     ; 1010                        uint8_t TIM3_ICSelection,
1542                     ; 1011                        uint8_t TIM3_ICFilter)
1542                     ; 1012 {
1543  0755               L5_TI2_Config:
1544  0755 89            	pushw	x
1545  0756 88            	push	a
1546       00000001      OFST:	set	1
1548                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
1549  0757 72195327      	bres	21287,#4
1550                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
1550                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
1550                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
1551  075b 7b06          	ld	a,(OFST+5,sp)
1552  075d 97            	ld	xl,a
1553  075e a610          	ld	a,#16
1554  0760 42            	mul	x,a
1555  0761 9f            	ld	a,xl
1556  0762 1a03          	or	a,(OFST+2,sp)
1557  0764 6b01          	ld	(OFST+0,sp),a
1558  0766 c65326        	ld	a,21286
1559  0769 a40c          	and	a,#12
1560  076b 1a01          	or	a,(OFST+0,sp)
1561  076d c75326        	ld	21286,a
1562                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
1563  0770 7b02          	ld	a,(OFST+1,sp)
1564  0772 2706          	jreq	L531
1565                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
1566  0774 721a5327      	bset	21287,#5
1568  0778 2004          	jra	L731
1569  077a               L531:
1570                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
1571  077a 721b5327      	bres	21287,#5
1572  077e               L731:
1573                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
1574  077e 72185327      	bset	21287,#4
1575                     ; 1033 }
1576  0782 5b03          	addw	sp,#3
1577  0784 81            	ret	
1579                     	xdef	_TIM3_ClearITPendingBit
1580                     	xdef	_TIM3_GetITStatus
1581                     	xdef	_TIM3_ClearFlag
1582                     	xdef	_TIM3_GetFlagStatus
1583                     	xdef	_TIM3_GetPrescaler
1584                     	xdef	_TIM3_GetCounter
1585                     	xdef	_TIM3_GetCapture2
1586                     	xdef	_TIM3_GetCapture1
1587                     	xdef	_TIM3_SetIC2Prescaler
1588                     	xdef	_TIM3_SetIC1Prescaler
1589                     	xdef	_TIM3_SetCompare2
1590                     	xdef	_TIM3_SetCompare1
1591                     	xdef	_TIM3_SetAutoreload
1592                     	xdef	_TIM3_SetCounter
1593                     	xdef	_TIM3_SelectOCxM
1594                     	xdef	_TIM3_CCxCmd
1595                     	xdef	_TIM3_OC2PolarityConfig
1596                     	xdef	_TIM3_OC1PolarityConfig
1597                     	xdef	_TIM3_GenerateEvent
1598                     	xdef	_TIM3_OC2PreloadConfig
1599                     	xdef	_TIM3_OC1PreloadConfig
1600                     	xdef	_TIM3_ARRPreloadConfig
1601                     	xdef	_TIM3_ForcedOC2Config
1602                     	xdef	_TIM3_ForcedOC1Config
1603                     	xdef	_TIM3_PrescalerConfig
1604                     	xdef	_TIM3_SelectOnePulseMode
1605                     	xdef	_TIM3_UpdateRequestConfig
1606                     	xdef	_TIM3_UpdateDisableConfig
1607                     	xdef	_TIM3_ITConfig
1608                     	xdef	_TIM3_Cmd
1609                     	xdef	_TIM3_PWMIConfig
1610                     	xdef	_TIM3_ICInit
1611                     	xdef	_TIM3_OC2Init
1612                     	xdef	_TIM3_OC1Init
1613                     	xdef	_TIM3_TimeBaseInit
1614                     	xdef	_TIM3_DeInit
1615                     	xref	_assert_failed
1616                     .const:	section	.text
1617  0000               L7:
1618  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1619  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
1620  0024 38735f74696d  	dc.b	"8s_tim3.c",0
1621                     	end
