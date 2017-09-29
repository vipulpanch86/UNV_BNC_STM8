   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 52 void TIM2_DeInit(void)
  20                     ; 53 {
  21                     	scross	off
  22  0000               _TIM2_DeInit:
  24                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  25  0000 725f5300      	clr	21248
  26                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  27  0004 725f5301      	clr	21249
  28                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  29  0008 725f5303      	clr	21251
  30                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  31  000c 725f5308      	clr	21256
  32                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  33  0010 725f5309      	clr	21257
  34                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  35  0014 725f5308      	clr	21256
  36                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  37  0018 725f5309      	clr	21257
  38                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  39  001c 725f5305      	clr	21253
  40                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  41  0020 725f5306      	clr	21254
  42                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  43  0024 725f5307      	clr	21255
  44                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  45  0028 725f530a      	clr	21258
  46                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  47  002c 725f530b      	clr	21259
  48                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  49  0030 725f530c      	clr	21260
  50                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  51  0034 35ff530d      	mov	21261,#255
  52                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  53  0038 35ff530e      	mov	21262,#255
  54                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  55  003c 725f530f      	clr	21263
  56                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  57  0040 725f5310      	clr	21264
  58                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
  59  0044 725f5311      	clr	21265
  60                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
  61  0048 725f5312      	clr	21266
  62                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
  63  004c 725f5313      	clr	21267
  64                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
  65  0050 725f5314      	clr	21268
  66                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
  67  0054 725f5302      	clr	21250
  68                     ; 81 }
  69  0058 81            	ret	
  71                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
  71                     ; 90                         uint16_t TIM2_Period)
  71                     ; 91 {
  72  0059               _TIM2_TimeBaseInit:
  73       ffffffff      OFST: set -1
  75                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
  76  0059 c7530c        	ld	21260,a
  77                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
  78  005c 7b03          	ld	a,(OFST+4,sp)
  79  005e c7530d        	ld	21261,a
  80                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
  81  0061 7b04          	ld	a,(OFST+5,sp)
  82  0063 c7530e        	ld	21262,a
  83                     ; 97 }
  84  0066 81            	ret	
  86                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
  86                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
  86                     ; 110                   uint16_t TIM2_Pulse,
  86                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
  86                     ; 112 {
  87  0067               _TIM2_OC1Init:
  88  0067 89            	pushw	x
  89  0068 88            	push	a
  90       00000001      OFST:	set	1
  92                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
  93  0069 9e            	ld	a,xh
  94  006a 4d            	tnz	a
  95  006b 271e          	jreq	L41
  96  006d 9e            	ld	a,xh
  97  006e a110          	cp	a,#16
  98  0070 2719          	jreq	L41
  99  0072 9e            	ld	a,xh
 100  0073 a120          	cp	a,#32
 101  0075 2714          	jreq	L41
 102  0077 9e            	ld	a,xh
 103  0078 a130          	cp	a,#48
 104  007a 270f          	jreq	L41
 105  007c 9e            	ld	a,xh
 106  007d a160          	cp	a,#96
 107  007f 270a          	jreq	L41
 108  0081 9e            	ld	a,xh
 109  0082 a170          	cp	a,#112
 110  0084 2705          	jreq	L41
 111  0086 ae0072        	ldw	x,#114
 112  0089 ad4b          	call	LC001
 113  008b               L41:
 114                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 115  008b 7b03          	ld	a,(OFST+2,sp)
 116  008d 2709          	jreq	L42
 117  008f a111          	cp	a,#17
 118  0091 2705          	jreq	L42
 119  0093 ae0073        	ldw	x,#115
 120  0096 ad3e          	call	LC001
 121  0098               L42:
 122                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 123  0098 7b08          	ld	a,(OFST+7,sp)
 124  009a 2709          	jreq	L43
 125  009c a122          	cp	a,#34
 126  009e 2705          	jreq	L43
 127  00a0 ae0074        	ldw	x,#116
 128  00a3 ad31          	call	LC001
 129  00a5               L43:
 130                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 131  00a5 c65308        	ld	a,21256
 132  00a8 a4fc          	and	a,#252
 133  00aa c75308        	ld	21256,a
 134                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 134                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 135  00ad 7b08          	ld	a,(OFST+7,sp)
 136  00af a402          	and	a,#2
 137  00b1 6b01          	ld	(OFST+0,sp),a
 138  00b3 7b03          	ld	a,(OFST+2,sp)
 139  00b5 a401          	and	a,#1
 140  00b7 1a01          	or	a,(OFST+0,sp)
 141  00b9 ca5308        	or	a,21256
 142  00bc c75308        	ld	21256,a
 143                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 143                     ; 126                           (uint8_t)TIM2_OCMode);
 144  00bf c65305        	ld	a,21253
 145  00c2 a48f          	and	a,#143
 146  00c4 1a02          	or	a,(OFST+1,sp)
 147  00c6 c75305        	ld	21253,a
 148                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 149  00c9 7b06          	ld	a,(OFST+5,sp)
 150  00cb c7530f        	ld	21263,a
 151                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 152  00ce 7b07          	ld	a,(OFST+6,sp)
 153  00d0 c75310        	ld	21264,a
 154                     ; 131 }
 155  00d3 5b03          	addw	sp,#3
 156  00d5 81            	ret	
 157  00d6               LC001:
 158  00d6 89            	pushw	x
 159  00d7 5f            	clrw	x
 160  00d8 89            	pushw	x
 161  00d9 ae0000        	ldw	x,#L11
 162  00dc cd0000        	call	_assert_failed
 164  00df 5b04          	addw	sp,#4
 165  00e1 81            	ret	
 167                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 167                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 167                     ; 144                   uint16_t TIM2_Pulse,
 167                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 167                     ; 146 {
 168  00e2               _TIM2_OC2Init:
 169  00e2 89            	pushw	x
 170  00e3 88            	push	a
 171       00000001      OFST:	set	1
 173                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 174  00e4 9e            	ld	a,xh
 175  00e5 4d            	tnz	a
 176  00e6 271e          	jreq	L64
 177  00e8 9e            	ld	a,xh
 178  00e9 a110          	cp	a,#16
 179  00eb 2719          	jreq	L64
 180  00ed 9e            	ld	a,xh
 181  00ee a120          	cp	a,#32
 182  00f0 2714          	jreq	L64
 183  00f2 9e            	ld	a,xh
 184  00f3 a130          	cp	a,#48
 185  00f5 270f          	jreq	L64
 186  00f7 9e            	ld	a,xh
 187  00f8 a160          	cp	a,#96
 188  00fa 270a          	jreq	L64
 189  00fc 9e            	ld	a,xh
 190  00fd a170          	cp	a,#112
 191  00ff 2705          	jreq	L64
 192  0101 ae0094        	ldw	x,#148
 193  0104 ad4b          	call	LC002
 194  0106               L64:
 195                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 196  0106 7b03          	ld	a,(OFST+2,sp)
 197  0108 2709          	jreq	L65
 198  010a a111          	cp	a,#17
 199  010c 2705          	jreq	L65
 200  010e ae0095        	ldw	x,#149
 201  0111 ad3e          	call	LC002
 202  0113               L65:
 203                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 204  0113 7b08          	ld	a,(OFST+7,sp)
 205  0115 2709          	jreq	L66
 206  0117 a122          	cp	a,#34
 207  0119 2705          	jreq	L66
 208  011b ae0096        	ldw	x,#150
 209  011e ad31          	call	LC002
 210  0120               L66:
 211                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 212  0120 c65308        	ld	a,21256
 213  0123 a4cf          	and	a,#207
 214  0125 c75308        	ld	21256,a
 215                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 215                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 216  0128 7b08          	ld	a,(OFST+7,sp)
 217  012a a420          	and	a,#32
 218  012c 6b01          	ld	(OFST+0,sp),a
 219  012e 7b03          	ld	a,(OFST+2,sp)
 220  0130 a410          	and	a,#16
 221  0132 1a01          	or	a,(OFST+0,sp)
 222  0134 ca5308        	or	a,21256
 223  0137 c75308        	ld	21256,a
 224                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 224                     ; 162                           (uint8_t)TIM2_OCMode);
 225  013a c65306        	ld	a,21254
 226  013d a48f          	and	a,#143
 227  013f 1a02          	or	a,(OFST+1,sp)
 228  0141 c75306        	ld	21254,a
 229                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 230  0144 7b06          	ld	a,(OFST+5,sp)
 231  0146 c75311        	ld	21265,a
 232                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 233  0149 7b07          	ld	a,(OFST+6,sp)
 234  014b c75312        	ld	21266,a
 235                     ; 168 }
 236  014e 5b03          	addw	sp,#3
 237  0150 81            	ret	
 238  0151               LC002:
 239  0151 89            	pushw	x
 240  0152 5f            	clrw	x
 241  0153 89            	pushw	x
 242  0154 ae0000        	ldw	x,#L11
 243  0157 cd0000        	call	_assert_failed
 245  015a 5b04          	addw	sp,#4
 246  015c 81            	ret	
 248                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 248                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 248                     ; 181                   uint16_t TIM2_Pulse,
 248                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 248                     ; 183 {
 249  015d               _TIM2_OC3Init:
 250  015d 89            	pushw	x
 251  015e 88            	push	a
 252       00000001      OFST:	set	1
 254                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 255  015f 9e            	ld	a,xh
 256  0160 4d            	tnz	a
 257  0161 271e          	jreq	L001
 258  0163 9e            	ld	a,xh
 259  0164 a110          	cp	a,#16
 260  0166 2719          	jreq	L001
 261  0168 9e            	ld	a,xh
 262  0169 a120          	cp	a,#32
 263  016b 2714          	jreq	L001
 264  016d 9e            	ld	a,xh
 265  016e a130          	cp	a,#48
 266  0170 270f          	jreq	L001
 267  0172 9e            	ld	a,xh
 268  0173 a160          	cp	a,#96
 269  0175 270a          	jreq	L001
 270  0177 9e            	ld	a,xh
 271  0178 a170          	cp	a,#112
 272  017a 2705          	jreq	L001
 273  017c ae00b9        	ldw	x,#185
 274  017f ad4b          	call	LC003
 275  0181               L001:
 276                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 277  0181 7b03          	ld	a,(OFST+2,sp)
 278  0183 2709          	jreq	L011
 279  0185 a111          	cp	a,#17
 280  0187 2705          	jreq	L011
 281  0189 ae00ba        	ldw	x,#186
 282  018c ad3e          	call	LC003
 283  018e               L011:
 284                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 285  018e 7b08          	ld	a,(OFST+7,sp)
 286  0190 2709          	jreq	L021
 287  0192 a122          	cp	a,#34
 288  0194 2705          	jreq	L021
 289  0196 ae00bb        	ldw	x,#187
 290  0199 ad31          	call	LC003
 291  019b               L021:
 292                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 293  019b c65309        	ld	a,21257
 294  019e a4fc          	and	a,#252
 295  01a0 c75309        	ld	21257,a
 296                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 296                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 297  01a3 7b08          	ld	a,(OFST+7,sp)
 298  01a5 a402          	and	a,#2
 299  01a7 6b01          	ld	(OFST+0,sp),a
 300  01a9 7b03          	ld	a,(OFST+2,sp)
 301  01ab a401          	and	a,#1
 302  01ad 1a01          	or	a,(OFST+0,sp)
 303  01af ca5309        	or	a,21257
 304  01b2 c75309        	ld	21257,a
 305                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 305                     ; 196                           (uint8_t)TIM2_OCMode);
 306  01b5 c65307        	ld	a,21255
 307  01b8 a48f          	and	a,#143
 308  01ba 1a02          	or	a,(OFST+1,sp)
 309  01bc c75307        	ld	21255,a
 310                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 311  01bf 7b06          	ld	a,(OFST+5,sp)
 312  01c1 c75313        	ld	21267,a
 313                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 314  01c4 7b07          	ld	a,(OFST+6,sp)
 315  01c6 c75314        	ld	21268,a
 316                     ; 201 }
 317  01c9 5b03          	addw	sp,#3
 318  01cb 81            	ret	
 319  01cc               LC003:
 320  01cc 89            	pushw	x
 321  01cd 5f            	clrw	x
 322  01ce 89            	pushw	x
 323  01cf ae0000        	ldw	x,#L11
 324  01d2 cd0000        	call	_assert_failed
 326  01d5 5b04          	addw	sp,#4
 327  01d7 81            	ret	
 329                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 329                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 329                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 329                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 329                     ; 216                  uint8_t TIM2_ICFilter)
 329                     ; 217 {
 330  01d8               _TIM2_ICInit:
 331  01d8 89            	pushw	x
 332       00000000      OFST:	set	0
 334                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 335  01d9 9e            	ld	a,xh
 336  01da 4d            	tnz	a
 337  01db 270f          	jreq	L231
 338  01dd 9e            	ld	a,xh
 339  01de 4a            	dec	a
 340  01df 270b          	jreq	L231
 341  01e1 9e            	ld	a,xh
 342  01e2 a102          	cp	a,#2
 343  01e4 2706          	jreq	L231
 344  01e6 ae00db        	ldw	x,#219
 345  01e9 cd026f        	call	LC004
 346  01ec               L231:
 347                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 348  01ec 7b02          	ld	a,(OFST+2,sp)
 349  01ee 2709          	jreq	L241
 350  01f0 a144          	cp	a,#68
 351  01f2 2705          	jreq	L241
 352  01f4 ae00dc        	ldw	x,#220
 353  01f7 ad76          	call	LC004
 354  01f9               L241:
 355                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 356  01f9 7b05          	ld	a,(OFST+5,sp)
 357  01fb a101          	cp	a,#1
 358  01fd 270d          	jreq	L251
 359  01ff a102          	cp	a,#2
 360  0201 2709          	jreq	L251
 361  0203 a103          	cp	a,#3
 362  0205 2705          	jreq	L251
 363  0207 ae00dd        	ldw	x,#221
 364  020a ad63          	call	LC004
 365  020c               L251:
 366                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 367  020c 7b06          	ld	a,(OFST+6,sp)
 368  020e 2711          	jreq	L261
 369  0210 a104          	cp	a,#4
 370  0212 270d          	jreq	L261
 371  0214 a108          	cp	a,#8
 372  0216 2709          	jreq	L261
 373  0218 a10c          	cp	a,#12
 374  021a 2705          	jreq	L261
 375  021c ae00de        	ldw	x,#222
 376  021f ad4e          	call	LC004
 377  0221               L261:
 378                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 379  0221 7b07          	ld	a,(OFST+7,sp)
 380  0223 a110          	cp	a,#16
 381  0225 2505          	jrult	L071
 382  0227 ae00df        	ldw	x,#223
 383  022a ad43          	call	LC004
 384  022c               L071:
 385                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 386  022c 7b01          	ld	a,(OFST+1,sp)
 387  022e 2614          	jrne	L31
 388                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 388                     ; 229                (uint8_t)TIM2_ICSelection,
 388                     ; 230                (uint8_t)TIM2_ICFilter);
 389  0230 7b07          	ld	a,(OFST+7,sp)
 390  0232 88            	push	a
 391  0233 7b06          	ld	a,(OFST+6,sp)
 392  0235 97            	ld	xl,a
 393  0236 7b03          	ld	a,(OFST+3,sp)
 394  0238 95            	ld	xh,a
 395  0239 cd08c9        	call	L3_TI1_Config
 397  023c 84            	pop	a
 398                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 399  023d 7b06          	ld	a,(OFST+6,sp)
 400  023f cd0709        	call	_TIM2_SetIC1Prescaler
 403  0242 2029          	jra	L51
 404  0244               L31:
 405                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 406  0244 4a            	dec	a
 407  0245 2614          	jrne	L71
 408                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 408                     ; 239                (uint8_t)TIM2_ICSelection,
 408                     ; 240                (uint8_t)TIM2_ICFilter);
 409  0247 7b07          	ld	a,(OFST+7,sp)
 410  0249 88            	push	a
 411  024a 7b06          	ld	a,(OFST+6,sp)
 412  024c 97            	ld	xl,a
 413  024d 7b03          	ld	a,(OFST+3,sp)
 414  024f 95            	ld	xh,a
 415  0250 cd08f9        	call	L5_TI2_Config
 417  0253 84            	pop	a
 418                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 419  0254 7b06          	ld	a,(OFST+6,sp)
 420  0256 cd0733        	call	_TIM2_SetIC2Prescaler
 423  0259 2012          	jra	L51
 424  025b               L71:
 425                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 425                     ; 249                (uint8_t)TIM2_ICSelection,
 425                     ; 250                (uint8_t)TIM2_ICFilter);
 426  025b 7b07          	ld	a,(OFST+7,sp)
 427  025d 88            	push	a
 428  025e 7b06          	ld	a,(OFST+6,sp)
 429  0260 97            	ld	xl,a
 430  0261 7b03          	ld	a,(OFST+3,sp)
 431  0263 95            	ld	xh,a
 432  0264 cd0929        	call	L7_TI3_Config
 434  0267 84            	pop	a
 435                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
 436  0268 7b06          	ld	a,(OFST+6,sp)
 437  026a cd075d        	call	_TIM2_SetIC3Prescaler
 439  026d               L51:
 440                     ; 255 }
 441  026d 85            	popw	x
 442  026e 81            	ret	
 443  026f               LC004:
 444  026f 89            	pushw	x
 445  0270 5f            	clrw	x
 446  0271 89            	pushw	x
 447  0272 ae0000        	ldw	x,#L11
 448  0275 cd0000        	call	_assert_failed
 450  0278 5b04          	addw	sp,#4
 451  027a 81            	ret	
 453                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
 453                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 453                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
 453                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 453                     ; 270                      uint8_t TIM2_ICFilter)
 453                     ; 271 {
 454  027b               _TIM2_PWMIConfig:
 455  027b 89            	pushw	x
 456  027c 89            	pushw	x
 457       00000002      OFST:	set	2
 459                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
 460                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
 461                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
 462  027d 9e            	ld	a,xh
 463  027e 4d            	tnz	a
 464  027f 270a          	jreq	L612
 465  0281 9e            	ld	a,xh
 466  0282 4a            	dec	a
 467  0283 2706          	jreq	L612
 468  0285 ae0114        	ldw	x,#276
 469  0288 cd032e        	call	LC005
 470  028b               L612:
 471                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 472  028b 7b04          	ld	a,(OFST+2,sp)
 473  028d 270a          	jreq	L622
 474  028f a144          	cp	a,#68
 475  0291 2706          	jreq	L622
 476  0293 ae0115        	ldw	x,#277
 477  0296 cd032e        	call	LC005
 478  0299               L622:
 479                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 480  0299 7b07          	ld	a,(OFST+5,sp)
 481  029b a101          	cp	a,#1
 482  029d 270e          	jreq	L632
 483  029f a102          	cp	a,#2
 484  02a1 270a          	jreq	L632
 485  02a3 a103          	cp	a,#3
 486  02a5 2706          	jreq	L632
 487  02a7 ae0116        	ldw	x,#278
 488  02aa cd032e        	call	LC005
 489  02ad               L632:
 490                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 491  02ad 7b08          	ld	a,(OFST+6,sp)
 492  02af 2711          	jreq	L642
 493  02b1 a104          	cp	a,#4
 494  02b3 270d          	jreq	L642
 495  02b5 a108          	cp	a,#8
 496  02b7 2709          	jreq	L642
 497  02b9 a10c          	cp	a,#12
 498  02bb 2705          	jreq	L642
 499  02bd ae0117        	ldw	x,#279
 500  02c0 ad6c          	call	LC005
 501  02c2               L642:
 502                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
 503  02c2 7b04          	ld	a,(OFST+2,sp)
 504  02c4 a144          	cp	a,#68
 505  02c6 2706          	jreq	L32
 506                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
 507  02c8 a644          	ld	a,#68
 508  02ca 6b01          	ld	(OFST-1,sp),a
 510  02cc 2002          	jra	L52
 511  02ce               L32:
 512                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
 513  02ce 0f01          	clr	(OFST-1,sp)
 514  02d0               L52:
 515                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
 516  02d0 7b07          	ld	a,(OFST+5,sp)
 517  02d2 4a            	dec	a
 518  02d3 2604          	jrne	L72
 519                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
 520  02d5 a602          	ld	a,#2
 522  02d7 2002          	jra	L13
 523  02d9               L72:
 524                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
 525  02d9 a601          	ld	a,#1
 526  02db               L13:
 527  02db 6b02          	ld	(OFST+0,sp),a
 528                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
 529  02dd 7b03          	ld	a,(OFST+1,sp)
 530  02df 2626          	jrne	L33
 531                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
 531                     ; 305                (uint8_t)TIM2_ICFilter);
 532  02e1 7b09          	ld	a,(OFST+7,sp)
 533  02e3 88            	push	a
 534  02e4 7b08          	ld	a,(OFST+6,sp)
 535  02e6 97            	ld	xl,a
 536  02e7 7b05          	ld	a,(OFST+3,sp)
 537  02e9 95            	ld	xh,a
 538  02ea cd08c9        	call	L3_TI1_Config
 540  02ed 84            	pop	a
 541                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 542  02ee 7b08          	ld	a,(OFST+6,sp)
 543  02f0 cd0709        	call	_TIM2_SetIC1Prescaler
 545                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
 546  02f3 7b09          	ld	a,(OFST+7,sp)
 547  02f5 88            	push	a
 548  02f6 7b03          	ld	a,(OFST+1,sp)
 549  02f8 97            	ld	xl,a
 550  02f9 7b02          	ld	a,(OFST+0,sp)
 551  02fb 95            	ld	xh,a
 552  02fc cd08f9        	call	L5_TI2_Config
 554  02ff 84            	pop	a
 555                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 556  0300 7b08          	ld	a,(OFST+6,sp)
 557  0302 cd0733        	call	_TIM2_SetIC2Prescaler
 560  0305 2024          	jra	L53
 561  0307               L33:
 562                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
 562                     ; 320                (uint8_t)TIM2_ICFilter);
 563  0307 7b09          	ld	a,(OFST+7,sp)
 564  0309 88            	push	a
 565  030a 7b08          	ld	a,(OFST+6,sp)
 566  030c 97            	ld	xl,a
 567  030d 7b05          	ld	a,(OFST+3,sp)
 568  030f 95            	ld	xh,a
 569  0310 cd08f9        	call	L5_TI2_Config
 571  0313 84            	pop	a
 572                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 573  0314 7b08          	ld	a,(OFST+6,sp)
 574  0316 cd0733        	call	_TIM2_SetIC2Prescaler
 576                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
 577  0319 7b09          	ld	a,(OFST+7,sp)
 578  031b 88            	push	a
 579  031c 7b03          	ld	a,(OFST+1,sp)
 580  031e 97            	ld	xl,a
 581  031f 7b02          	ld	a,(OFST+0,sp)
 582  0321 95            	ld	xh,a
 583  0322 cd08c9        	call	L3_TI1_Config
 585  0325 84            	pop	a
 586                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 587  0326 7b08          	ld	a,(OFST+6,sp)
 588  0328 cd0709        	call	_TIM2_SetIC1Prescaler
 590  032b               L53:
 591                     ; 331 }
 592  032b 5b04          	addw	sp,#4
 593  032d 81            	ret	
 594  032e               LC005:
 595  032e 89            	pushw	x
 596  032f 5f            	clrw	x
 597  0330 89            	pushw	x
 598  0331 ae0000        	ldw	x,#L11
 599  0334 cd0000        	call	_assert_failed
 601  0337 5b04          	addw	sp,#4
 602  0339 81            	ret	
 604                     ; 339 void TIM2_Cmd(FunctionalState NewState)
 604                     ; 340 {
 605  033a               _TIM2_Cmd:
 606  033a 88            	push	a
 607       00000000      OFST:	set	0
 609                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 610  033b 4d            	tnz	a
 611  033c 2711          	jreq	L003
 612  033e 4a            	dec	a
 613  033f 270e          	jreq	L003
 614  0341 ae0156        	ldw	x,#342
 615  0344 89            	pushw	x
 616  0345 5f            	clrw	x
 617  0346 89            	pushw	x
 618  0347 ae0000        	ldw	x,#L11
 619  034a cd0000        	call	_assert_failed
 621  034d 5b04          	addw	sp,#4
 622  034f               L003:
 623                     ; 345   if (NewState != DISABLE)
 624  034f 7b01          	ld	a,(OFST+1,sp)
 625  0351 2706          	jreq	L73
 626                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
 627  0353 72105300      	bset	21248,#0
 629  0357 2004          	jra	L14
 630  0359               L73:
 631                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
 632  0359 72115300      	bres	21248,#0
 633  035d               L14:
 634                     ; 353 }
 635  035d 84            	pop	a
 636  035e 81            	ret	
 638                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
 638                     ; 369 {
 639  035f               _TIM2_ITConfig:
 640  035f 89            	pushw	x
 641       00000000      OFST:	set	0
 643                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
 644  0360 9e            	ld	a,xh
 645  0361 4d            	tnz	a
 646  0362 2705          	jreq	L603
 647  0364 9e            	ld	a,xh
 648  0365 a110          	cp	a,#16
 649  0367 2505          	jrult	L013
 650  0369               L603:
 651  0369 ae0173        	ldw	x,#371
 652  036c ad22          	call	LC006
 653  036e               L013:
 654                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 655  036e 7b02          	ld	a,(OFST+2,sp)
 656  0370 2708          	jreq	L023
 657  0372 4a            	dec	a
 658  0373 2705          	jreq	L023
 659  0375 ae0174        	ldw	x,#372
 660  0378 ad16          	call	LC006
 661  037a               L023:
 662                     ; 374   if (NewState != DISABLE)
 663  037a 7b02          	ld	a,(OFST+2,sp)
 664  037c 2707          	jreq	L34
 665                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
 666  037e c65301        	ld	a,21249
 667  0381 1a01          	or	a,(OFST+1,sp)
 669  0383 2006          	jra	L54
 670  0385               L34:
 671                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
 672  0385 7b01          	ld	a,(OFST+1,sp)
 673  0387 43            	cpl	a
 674  0388 c45301        	and	a,21249
 675  038b               L54:
 676  038b c75301        	ld	21249,a
 677                     ; 384 }
 678  038e 85            	popw	x
 679  038f 81            	ret	
 680  0390               LC006:
 681  0390 89            	pushw	x
 682  0391 5f            	clrw	x
 683  0392 89            	pushw	x
 684  0393 ae0000        	ldw	x,#L11
 685  0396 cd0000        	call	_assert_failed
 687  0399 5b04          	addw	sp,#4
 688  039b 81            	ret	
 690                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
 690                     ; 393 {
 691  039c               _TIM2_UpdateDisableConfig:
 692  039c 88            	push	a
 693       00000000      OFST:	set	0
 695                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 696  039d 4d            	tnz	a
 697  039e 2711          	jreq	L233
 698  03a0 4a            	dec	a
 699  03a1 270e          	jreq	L233
 700  03a3 ae018b        	ldw	x,#395
 701  03a6 89            	pushw	x
 702  03a7 5f            	clrw	x
 703  03a8 89            	pushw	x
 704  03a9 ae0000        	ldw	x,#L11
 705  03ac cd0000        	call	_assert_failed
 707  03af 5b04          	addw	sp,#4
 708  03b1               L233:
 709                     ; 398   if (NewState != DISABLE)
 710  03b1 7b01          	ld	a,(OFST+1,sp)
 711  03b3 2706          	jreq	L74
 712                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
 713  03b5 72125300      	bset	21248,#1
 715  03b9 2004          	jra	L15
 716  03bb               L74:
 717                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
 718  03bb 72135300      	bres	21248,#1
 719  03bf               L15:
 720                     ; 406 }
 721  03bf 84            	pop	a
 722  03c0 81            	ret	
 724                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
 724                     ; 417 {
 725  03c1               _TIM2_UpdateRequestConfig:
 726  03c1 88            	push	a
 727       00000000      OFST:	set	0
 729                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
 730  03c2 4d            	tnz	a
 731  03c3 2711          	jreq	L443
 732  03c5 4a            	dec	a
 733  03c6 270e          	jreq	L443
 734  03c8 ae01a3        	ldw	x,#419
 735  03cb 89            	pushw	x
 736  03cc 5f            	clrw	x
 737  03cd 89            	pushw	x
 738  03ce ae0000        	ldw	x,#L11
 739  03d1 cd0000        	call	_assert_failed
 741  03d4 5b04          	addw	sp,#4
 742  03d6               L443:
 743                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
 744  03d6 7b01          	ld	a,(OFST+1,sp)
 745  03d8 2706          	jreq	L35
 746                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
 747  03da 72145300      	bset	21248,#2
 749  03de 2004          	jra	L55
 750  03e0               L35:
 751                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
 752  03e0 72155300      	bres	21248,#2
 753  03e4               L55:
 754                     ; 430 }
 755  03e4 84            	pop	a
 756  03e5 81            	ret	
 758                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
 758                     ; 441 {
 759  03e6               _TIM2_SelectOnePulseMode:
 760  03e6 88            	push	a
 761       00000000      OFST:	set	0
 763                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
 764  03e7 a101          	cp	a,#1
 765  03e9 2711          	jreq	L653
 766  03eb 4d            	tnz	a
 767  03ec 270e          	jreq	L653
 768  03ee ae01bb        	ldw	x,#443
 769  03f1 89            	pushw	x
 770  03f2 5f            	clrw	x
 771  03f3 89            	pushw	x
 772  03f4 ae0000        	ldw	x,#L11
 773  03f7 cd0000        	call	_assert_failed
 775  03fa 5b04          	addw	sp,#4
 776  03fc               L653:
 777                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
 778  03fc 7b01          	ld	a,(OFST+1,sp)
 779  03fe 2706          	jreq	L75
 780                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
 781  0400 72165300      	bset	21248,#3
 783  0404 2004          	jra	L16
 784  0406               L75:
 785                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
 786  0406 72175300      	bres	21248,#3
 787  040a               L16:
 788                     ; 454 }
 789  040a 84            	pop	a
 790  040b 81            	ret	
 792                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
 792                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
 792                     ; 486 {
 793  040c               _TIM2_PrescalerConfig:
 794  040c 89            	pushw	x
 795       00000000      OFST:	set	0
 797                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
 798  040d 9f            	ld	a,xl
 799  040e 4d            	tnz	a
 800  040f 2709          	jreq	L073
 801  0411 9f            	ld	a,xl
 802  0412 4a            	dec	a
 803  0413 2705          	jreq	L073
 804  0415 ae01e8        	ldw	x,#488
 805  0418 ad51          	call	LC007
 806  041a               L073:
 807                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
 808  041a 7b01          	ld	a,(OFST+1,sp)
 809  041c 2743          	jreq	L004
 810  041e a101          	cp	a,#1
 811  0420 273f          	jreq	L004
 812  0422 a102          	cp	a,#2
 813  0424 273b          	jreq	L004
 814  0426 a103          	cp	a,#3
 815  0428 2737          	jreq	L004
 816  042a a104          	cp	a,#4
 817  042c 2733          	jreq	L004
 818  042e a105          	cp	a,#5
 819  0430 272f          	jreq	L004
 820  0432 a106          	cp	a,#6
 821  0434 272b          	jreq	L004
 822  0436 a107          	cp	a,#7
 823  0438 2727          	jreq	L004
 824  043a a108          	cp	a,#8
 825  043c 2723          	jreq	L004
 826  043e a109          	cp	a,#9
 827  0440 271f          	jreq	L004
 828  0442 a10a          	cp	a,#10
 829  0444 271b          	jreq	L004
 830  0446 a10b          	cp	a,#11
 831  0448 2717          	jreq	L004
 832  044a a10c          	cp	a,#12
 833  044c 2713          	jreq	L004
 834  044e a10d          	cp	a,#13
 835  0450 270f          	jreq	L004
 836  0452 a10e          	cp	a,#14
 837  0454 270b          	jreq	L004
 838  0456 a10f          	cp	a,#15
 839  0458 2707          	jreq	L004
 840  045a ae01e9        	ldw	x,#489
 841  045d ad0c          	call	LC007
 842  045f 7b01          	ld	a,(OFST+1,sp)
 843  0461               L004:
 844                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
 845  0461 c7530c        	ld	21260,a
 846                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
 847  0464 7b02          	ld	a,(OFST+2,sp)
 848  0466 c75304        	ld	21252,a
 849                     ; 496 }
 850  0469 85            	popw	x
 851  046a 81            	ret	
 852  046b               LC007:
 853  046b 89            	pushw	x
 854  046c 5f            	clrw	x
 855  046d 89            	pushw	x
 856  046e ae0000        	ldw	x,#L11
 857  0471 cd0000        	call	_assert_failed
 859  0474 5b04          	addw	sp,#4
 860  0476 81            	ret	
 862                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
 862                     ; 508 {
 863  0477               _TIM2_ForcedOC1Config:
 864  0477 88            	push	a
 865       00000000      OFST:	set	0
 867                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
 868  0478 a150          	cp	a,#80
 869  047a 2712          	jreq	L214
 870  047c a140          	cp	a,#64
 871  047e 270e          	jreq	L214
 872  0480 ae01fe        	ldw	x,#510
 873  0483 89            	pushw	x
 874  0484 5f            	clrw	x
 875  0485 89            	pushw	x
 876  0486 ae0000        	ldw	x,#L11
 877  0489 cd0000        	call	_assert_failed
 879  048c 5b04          	addw	sp,#4
 880  048e               L214:
 881                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
 881                     ; 514                             | (uint8_t)TIM2_ForcedAction);
 882  048e c65305        	ld	a,21253
 883  0491 a48f          	and	a,#143
 884  0493 1a01          	or	a,(OFST+1,sp)
 885  0495 c75305        	ld	21253,a
 886                     ; 515 }
 887  0498 84            	pop	a
 888  0499 81            	ret	
 890                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
 890                     ; 527 {
 891  049a               _TIM2_ForcedOC2Config:
 892  049a 88            	push	a
 893       00000000      OFST:	set	0
 895                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
 896  049b a150          	cp	a,#80
 897  049d 2712          	jreq	L424
 898  049f a140          	cp	a,#64
 899  04a1 270e          	jreq	L424
 900  04a3 ae0211        	ldw	x,#529
 901  04a6 89            	pushw	x
 902  04a7 5f            	clrw	x
 903  04a8 89            	pushw	x
 904  04a9 ae0000        	ldw	x,#L11
 905  04ac cd0000        	call	_assert_failed
 907  04af 5b04          	addw	sp,#4
 908  04b1               L424:
 909                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
 909                     ; 533                           | (uint8_t)TIM2_ForcedAction);
 910  04b1 c65306        	ld	a,21254
 911  04b4 a48f          	and	a,#143
 912  04b6 1a01          	or	a,(OFST+1,sp)
 913  04b8 c75306        	ld	21254,a
 914                     ; 534 }
 915  04bb 84            	pop	a
 916  04bc 81            	ret	
 918                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
 918                     ; 546 {
 919  04bd               _TIM2_ForcedOC3Config:
 920  04bd 88            	push	a
 921       00000000      OFST:	set	0
 923                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
 924  04be a150          	cp	a,#80
 925  04c0 2712          	jreq	L634
 926  04c2 a140          	cp	a,#64
 927  04c4 270e          	jreq	L634
 928  04c6 ae0224        	ldw	x,#548
 929  04c9 89            	pushw	x
 930  04ca 5f            	clrw	x
 931  04cb 89            	pushw	x
 932  04cc ae0000        	ldw	x,#L11
 933  04cf cd0000        	call	_assert_failed
 935  04d2 5b04          	addw	sp,#4
 936  04d4               L634:
 937                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
 937                     ; 552                             | (uint8_t)TIM2_ForcedAction);
 938  04d4 c65307        	ld	a,21255
 939  04d7 a48f          	and	a,#143
 940  04d9 1a01          	or	a,(OFST+1,sp)
 941  04db c75307        	ld	21255,a
 942                     ; 553 }
 943  04de 84            	pop	a
 944  04df 81            	ret	
 946                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
 946                     ; 562 {
 947  04e0               _TIM2_ARRPreloadConfig:
 948  04e0 88            	push	a
 949       00000000      OFST:	set	0
 951                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952  04e1 4d            	tnz	a
 953  04e2 2711          	jreq	L054
 954  04e4 4a            	dec	a
 955  04e5 270e          	jreq	L054
 956  04e7 ae0234        	ldw	x,#564
 957  04ea 89            	pushw	x
 958  04eb 5f            	clrw	x
 959  04ec 89            	pushw	x
 960  04ed ae0000        	ldw	x,#L11
 961  04f0 cd0000        	call	_assert_failed
 963  04f3 5b04          	addw	sp,#4
 964  04f5               L054:
 965                     ; 567   if (NewState != DISABLE)
 966  04f5 7b01          	ld	a,(OFST+1,sp)
 967  04f7 2706          	jreq	L36
 968                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
 969  04f9 721e5300      	bset	21248,#7
 971  04fd 2004          	jra	L56
 972  04ff               L36:
 973                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
 974  04ff 721f5300      	bres	21248,#7
 975  0503               L56:
 976                     ; 575 }
 977  0503 84            	pop	a
 978  0504 81            	ret	
 980                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
 980                     ; 584 {
 981  0505               _TIM2_OC1PreloadConfig:
 982  0505 88            	push	a
 983       00000000      OFST:	set	0
 985                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 986  0506 4d            	tnz	a
 987  0507 2711          	jreq	L264
 988  0509 4a            	dec	a
 989  050a 270e          	jreq	L264
 990  050c ae024a        	ldw	x,#586
 991  050f 89            	pushw	x
 992  0510 5f            	clrw	x
 993  0511 89            	pushw	x
 994  0512 ae0000        	ldw	x,#L11
 995  0515 cd0000        	call	_assert_failed
 997  0518 5b04          	addw	sp,#4
 998  051a               L264:
 999                     ; 589   if (NewState != DISABLE)
1000  051a 7b01          	ld	a,(OFST+1,sp)
1001  051c 2706          	jreq	L76
1002                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
1003  051e 72165305      	bset	21253,#3
1005  0522 2004          	jra	L17
1006  0524               L76:
1007                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
1008  0524 72175305      	bres	21253,#3
1009  0528               L17:
1010                     ; 597 }
1011  0528 84            	pop	a
1012  0529 81            	ret	
1014                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
1014                     ; 606 {
1015  052a               _TIM2_OC2PreloadConfig:
1016  052a 88            	push	a
1017       00000000      OFST:	set	0
1019                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1020  052b 4d            	tnz	a
1021  052c 2711          	jreq	L474
1022  052e 4a            	dec	a
1023  052f 270e          	jreq	L474
1024  0531 ae0260        	ldw	x,#608
1025  0534 89            	pushw	x
1026  0535 5f            	clrw	x
1027  0536 89            	pushw	x
1028  0537 ae0000        	ldw	x,#L11
1029  053a cd0000        	call	_assert_failed
1031  053d 5b04          	addw	sp,#4
1032  053f               L474:
1033                     ; 611   if (NewState != DISABLE)
1034  053f 7b01          	ld	a,(OFST+1,sp)
1035  0541 2706          	jreq	L37
1036                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
1037  0543 72165306      	bset	21254,#3
1039  0547 2004          	jra	L57
1040  0549               L37:
1041                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
1042  0549 72175306      	bres	21254,#3
1043  054d               L57:
1044                     ; 619 }
1045  054d 84            	pop	a
1046  054e 81            	ret	
1048                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
1048                     ; 628 {
1049  054f               _TIM2_OC3PreloadConfig:
1050  054f 88            	push	a
1051       00000000      OFST:	set	0
1053                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1054  0550 4d            	tnz	a
1055  0551 2711          	jreq	L605
1056  0553 4a            	dec	a
1057  0554 270e          	jreq	L605
1058  0556 ae0276        	ldw	x,#630
1059  0559 89            	pushw	x
1060  055a 5f            	clrw	x
1061  055b 89            	pushw	x
1062  055c ae0000        	ldw	x,#L11
1063  055f cd0000        	call	_assert_failed
1065  0562 5b04          	addw	sp,#4
1066  0564               L605:
1067                     ; 633   if (NewState != DISABLE)
1068  0564 7b01          	ld	a,(OFST+1,sp)
1069  0566 2706          	jreq	L77
1070                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
1071  0568 72165307      	bset	21255,#3
1073  056c 2004          	jra	L101
1074  056e               L77:
1075                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
1076  056e 72175307      	bres	21255,#3
1077  0572               L101:
1078                     ; 641 }
1079  0572 84            	pop	a
1080  0573 81            	ret	
1082                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
1082                     ; 654 {
1083  0574               _TIM2_GenerateEvent:
1084  0574 88            	push	a
1085       00000000      OFST:	set	0
1087                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
1088  0575 4d            	tnz	a
1089  0576 260e          	jrne	L615
1090  0578 ae0290        	ldw	x,#656
1091  057b 89            	pushw	x
1092  057c 5f            	clrw	x
1093  057d 89            	pushw	x
1094  057e ae0000        	ldw	x,#L11
1095  0581 cd0000        	call	_assert_failed
1097  0584 5b04          	addw	sp,#4
1098  0586               L615:
1099                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
1100  0586 7b01          	ld	a,(OFST+1,sp)
1101  0588 c75304        	ld	21252,a
1102                     ; 660 }
1103  058b 84            	pop	a
1104  058c 81            	ret	
1106                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
1106                     ; 671 {
1107  058d               _TIM2_OC1PolarityConfig:
1108  058d 88            	push	a
1109       00000000      OFST:	set	0
1111                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
1112  058e 4d            	tnz	a
1113  058f 2712          	jreq	L035
1114  0591 a122          	cp	a,#34
1115  0593 270e          	jreq	L035
1116  0595 ae02a1        	ldw	x,#673
1117  0598 89            	pushw	x
1118  0599 5f            	clrw	x
1119  059a 89            	pushw	x
1120  059b ae0000        	ldw	x,#L11
1121  059e cd0000        	call	_assert_failed
1123  05a1 5b04          	addw	sp,#4
1124  05a3               L035:
1125                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
1126  05a3 7b01          	ld	a,(OFST+1,sp)
1127  05a5 2706          	jreq	L301
1128                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
1129  05a7 72125308      	bset	21256,#1
1131  05ab 2004          	jra	L501
1132  05ad               L301:
1133                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
1134  05ad 72135308      	bres	21256,#1
1135  05b1               L501:
1136                     ; 684 }
1137  05b1 84            	pop	a
1138  05b2 81            	ret	
1140                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
1140                     ; 695 {
1141  05b3               _TIM2_OC2PolarityConfig:
1142  05b3 88            	push	a
1143       00000000      OFST:	set	0
1145                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
1146  05b4 4d            	tnz	a
1147  05b5 2712          	jreq	L245
1148  05b7 a122          	cp	a,#34
1149  05b9 270e          	jreq	L245
1150  05bb ae02b9        	ldw	x,#697
1151  05be 89            	pushw	x
1152  05bf 5f            	clrw	x
1153  05c0 89            	pushw	x
1154  05c1 ae0000        	ldw	x,#L11
1155  05c4 cd0000        	call	_assert_failed
1157  05c7 5b04          	addw	sp,#4
1158  05c9               L245:
1159                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
1160  05c9 7b01          	ld	a,(OFST+1,sp)
1161  05cb 2706          	jreq	L701
1162                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
1163  05cd 721a5308      	bset	21256,#5
1165  05d1 2004          	jra	L111
1166  05d3               L701:
1167                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
1168  05d3 721b5308      	bres	21256,#5
1169  05d7               L111:
1170                     ; 708 }
1171  05d7 84            	pop	a
1172  05d8 81            	ret	
1174                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
1174                     ; 719 {
1175  05d9               _TIM2_OC3PolarityConfig:
1176  05d9 88            	push	a
1177       00000000      OFST:	set	0
1179                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
1180  05da 4d            	tnz	a
1181  05db 2712          	jreq	L455
1182  05dd a122          	cp	a,#34
1183  05df 270e          	jreq	L455
1184  05e1 ae02d1        	ldw	x,#721
1185  05e4 89            	pushw	x
1186  05e5 5f            	clrw	x
1187  05e6 89            	pushw	x
1188  05e7 ae0000        	ldw	x,#L11
1189  05ea cd0000        	call	_assert_failed
1191  05ed 5b04          	addw	sp,#4
1192  05ef               L455:
1193                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
1194  05ef 7b01          	ld	a,(OFST+1,sp)
1195  05f1 2706          	jreq	L311
1196                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
1197  05f3 72125309      	bset	21257,#1
1199  05f7 2004          	jra	L511
1200  05f9               L311:
1201                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
1202  05f9 72135309      	bres	21257,#1
1203  05fd               L511:
1204                     ; 732 }
1205  05fd 84            	pop	a
1206  05fe 81            	ret	
1208                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
1208                     ; 746 {
1209  05ff               _TIM2_CCxCmd:
1210  05ff 89            	pushw	x
1211       00000000      OFST:	set	0
1213                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1214  0600 9e            	ld	a,xh
1215  0601 4d            	tnz	a
1216  0602 270e          	jreq	L665
1217  0604 9e            	ld	a,xh
1218  0605 4a            	dec	a
1219  0606 270a          	jreq	L665
1220  0608 9e            	ld	a,xh
1221  0609 a102          	cp	a,#2
1222  060b 2705          	jreq	L665
1223  060d ae02ec        	ldw	x,#748
1224  0610 ad43          	call	LC008
1225  0612               L665:
1226                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1227  0612 7b02          	ld	a,(OFST+2,sp)
1228  0614 2708          	jreq	L675
1229  0616 4a            	dec	a
1230  0617 2705          	jreq	L675
1231  0619 ae02ed        	ldw	x,#749
1232  061c ad37          	call	LC008
1233  061e               L675:
1234                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
1235  061e 7b01          	ld	a,(OFST+1,sp)
1236  0620 2610          	jrne	L711
1237                     ; 754     if (NewState != DISABLE)
1238  0622 7b02          	ld	a,(OFST+2,sp)
1239  0624 2706          	jreq	L121
1240                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
1241  0626 72105308      	bset	21256,#0
1243  062a 2027          	jra	L521
1244  062c               L121:
1245                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
1246  062c 72115308      	bres	21256,#0
1247  0630 2021          	jra	L521
1248  0632               L711:
1249                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
1250  0632 4a            	dec	a
1251  0633 2610          	jrne	L721
1252                     ; 767     if (NewState != DISABLE)
1253  0635 7b02          	ld	a,(OFST+2,sp)
1254  0637 2706          	jreq	L131
1255                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
1256  0639 72185308      	bset	21256,#4
1258  063d 2014          	jra	L521
1259  063f               L131:
1260                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
1261  063f 72195308      	bres	21256,#4
1262  0643 200e          	jra	L521
1263  0645               L721:
1264                     ; 779     if (NewState != DISABLE)
1265  0645 7b02          	ld	a,(OFST+2,sp)
1266  0647 2706          	jreq	L731
1267                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
1268  0649 72105309      	bset	21257,#0
1270  064d 2004          	jra	L521
1271  064f               L731:
1272                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
1273  064f 72115309      	bres	21257,#0
1274  0653               L521:
1275                     ; 788 }
1276  0653 85            	popw	x
1277  0654 81            	ret	
1278  0655               LC008:
1279  0655 89            	pushw	x
1280  0656 5f            	clrw	x
1281  0657 89            	pushw	x
1282  0658 ae0000        	ldw	x,#L11
1283  065b cd0000        	call	_assert_failed
1285  065e 5b04          	addw	sp,#4
1286  0660 81            	ret	
1288                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
1288                     ; 811 {
1289  0661               _TIM2_SelectOCxM:
1290  0661 89            	pushw	x
1291       00000000      OFST:	set	0
1293                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1294  0662 9e            	ld	a,xh
1295  0663 4d            	tnz	a
1296  0664 270e          	jreq	L016
1297  0666 9e            	ld	a,xh
1298  0667 4a            	dec	a
1299  0668 270a          	jreq	L016
1300  066a 9e            	ld	a,xh
1301  066b a102          	cp	a,#2
1302  066d 2705          	jreq	L016
1303  066f ae032d        	ldw	x,#813
1304  0672 ad5c          	call	LC009
1305  0674               L016:
1306                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
1307  0674 7b02          	ld	a,(OFST+2,sp)
1308  0676 2721          	jreq	L026
1309  0678 a110          	cp	a,#16
1310  067a 271d          	jreq	L026
1311  067c a120          	cp	a,#32
1312  067e 2719          	jreq	L026
1313  0680 a130          	cp	a,#48
1314  0682 2715          	jreq	L026
1315  0684 a160          	cp	a,#96
1316  0686 2711          	jreq	L026
1317  0688 a170          	cp	a,#112
1318  068a 270d          	jreq	L026
1319  068c a150          	cp	a,#80
1320  068e 2709          	jreq	L026
1321  0690 a140          	cp	a,#64
1322  0692 2705          	jreq	L026
1323  0694 ae032e        	ldw	x,#814
1324  0697 ad37          	call	LC009
1325  0699               L026:
1326                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
1327  0699 7b01          	ld	a,(OFST+1,sp)
1328  069b 2610          	jrne	L341
1329                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
1330  069d 72115308      	bres	21256,#0
1331                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
1331                     ; 823                             | (uint8_t)TIM2_OCMode);
1332  06a1 c65305        	ld	a,21253
1333  06a4 a48f          	and	a,#143
1334  06a6 1a02          	or	a,(OFST+2,sp)
1335  06a8 c75305        	ld	21253,a
1337  06ab 2021          	jra	L541
1338  06ad               L341:
1339                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
1340  06ad 4a            	dec	a
1341  06ae 2610          	jrne	L741
1342                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
1343  06b0 72195308      	bres	21256,#4
1344                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
1344                     ; 832                             | (uint8_t)TIM2_OCMode);
1345  06b4 c65306        	ld	a,21254
1346  06b7 a48f          	and	a,#143
1347  06b9 1a02          	or	a,(OFST+2,sp)
1348  06bb c75306        	ld	21254,a
1350  06be 200e          	jra	L541
1351  06c0               L741:
1352                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
1353  06c0 72115309      	bres	21257,#0
1354                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1354                     ; 841                             | (uint8_t)TIM2_OCMode);
1355  06c4 c65307        	ld	a,21255
1356  06c7 a48f          	and	a,#143
1357  06c9 1a02          	or	a,(OFST+2,sp)
1358  06cb c75307        	ld	21255,a
1359  06ce               L541:
1360                     ; 843 }
1361  06ce 85            	popw	x
1362  06cf 81            	ret	
1363  06d0               LC009:
1364  06d0 89            	pushw	x
1365  06d1 5f            	clrw	x
1366  06d2 89            	pushw	x
1367  06d3 ae0000        	ldw	x,#L11
1368  06d6 cd0000        	call	_assert_failed
1370  06d9 5b04          	addw	sp,#4
1371  06db 81            	ret	
1373                     ; 851 void TIM2_SetCounter(uint16_t Counter)
1373                     ; 852 {
1374  06dc               _TIM2_SetCounter:
1376                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
1377  06dc 9e            	ld	a,xh
1378  06dd c7530a        	ld	21258,a
1379                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
1380  06e0 9f            	ld	a,xl
1381  06e1 c7530b        	ld	21259,a
1382                     ; 856 }
1383  06e4 81            	ret	
1385                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
1385                     ; 865 {
1386  06e5               _TIM2_SetAutoreload:
1388                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
1389  06e5 9e            	ld	a,xh
1390  06e6 c7530d        	ld	21261,a
1391                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
1392  06e9 9f            	ld	a,xl
1393  06ea c7530e        	ld	21262,a
1394                     ; 869 }
1395  06ed 81            	ret	
1397                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
1397                     ; 878 {
1398  06ee               _TIM2_SetCompare1:
1400                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
1401  06ee 9e            	ld	a,xh
1402  06ef c7530f        	ld	21263,a
1403                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
1404  06f2 9f            	ld	a,xl
1405  06f3 c75310        	ld	21264,a
1406                     ; 882 }
1407  06f6 81            	ret	
1409                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
1409                     ; 891 {
1410  06f7               _TIM2_SetCompare2:
1412                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
1413  06f7 9e            	ld	a,xh
1414  06f8 c75311        	ld	21265,a
1415                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
1416  06fb 9f            	ld	a,xl
1417  06fc c75312        	ld	21266,a
1418                     ; 895 }
1419  06ff 81            	ret	
1421                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
1421                     ; 904 {
1422  0700               _TIM2_SetCompare3:
1424                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
1425  0700 9e            	ld	a,xh
1426  0701 c75313        	ld	21267,a
1427                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
1428  0704 9f            	ld	a,xl
1429  0705 c75314        	ld	21268,a
1430                     ; 908 }
1431  0708 81            	ret	
1433                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
1433                     ; 921 {
1434  0709               _TIM2_SetIC1Prescaler:
1435  0709 88            	push	a
1436       00000000      OFST:	set	0
1438                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
1439  070a 4d            	tnz	a
1440  070b 271a          	jreq	L446
1441  070d a104          	cp	a,#4
1442  070f 2716          	jreq	L446
1443  0711 a108          	cp	a,#8
1444  0713 2712          	jreq	L446
1445  0715 a10c          	cp	a,#12
1446  0717 270e          	jreq	L446
1447  0719 ae039b        	ldw	x,#923
1448  071c 89            	pushw	x
1449  071d 5f            	clrw	x
1450  071e 89            	pushw	x
1451  071f ae0000        	ldw	x,#L11
1452  0722 cd0000        	call	_assert_failed
1454  0725 5b04          	addw	sp,#4
1455  0727               L446:
1456                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
1456                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
1457  0727 c65305        	ld	a,21253
1458  072a a4f3          	and	a,#243
1459  072c 1a01          	or	a,(OFST+1,sp)
1460  072e c75305        	ld	21253,a
1461                     ; 928 }
1462  0731 84            	pop	a
1463  0732 81            	ret	
1465                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
1465                     ; 941 {
1466  0733               _TIM2_SetIC2Prescaler:
1467  0733 88            	push	a
1468       00000000      OFST:	set	0
1470                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
1471  0734 4d            	tnz	a
1472  0735 271a          	jreq	L656
1473  0737 a104          	cp	a,#4
1474  0739 2716          	jreq	L656
1475  073b a108          	cp	a,#8
1476  073d 2712          	jreq	L656
1477  073f a10c          	cp	a,#12
1478  0741 270e          	jreq	L656
1479  0743 ae03af        	ldw	x,#943
1480  0746 89            	pushw	x
1481  0747 5f            	clrw	x
1482  0748 89            	pushw	x
1483  0749 ae0000        	ldw	x,#L11
1484  074c cd0000        	call	_assert_failed
1486  074f 5b04          	addw	sp,#4
1487  0751               L656:
1488                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
1488                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
1489  0751 c65306        	ld	a,21254
1490  0754 a4f3          	and	a,#243
1491  0756 1a01          	or	a,(OFST+1,sp)
1492  0758 c75306        	ld	21254,a
1493                     ; 948 }
1494  075b 84            	pop	a
1495  075c 81            	ret	
1497                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
1497                     ; 961 {
1498  075d               _TIM2_SetIC3Prescaler:
1499  075d 88            	push	a
1500       00000000      OFST:	set	0
1502                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
1503  075e 4d            	tnz	a
1504  075f 271a          	jreq	L076
1505  0761 a104          	cp	a,#4
1506  0763 2716          	jreq	L076
1507  0765 a108          	cp	a,#8
1508  0767 2712          	jreq	L076
1509  0769 a10c          	cp	a,#12
1510  076b 270e          	jreq	L076
1511  076d ae03c4        	ldw	x,#964
1512  0770 89            	pushw	x
1513  0771 5f            	clrw	x
1514  0772 89            	pushw	x
1515  0773 ae0000        	ldw	x,#L11
1516  0776 cd0000        	call	_assert_failed
1518  0779 5b04          	addw	sp,#4
1519  077b               L076:
1520                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
1520                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
1521  077b c65307        	ld	a,21255
1522  077e a4f3          	and	a,#243
1523  0780 1a01          	or	a,(OFST+1,sp)
1524  0782 c75307        	ld	21255,a
1525                     ; 968 }
1526  0785 84            	pop	a
1527  0786 81            	ret	
1529                     ; 975 uint16_t TIM2_GetCapture1(void)
1529                     ; 976 {
1530  0787               _TIM2_GetCapture1:
1531  0787 5204          	subw	sp,#4
1532       00000004      OFST:	set	4
1534                     ; 978   uint16_t tmpccr1 = 0;
1535                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
1537                     ; 981   tmpccr1h = TIM2->CCR1H;
1538  0789 c6530f        	ld	a,21263
1539  078c 6b02          	ld	(OFST-2,sp),a
1540                     ; 982   tmpccr1l = TIM2->CCR1L;
1541  078e c65310        	ld	a,21264
1542  0791 6b01          	ld	(OFST-3,sp),a
1543                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
1544  0793 5f            	clrw	x
1545  0794 97            	ld	xl,a
1546  0795 1f03          	ldw	(OFST-1,sp),x
1547                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
1548  0797 5f            	clrw	x
1549  0798 7b02          	ld	a,(OFST-2,sp)
1550  079a 97            	ld	xl,a
1551  079b 7b04          	ld	a,(OFST+0,sp)
1552  079d 01            	rrwa	x,a
1553  079e 1a03          	or	a,(OFST-1,sp)
1554  07a0 01            	rrwa	x,a
1555                     ; 987   return (uint16_t)tmpccr1;
1557  07a1 5b04          	addw	sp,#4
1558  07a3 81            	ret	
1560                     ; 995 uint16_t TIM2_GetCapture2(void)
1560                     ; 996 {
1561  07a4               _TIM2_GetCapture2:
1562  07a4 5204          	subw	sp,#4
1563       00000004      OFST:	set	4
1565                     ; 998   uint16_t tmpccr2 = 0;
1566                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
1568                     ; 1001   tmpccr2h = TIM2->CCR2H;
1569  07a6 c65311        	ld	a,21265
1570  07a9 6b02          	ld	(OFST-2,sp),a
1571                     ; 1002   tmpccr2l = TIM2->CCR2L;
1572  07ab c65312        	ld	a,21266
1573  07ae 6b01          	ld	(OFST-3,sp),a
1574                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
1575  07b0 5f            	clrw	x
1576  07b1 97            	ld	xl,a
1577  07b2 1f03          	ldw	(OFST-1,sp),x
1578                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
1579  07b4 5f            	clrw	x
1580  07b5 7b02          	ld	a,(OFST-2,sp)
1581  07b7 97            	ld	xl,a
1582  07b8 7b04          	ld	a,(OFST+0,sp)
1583  07ba 01            	rrwa	x,a
1584  07bb 1a03          	or	a,(OFST-1,sp)
1585  07bd 01            	rrwa	x,a
1586                     ; 1007   return (uint16_t)tmpccr2;
1588  07be 5b04          	addw	sp,#4
1589  07c0 81            	ret	
1591                     ; 1015 uint16_t TIM2_GetCapture3(void)
1591                     ; 1016 {
1592  07c1               _TIM2_GetCapture3:
1593  07c1 5204          	subw	sp,#4
1594       00000004      OFST:	set	4
1596                     ; 1018   uint16_t tmpccr3 = 0;
1597                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
1599                     ; 1021   tmpccr3h = TIM2->CCR3H;
1600  07c3 c65313        	ld	a,21267
1601  07c6 6b02          	ld	(OFST-2,sp),a
1602                     ; 1022   tmpccr3l = TIM2->CCR3L;
1603  07c8 c65314        	ld	a,21268
1604  07cb 6b01          	ld	(OFST-3,sp),a
1605                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
1606  07cd 5f            	clrw	x
1607  07ce 97            	ld	xl,a
1608  07cf 1f03          	ldw	(OFST-1,sp),x
1609                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
1610  07d1 5f            	clrw	x
1611  07d2 7b02          	ld	a,(OFST-2,sp)
1612  07d4 97            	ld	xl,a
1613  07d5 7b04          	ld	a,(OFST+0,sp)
1614  07d7 01            	rrwa	x,a
1615  07d8 1a03          	or	a,(OFST-1,sp)
1616  07da 01            	rrwa	x,a
1617                     ; 1027   return (uint16_t)tmpccr3;
1619  07db 5b04          	addw	sp,#4
1620  07dd 81            	ret	
1622                     ; 1035 uint16_t TIM2_GetCounter(void)
1622                     ; 1036 {
1623  07de               _TIM2_GetCounter:
1624  07de 89            	pushw	x
1625       00000002      OFST:	set	2
1627                     ; 1037   uint16_t tmpcntr = 0;
1628                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
1629  07df c6530a        	ld	a,21258
1630  07e2 97            	ld	xl,a
1631  07e3 4f            	clr	a
1632  07e4 02            	rlwa	x,a
1633  07e5 1f01          	ldw	(OFST-1,sp),x
1634                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
1635  07e7 c6530b        	ld	a,21259
1636  07ea 5f            	clrw	x
1637  07eb 97            	ld	xl,a
1638  07ec 01            	rrwa	x,a
1639  07ed 1a02          	or	a,(OFST+0,sp)
1640  07ef 01            	rrwa	x,a
1641  07f0 1a01          	or	a,(OFST-1,sp)
1642  07f2 01            	rrwa	x,a
1644  07f3 5b02          	addw	sp,#2
1645  07f5 81            	ret	
1647                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
1647                     ; 1050 {
1648  07f6               _TIM2_GetPrescaler:
1650                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
1651  07f6 c6530c        	ld	a,21260
1653  07f9 81            	ret	
1655                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
1655                     ; 1069 {
1656  07fa               _TIM2_GetFlagStatus:
1657  07fa 89            	pushw	x
1658  07fb 89            	pushw	x
1659       00000002      OFST:	set	2
1661                     ; 1070   FlagStatus bitstatus = RESET;
1662                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
1664                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
1665  07fc a30001        	cpw	x,#1
1666  07ff 272c          	jreq	L417
1667  0801 a30002        	cpw	x,#2
1668  0804 2727          	jreq	L417
1669  0806 a30004        	cpw	x,#4
1670  0809 2722          	jreq	L417
1671  080b a30008        	cpw	x,#8
1672  080e 271d          	jreq	L417
1673  0810 a30200        	cpw	x,#512
1674  0813 2718          	jreq	L417
1675  0815 a30400        	cpw	x,#1024
1676  0818 2713          	jreq	L417
1677  081a a30800        	cpw	x,#2048
1678  081d 270e          	jreq	L417
1679  081f ae0432        	ldw	x,#1074
1680  0822 89            	pushw	x
1681  0823 5f            	clrw	x
1682  0824 89            	pushw	x
1683  0825 ae0000        	ldw	x,#L11
1684  0828 cd0000        	call	_assert_failed
1686  082b 5b04          	addw	sp,#4
1687  082d               L417:
1688                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
1689  082d c65302        	ld	a,21250
1690  0830 1404          	and	a,(OFST+2,sp)
1691  0832 6b01          	ld	(OFST-1,sp),a
1692                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
1693  0834 7b03          	ld	a,(OFST+1,sp)
1694  0836 6b02          	ld	(OFST+0,sp),a
1695                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
1696  0838 c45303        	and	a,21251
1697  083b 1a01          	or	a,(OFST-1,sp)
1698  083d 2702          	jreq	L351
1699                     ; 1081     bitstatus = SET;
1700  083f a601          	ld	a,#1
1702  0841               L351:
1703                     ; 1085     bitstatus = RESET;
1704                     ; 1087   return (FlagStatus)bitstatus;
1706  0841 5b04          	addw	sp,#4
1707  0843 81            	ret	
1709                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
1709                     ; 1104 {
1710  0844               _TIM2_ClearFlag:
1711  0844 89            	pushw	x
1712       00000000      OFST:	set	0
1714                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
1715  0845 01            	rrwa	x,a
1716  0846 a4f0          	and	a,#240
1717  0848 01            	rrwa	x,a
1718  0849 a4f1          	and	a,#241
1719  084b 01            	rrwa	x,a
1720  084c 5d            	tnzw	x
1721  084d 2604          	jrne	L227
1722  084f 1e01          	ldw	x,(OFST+1,sp)
1723  0851 260e          	jrne	L427
1724  0853               L227:
1725  0853 ae0452        	ldw	x,#1106
1726  0856 89            	pushw	x
1727  0857 5f            	clrw	x
1728  0858 89            	pushw	x
1729  0859 ae0000        	ldw	x,#L11
1730  085c cd0000        	call	_assert_failed
1732  085f 5b04          	addw	sp,#4
1733  0861               L427:
1734                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
1735  0861 7b02          	ld	a,(OFST+2,sp)
1736  0863 43            	cpl	a
1737  0864 c75302        	ld	21250,a
1738                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
1739  0867 35ff5303      	mov	21251,#255
1740                     ; 1111 }
1741  086b 85            	popw	x
1742  086c 81            	ret	
1744                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
1744                     ; 1124 {
1745  086d               _TIM2_GetITStatus:
1746  086d 88            	push	a
1747  086e 89            	pushw	x
1748       00000002      OFST:	set	2
1750                     ; 1125   ITStatus bitstatus = RESET;
1751                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
1753                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
1754  086f a101          	cp	a,#1
1755  0871 271a          	jreq	L637
1756  0873 a102          	cp	a,#2
1757  0875 2716          	jreq	L637
1758  0877 a104          	cp	a,#4
1759  0879 2712          	jreq	L637
1760  087b a108          	cp	a,#8
1761  087d 270e          	jreq	L637
1762  087f ae0469        	ldw	x,#1129
1763  0882 89            	pushw	x
1764  0883 5f            	clrw	x
1765  0884 89            	pushw	x
1766  0885 ae0000        	ldw	x,#L11
1767  0888 cd0000        	call	_assert_failed
1769  088b 5b04          	addw	sp,#4
1770  088d               L637:
1771                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
1772  088d c65302        	ld	a,21250
1773  0890 1403          	and	a,(OFST+1,sp)
1774  0892 6b01          	ld	(OFST-1,sp),a
1775                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
1776  0894 c65301        	ld	a,21249
1777  0897 1403          	and	a,(OFST+1,sp)
1778  0899 6b02          	ld	(OFST+0,sp),a
1779                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
1780  089b 7b01          	ld	a,(OFST-1,sp)
1781  089d 2708          	jreq	L751
1783  089f 7b02          	ld	a,(OFST+0,sp)
1784  08a1 2704          	jreq	L751
1785                     ; 1137     bitstatus = SET;
1786  08a3 a601          	ld	a,#1
1788  08a5 2001          	jra	L161
1789  08a7               L751:
1790                     ; 1141     bitstatus = RESET;
1791  08a7 4f            	clr	a
1792  08a8               L161:
1793                     ; 1143   return (ITStatus)(bitstatus);
1795  08a8 5b03          	addw	sp,#3
1796  08aa 81            	ret	
1798                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
1798                     ; 1157 {
1799  08ab               _TIM2_ClearITPendingBit:
1800  08ab 88            	push	a
1801       00000000      OFST:	set	0
1803                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1804  08ac 4d            	tnz	a
1805  08ad 2704          	jreq	L447
1806  08af a110          	cp	a,#16
1807  08b1 250e          	jrult	L647
1808  08b3               L447:
1809  08b3 ae0487        	ldw	x,#1159
1810  08b6 89            	pushw	x
1811  08b7 5f            	clrw	x
1812  08b8 89            	pushw	x
1813  08b9 ae0000        	ldw	x,#L11
1814  08bc cd0000        	call	_assert_failed
1816  08bf 5b04          	addw	sp,#4
1817  08c1               L647:
1818                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
1819  08c1 7b01          	ld	a,(OFST+1,sp)
1820  08c3 43            	cpl	a
1821  08c4 c75302        	ld	21250,a
1822                     ; 1163 }
1823  08c7 84            	pop	a
1824  08c8 81            	ret	
1826                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
1826                     ; 1182                        uint8_t TIM2_ICSelection,
1826                     ; 1183                        uint8_t TIM2_ICFilter)
1826                     ; 1184 {
1827  08c9               L3_TI1_Config:
1828  08c9 89            	pushw	x
1829  08ca 88            	push	a
1830       00000001      OFST:	set	1
1832                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
1833  08cb 72115308      	bres	21256,#0
1834                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
1834                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
1835  08cf 7b06          	ld	a,(OFST+5,sp)
1836  08d1 97            	ld	xl,a
1837  08d2 a610          	ld	a,#16
1838  08d4 42            	mul	x,a
1839  08d5 9f            	ld	a,xl
1840  08d6 1a03          	or	a,(OFST+2,sp)
1841  08d8 6b01          	ld	(OFST+0,sp),a
1842  08da c65305        	ld	a,21253
1843  08dd a40c          	and	a,#12
1844  08df 1a01          	or	a,(OFST+0,sp)
1845  08e1 c75305        	ld	21253,a
1846                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
1847  08e4 7b02          	ld	a,(OFST+1,sp)
1848  08e6 2706          	jreq	L361
1849                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
1850  08e8 72125308      	bset	21256,#1
1852  08ec 2004          	jra	L561
1853  08ee               L361:
1854                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
1855  08ee 72135308      	bres	21256,#1
1856  08f2               L561:
1857                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
1858  08f2 72105308      	bset	21256,#0
1859                     ; 1203 }
1860  08f6 5b03          	addw	sp,#3
1861  08f8 81            	ret	
1863                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
1863                     ; 1222                        uint8_t TIM2_ICSelection,
1863                     ; 1223                        uint8_t TIM2_ICFilter)
1863                     ; 1224 {
1864  08f9               L5_TI2_Config:
1865  08f9 89            	pushw	x
1866  08fa 88            	push	a
1867       00000001      OFST:	set	1
1869                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
1870  08fb 72195308      	bres	21256,#4
1871                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
1871                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
1872  08ff 7b06          	ld	a,(OFST+5,sp)
1873  0901 97            	ld	xl,a
1874  0902 a610          	ld	a,#16
1875  0904 42            	mul	x,a
1876  0905 9f            	ld	a,xl
1877  0906 1a03          	or	a,(OFST+2,sp)
1878  0908 6b01          	ld	(OFST+0,sp),a
1879  090a c65306        	ld	a,21254
1880  090d a40c          	and	a,#12
1881  090f 1a01          	or	a,(OFST+0,sp)
1882  0911 c75306        	ld	21254,a
1883                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
1884  0914 7b02          	ld	a,(OFST+1,sp)
1885  0916 2706          	jreq	L761
1886                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
1887  0918 721a5308      	bset	21256,#5
1889  091c 2004          	jra	L171
1890  091e               L761:
1891                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
1892  091e 721b5308      	bres	21256,#5
1893  0922               L171:
1894                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
1895  0922 72185308      	bset	21256,#4
1896                     ; 1245 }
1897  0926 5b03          	addw	sp,#3
1898  0928 81            	ret	
1900                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
1900                     ; 1262                        uint8_t TIM2_ICFilter)
1900                     ; 1263 {
1901  0929               L7_TI3_Config:
1902  0929 89            	pushw	x
1903  092a 88            	push	a
1904       00000001      OFST:	set	1
1906                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
1907  092b 72115309      	bres	21257,#0
1908                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
1908                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
1909  092f 7b06          	ld	a,(OFST+5,sp)
1910  0931 97            	ld	xl,a
1911  0932 a610          	ld	a,#16
1912  0934 42            	mul	x,a
1913  0935 9f            	ld	a,xl
1914  0936 1a03          	or	a,(OFST+2,sp)
1915  0938 6b01          	ld	(OFST+0,sp),a
1916  093a c65307        	ld	a,21255
1917  093d a40c          	and	a,#12
1918  093f 1a01          	or	a,(OFST+0,sp)
1919  0941 c75307        	ld	21255,a
1920                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
1921  0944 7b02          	ld	a,(OFST+1,sp)
1922  0946 2706          	jreq	L371
1923                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
1924  0948 72125309      	bset	21257,#1
1926  094c 2004          	jra	L571
1927  094e               L371:
1928                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
1929  094e 72135309      	bres	21257,#1
1930  0952               L571:
1931                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
1932  0952 72105309      	bset	21257,#0
1933                     ; 1283 }
1934  0956 5b03          	addw	sp,#3
1935  0958 81            	ret	
1937                     	xdef	_TIM2_ClearITPendingBit
1938                     	xdef	_TIM2_GetITStatus
1939                     	xdef	_TIM2_ClearFlag
1940                     	xdef	_TIM2_GetFlagStatus
1941                     	xdef	_TIM2_GetPrescaler
1942                     	xdef	_TIM2_GetCounter
1943                     	xdef	_TIM2_GetCapture3
1944                     	xdef	_TIM2_GetCapture2
1945                     	xdef	_TIM2_GetCapture1
1946                     	xdef	_TIM2_SetIC3Prescaler
1947                     	xdef	_TIM2_SetIC2Prescaler
1948                     	xdef	_TIM2_SetIC1Prescaler
1949                     	xdef	_TIM2_SetCompare3
1950                     	xdef	_TIM2_SetCompare2
1951                     	xdef	_TIM2_SetCompare1
1952                     	xdef	_TIM2_SetAutoreload
1953                     	xdef	_TIM2_SetCounter
1954                     	xdef	_TIM2_SelectOCxM
1955                     	xdef	_TIM2_CCxCmd
1956                     	xdef	_TIM2_OC3PolarityConfig
1957                     	xdef	_TIM2_OC2PolarityConfig
1958                     	xdef	_TIM2_OC1PolarityConfig
1959                     	xdef	_TIM2_GenerateEvent
1960                     	xdef	_TIM2_OC3PreloadConfig
1961                     	xdef	_TIM2_OC2PreloadConfig
1962                     	xdef	_TIM2_OC1PreloadConfig
1963                     	xdef	_TIM2_ARRPreloadConfig
1964                     	xdef	_TIM2_ForcedOC3Config
1965                     	xdef	_TIM2_ForcedOC2Config
1966                     	xdef	_TIM2_ForcedOC1Config
1967                     	xdef	_TIM2_PrescalerConfig
1968                     	xdef	_TIM2_SelectOnePulseMode
1969                     	xdef	_TIM2_UpdateRequestConfig
1970                     	xdef	_TIM2_UpdateDisableConfig
1971                     	xdef	_TIM2_ITConfig
1972                     	xdef	_TIM2_Cmd
1973                     	xdef	_TIM2_PWMIConfig
1974                     	xdef	_TIM2_ICInit
1975                     	xdef	_TIM2_OC3Init
1976                     	xdef	_TIM2_OC2Init
1977                     	xdef	_TIM2_OC1Init
1978                     	xdef	_TIM2_TimeBaseInit
1979                     	xdef	_TIM2_DeInit
1980                     	xref	_assert_failed
1981                     .const:	section	.text
1982  0000               L11:
1983  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1984  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
1985  0024 38735f74696d  	dc.b	"8s_tim2.c",0
1986                     	end
