   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 58 void TIM1_DeInit(void)
  20                     ; 59 {
  21                     	scross	off
  22  0000               _TIM1_DeInit:
  24                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  25  0000 725f5250      	clr	21072
  26                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  27  0004 725f5251      	clr	21073
  28                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  29  0008 725f5252      	clr	21074
  30                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  31  000c 725f5253      	clr	21075
  32                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  33  0010 725f5254      	clr	21076
  34                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  35  0014 725f5256      	clr	21078
  36                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  37  0018 725f525c      	clr	21084
  38                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  39  001c 725f525d      	clr	21085
  40                     ; 70   TIM1->CCMR1 = 0x01;
  41  0020 35015258      	mov	21080,#1
  42                     ; 71   TIM1->CCMR2 = 0x01;
  43  0024 35015259      	mov	21081,#1
  44                     ; 72   TIM1->CCMR3 = 0x01;
  45  0028 3501525a      	mov	21082,#1
  46                     ; 73   TIM1->CCMR4 = 0x01;
  47  002c 3501525b      	mov	21083,#1
  48                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  49  0030 725f525c      	clr	21084
  50                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  51  0034 725f525d      	clr	21085
  52                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  53  0038 725f5258      	clr	21080
  54                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  55  003c 725f5259      	clr	21081
  56                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  57  0040 725f525a      	clr	21082
  58                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  59  0044 725f525b      	clr	21083
  60                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  61  0048 725f525e      	clr	21086
  62                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  63  004c 725f525f      	clr	21087
  64                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  65  0050 725f5260      	clr	21088
  66                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
  67  0054 725f5261      	clr	21089
  68                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
  69  0058 35ff5262      	mov	21090,#255
  70                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
  71  005c 35ff5263      	mov	21091,#255
  72                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
  73  0060 725f5265      	clr	21093
  74                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
  75  0064 725f5266      	clr	21094
  76                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
  77  0068 725f5267      	clr	21095
  78                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
  79  006c 725f5268      	clr	21096
  80                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
  81  0070 725f5269      	clr	21097
  82                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
  83  0074 725f526a      	clr	21098
  84                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
  85  0078 725f526b      	clr	21099
  86                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
  87  007c 725f526c      	clr	21100
  88                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
  89  0080 725f526f      	clr	21103
  90                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
  91  0084 35015257      	mov	21079,#1
  92                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
  93  0088 725f526e      	clr	21102
  94                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
  95  008c 725f526d      	clr	21101
  96                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
  97  0090 725f5264      	clr	21092
  98                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
  99  0094 725f5255      	clr	21077
 100                     ; 101 }
 101  0098 81            	ret	
 103                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 103                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 103                     ; 113                        uint16_t TIM1_Period,
 103                     ; 114                        uint8_t TIM1_RepetitionCounter)
 103                     ; 115 {
 104  0099               _TIM1_TimeBaseInit:
 105  0099 89            	pushw	x
 106       00000000      OFST:	set	0
 108                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 109  009a 7b05          	ld	a,(OFST+5,sp)
 110  009c 271e          	jreq	L21
 111  009e a110          	cp	a,#16
 112  00a0 271a          	jreq	L21
 113  00a2 a120          	cp	a,#32
 114  00a4 2716          	jreq	L21
 115  00a6 a140          	cp	a,#64
 116  00a8 2712          	jreq	L21
 117  00aa a160          	cp	a,#96
 118  00ac 270e          	jreq	L21
 119  00ae ae0075        	ldw	x,#117
 120  00b1 89            	pushw	x
 121  00b2 5f            	clrw	x
 122  00b3 89            	pushw	x
 123  00b4 ae0000        	ldw	x,#L31
 124  00b7 cd0000        	call	_assert_failed
 126  00ba 5b04          	addw	sp,#4
 127  00bc               L21:
 128                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 129  00bc 7b06          	ld	a,(OFST+6,sp)
 130  00be c75262        	ld	21090,a
 131                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 132  00c1 7b07          	ld	a,(OFST+7,sp)
 133  00c3 c75263        	ld	21091,a
 134                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 135  00c6 7b01          	ld	a,(OFST+1,sp)
 136  00c8 c75260        	ld	21088,a
 137                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 138  00cb 7b02          	ld	a,(OFST+2,sp)
 139  00cd c75261        	ld	21089,a
 140                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 140                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 141  00d0 c65250        	ld	a,21072
 142  00d3 a48f          	and	a,#143
 143  00d5 1a05          	or	a,(OFST+5,sp)
 144  00d7 c75250        	ld	21072,a
 145                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 146  00da 7b08          	ld	a,(OFST+8,sp)
 147  00dc c75264        	ld	21092,a
 148                     ; 133 }
 149  00df 85            	popw	x
 150  00e0 81            	ret	
 152                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 152                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 152                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 152                     ; 157                   uint16_t TIM1_Pulse,
 152                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 152                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 152                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 152                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 152                     ; 162 {
 153  00e1               _TIM1_OC1Init:
 154  00e1 89            	pushw	x
 155  00e2 5203          	subw	sp,#3
 156       00000003      OFST:	set	3
 158                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 159  00e4 9e            	ld	a,xh
 160  00e5 4d            	tnz	a
 161  00e6 271f          	jreq	L42
 162  00e8 9e            	ld	a,xh
 163  00e9 a110          	cp	a,#16
 164  00eb 271a          	jreq	L42
 165  00ed 9e            	ld	a,xh
 166  00ee a120          	cp	a,#32
 167  00f0 2715          	jreq	L42
 168  00f2 9e            	ld	a,xh
 169  00f3 a130          	cp	a,#48
 170  00f5 2710          	jreq	L42
 171  00f7 9e            	ld	a,xh
 172  00f8 a160          	cp	a,#96
 173  00fa 270b          	jreq	L42
 174  00fc 9e            	ld	a,xh
 175  00fd a170          	cp	a,#112
 176  00ff 2706          	jreq	L42
 177  0101 ae00a4        	ldw	x,#164
 178  0104 cd01b7        	call	LC001
 179  0107               L42:
 180                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 181  0107 7b05          	ld	a,(OFST+2,sp)
 182  0109 270a          	jreq	L43
 183  010b a111          	cp	a,#17
 184  010d 2706          	jreq	L43
 185  010f ae00a5        	ldw	x,#165
 186  0112 cd01b7        	call	LC001
 187  0115               L43:
 188                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 189  0115 7b08          	ld	a,(OFST+5,sp)
 190  0117 270a          	jreq	L44
 191  0119 a144          	cp	a,#68
 192  011b 2706          	jreq	L44
 193  011d ae00a6        	ldw	x,#166
 194  0120 cd01b7        	call	LC001
 195  0123               L44:
 196                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 197  0123 7b0b          	ld	a,(OFST+8,sp)
 198  0125 270a          	jreq	L45
 199  0127 a122          	cp	a,#34
 200  0129 2706          	jreq	L45
 201  012b ae00a7        	ldw	x,#167
 202  012e cd01b7        	call	LC001
 203  0131               L45:
 204                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 205  0131 7b0c          	ld	a,(OFST+9,sp)
 206  0133 2709          	jreq	L46
 207  0135 a188          	cp	a,#136
 208  0137 2705          	jreq	L46
 209  0139 ae00a8        	ldw	x,#168
 210  013c ad79          	call	LC001
 211  013e               L46:
 212                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 213  013e 7b0d          	ld	a,(OFST+10,sp)
 214  0140 a155          	cp	a,#85
 215  0142 2709          	jreq	L47
 216  0144 7b0d          	ld	a,(OFST+10,sp)
 217  0146 2705          	jreq	L47
 218  0148 ae00a9        	ldw	x,#169
 219  014b ad6a          	call	LC001
 220  014d               L47:
 221                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 222  014d 7b0e          	ld	a,(OFST+11,sp)
 223  014f a12a          	cp	a,#42
 224  0151 2709          	jreq	L401
 225  0153 7b0e          	ld	a,(OFST+11,sp)
 226  0155 2705          	jreq	L401
 227  0157 ae00aa        	ldw	x,#170
 228  015a ad5b          	call	LC001
 229  015c               L401:
 230                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 230                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 231  015c c6525c        	ld	a,21084
 232  015f a4f0          	and	a,#240
 233  0161 c7525c        	ld	21084,a
 234                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 234                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 234                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 234                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 235  0164 7b0c          	ld	a,(OFST+9,sp)
 236  0166 a408          	and	a,#8
 237  0168 6b03          	ld	(OFST+0,sp),a
 238  016a 7b0b          	ld	a,(OFST+8,sp)
 239  016c a402          	and	a,#2
 240  016e 1a03          	or	a,(OFST+0,sp)
 241  0170 6b02          	ld	(OFST-1,sp),a
 242  0172 7b08          	ld	a,(OFST+5,sp)
 243  0174 a404          	and	a,#4
 244  0176 6b01          	ld	(OFST-2,sp),a
 245  0178 7b05          	ld	a,(OFST+2,sp)
 246  017a a401          	and	a,#1
 247  017c 1a01          	or	a,(OFST-2,sp)
 248  017e 1a02          	or	a,(OFST-1,sp)
 249  0180 ca525c        	or	a,21084
 250  0183 c7525c        	ld	21084,a
 251                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 251                     ; 185                           (uint8_t)TIM1_OCMode);
 252  0186 c65258        	ld	a,21080
 253  0189 a48f          	and	a,#143
 254  018b 1a04          	or	a,(OFST+1,sp)
 255  018d c75258        	ld	21080,a
 256                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 257  0190 c6526f        	ld	a,21103
 258  0193 a4fc          	and	a,#252
 259  0195 c7526f        	ld	21103,a
 260                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 260                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 261  0198 7b0e          	ld	a,(OFST+11,sp)
 262  019a a402          	and	a,#2
 263  019c 6b03          	ld	(OFST+0,sp),a
 264  019e 7b0d          	ld	a,(OFST+10,sp)
 265  01a0 a401          	and	a,#1
 266  01a2 1a03          	or	a,(OFST+0,sp)
 267  01a4 ca526f        	or	a,21103
 268  01a7 c7526f        	ld	21103,a
 269                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 270  01aa 7b09          	ld	a,(OFST+6,sp)
 271  01ac c75265        	ld	21093,a
 272                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 273  01af 7b0a          	ld	a,(OFST+7,sp)
 274  01b1 c75266        	ld	21094,a
 275                     ; 196 }
 276  01b4 5b05          	addw	sp,#5
 277  01b6 81            	ret	
 278  01b7               LC001:
 279  01b7 89            	pushw	x
 280  01b8 5f            	clrw	x
 281  01b9 89            	pushw	x
 282  01ba ae0000        	ldw	x,#L31
 283  01bd cd0000        	call	_assert_failed
 285  01c0 5b04          	addw	sp,#4
 286  01c2 81            	ret	
 288                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 288                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 288                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 288                     ; 220                   uint16_t TIM1_Pulse,
 288                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 288                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 288                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 288                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 288                     ; 225 {
 289  01c3               _TIM1_OC2Init:
 290  01c3 89            	pushw	x
 291  01c4 5203          	subw	sp,#3
 292       00000003      OFST:	set	3
 294                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 295  01c6 9e            	ld	a,xh
 296  01c7 4d            	tnz	a
 297  01c8 271f          	jreq	L611
 298  01ca 9e            	ld	a,xh
 299  01cb a110          	cp	a,#16
 300  01cd 271a          	jreq	L611
 301  01cf 9e            	ld	a,xh
 302  01d0 a120          	cp	a,#32
 303  01d2 2715          	jreq	L611
 304  01d4 9e            	ld	a,xh
 305  01d5 a130          	cp	a,#48
 306  01d7 2710          	jreq	L611
 307  01d9 9e            	ld	a,xh
 308  01da a160          	cp	a,#96
 309  01dc 270b          	jreq	L611
 310  01de 9e            	ld	a,xh
 311  01df a170          	cp	a,#112
 312  01e1 2706          	jreq	L611
 313  01e3 ae00e3        	ldw	x,#227
 314  01e6 cd0299        	call	LC002
 315  01e9               L611:
 316                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 317  01e9 7b05          	ld	a,(OFST+2,sp)
 318  01eb 270a          	jreq	L621
 319  01ed a111          	cp	a,#17
 320  01ef 2706          	jreq	L621
 321  01f1 ae00e4        	ldw	x,#228
 322  01f4 cd0299        	call	LC002
 323  01f7               L621:
 324                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 325  01f7 7b08          	ld	a,(OFST+5,sp)
 326  01f9 270a          	jreq	L631
 327  01fb a144          	cp	a,#68
 328  01fd 2706          	jreq	L631
 329  01ff ae00e5        	ldw	x,#229
 330  0202 cd0299        	call	LC002
 331  0205               L631:
 332                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 333  0205 7b0b          	ld	a,(OFST+8,sp)
 334  0207 270a          	jreq	L641
 335  0209 a122          	cp	a,#34
 336  020b 2706          	jreq	L641
 337  020d ae00e6        	ldw	x,#230
 338  0210 cd0299        	call	LC002
 339  0213               L641:
 340                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 341  0213 7b0c          	ld	a,(OFST+9,sp)
 342  0215 2709          	jreq	L651
 343  0217 a188          	cp	a,#136
 344  0219 2705          	jreq	L651
 345  021b ae00e7        	ldw	x,#231
 346  021e ad79          	call	LC002
 347  0220               L651:
 348                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 349  0220 7b0d          	ld	a,(OFST+10,sp)
 350  0222 a155          	cp	a,#85
 351  0224 2709          	jreq	L661
 352  0226 7b0d          	ld	a,(OFST+10,sp)
 353  0228 2705          	jreq	L661
 354  022a ae00e8        	ldw	x,#232
 355  022d ad6a          	call	LC002
 356  022f               L661:
 357                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 358  022f 7b0e          	ld	a,(OFST+11,sp)
 359  0231 a12a          	cp	a,#42
 360  0233 2709          	jreq	L671
 361  0235 7b0e          	ld	a,(OFST+11,sp)
 362  0237 2705          	jreq	L671
 363  0239 ae00e9        	ldw	x,#233
 364  023c ad5b          	call	LC002
 365  023e               L671:
 366                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 366                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 367  023e c6525c        	ld	a,21084
 368  0241 a40f          	and	a,#15
 369  0243 c7525c        	ld	21084,a
 370                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 370                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 370                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 370                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 371  0246 7b0c          	ld	a,(OFST+9,sp)
 372  0248 a480          	and	a,#128
 373  024a 6b03          	ld	(OFST+0,sp),a
 374  024c 7b0b          	ld	a,(OFST+8,sp)
 375  024e a420          	and	a,#32
 376  0250 1a03          	or	a,(OFST+0,sp)
 377  0252 6b02          	ld	(OFST-1,sp),a
 378  0254 7b08          	ld	a,(OFST+5,sp)
 379  0256 a440          	and	a,#64
 380  0258 6b01          	ld	(OFST-2,sp),a
 381  025a 7b05          	ld	a,(OFST+2,sp)
 382  025c a410          	and	a,#16
 383  025e 1a01          	or	a,(OFST-2,sp)
 384  0260 1a02          	or	a,(OFST-1,sp)
 385  0262 ca525c        	or	a,21084
 386  0265 c7525c        	ld	21084,a
 387                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 387                     ; 249                           (uint8_t)TIM1_OCMode);
 388  0268 c65259        	ld	a,21081
 389  026b a48f          	and	a,#143
 390  026d 1a04          	or	a,(OFST+1,sp)
 391  026f c75259        	ld	21081,a
 392                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 393  0272 c6526f        	ld	a,21103
 394  0275 a4f3          	and	a,#243
 395  0277 c7526f        	ld	21103,a
 396                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 396                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 397  027a 7b0e          	ld	a,(OFST+11,sp)
 398  027c a408          	and	a,#8
 399  027e 6b03          	ld	(OFST+0,sp),a
 400  0280 7b0d          	ld	a,(OFST+10,sp)
 401  0282 a404          	and	a,#4
 402  0284 1a03          	or	a,(OFST+0,sp)
 403  0286 ca526f        	or	a,21103
 404  0289 c7526f        	ld	21103,a
 405                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 406  028c 7b09          	ld	a,(OFST+6,sp)
 407  028e c75267        	ld	21095,a
 408                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 409  0291 7b0a          	ld	a,(OFST+7,sp)
 410  0293 c75268        	ld	21096,a
 411                     ; 260 }
 412  0296 5b05          	addw	sp,#5
 413  0298 81            	ret	
 414  0299               LC002:
 415  0299 89            	pushw	x
 416  029a 5f            	clrw	x
 417  029b 89            	pushw	x
 418  029c ae0000        	ldw	x,#L31
 419  029f cd0000        	call	_assert_failed
 421  02a2 5b04          	addw	sp,#4
 422  02a4 81            	ret	
 424                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 424                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 424                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 424                     ; 284                   uint16_t TIM1_Pulse,
 424                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 424                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 424                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 424                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 424                     ; 289 {
 425  02a5               _TIM1_OC3Init:
 426  02a5 89            	pushw	x
 427  02a6 5203          	subw	sp,#3
 428       00000003      OFST:	set	3
 430                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 431  02a8 9e            	ld	a,xh
 432  02a9 4d            	tnz	a
 433  02aa 271f          	jreq	L012
 434  02ac 9e            	ld	a,xh
 435  02ad a110          	cp	a,#16
 436  02af 271a          	jreq	L012
 437  02b1 9e            	ld	a,xh
 438  02b2 a120          	cp	a,#32
 439  02b4 2715          	jreq	L012
 440  02b6 9e            	ld	a,xh
 441  02b7 a130          	cp	a,#48
 442  02b9 2710          	jreq	L012
 443  02bb 9e            	ld	a,xh
 444  02bc a160          	cp	a,#96
 445  02be 270b          	jreq	L012
 446  02c0 9e            	ld	a,xh
 447  02c1 a170          	cp	a,#112
 448  02c3 2706          	jreq	L012
 449  02c5 ae0123        	ldw	x,#291
 450  02c8 cd037b        	call	LC003
 451  02cb               L012:
 452                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 453  02cb 7b05          	ld	a,(OFST+2,sp)
 454  02cd 270a          	jreq	L022
 455  02cf a111          	cp	a,#17
 456  02d1 2706          	jreq	L022
 457  02d3 ae0124        	ldw	x,#292
 458  02d6 cd037b        	call	LC003
 459  02d9               L022:
 460                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 461  02d9 7b08          	ld	a,(OFST+5,sp)
 462  02db 270a          	jreq	L032
 463  02dd a144          	cp	a,#68
 464  02df 2706          	jreq	L032
 465  02e1 ae0125        	ldw	x,#293
 466  02e4 cd037b        	call	LC003
 467  02e7               L032:
 468                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 469  02e7 7b0b          	ld	a,(OFST+8,sp)
 470  02e9 270a          	jreq	L042
 471  02eb a122          	cp	a,#34
 472  02ed 2706          	jreq	L042
 473  02ef ae0126        	ldw	x,#294
 474  02f2 cd037b        	call	LC003
 475  02f5               L042:
 476                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 477  02f5 7b0c          	ld	a,(OFST+9,sp)
 478  02f7 2709          	jreq	L052
 479  02f9 a188          	cp	a,#136
 480  02fb 2705          	jreq	L052
 481  02fd ae0127        	ldw	x,#295
 482  0300 ad79          	call	LC003
 483  0302               L052:
 484                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 485  0302 7b0d          	ld	a,(OFST+10,sp)
 486  0304 a155          	cp	a,#85
 487  0306 2709          	jreq	L062
 488  0308 7b0d          	ld	a,(OFST+10,sp)
 489  030a 2705          	jreq	L062
 490  030c ae0128        	ldw	x,#296
 491  030f ad6a          	call	LC003
 492  0311               L062:
 493                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 494  0311 7b0e          	ld	a,(OFST+11,sp)
 495  0313 a12a          	cp	a,#42
 496  0315 2709          	jreq	L072
 497  0317 7b0e          	ld	a,(OFST+11,sp)
 498  0319 2705          	jreq	L072
 499  031b ae0129        	ldw	x,#297
 500  031e ad5b          	call	LC003
 501  0320               L072:
 502                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 502                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 503  0320 c6525d        	ld	a,21085
 504  0323 a4f0          	and	a,#240
 505  0325 c7525d        	ld	21085,a
 506                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 506                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 506                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 506                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 507  0328 7b0c          	ld	a,(OFST+9,sp)
 508  032a a408          	and	a,#8
 509  032c 6b03          	ld	(OFST+0,sp),a
 510  032e 7b0b          	ld	a,(OFST+8,sp)
 511  0330 a402          	and	a,#2
 512  0332 1a03          	or	a,(OFST+0,sp)
 513  0334 6b02          	ld	(OFST-1,sp),a
 514  0336 7b08          	ld	a,(OFST+5,sp)
 515  0338 a404          	and	a,#4
 516  033a 6b01          	ld	(OFST-2,sp),a
 517  033c 7b05          	ld	a,(OFST+2,sp)
 518  033e a401          	and	a,#1
 519  0340 1a01          	or	a,(OFST-2,sp)
 520  0342 1a02          	or	a,(OFST-1,sp)
 521  0344 ca525d        	or	a,21085
 522  0347 c7525d        	ld	21085,a
 523                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 523                     ; 312                           (uint8_t)TIM1_OCMode);
 524  034a c6525a        	ld	a,21082
 525  034d a48f          	and	a,#143
 526  034f 1a04          	or	a,(OFST+1,sp)
 527  0351 c7525a        	ld	21082,a
 528                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
 529  0354 c6526f        	ld	a,21103
 530  0357 a4cf          	and	a,#207
 531  0359 c7526f        	ld	21103,a
 532                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
 532                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
 533  035c 7b0e          	ld	a,(OFST+11,sp)
 534  035e a420          	and	a,#32
 535  0360 6b03          	ld	(OFST+0,sp),a
 536  0362 7b0d          	ld	a,(OFST+10,sp)
 537  0364 a410          	and	a,#16
 538  0366 1a03          	or	a,(OFST+0,sp)
 539  0368 ca526f        	or	a,21103
 540  036b c7526f        	ld	21103,a
 541                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
 542  036e 7b09          	ld	a,(OFST+6,sp)
 543  0370 c75269        	ld	21097,a
 544                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
 545  0373 7b0a          	ld	a,(OFST+7,sp)
 546  0375 c7526a        	ld	21098,a
 547                     ; 323 }
 548  0378 5b05          	addw	sp,#5
 549  037a 81            	ret	
 550  037b               LC003:
 551  037b 89            	pushw	x
 552  037c 5f            	clrw	x
 553  037d 89            	pushw	x
 554  037e ae0000        	ldw	x,#L31
 555  0381 cd0000        	call	_assert_failed
 557  0384 5b04          	addw	sp,#4
 558  0386 81            	ret	
 560                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 560                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
 560                     ; 340                   uint16_t TIM1_Pulse,
 560                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 560                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
 560                     ; 343 {
 561  0387               _TIM1_OC4Init:
 562  0387 89            	pushw	x
 563  0388 88            	push	a
 564       00000001      OFST:	set	1
 566                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 567  0389 9e            	ld	a,xh
 568  038a 4d            	tnz	a
 569  038b 271e          	jreq	L203
 570  038d 9e            	ld	a,xh
 571  038e a110          	cp	a,#16
 572  0390 2719          	jreq	L203
 573  0392 9e            	ld	a,xh
 574  0393 a120          	cp	a,#32
 575  0395 2714          	jreq	L203
 576  0397 9e            	ld	a,xh
 577  0398 a130          	cp	a,#48
 578  039a 270f          	jreq	L203
 579  039c 9e            	ld	a,xh
 580  039d a160          	cp	a,#96
 581  039f 270a          	jreq	L203
 582  03a1 9e            	ld	a,xh
 583  03a2 a170          	cp	a,#112
 584  03a4 2705          	jreq	L203
 585  03a6 ae0159        	ldw	x,#345
 586  03a9 ad6c          	call	LC004
 587  03ab               L203:
 588                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 589  03ab 7b03          	ld	a,(OFST+2,sp)
 590  03ad 2709          	jreq	L213
 591  03af a111          	cp	a,#17
 592  03b1 2705          	jreq	L213
 593  03b3 ae015a        	ldw	x,#346
 594  03b6 ad5f          	call	LC004
 595  03b8               L213:
 596                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 597  03b8 7b08          	ld	a,(OFST+7,sp)
 598  03ba 2709          	jreq	L223
 599  03bc a122          	cp	a,#34
 600  03be 2705          	jreq	L223
 601  03c0 ae015b        	ldw	x,#347
 602  03c3 ad52          	call	LC004
 603  03c5               L223:
 604                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 605  03c5 7b09          	ld	a,(OFST+8,sp)
 606  03c7 a155          	cp	a,#85
 607  03c9 2709          	jreq	L233
 608  03cb 7b09          	ld	a,(OFST+8,sp)
 609  03cd 2705          	jreq	L233
 610  03cf ae015c        	ldw	x,#348
 611  03d2 ad43          	call	LC004
 612  03d4               L233:
 613                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
 614  03d4 c6525d        	ld	a,21085
 615  03d7 a4cf          	and	a,#207
 616  03d9 c7525d        	ld	21085,a
 617                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
 617                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
 618  03dc 7b08          	ld	a,(OFST+7,sp)
 619  03de a420          	and	a,#32
 620  03e0 6b01          	ld	(OFST+0,sp),a
 621  03e2 7b03          	ld	a,(OFST+2,sp)
 622  03e4 a410          	and	a,#16
 623  03e6 1a01          	or	a,(OFST+0,sp)
 624  03e8 ca525d        	or	a,21085
 625  03eb c7525d        	ld	21085,a
 626                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 626                     ; 358                           TIM1_OCMode);
 627  03ee c6525b        	ld	a,21083
 628  03f1 a48f          	and	a,#143
 629  03f3 1a02          	or	a,(OFST+1,sp)
 630  03f5 c7525b        	ld	21083,a
 631                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
 632  03f8 7b09          	ld	a,(OFST+8,sp)
 633  03fa 270a          	jreq	L51
 634                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
 635  03fc c6526f        	ld	a,21103
 636  03ff aadf          	or	a,#223
 637  0401 c7526f        	ld	21103,a
 639  0404 2004          	jra	L71
 640  0406               L51:
 641                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
 642  0406 721d526f      	bres	21103,#6
 643  040a               L71:
 644                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
 645  040a 7b06          	ld	a,(OFST+5,sp)
 646  040c c7526b        	ld	21099,a
 647                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
 648  040f 7b07          	ld	a,(OFST+6,sp)
 649  0411 c7526c        	ld	21100,a
 650                     ; 373 }
 651  0414 5b03          	addw	sp,#3
 652  0416 81            	ret	
 653  0417               LC004:
 654  0417 89            	pushw	x
 655  0418 5f            	clrw	x
 656  0419 89            	pushw	x
 657  041a ae0000        	ldw	x,#L31
 658  041d cd0000        	call	_assert_failed
 660  0420 5b04          	addw	sp,#4
 661  0422 81            	ret	
 663                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
 663                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
 663                     ; 390                      uint8_t TIM1_DeadTime,
 663                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
 663                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
 663                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
 663                     ; 394 {
 664  0423               _TIM1_BDTRConfig:
 665  0423 89            	pushw	x
 666  0424 88            	push	a
 667       00000001      OFST:	set	1
 669                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
 670  0425 9e            	ld	a,xh
 671  0426 a104          	cp	a,#4
 672  0428 2709          	jreq	L443
 673  042a 9e            	ld	a,xh
 674  042b 4d            	tnz	a
 675  042c 2705          	jreq	L443
 676  042e ae018c        	ldw	x,#396
 677  0431 ad59          	call	LC005
 678  0433               L443:
 679                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
 680  0433 7b03          	ld	a,(OFST+2,sp)
 681  0435 2711          	jreq	L453
 682  0437 a101          	cp	a,#1
 683  0439 270d          	jreq	L453
 684  043b a102          	cp	a,#2
 685  043d 2709          	jreq	L453
 686  043f a103          	cp	a,#3
 687  0441 2705          	jreq	L453
 688  0443 ae018d        	ldw	x,#397
 689  0446 ad44          	call	LC005
 690  0448               L453:
 691                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
 692  0448 7b07          	ld	a,(OFST+6,sp)
 693  044a a110          	cp	a,#16
 694  044c 2709          	jreq	L463
 695  044e 7b07          	ld	a,(OFST+6,sp)
 696  0450 2705          	jreq	L463
 697  0452 ae018e        	ldw	x,#398
 698  0455 ad35          	call	LC005
 699  0457               L463:
 700                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
 701  0457 7b08          	ld	a,(OFST+7,sp)
 702  0459 2709          	jreq	L473
 703  045b a120          	cp	a,#32
 704  045d 2705          	jreq	L473
 705  045f ae018f        	ldw	x,#399
 706  0462 ad28          	call	LC005
 707  0464               L473:
 708                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
 709  0464 7b09          	ld	a,(OFST+8,sp)
 710  0466 a140          	cp	a,#64
 711  0468 2709          	jreq	L404
 712  046a 7b09          	ld	a,(OFST+8,sp)
 713  046c 2705          	jreq	L404
 714  046e ae0190        	ldw	x,#400
 715  0471 ad19          	call	LC005
 716  0473               L404:
 717                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
 718  0473 7b06          	ld	a,(OFST+5,sp)
 719  0475 c7526e        	ld	21102,a
 720                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
 720                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
 720                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
 721  0478 7b07          	ld	a,(OFST+6,sp)
 722  047a 1a08          	or	a,(OFST+7,sp)
 723  047c 1a09          	or	a,(OFST+8,sp)
 724  047e 6b01          	ld	(OFST+0,sp),a
 725  0480 7b02          	ld	a,(OFST+1,sp)
 726  0482 1a03          	or	a,(OFST+2,sp)
 727  0484 1a01          	or	a,(OFST+0,sp)
 728  0486 c7526d        	ld	21101,a
 729                     ; 409 }
 730  0489 5b03          	addw	sp,#3
 731  048b 81            	ret	
 732  048c               LC005:
 733  048c 89            	pushw	x
 734  048d 5f            	clrw	x
 735  048e 89            	pushw	x
 736  048f ae0000        	ldw	x,#L31
 737  0492 cd0000        	call	_assert_failed
 739  0495 5b04          	addw	sp,#4
 740  0497 81            	ret	
 742                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
 742                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
 742                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
 742                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
 742                     ; 427                  uint8_t TIM1_ICFilter)
 742                     ; 428 {
 743  0498               _TIM1_ICInit:
 744  0498 89            	pushw	x
 745       00000000      OFST:	set	0
 747                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
 748  0499 9e            	ld	a,xh
 749  049a 4d            	tnz	a
 750  049b 2714          	jreq	L614
 751  049d 9e            	ld	a,xh
 752  049e 4a            	dec	a
 753  049f 2710          	jreq	L614
 754  04a1 9e            	ld	a,xh
 755  04a2 a102          	cp	a,#2
 756  04a4 270b          	jreq	L614
 757  04a6 9e            	ld	a,xh
 758  04a7 a103          	cp	a,#3
 759  04a9 2706          	jreq	L614
 760  04ab ae01ae        	ldw	x,#430
 761  04ae cd054d        	call	LC006
 762  04b1               L614:
 763                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
 764  04b1 7b02          	ld	a,(OFST+2,sp)
 765  04b3 2709          	jreq	L624
 766  04b5 4a            	dec	a
 767  04b6 2706          	jreq	L624
 768  04b8 ae01af        	ldw	x,#431
 769  04bb cd054d        	call	LC006
 770  04be               L624:
 771                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
 772  04be 7b05          	ld	a,(OFST+5,sp)
 773  04c0 a101          	cp	a,#1
 774  04c2 270d          	jreq	L634
 775  04c4 a102          	cp	a,#2
 776  04c6 2709          	jreq	L634
 777  04c8 a103          	cp	a,#3
 778  04ca 2705          	jreq	L634
 779  04cc ae01b0        	ldw	x,#432
 780  04cf ad7c          	call	LC006
 781  04d1               L634:
 782                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
 783  04d1 7b06          	ld	a,(OFST+6,sp)
 784  04d3 2711          	jreq	L644
 785  04d5 a104          	cp	a,#4
 786  04d7 270d          	jreq	L644
 787  04d9 a108          	cp	a,#8
 788  04db 2709          	jreq	L644
 789  04dd a10c          	cp	a,#12
 790  04df 2705          	jreq	L644
 791  04e1 ae01b1        	ldw	x,#433
 792  04e4 ad67          	call	LC006
 793  04e6               L644:
 794                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
 795  04e6 7b07          	ld	a,(OFST+7,sp)
 796  04e8 a110          	cp	a,#16
 797  04ea 2505          	jrult	L454
 798  04ec ae01b2        	ldw	x,#434
 799  04ef ad5c          	call	LC006
 800  04f1               L454:
 801                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
 802  04f1 7b01          	ld	a,(OFST+1,sp)
 803  04f3 2614          	jrne	L12
 804                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
 804                     ; 440                (uint8_t)TIM1_ICSelection,
 804                     ; 441                (uint8_t)TIM1_ICFilter);
 805  04f5 7b07          	ld	a,(OFST+7,sp)
 806  04f7 88            	push	a
 807  04f8 7b06          	ld	a,(OFST+6,sp)
 808  04fa 97            	ld	xl,a
 809  04fb 7b03          	ld	a,(OFST+3,sp)
 810  04fd 95            	ld	xh,a
 811  04fe cd10ff        	call	L3_TI1_Config
 813  0501 84            	pop	a
 814                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
 815  0502 7b06          	ld	a,(OFST+6,sp)
 816  0504 cd0ebb        	call	_TIM1_SetIC1Prescaler
 819  0507 2042          	jra	L32
 820  0509               L12:
 821                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
 822  0509 a101          	cp	a,#1
 823  050b 2614          	jrne	L52
 824                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
 824                     ; 449                (uint8_t)TIM1_ICSelection,
 824                     ; 450                (uint8_t)TIM1_ICFilter);
 825  050d 7b07          	ld	a,(OFST+7,sp)
 826  050f 88            	push	a
 827  0510 7b06          	ld	a,(OFST+6,sp)
 828  0512 97            	ld	xl,a
 829  0513 7b03          	ld	a,(OFST+3,sp)
 830  0515 95            	ld	xh,a
 831  0516 cd112f        	call	L5_TI2_Config
 833  0519 84            	pop	a
 834                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
 835  051a 7b06          	ld	a,(OFST+6,sp)
 836  051c cd0ee5        	call	_TIM1_SetIC2Prescaler
 839  051f 202a          	jra	L32
 840  0521               L52:
 841                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
 842  0521 a102          	cp	a,#2
 843  0523 2614          	jrne	L13
 844                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
 844                     ; 458                (uint8_t)TIM1_ICSelection,
 844                     ; 459                (uint8_t)TIM1_ICFilter);
 845  0525 7b07          	ld	a,(OFST+7,sp)
 846  0527 88            	push	a
 847  0528 7b06          	ld	a,(OFST+6,sp)
 848  052a 97            	ld	xl,a
 849  052b 7b03          	ld	a,(OFST+3,sp)
 850  052d 95            	ld	xh,a
 851  052e cd115f        	call	L7_TI3_Config
 853  0531 84            	pop	a
 854                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
 855  0532 7b06          	ld	a,(OFST+6,sp)
 856  0534 cd0f0f        	call	_TIM1_SetIC3Prescaler
 859  0537 2012          	jra	L32
 860  0539               L13:
 861                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
 861                     ; 467                (uint8_t)TIM1_ICSelection,
 861                     ; 468                (uint8_t)TIM1_ICFilter);
 862  0539 7b07          	ld	a,(OFST+7,sp)
 863  053b 88            	push	a
 864  053c 7b06          	ld	a,(OFST+6,sp)
 865  053e 97            	ld	xl,a
 866  053f 7b03          	ld	a,(OFST+3,sp)
 867  0541 95            	ld	xh,a
 868  0542 cd118f        	call	L11_TI4_Config
 870  0545 84            	pop	a
 871                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
 872  0546 7b06          	ld	a,(OFST+6,sp)
 873  0548 cd0f39        	call	_TIM1_SetIC4Prescaler
 875  054b               L32:
 876                     ; 472 }
 877  054b 85            	popw	x
 878  054c 81            	ret	
 879  054d               LC006:
 880  054d 89            	pushw	x
 881  054e 5f            	clrw	x
 882  054f 89            	pushw	x
 883  0550 ae0000        	ldw	x,#L31
 884  0553 cd0000        	call	_assert_failed
 886  0556 5b04          	addw	sp,#4
 887  0558 81            	ret	
 889                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
 889                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
 889                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
 889                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
 889                     ; 492                      uint8_t TIM1_ICFilter)
 889                     ; 493 {
 890  0559               _TIM1_PWMIConfig:
 891  0559 89            	pushw	x
 892  055a 89            	pushw	x
 893       00000002      OFST:	set	2
 895                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
 896                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
 897                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
 898  055b 9e            	ld	a,xh
 899  055c 4d            	tnz	a
 900  055d 270a          	jreq	L605
 901  055f 9e            	ld	a,xh
 902  0560 4a            	dec	a
 903  0561 2706          	jreq	L605
 904  0563 ae01f2        	ldw	x,#498
 905  0566 cd0605        	call	LC007
 906  0569               L605:
 907                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
 908  0569 7b04          	ld	a,(OFST+2,sp)
 909  056b 2709          	jreq	L615
 910  056d 4a            	dec	a
 911  056e 2706          	jreq	L615
 912  0570 ae01f3        	ldw	x,#499
 913  0573 cd0605        	call	LC007
 914  0576               L615:
 915                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
 916  0576 7b07          	ld	a,(OFST+5,sp)
 917  0578 a101          	cp	a,#1
 918  057a 270d          	jreq	L625
 919  057c a102          	cp	a,#2
 920  057e 2709          	jreq	L625
 921  0580 a103          	cp	a,#3
 922  0582 2705          	jreq	L625
 923  0584 ae01f4        	ldw	x,#500
 924  0587 ad7c          	call	LC007
 925  0589               L625:
 926                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
 927  0589 7b08          	ld	a,(OFST+6,sp)
 928  058b 2711          	jreq	L635
 929  058d a104          	cp	a,#4
 930  058f 270d          	jreq	L635
 931  0591 a108          	cp	a,#8
 932  0593 2709          	jreq	L635
 933  0595 a10c          	cp	a,#12
 934  0597 2705          	jreq	L635
 935  0599 ae01f5        	ldw	x,#501
 936  059c ad67          	call	LC007
 937  059e               L635:
 938                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
 939  059e 7b04          	ld	a,(OFST+2,sp)
 940  05a0 4a            	dec	a
 941  05a1 2702          	jreq	L53
 942                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
 943  05a3 a601          	ld	a,#1
 945  05a5               L53:
 946                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
 947  05a5 6b01          	ld	(OFST-1,sp),a
 948                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
 949  05a7 7b07          	ld	a,(OFST+5,sp)
 950  05a9 4a            	dec	a
 951  05aa 2604          	jrne	L14
 952                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
 953  05ac a602          	ld	a,#2
 955  05ae 2002          	jra	L34
 956  05b0               L14:
 957                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
 958  05b0 a601          	ld	a,#1
 959  05b2               L34:
 960  05b2 6b02          	ld	(OFST+0,sp),a
 961                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
 962  05b4 7b03          	ld	a,(OFST+1,sp)
 963  05b6 2626          	jrne	L54
 964                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
 964                     ; 527                (uint8_t)TIM1_ICFilter);
 965  05b8 7b09          	ld	a,(OFST+7,sp)
 966  05ba 88            	push	a
 967  05bb 7b08          	ld	a,(OFST+6,sp)
 968  05bd 97            	ld	xl,a
 969  05be 7b05          	ld	a,(OFST+3,sp)
 970  05c0 95            	ld	xh,a
 971  05c1 cd10ff        	call	L3_TI1_Config
 973  05c4 84            	pop	a
 974                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
 975  05c5 7b08          	ld	a,(OFST+6,sp)
 976  05c7 cd0ebb        	call	_TIM1_SetIC1Prescaler
 978                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
 979  05ca 7b09          	ld	a,(OFST+7,sp)
 980  05cc 88            	push	a
 981  05cd 7b03          	ld	a,(OFST+1,sp)
 982  05cf 97            	ld	xl,a
 983  05d0 7b02          	ld	a,(OFST+0,sp)
 984  05d2 95            	ld	xh,a
 985  05d3 cd112f        	call	L5_TI2_Config
 987  05d6 84            	pop	a
 988                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
 989  05d7 7b08          	ld	a,(OFST+6,sp)
 990  05d9 cd0ee5        	call	_TIM1_SetIC2Prescaler
 993  05dc 2024          	jra	L74
 994  05de               L54:
 995                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
 995                     ; 542                (uint8_t)TIM1_ICFilter);
 996  05de 7b09          	ld	a,(OFST+7,sp)
 997  05e0 88            	push	a
 998  05e1 7b08          	ld	a,(OFST+6,sp)
 999  05e3 97            	ld	xl,a
1000  05e4 7b05          	ld	a,(OFST+3,sp)
1001  05e6 95            	ld	xh,a
1002  05e7 cd112f        	call	L5_TI2_Config
1004  05ea 84            	pop	a
1005                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1006  05eb 7b08          	ld	a,(OFST+6,sp)
1007  05ed cd0ee5        	call	_TIM1_SetIC2Prescaler
1009                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1010  05f0 7b09          	ld	a,(OFST+7,sp)
1011  05f2 88            	push	a
1012  05f3 7b03          	ld	a,(OFST+1,sp)
1013  05f5 97            	ld	xl,a
1014  05f6 7b02          	ld	a,(OFST+0,sp)
1015  05f8 95            	ld	xh,a
1016  05f9 cd10ff        	call	L3_TI1_Config
1018  05fc 84            	pop	a
1019                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1020  05fd 7b08          	ld	a,(OFST+6,sp)
1021  05ff cd0ebb        	call	_TIM1_SetIC1Prescaler
1023  0602               L74:
1024                     ; 553 }
1025  0602 5b04          	addw	sp,#4
1026  0604 81            	ret	
1027  0605               LC007:
1028  0605 89            	pushw	x
1029  0606 5f            	clrw	x
1030  0607 89            	pushw	x
1031  0608 ae0000        	ldw	x,#L31
1032  060b cd0000        	call	_assert_failed
1034  060e 5b04          	addw	sp,#4
1035  0610 81            	ret	
1037                     ; 561 void TIM1_Cmd(FunctionalState NewState)
1037                     ; 562 {
1038  0611               _TIM1_Cmd:
1039  0611 88            	push	a
1040       00000000      OFST:	set	0
1042                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1043  0612 4d            	tnz	a
1044  0613 2711          	jreq	L075
1045  0615 4a            	dec	a
1046  0616 270e          	jreq	L075
1047  0618 ae0234        	ldw	x,#564
1048  061b 89            	pushw	x
1049  061c 5f            	clrw	x
1050  061d 89            	pushw	x
1051  061e ae0000        	ldw	x,#L31
1052  0621 cd0000        	call	_assert_failed
1054  0624 5b04          	addw	sp,#4
1055  0626               L075:
1056                     ; 567   if (NewState != DISABLE)
1057  0626 7b01          	ld	a,(OFST+1,sp)
1058  0628 2706          	jreq	L15
1059                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
1060  062a 72105250      	bset	21072,#0
1062  062e 2004          	jra	L35
1063  0630               L15:
1064                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1065  0630 72115250      	bres	21072,#0
1066  0634               L35:
1067                     ; 575 }
1068  0634 84            	pop	a
1069  0635 81            	ret	
1071                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1071                     ; 584 {
1072  0636               _TIM1_CtrlPWMOutputs:
1073  0636 88            	push	a
1074       00000000      OFST:	set	0
1076                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1077  0637 4d            	tnz	a
1078  0638 2711          	jreq	L206
1079  063a 4a            	dec	a
1080  063b 270e          	jreq	L206
1081  063d ae024a        	ldw	x,#586
1082  0640 89            	pushw	x
1083  0641 5f            	clrw	x
1084  0642 89            	pushw	x
1085  0643 ae0000        	ldw	x,#L31
1086  0646 cd0000        	call	_assert_failed
1088  0649 5b04          	addw	sp,#4
1089  064b               L206:
1090                     ; 590   if (NewState != DISABLE)
1091  064b 7b01          	ld	a,(OFST+1,sp)
1092  064d 2706          	jreq	L55
1093                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
1094  064f 721e526d      	bset	21101,#7
1096  0653 2004          	jra	L75
1097  0655               L55:
1098                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1099  0655 721f526d      	bres	21101,#7
1100  0659               L75:
1101                     ; 598 }
1102  0659 84            	pop	a
1103  065a 81            	ret	
1105                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
1105                     ; 618 {
1106  065b               _TIM1_ITConfig:
1107  065b 89            	pushw	x
1108       00000000      OFST:	set	0
1110                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
1111  065c 9e            	ld	a,xh
1112  065d 4d            	tnz	a
1113  065e 2605          	jrne	L216
1114  0660 ae026c        	ldw	x,#620
1115  0663 ad22          	call	LC008
1116  0665               L216:
1117                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1118  0665 7b02          	ld	a,(OFST+2,sp)
1119  0667 2708          	jreq	L226
1120  0669 4a            	dec	a
1121  066a 2705          	jreq	L226
1122  066c ae026d        	ldw	x,#621
1123  066f ad16          	call	LC008
1124  0671               L226:
1125                     ; 623   if (NewState != DISABLE)
1126  0671 7b02          	ld	a,(OFST+2,sp)
1127  0673 2707          	jreq	L16
1128                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
1129  0675 c65254        	ld	a,21076
1130  0678 1a01          	or	a,(OFST+1,sp)
1132  067a 2006          	jra	L36
1133  067c               L16:
1134                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
1135  067c 7b01          	ld	a,(OFST+1,sp)
1136  067e 43            	cpl	a
1137  067f c45254        	and	a,21076
1138  0682               L36:
1139  0682 c75254        	ld	21076,a
1140                     ; 633 }
1141  0685 85            	popw	x
1142  0686 81            	ret	
1143  0687               LC008:
1144  0687 89            	pushw	x
1145  0688 5f            	clrw	x
1146  0689 89            	pushw	x
1147  068a ae0000        	ldw	x,#L31
1148  068d cd0000        	call	_assert_failed
1150  0690 5b04          	addw	sp,#4
1151  0692 81            	ret	
1153                     ; 640 void TIM1_InternalClockConfig(void)
1153                     ; 641 {
1154  0693               _TIM1_InternalClockConfig:
1156                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
1157  0693 c65252        	ld	a,21074
1158  0696 a4f8          	and	a,#248
1159  0698 c75252        	ld	21074,a
1160                     ; 644 }
1161  069b 81            	ret	
1163                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1163                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1163                     ; 664                               uint8_t ExtTRGFilter)
1163                     ; 665 {
1164  069c               _TIM1_ETRClockMode1Config:
1165  069c 89            	pushw	x
1166       00000000      OFST:	set	0
1168                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
1169  069d 9e            	ld	a,xh
1170  069e 4d            	tnz	a
1171  069f 2714          	jreq	L636
1172  06a1 9e            	ld	a,xh
1173  06a2 a110          	cp	a,#16
1174  06a4 270f          	jreq	L636
1175  06a6 9e            	ld	a,xh
1176  06a7 a120          	cp	a,#32
1177  06a9 270a          	jreq	L636
1178  06ab 9e            	ld	a,xh
1179  06ac a130          	cp	a,#48
1180  06ae 2705          	jreq	L636
1181  06b0 ae029b        	ldw	x,#667
1182  06b3 ad25          	call	LC009
1183  06b5               L636:
1184                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
1185  06b5 7b02          	ld	a,(OFST+2,sp)
1186  06b7 a180          	cp	a,#128
1187  06b9 2709          	jreq	L646
1188  06bb 7b02          	ld	a,(OFST+2,sp)
1189  06bd 2705          	jreq	L646
1190  06bf ae029c        	ldw	x,#668
1191  06c2 ad16          	call	LC009
1192  06c4               L646:
1193                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1194  06c4 7b05          	ld	a,(OFST+5,sp)
1195  06c6 88            	push	a
1196  06c7 7b03          	ld	a,(OFST+3,sp)
1197  06c9 97            	ld	xl,a
1198  06ca 7b02          	ld	a,(OFST+2,sp)
1199  06cc 95            	ld	xh,a
1200  06cd ad5d          	call	_TIM1_ETRConfig
1202  06cf 84            	pop	a
1203                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
1203                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
1204  06d0 c65252        	ld	a,21074
1205  06d3 aa77          	or	a,#119
1206  06d5 c75252        	ld	21074,a
1207                     ; 676 }
1208  06d8 85            	popw	x
1209  06d9 81            	ret	
1210  06da               LC009:
1211  06da 89            	pushw	x
1212  06db 5f            	clrw	x
1213  06dc 89            	pushw	x
1214  06dd ae0000        	ldw	x,#L31
1215  06e0 cd0000        	call	_assert_failed
1217  06e3 5b04          	addw	sp,#4
1218  06e5 81            	ret	
1220                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1220                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1220                     ; 696                               uint8_t ExtTRGFilter)
1220                     ; 697 {
1221  06e6               _TIM1_ETRClockMode2Config:
1222  06e6 89            	pushw	x
1223       00000000      OFST:	set	0
1225                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
1226  06e7 9e            	ld	a,xh
1227  06e8 4d            	tnz	a
1228  06e9 2714          	jreq	L266
1229  06eb 9e            	ld	a,xh
1230  06ec a110          	cp	a,#16
1231  06ee 270f          	jreq	L266
1232  06f0 9e            	ld	a,xh
1233  06f1 a120          	cp	a,#32
1234  06f3 270a          	jreq	L266
1235  06f5 9e            	ld	a,xh
1236  06f6 a130          	cp	a,#48
1237  06f8 2705          	jreq	L266
1238  06fa ae02bb        	ldw	x,#699
1239  06fd ad21          	call	LC010
1240  06ff               L266:
1241                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
1242  06ff 7b02          	ld	a,(OFST+2,sp)
1243  0701 a180          	cp	a,#128
1244  0703 2709          	jreq	L276
1245  0705 7b02          	ld	a,(OFST+2,sp)
1246  0707 2705          	jreq	L276
1247  0709 ae02bc        	ldw	x,#700
1248  070c ad12          	call	LC010
1249  070e               L276:
1250                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
1251  070e 7b05          	ld	a,(OFST+5,sp)
1252  0710 88            	push	a
1253  0711 7b03          	ld	a,(OFST+3,sp)
1254  0713 97            	ld	xl,a
1255  0714 7b02          	ld	a,(OFST+2,sp)
1256  0716 95            	ld	xh,a
1257  0717 ad13          	call	_TIM1_ETRConfig
1259  0719 721c5253      	bset	21075,#6
1260                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
1261                     ; 707 }
1262  071d 5b03          	addw	sp,#3
1263  071f 81            	ret	
1264  0720               LC010:
1265  0720 89            	pushw	x
1266  0721 5f            	clrw	x
1267  0722 89            	pushw	x
1268  0723 ae0000        	ldw	x,#L31
1269  0726 cd0000        	call	_assert_failed
1271  0729 5b04          	addw	sp,#4
1272  072b 81            	ret	
1274                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
1274                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
1274                     ; 727                     uint8_t ExtTRGFilter)
1274                     ; 728 {
1275  072c               _TIM1_ETRConfig:
1276  072c 89            	pushw	x
1277       00000000      OFST:	set	0
1279                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
1280  072d 7b05          	ld	a,(OFST+5,sp)
1281  072f a110          	cp	a,#16
1282  0731 250e          	jrult	L407
1283  0733 ae02da        	ldw	x,#730
1284  0736 89            	pushw	x
1285  0737 5f            	clrw	x
1286  0738 89            	pushw	x
1287  0739 ae0000        	ldw	x,#L31
1288  073c cd0000        	call	_assert_failed
1290  073f 5b04          	addw	sp,#4
1291  0741               L407:
1292                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
1292                     ; 733                          (uint8_t)ExtTRGFilter );
1293  0741 7b01          	ld	a,(OFST+1,sp)
1294  0743 1a02          	or	a,(OFST+2,sp)
1295  0745 1a05          	or	a,(OFST+5,sp)
1296  0747 ca5253        	or	a,21075
1297  074a c75253        	ld	21075,a
1298                     ; 734 }
1299  074d 85            	popw	x
1300  074e 81            	ret	
1302                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
1302                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1302                     ; 753                                  uint8_t ICFilter)
1302                     ; 754 {
1303  074f               _TIM1_TIxExternalClockConfig:
1304  074f 89            	pushw	x
1305       00000000      OFST:	set	0
1307                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
1308  0750 9e            	ld	a,xh
1309  0751 a140          	cp	a,#64
1310  0753 270f          	jreq	L617
1311  0755 9e            	ld	a,xh
1312  0756 a160          	cp	a,#96
1313  0758 270a          	jreq	L617
1314  075a 9e            	ld	a,xh
1315  075b a150          	cp	a,#80
1316  075d 2705          	jreq	L617
1317  075f ae02f4        	ldw	x,#756
1318  0762 ad46          	call	LC011
1319  0764               L617:
1320                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1321  0764 7b02          	ld	a,(OFST+2,sp)
1322  0766 2708          	jreq	L627
1323  0768 4a            	dec	a
1324  0769 2705          	jreq	L627
1325  076b ae02f5        	ldw	x,#757
1326  076e ad3a          	call	LC011
1327  0770               L627:
1328                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
1329  0770 7b05          	ld	a,(OFST+5,sp)
1330  0772 a110          	cp	a,#16
1331  0774 2505          	jrult	L437
1332  0776 ae02f6        	ldw	x,#758
1333  0779 ad2f          	call	LC011
1334  077b               L437:
1335                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
1336  077b 7b01          	ld	a,(OFST+1,sp)
1337  077d a160          	cp	a,#96
1338  077f 260e          	jrne	L56
1339                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
1340  0781 7b05          	ld	a,(OFST+5,sp)
1341  0783 88            	push	a
1342  0784 7b03          	ld	a,(OFST+3,sp)
1343  0786 ae0001        	ldw	x,#1
1344  0789 95            	ld	xh,a
1345  078a cd112f        	call	L5_TI2_Config
1348  078d 200c          	jra	L76
1349  078f               L56:
1350                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
1351  078f 7b05          	ld	a,(OFST+5,sp)
1352  0791 88            	push	a
1353  0792 7b03          	ld	a,(OFST+3,sp)
1354  0794 ae0001        	ldw	x,#1
1355  0797 95            	ld	xh,a
1356  0798 cd10ff        	call	L3_TI1_Config
1358  079b               L76:
1359  079b 84            	pop	a
1360                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
1361  079c 7b01          	ld	a,(OFST+1,sp)
1362  079e ad16          	call	_TIM1_SelectInputTrigger
1364                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
1365  07a0 c65252        	ld	a,21074
1366  07a3 aa07          	or	a,#7
1367  07a5 c75252        	ld	21074,a
1368                     ; 775 }
1369  07a8 85            	popw	x
1370  07a9 81            	ret	
1371  07aa               LC011:
1372  07aa 89            	pushw	x
1373  07ab 5f            	clrw	x
1374  07ac 89            	pushw	x
1375  07ad ae0000        	ldw	x,#L31
1376  07b0 cd0000        	call	_assert_failed
1378  07b3 5b04          	addw	sp,#4
1379  07b5 81            	ret	
1381                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
1381                     ; 788 {
1382  07b6               _TIM1_SelectInputTrigger:
1383  07b6 88            	push	a
1384       00000000      OFST:	set	0
1386                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
1387  07b7 a140          	cp	a,#64
1388  07b9 2721          	jreq	L457
1389  07bb a150          	cp	a,#80
1390  07bd 271d          	jreq	L457
1391  07bf a160          	cp	a,#96
1392  07c1 2719          	jreq	L457
1393  07c3 a170          	cp	a,#112
1394  07c5 2715          	jreq	L457
1395  07c7 a130          	cp	a,#48
1396  07c9 2711          	jreq	L457
1397  07cb 4d            	tnz	a
1398  07cc 270e          	jreq	L457
1399  07ce ae0316        	ldw	x,#790
1400  07d1 89            	pushw	x
1401  07d2 5f            	clrw	x
1402  07d3 89            	pushw	x
1403  07d4 ae0000        	ldw	x,#L31
1404  07d7 cd0000        	call	_assert_failed
1406  07da 5b04          	addw	sp,#4
1407  07dc               L457:
1408                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
1409  07dc c65252        	ld	a,21074
1410  07df a48f          	and	a,#143
1411  07e1 1a01          	or	a,(OFST+1,sp)
1412  07e3 c75252        	ld	21074,a
1413                     ; 794 }
1414  07e6 84            	pop	a
1415  07e7 81            	ret	
1417                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
1417                     ; 804 {
1418  07e8               _TIM1_UpdateDisableConfig:
1419  07e8 88            	push	a
1420       00000000      OFST:	set	0
1422                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1423  07e9 4d            	tnz	a
1424  07ea 2711          	jreq	L667
1425  07ec 4a            	dec	a
1426  07ed 270e          	jreq	L667
1427  07ef ae0326        	ldw	x,#806
1428  07f2 89            	pushw	x
1429  07f3 5f            	clrw	x
1430  07f4 89            	pushw	x
1431  07f5 ae0000        	ldw	x,#L31
1432  07f8 cd0000        	call	_assert_failed
1434  07fb 5b04          	addw	sp,#4
1435  07fd               L667:
1436                     ; 809   if (NewState != DISABLE)
1437  07fd 7b01          	ld	a,(OFST+1,sp)
1438  07ff 2706          	jreq	L17
1439                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
1440  0801 72125250      	bset	21072,#1
1442  0805 2004          	jra	L37
1443  0807               L17:
1444                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
1445  0807 72135250      	bres	21072,#1
1446  080b               L37:
1447                     ; 817 }
1448  080b 84            	pop	a
1449  080c 81            	ret	
1451                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
1451                     ; 828 {
1452  080d               _TIM1_UpdateRequestConfig:
1453  080d 88            	push	a
1454       00000000      OFST:	set	0
1456                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
1457  080e 4d            	tnz	a
1458  080f 2711          	jreq	L0001
1459  0811 4a            	dec	a
1460  0812 270e          	jreq	L0001
1461  0814 ae033e        	ldw	x,#830
1462  0817 89            	pushw	x
1463  0818 5f            	clrw	x
1464  0819 89            	pushw	x
1465  081a ae0000        	ldw	x,#L31
1466  081d cd0000        	call	_assert_failed
1468  0820 5b04          	addw	sp,#4
1469  0822               L0001:
1470                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
1471  0822 7b01          	ld	a,(OFST+1,sp)
1472  0824 2706          	jreq	L57
1473                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
1474  0826 72145250      	bset	21072,#2
1476  082a 2004          	jra	L77
1477  082c               L57:
1478                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
1479  082c 72155250      	bres	21072,#2
1480  0830               L77:
1481                     ; 841 }
1482  0830 84            	pop	a
1483  0831 81            	ret	
1485                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
1485                     ; 850 {
1486  0832               _TIM1_SelectHallSensor:
1487  0832 88            	push	a
1488       00000000      OFST:	set	0
1490                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1491  0833 4d            	tnz	a
1492  0834 2711          	jreq	L2101
1493  0836 4a            	dec	a
1494  0837 270e          	jreq	L2101
1495  0839 ae0354        	ldw	x,#852
1496  083c 89            	pushw	x
1497  083d 5f            	clrw	x
1498  083e 89            	pushw	x
1499  083f ae0000        	ldw	x,#L31
1500  0842 cd0000        	call	_assert_failed
1502  0845 5b04          	addw	sp,#4
1503  0847               L2101:
1504                     ; 855   if (NewState != DISABLE)
1505  0847 7b01          	ld	a,(OFST+1,sp)
1506  0849 2706          	jreq	L101
1507                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
1508  084b 721e5251      	bset	21073,#7
1510  084f 2004          	jra	L301
1511  0851               L101:
1512                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
1513  0851 721f5251      	bres	21073,#7
1514  0855               L301:
1515                     ; 863 }
1516  0855 84            	pop	a
1517  0856 81            	ret	
1519                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1519                     ; 874 {
1520  0857               _TIM1_SelectOnePulseMode:
1521  0857 88            	push	a
1522       00000000      OFST:	set	0
1524                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
1525  0858 a101          	cp	a,#1
1526  085a 2711          	jreq	L4201
1527  085c 4d            	tnz	a
1528  085d 270e          	jreq	L4201
1529  085f ae036c        	ldw	x,#876
1530  0862 89            	pushw	x
1531  0863 5f            	clrw	x
1532  0864 89            	pushw	x
1533  0865 ae0000        	ldw	x,#L31
1534  0868 cd0000        	call	_assert_failed
1536  086b 5b04          	addw	sp,#4
1537  086d               L4201:
1538                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
1539  086d 7b01          	ld	a,(OFST+1,sp)
1540  086f 2706          	jreq	L501
1541                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
1542  0871 72165250      	bset	21072,#3
1544  0875 2004          	jra	L701
1545  0877               L501:
1546                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1547  0877 72175250      	bres	21072,#3
1548  087b               L701:
1549                     ; 888 }
1550  087b 84            	pop	a
1551  087c 81            	ret	
1553                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
1553                     ; 904 {
1554  087d               _TIM1_SelectOutputTrigger:
1555  087d 88            	push	a
1556       00000000      OFST:	set	0
1558                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
1559  087e 4d            	tnz	a
1560  087f 2726          	jreq	L6301
1561  0881 a110          	cp	a,#16
1562  0883 2722          	jreq	L6301
1563  0885 a120          	cp	a,#32
1564  0887 271e          	jreq	L6301
1565  0889 a130          	cp	a,#48
1566  088b 271a          	jreq	L6301
1567  088d a140          	cp	a,#64
1568  088f 2716          	jreq	L6301
1569  0891 a150          	cp	a,#80
1570  0893 2712          	jreq	L6301
1571  0895 a160          	cp	a,#96
1572  0897 270e          	jreq	L6301
1573  0899 ae038a        	ldw	x,#906
1574  089c 89            	pushw	x
1575  089d 5f            	clrw	x
1576  089e 89            	pushw	x
1577  089f ae0000        	ldw	x,#L31
1578  08a2 cd0000        	call	_assert_failed
1580  08a5 5b04          	addw	sp,#4
1581  08a7               L6301:
1582                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
1582                     ; 910                         (uint8_t) TIM1_TRGOSource);
1583  08a7 c65251        	ld	a,21073
1584  08aa a48f          	and	a,#143
1585  08ac 1a01          	or	a,(OFST+1,sp)
1586  08ae c75251        	ld	21073,a
1587                     ; 911 }
1588  08b1 84            	pop	a
1589  08b2 81            	ret	
1591                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
1591                     ; 924 {
1592  08b3               _TIM1_SelectSlaveMode:
1593  08b3 88            	push	a
1594       00000000      OFST:	set	0
1596                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
1597  08b4 a104          	cp	a,#4
1598  08b6 271a          	jreq	L0501
1599  08b8 a105          	cp	a,#5
1600  08ba 2716          	jreq	L0501
1601  08bc a106          	cp	a,#6
1602  08be 2712          	jreq	L0501
1603  08c0 a107          	cp	a,#7
1604  08c2 270e          	jreq	L0501
1605  08c4 ae039e        	ldw	x,#926
1606  08c7 89            	pushw	x
1607  08c8 5f            	clrw	x
1608  08c9 89            	pushw	x
1609  08ca ae0000        	ldw	x,#L31
1610  08cd cd0000        	call	_assert_failed
1612  08d0 5b04          	addw	sp,#4
1613  08d2               L0501:
1614                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
1614                     ; 930                          (uint8_t)TIM1_SlaveMode);
1615  08d2 c65252        	ld	a,21074
1616  08d5 a4f8          	and	a,#248
1617  08d7 1a01          	or	a,(OFST+1,sp)
1618  08d9 c75252        	ld	21074,a
1619                     ; 931 }
1620  08dc 84            	pop	a
1621  08dd 81            	ret	
1623                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
1623                     ; 940 {
1624  08de               _TIM1_SelectMasterSlaveMode:
1625  08de 88            	push	a
1626       00000000      OFST:	set	0
1628                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1629  08df 4d            	tnz	a
1630  08e0 2711          	jreq	L2601
1631  08e2 4a            	dec	a
1632  08e3 270e          	jreq	L2601
1633  08e5 ae03ae        	ldw	x,#942
1634  08e8 89            	pushw	x
1635  08e9 5f            	clrw	x
1636  08ea 89            	pushw	x
1637  08eb ae0000        	ldw	x,#L31
1638  08ee cd0000        	call	_assert_failed
1640  08f1 5b04          	addw	sp,#4
1641  08f3               L2601:
1642                     ; 945   if (NewState != DISABLE)
1643  08f3 7b01          	ld	a,(OFST+1,sp)
1644  08f5 2706          	jreq	L111
1645                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
1646  08f7 721e5252      	bset	21074,#7
1648  08fb 2004          	jra	L311
1649  08fd               L111:
1650                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
1651  08fd 721f5252      	bres	21074,#7
1652  0901               L311:
1653                     ; 953 }
1654  0901 84            	pop	a
1655  0902 81            	ret	
1657                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
1657                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
1657                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
1657                     ; 978 {
1658  0903               _TIM1_EncoderInterfaceConfig:
1659  0903 89            	pushw	x
1660       00000000      OFST:	set	0
1662                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
1663  0904 9e            	ld	a,xh
1664  0905 4a            	dec	a
1665  0906 270f          	jreq	L4701
1666  0908 9e            	ld	a,xh
1667  0909 a102          	cp	a,#2
1668  090b 270a          	jreq	L4701
1669  090d 9e            	ld	a,xh
1670  090e a103          	cp	a,#3
1671  0910 2705          	jreq	L4701
1672  0912 ae03d4        	ldw	x,#980
1673  0915 ad54          	call	LC012
1674  0917               L4701:
1675                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
1676  0917 7b02          	ld	a,(OFST+2,sp)
1677  0919 2708          	jreq	L4011
1678  091b 4a            	dec	a
1679  091c 2705          	jreq	L4011
1680  091e ae03d5        	ldw	x,#981
1681  0921 ad48          	call	LC012
1682  0923               L4011:
1683                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
1684  0923 7b05          	ld	a,(OFST+5,sp)
1685  0925 2708          	jreq	L4111
1686  0927 4a            	dec	a
1687  0928 2705          	jreq	L4111
1688  092a ae03d6        	ldw	x,#982
1689  092d ad3c          	call	LC012
1690  092f               L4111:
1691                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
1692  092f 7b02          	ld	a,(OFST+2,sp)
1693  0931 2706          	jreq	L511
1694                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1695  0933 7212525c      	bset	21084,#1
1697  0937 2004          	jra	L711
1698  0939               L511:
1699                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1700  0939 7213525c      	bres	21084,#1
1701  093d               L711:
1702                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
1703  093d 7b05          	ld	a,(OFST+5,sp)
1704  093f 2706          	jreq	L121
1705                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
1706  0941 721a525c      	bset	21084,#5
1708  0945 2004          	jra	L321
1709  0947               L121:
1710                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
1711  0947 721b525c      	bres	21084,#5
1712  094b               L321:
1713                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
1713                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
1714  094b c65252        	ld	a,21074
1715  094e a4f0          	and	a,#240
1716  0950 1a01          	or	a,(OFST+1,sp)
1717  0952 c75252        	ld	21074,a
1718                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
1718                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
1719  0955 c65258        	ld	a,21080
1720  0958 a4fc          	and	a,#252
1721  095a aa01          	or	a,#1
1722  095c c75258        	ld	21080,a
1723                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
1723                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
1724  095f c65259        	ld	a,21081
1725  0962 a4fc          	and	a,#252
1726  0964 aa01          	or	a,#1
1727  0966 c75259        	ld	21081,a
1728                     ; 1011 }
1729  0969 85            	popw	x
1730  096a 81            	ret	
1731  096b               LC012:
1732  096b 89            	pushw	x
1733  096c 5f            	clrw	x
1734  096d 89            	pushw	x
1735  096e ae0000        	ldw	x,#L31
1736  0971 cd0000        	call	_assert_failed
1738  0974 5b04          	addw	sp,#4
1739  0976 81            	ret	
1741                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
1741                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
1741                     ; 1025 {
1742  0977               _TIM1_PrescalerConfig:
1743  0977 89            	pushw	x
1744       00000000      OFST:	set	0
1746                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
1747  0978 7b05          	ld	a,(OFST+5,sp)
1748  097a 2711          	jreq	L6211
1749  097c 4a            	dec	a
1750  097d 270e          	jreq	L6211
1751  097f ae0403        	ldw	x,#1027
1752  0982 89            	pushw	x
1753  0983 5f            	clrw	x
1754  0984 89            	pushw	x
1755  0985 ae0000        	ldw	x,#L31
1756  0988 cd0000        	call	_assert_failed
1758  098b 5b04          	addw	sp,#4
1759  098d               L6211:
1760                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
1761  098d 7b01          	ld	a,(OFST+1,sp)
1762  098f c75260        	ld	21088,a
1763                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
1764  0992 7b02          	ld	a,(OFST+2,sp)
1765  0994 c75261        	ld	21089,a
1766                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
1767  0997 7b05          	ld	a,(OFST+5,sp)
1768  0999 c75257        	ld	21079,a
1769                     ; 1035 }
1770  099c 85            	popw	x
1771  099d 81            	ret	
1773                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
1773                     ; 1049 {
1774  099e               _TIM1_CounterModeConfig:
1775  099e 88            	push	a
1776       00000000      OFST:	set	0
1778                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
1779  099f 4d            	tnz	a
1780  09a0 271e          	jreq	L0411
1781  09a2 a110          	cp	a,#16
1782  09a4 271a          	jreq	L0411
1783  09a6 a120          	cp	a,#32
1784  09a8 2716          	jreq	L0411
1785  09aa a140          	cp	a,#64
1786  09ac 2712          	jreq	L0411
1787  09ae a160          	cp	a,#96
1788  09b0 270e          	jreq	L0411
1789  09b2 ae041b        	ldw	x,#1051
1790  09b5 89            	pushw	x
1791  09b6 5f            	clrw	x
1792  09b7 89            	pushw	x
1793  09b8 ae0000        	ldw	x,#L31
1794  09bb cd0000        	call	_assert_failed
1796  09be 5b04          	addw	sp,#4
1797  09c0               L0411:
1798                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
1798                     ; 1056                         | (uint8_t)TIM1_CounterMode);
1799  09c0 c65250        	ld	a,21072
1800  09c3 a48f          	and	a,#143
1801  09c5 1a01          	or	a,(OFST+1,sp)
1802  09c7 c75250        	ld	21072,a
1803                     ; 1057 }
1804  09ca 84            	pop	a
1805  09cb 81            	ret	
1807                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1807                     ; 1068 {
1808  09cc               _TIM1_ForcedOC1Config:
1809  09cc 88            	push	a
1810       00000000      OFST:	set	0
1812                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1813  09cd a150          	cp	a,#80
1814  09cf 2712          	jreq	L2511
1815  09d1 a140          	cp	a,#64
1816  09d3 270e          	jreq	L2511
1817  09d5 ae042e        	ldw	x,#1070
1818  09d8 89            	pushw	x
1819  09d9 5f            	clrw	x
1820  09da 89            	pushw	x
1821  09db ae0000        	ldw	x,#L31
1822  09de cd0000        	call	_assert_failed
1824  09e1 5b04          	addw	sp,#4
1825  09e3               L2511:
1826                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
1826                     ; 1074                            (uint8_t)TIM1_ForcedAction);
1827  09e3 c65258        	ld	a,21080
1828  09e6 a48f          	and	a,#143
1829  09e8 1a01          	or	a,(OFST+1,sp)
1830  09ea c75258        	ld	21080,a
1831                     ; 1075 }
1832  09ed 84            	pop	a
1833  09ee 81            	ret	
1835                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1835                     ; 1086 {
1836  09ef               _TIM1_ForcedOC2Config:
1837  09ef 88            	push	a
1838       00000000      OFST:	set	0
1840                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1841  09f0 a150          	cp	a,#80
1842  09f2 2712          	jreq	L4611
1843  09f4 a140          	cp	a,#64
1844  09f6 270e          	jreq	L4611
1845  09f8 ae0440        	ldw	x,#1088
1846  09fb 89            	pushw	x
1847  09fc 5f            	clrw	x
1848  09fd 89            	pushw	x
1849  09fe ae0000        	ldw	x,#L31
1850  0a01 cd0000        	call	_assert_failed
1852  0a04 5b04          	addw	sp,#4
1853  0a06               L4611:
1854                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
1854                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
1855  0a06 c65259        	ld	a,21081
1856  0a09 a48f          	and	a,#143
1857  0a0b 1a01          	or	a,(OFST+1,sp)
1858  0a0d c75259        	ld	21081,a
1859                     ; 1093 }
1860  0a10 84            	pop	a
1861  0a11 81            	ret	
1863                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1863                     ; 1105 {
1864  0a12               _TIM1_ForcedOC3Config:
1865  0a12 88            	push	a
1866       00000000      OFST:	set	0
1868                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1869  0a13 a150          	cp	a,#80
1870  0a15 2712          	jreq	L6711
1871  0a17 a140          	cp	a,#64
1872  0a19 270e          	jreq	L6711
1873  0a1b ae0453        	ldw	x,#1107
1874  0a1e 89            	pushw	x
1875  0a1f 5f            	clrw	x
1876  0a20 89            	pushw	x
1877  0a21 ae0000        	ldw	x,#L31
1878  0a24 cd0000        	call	_assert_failed
1880  0a27 5b04          	addw	sp,#4
1881  0a29               L6711:
1882                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
1882                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
1883  0a29 c6525a        	ld	a,21082
1884  0a2c a48f          	and	a,#143
1885  0a2e 1a01          	or	a,(OFST+1,sp)
1886  0a30 c7525a        	ld	21082,a
1887                     ; 1112 }
1888  0a33 84            	pop	a
1889  0a34 81            	ret	
1891                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1891                     ; 1124 {
1892  0a35               _TIM1_ForcedOC4Config:
1893  0a35 88            	push	a
1894       00000000      OFST:	set	0
1896                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1897  0a36 a150          	cp	a,#80
1898  0a38 2712          	jreq	L0121
1899  0a3a a140          	cp	a,#64
1900  0a3c 270e          	jreq	L0121
1901  0a3e ae0466        	ldw	x,#1126
1902  0a41 89            	pushw	x
1903  0a42 5f            	clrw	x
1904  0a43 89            	pushw	x
1905  0a44 ae0000        	ldw	x,#L31
1906  0a47 cd0000        	call	_assert_failed
1908  0a4a 5b04          	addw	sp,#4
1909  0a4c               L0121:
1910                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
1910                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
1911  0a4c c6525b        	ld	a,21083
1912  0a4f a48f          	and	a,#143
1913  0a51 1a01          	or	a,(OFST+1,sp)
1914  0a53 c7525b        	ld	21083,a
1915                     ; 1131 }
1916  0a56 84            	pop	a
1917  0a57 81            	ret	
1919                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
1919                     ; 1140 {
1920  0a58               _TIM1_ARRPreloadConfig:
1921  0a58 88            	push	a
1922       00000000      OFST:	set	0
1924                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1925  0a59 4d            	tnz	a
1926  0a5a 2711          	jreq	L2221
1927  0a5c 4a            	dec	a
1928  0a5d 270e          	jreq	L2221
1929  0a5f ae0476        	ldw	x,#1142
1930  0a62 89            	pushw	x
1931  0a63 5f            	clrw	x
1932  0a64 89            	pushw	x
1933  0a65 ae0000        	ldw	x,#L31
1934  0a68 cd0000        	call	_assert_failed
1936  0a6b 5b04          	addw	sp,#4
1937  0a6d               L2221:
1938                     ; 1145   if (NewState != DISABLE)
1939  0a6d 7b01          	ld	a,(OFST+1,sp)
1940  0a6f 2706          	jreq	L521
1941                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
1942  0a71 721e5250      	bset	21072,#7
1944  0a75 2004          	jra	L721
1945  0a77               L521:
1946                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
1947  0a77 721f5250      	bres	21072,#7
1948  0a7b               L721:
1949                     ; 1153 }
1950  0a7b 84            	pop	a
1951  0a7c 81            	ret	
1953                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
1953                     ; 1162 {
1954  0a7d               _TIM1_SelectCOM:
1955  0a7d 88            	push	a
1956       00000000      OFST:	set	0
1958                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1959  0a7e 4d            	tnz	a
1960  0a7f 2711          	jreq	L4321
1961  0a81 4a            	dec	a
1962  0a82 270e          	jreq	L4321
1963  0a84 ae048c        	ldw	x,#1164
1964  0a87 89            	pushw	x
1965  0a88 5f            	clrw	x
1966  0a89 89            	pushw	x
1967  0a8a ae0000        	ldw	x,#L31
1968  0a8d cd0000        	call	_assert_failed
1970  0a90 5b04          	addw	sp,#4
1971  0a92               L4321:
1972                     ; 1167   if (NewState != DISABLE)
1973  0a92 7b01          	ld	a,(OFST+1,sp)
1974  0a94 2706          	jreq	L131
1975                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
1976  0a96 72145251      	bset	21073,#2
1978  0a9a 2004          	jra	L331
1979  0a9c               L131:
1980                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
1981  0a9c 72155251      	bres	21073,#2
1982  0aa0               L331:
1983                     ; 1175 }
1984  0aa0 84            	pop	a
1985  0aa1 81            	ret	
1987                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
1987                     ; 1184 {
1988  0aa2               _TIM1_CCPreloadControl:
1989  0aa2 88            	push	a
1990       00000000      OFST:	set	0
1992                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1993  0aa3 4d            	tnz	a
1994  0aa4 2711          	jreq	L6421
1995  0aa6 4a            	dec	a
1996  0aa7 270e          	jreq	L6421
1997  0aa9 ae04a2        	ldw	x,#1186
1998  0aac 89            	pushw	x
1999  0aad 5f            	clrw	x
2000  0aae 89            	pushw	x
2001  0aaf ae0000        	ldw	x,#L31
2002  0ab2 cd0000        	call	_assert_failed
2004  0ab5 5b04          	addw	sp,#4
2005  0ab7               L6421:
2006                     ; 1189   if (NewState != DISABLE)
2007  0ab7 7b01          	ld	a,(OFST+1,sp)
2008  0ab9 2706          	jreq	L531
2009                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
2010  0abb 72105251      	bset	21073,#0
2012  0abf 2004          	jra	L731
2013  0ac1               L531:
2014                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2015  0ac1 72115251      	bres	21073,#0
2016  0ac5               L731:
2017                     ; 1197 }
2018  0ac5 84            	pop	a
2019  0ac6 81            	ret	
2021                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2021                     ; 1206 {
2022  0ac7               _TIM1_OC1PreloadConfig:
2023  0ac7 88            	push	a
2024       00000000      OFST:	set	0
2026                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2027  0ac8 4d            	tnz	a
2028  0ac9 2711          	jreq	L0621
2029  0acb 4a            	dec	a
2030  0acc 270e          	jreq	L0621
2031  0ace ae04b8        	ldw	x,#1208
2032  0ad1 89            	pushw	x
2033  0ad2 5f            	clrw	x
2034  0ad3 89            	pushw	x
2035  0ad4 ae0000        	ldw	x,#L31
2036  0ad7 cd0000        	call	_assert_failed
2038  0ada 5b04          	addw	sp,#4
2039  0adc               L0621:
2040                     ; 1211   if (NewState != DISABLE)
2041  0adc 7b01          	ld	a,(OFST+1,sp)
2042  0ade 2706          	jreq	L141
2043                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2044  0ae0 72165258      	bset	21080,#3
2046  0ae4 2004          	jra	L341
2047  0ae6               L141:
2048                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2049  0ae6 72175258      	bres	21080,#3
2050  0aea               L341:
2051                     ; 1219 }
2052  0aea 84            	pop	a
2053  0aeb 81            	ret	
2055                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2055                     ; 1228 {
2056  0aec               _TIM1_OC2PreloadConfig:
2057  0aec 88            	push	a
2058       00000000      OFST:	set	0
2060                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2061  0aed 4d            	tnz	a
2062  0aee 2711          	jreq	L2721
2063  0af0 4a            	dec	a
2064  0af1 270e          	jreq	L2721
2065  0af3 ae04ce        	ldw	x,#1230
2066  0af6 89            	pushw	x
2067  0af7 5f            	clrw	x
2068  0af8 89            	pushw	x
2069  0af9 ae0000        	ldw	x,#L31
2070  0afc cd0000        	call	_assert_failed
2072  0aff 5b04          	addw	sp,#4
2073  0b01               L2721:
2074                     ; 1233   if (NewState != DISABLE)
2075  0b01 7b01          	ld	a,(OFST+1,sp)
2076  0b03 2706          	jreq	L541
2077                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2078  0b05 72165259      	bset	21081,#3
2080  0b09 2004          	jra	L741
2081  0b0b               L541:
2082                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2083  0b0b 72175259      	bres	21081,#3
2084  0b0f               L741:
2085                     ; 1241 }
2086  0b0f 84            	pop	a
2087  0b10 81            	ret	
2089                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2089                     ; 1250 {
2090  0b11               _TIM1_OC3PreloadConfig:
2091  0b11 88            	push	a
2092       00000000      OFST:	set	0
2094                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2095  0b12 4d            	tnz	a
2096  0b13 2711          	jreq	L4031
2097  0b15 4a            	dec	a
2098  0b16 270e          	jreq	L4031
2099  0b18 ae04e4        	ldw	x,#1252
2100  0b1b 89            	pushw	x
2101  0b1c 5f            	clrw	x
2102  0b1d 89            	pushw	x
2103  0b1e ae0000        	ldw	x,#L31
2104  0b21 cd0000        	call	_assert_failed
2106  0b24 5b04          	addw	sp,#4
2107  0b26               L4031:
2108                     ; 1255   if (NewState != DISABLE)
2109  0b26 7b01          	ld	a,(OFST+1,sp)
2110  0b28 2706          	jreq	L151
2111                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2112  0b2a 7216525a      	bset	21082,#3
2114  0b2e 2004          	jra	L351
2115  0b30               L151:
2116                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2117  0b30 7217525a      	bres	21082,#3
2118  0b34               L351:
2119                     ; 1263 }
2120  0b34 84            	pop	a
2121  0b35 81            	ret	
2123                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2123                     ; 1272 {
2124  0b36               _TIM1_OC4PreloadConfig:
2125  0b36 88            	push	a
2126       00000000      OFST:	set	0
2128                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2129  0b37 4d            	tnz	a
2130  0b38 2711          	jreq	L6131
2131  0b3a 4a            	dec	a
2132  0b3b 270e          	jreq	L6131
2133  0b3d ae04fa        	ldw	x,#1274
2134  0b40 89            	pushw	x
2135  0b41 5f            	clrw	x
2136  0b42 89            	pushw	x
2137  0b43 ae0000        	ldw	x,#L31
2138  0b46 cd0000        	call	_assert_failed
2140  0b49 5b04          	addw	sp,#4
2141  0b4b               L6131:
2142                     ; 1277   if (NewState != DISABLE)
2143  0b4b 7b01          	ld	a,(OFST+1,sp)
2144  0b4d 2706          	jreq	L551
2145                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2146  0b4f 7216525b      	bset	21083,#3
2148  0b53 2004          	jra	L751
2149  0b55               L551:
2150                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2151  0b55 7217525b      	bres	21083,#3
2152  0b59               L751:
2153                     ; 1285 }
2154  0b59 84            	pop	a
2155  0b5a 81            	ret	
2157                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
2157                     ; 1294 {
2158  0b5b               _TIM1_OC1FastConfig:
2159  0b5b 88            	push	a
2160       00000000      OFST:	set	0
2162                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2163  0b5c 4d            	tnz	a
2164  0b5d 2711          	jreq	L0331
2165  0b5f 4a            	dec	a
2166  0b60 270e          	jreq	L0331
2167  0b62 ae0510        	ldw	x,#1296
2168  0b65 89            	pushw	x
2169  0b66 5f            	clrw	x
2170  0b67 89            	pushw	x
2171  0b68 ae0000        	ldw	x,#L31
2172  0b6b cd0000        	call	_assert_failed
2174  0b6e 5b04          	addw	sp,#4
2175  0b70               L0331:
2176                     ; 1299   if (NewState != DISABLE)
2177  0b70 7b01          	ld	a,(OFST+1,sp)
2178  0b72 2706          	jreq	L161
2179                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2180  0b74 72145258      	bset	21080,#2
2182  0b78 2004          	jra	L361
2183  0b7a               L161:
2184                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2185  0b7a 72155258      	bres	21080,#2
2186  0b7e               L361:
2187                     ; 1307 }
2188  0b7e 84            	pop	a
2189  0b7f 81            	ret	
2191                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
2191                     ; 1316 {
2192  0b80               _TIM1_OC2FastConfig:
2193  0b80 88            	push	a
2194       00000000      OFST:	set	0
2196                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2197  0b81 4d            	tnz	a
2198  0b82 2711          	jreq	L2431
2199  0b84 4a            	dec	a
2200  0b85 270e          	jreq	L2431
2201  0b87 ae0526        	ldw	x,#1318
2202  0b8a 89            	pushw	x
2203  0b8b 5f            	clrw	x
2204  0b8c 89            	pushw	x
2205  0b8d ae0000        	ldw	x,#L31
2206  0b90 cd0000        	call	_assert_failed
2208  0b93 5b04          	addw	sp,#4
2209  0b95               L2431:
2210                     ; 1321   if (NewState != DISABLE)
2211  0b95 7b01          	ld	a,(OFST+1,sp)
2212  0b97 2706          	jreq	L561
2213                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
2214  0b99 72145259      	bset	21081,#2
2216  0b9d 2004          	jra	L761
2217  0b9f               L561:
2218                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2219  0b9f 72155259      	bres	21081,#2
2220  0ba3               L761:
2221                     ; 1329 }
2222  0ba3 84            	pop	a
2223  0ba4 81            	ret	
2225                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
2225                     ; 1338 {
2226  0ba5               _TIM1_OC3FastConfig:
2227  0ba5 88            	push	a
2228       00000000      OFST:	set	0
2230                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2231  0ba6 4d            	tnz	a
2232  0ba7 2711          	jreq	L4531
2233  0ba9 4a            	dec	a
2234  0baa 270e          	jreq	L4531
2235  0bac ae053c        	ldw	x,#1340
2236  0baf 89            	pushw	x
2237  0bb0 5f            	clrw	x
2238  0bb1 89            	pushw	x
2239  0bb2 ae0000        	ldw	x,#L31
2240  0bb5 cd0000        	call	_assert_failed
2242  0bb8 5b04          	addw	sp,#4
2243  0bba               L4531:
2244                     ; 1343   if (NewState != DISABLE)
2245  0bba 7b01          	ld	a,(OFST+1,sp)
2246  0bbc 2706          	jreq	L171
2247                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
2248  0bbe 7214525a      	bset	21082,#2
2250  0bc2 2004          	jra	L371
2251  0bc4               L171:
2252                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2253  0bc4 7215525a      	bres	21082,#2
2254  0bc8               L371:
2255                     ; 1351 }
2256  0bc8 84            	pop	a
2257  0bc9 81            	ret	
2259                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
2259                     ; 1360 {
2260  0bca               _TIM1_OC4FastConfig:
2261  0bca 88            	push	a
2262       00000000      OFST:	set	0
2264                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2265  0bcb 4d            	tnz	a
2266  0bcc 2711          	jreq	L6631
2267  0bce 4a            	dec	a
2268  0bcf 270e          	jreq	L6631
2269  0bd1 ae0552        	ldw	x,#1362
2270  0bd4 89            	pushw	x
2271  0bd5 5f            	clrw	x
2272  0bd6 89            	pushw	x
2273  0bd7 ae0000        	ldw	x,#L31
2274  0bda cd0000        	call	_assert_failed
2276  0bdd 5b04          	addw	sp,#4
2277  0bdf               L6631:
2278                     ; 1365   if (NewState != DISABLE)
2279  0bdf 7b01          	ld	a,(OFST+1,sp)
2280  0be1 2706          	jreq	L571
2281                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
2282  0be3 7214525b      	bset	21083,#2
2284  0be7 2004          	jra	L771
2285  0be9               L571:
2286                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2287  0be9 7215525b      	bres	21083,#2
2288  0bed               L771:
2289                     ; 1373 }
2290  0bed 84            	pop	a
2291  0bee 81            	ret	
2293                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
2293                     ; 1390 {
2294  0bef               _TIM1_GenerateEvent:
2295  0bef 88            	push	a
2296       00000000      OFST:	set	0
2298                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
2299  0bf0 4d            	tnz	a
2300  0bf1 260e          	jrne	L6731
2301  0bf3 ae0570        	ldw	x,#1392
2302  0bf6 89            	pushw	x
2303  0bf7 5f            	clrw	x
2304  0bf8 89            	pushw	x
2305  0bf9 ae0000        	ldw	x,#L31
2306  0bfc cd0000        	call	_assert_failed
2308  0bff 5b04          	addw	sp,#4
2309  0c01               L6731:
2310                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
2311  0c01 7b01          	ld	a,(OFST+1,sp)
2312  0c03 c75257        	ld	21079,a
2313                     ; 1396 }
2314  0c06 84            	pop	a
2315  0c07 81            	ret	
2317                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
2317                     ; 1407 {
2318  0c08               _TIM1_OC1PolarityConfig:
2319  0c08 88            	push	a
2320       00000000      OFST:	set	0
2322                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
2323  0c09 4d            	tnz	a
2324  0c0a 2712          	jreq	L0141
2325  0c0c a122          	cp	a,#34
2326  0c0e 270e          	jreq	L0141
2327  0c10 ae0581        	ldw	x,#1409
2328  0c13 89            	pushw	x
2329  0c14 5f            	clrw	x
2330  0c15 89            	pushw	x
2331  0c16 ae0000        	ldw	x,#L31
2332  0c19 cd0000        	call	_assert_failed
2334  0c1c 5b04          	addw	sp,#4
2335  0c1e               L0141:
2336                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
2337  0c1e 7b01          	ld	a,(OFST+1,sp)
2338  0c20 2706          	jreq	L102
2339                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
2340  0c22 7212525c      	bset	21084,#1
2342  0c26 2004          	jra	L302
2343  0c28               L102:
2344                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
2345  0c28 7213525c      	bres	21084,#1
2346  0c2c               L302:
2347                     ; 1420 }
2348  0c2c 84            	pop	a
2349  0c2d 81            	ret	
2351                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
2351                     ; 1431 {
2352  0c2e               _TIM1_OC1NPolarityConfig:
2353  0c2e 88            	push	a
2354       00000000      OFST:	set	0
2356                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
2357  0c2f 4d            	tnz	a
2358  0c30 2712          	jreq	L2241
2359  0c32 a188          	cp	a,#136
2360  0c34 270e          	jreq	L2241
2361  0c36 ae0599        	ldw	x,#1433
2362  0c39 89            	pushw	x
2363  0c3a 5f            	clrw	x
2364  0c3b 89            	pushw	x
2365  0c3c ae0000        	ldw	x,#L31
2366  0c3f cd0000        	call	_assert_failed
2368  0c42 5b04          	addw	sp,#4
2369  0c44               L2241:
2370                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
2371  0c44 7b01          	ld	a,(OFST+1,sp)
2372  0c46 2706          	jreq	L502
2373                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
2374  0c48 7216525c      	bset	21084,#3
2376  0c4c 2004          	jra	L702
2377  0c4e               L502:
2378                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
2379  0c4e 7217525c      	bres	21084,#3
2380  0c52               L702:
2381                     ; 1444 }
2382  0c52 84            	pop	a
2383  0c53 81            	ret	
2385                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
2385                     ; 1455 {
2386  0c54               _TIM1_OC2PolarityConfig:
2387  0c54 88            	push	a
2388       00000000      OFST:	set	0
2390                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
2391  0c55 4d            	tnz	a
2392  0c56 2712          	jreq	L4341
2393  0c58 a122          	cp	a,#34
2394  0c5a 270e          	jreq	L4341
2395  0c5c ae05b1        	ldw	x,#1457
2396  0c5f 89            	pushw	x
2397  0c60 5f            	clrw	x
2398  0c61 89            	pushw	x
2399  0c62 ae0000        	ldw	x,#L31
2400  0c65 cd0000        	call	_assert_failed
2402  0c68 5b04          	addw	sp,#4
2403  0c6a               L4341:
2404                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
2405  0c6a 7b01          	ld	a,(OFST+1,sp)
2406  0c6c 2706          	jreq	L112
2407                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
2408  0c6e 721a525c      	bset	21084,#5
2410  0c72 2004          	jra	L312
2411  0c74               L112:
2412                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
2413  0c74 721b525c      	bres	21084,#5
2414  0c78               L312:
2415                     ; 1468 }
2416  0c78 84            	pop	a
2417  0c79 81            	ret	
2419                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
2419                     ; 1479 {
2420  0c7a               _TIM1_OC2NPolarityConfig:
2421  0c7a 88            	push	a
2422       00000000      OFST:	set	0
2424                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
2425  0c7b 4d            	tnz	a
2426  0c7c 2712          	jreq	L6441
2427  0c7e a188          	cp	a,#136
2428  0c80 270e          	jreq	L6441
2429  0c82 ae05c9        	ldw	x,#1481
2430  0c85 89            	pushw	x
2431  0c86 5f            	clrw	x
2432  0c87 89            	pushw	x
2433  0c88 ae0000        	ldw	x,#L31
2434  0c8b cd0000        	call	_assert_failed
2436  0c8e 5b04          	addw	sp,#4
2437  0c90               L6441:
2438                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
2439  0c90 7b01          	ld	a,(OFST+1,sp)
2440  0c92 2706          	jreq	L512
2441                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
2442  0c94 721e525c      	bset	21084,#7
2444  0c98 2004          	jra	L712
2445  0c9a               L512:
2446                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
2447  0c9a 721f525c      	bres	21084,#7
2448  0c9e               L712:
2449                     ; 1492 }
2450  0c9e 84            	pop	a
2451  0c9f 81            	ret	
2453                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
2453                     ; 1503 {
2454  0ca0               _TIM1_OC3PolarityConfig:
2455  0ca0 88            	push	a
2456       00000000      OFST:	set	0
2458                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
2459  0ca1 4d            	tnz	a
2460  0ca2 2712          	jreq	L0641
2461  0ca4 a122          	cp	a,#34
2462  0ca6 270e          	jreq	L0641
2463  0ca8 ae05e1        	ldw	x,#1505
2464  0cab 89            	pushw	x
2465  0cac 5f            	clrw	x
2466  0cad 89            	pushw	x
2467  0cae ae0000        	ldw	x,#L31
2468  0cb1 cd0000        	call	_assert_failed
2470  0cb4 5b04          	addw	sp,#4
2471  0cb6               L0641:
2472                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
2473  0cb6 7b01          	ld	a,(OFST+1,sp)
2474  0cb8 2706          	jreq	L122
2475                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
2476  0cba 7212525d      	bset	21085,#1
2478  0cbe 2004          	jra	L322
2479  0cc0               L122:
2480                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
2481  0cc0 7213525d      	bres	21085,#1
2482  0cc4               L322:
2483                     ; 1516 }
2484  0cc4 84            	pop	a
2485  0cc5 81            	ret	
2487                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
2487                     ; 1528 {
2488  0cc6               _TIM1_OC3NPolarityConfig:
2489  0cc6 88            	push	a
2490       00000000      OFST:	set	0
2492                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
2493  0cc7 4d            	tnz	a
2494  0cc8 2712          	jreq	L2741
2495  0cca a188          	cp	a,#136
2496  0ccc 270e          	jreq	L2741
2497  0cce ae05fa        	ldw	x,#1530
2498  0cd1 89            	pushw	x
2499  0cd2 5f            	clrw	x
2500  0cd3 89            	pushw	x
2501  0cd4 ae0000        	ldw	x,#L31
2502  0cd7 cd0000        	call	_assert_failed
2504  0cda 5b04          	addw	sp,#4
2505  0cdc               L2741:
2506                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
2507  0cdc 7b01          	ld	a,(OFST+1,sp)
2508  0cde 2706          	jreq	L522
2509                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
2510  0ce0 7216525d      	bset	21085,#3
2512  0ce4 2004          	jra	L722
2513  0ce6               L522:
2514                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
2515  0ce6 7217525d      	bres	21085,#3
2516  0cea               L722:
2517                     ; 1541 }
2518  0cea 84            	pop	a
2519  0ceb 81            	ret	
2521                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
2521                     ; 1552 {
2522  0cec               _TIM1_OC4PolarityConfig:
2523  0cec 88            	push	a
2524       00000000      OFST:	set	0
2526                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
2527  0ced 4d            	tnz	a
2528  0cee 2712          	jreq	L4051
2529  0cf0 a122          	cp	a,#34
2530  0cf2 270e          	jreq	L4051
2531  0cf4 ae0612        	ldw	x,#1554
2532  0cf7 89            	pushw	x
2533  0cf8 5f            	clrw	x
2534  0cf9 89            	pushw	x
2535  0cfa ae0000        	ldw	x,#L31
2536  0cfd cd0000        	call	_assert_failed
2538  0d00 5b04          	addw	sp,#4
2539  0d02               L4051:
2540                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
2541  0d02 7b01          	ld	a,(OFST+1,sp)
2542  0d04 2706          	jreq	L132
2543                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
2544  0d06 721a525d      	bset	21085,#5
2546  0d0a 2004          	jra	L332
2547  0d0c               L132:
2548                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
2549  0d0c 721b525d      	bres	21085,#5
2550  0d10               L332:
2551                     ; 1565 }
2552  0d10 84            	pop	a
2553  0d11 81            	ret	
2555                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
2555                     ; 1580 {
2556  0d12               _TIM1_CCxCmd:
2557  0d12 89            	pushw	x
2558       00000000      OFST:	set	0
2560                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2561  0d13 9e            	ld	a,xh
2562  0d14 4d            	tnz	a
2563  0d15 2713          	jreq	L6151
2564  0d17 9e            	ld	a,xh
2565  0d18 4a            	dec	a
2566  0d19 270f          	jreq	L6151
2567  0d1b 9e            	ld	a,xh
2568  0d1c a102          	cp	a,#2
2569  0d1e 270a          	jreq	L6151
2570  0d20 9e            	ld	a,xh
2571  0d21 a103          	cp	a,#3
2572  0d23 2705          	jreq	L6151
2573  0d25 ae062e        	ldw	x,#1582
2574  0d28 ad58          	call	LC013
2575  0d2a               L6151:
2576                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2577  0d2a 7b02          	ld	a,(OFST+2,sp)
2578  0d2c 2708          	jreq	L6251
2579  0d2e 4a            	dec	a
2580  0d2f 2705          	jreq	L6251
2581  0d31 ae062f        	ldw	x,#1583
2582  0d34 ad4c          	call	LC013
2583  0d36               L6251:
2584                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
2585  0d36 7b01          	ld	a,(OFST+1,sp)
2586  0d38 2610          	jrne	L532
2587                     ; 1588     if (NewState != DISABLE)
2588  0d3a 7b02          	ld	a,(OFST+2,sp)
2589  0d3c 2706          	jreq	L732
2590                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
2591  0d3e 7210525c      	bset	21084,#0
2593  0d42 203c          	jra	L342
2594  0d44               L732:
2595                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2596  0d44 7211525c      	bres	21084,#0
2597  0d48 2036          	jra	L342
2598  0d4a               L532:
2599                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
2600  0d4a a101          	cp	a,#1
2601  0d4c 2610          	jrne	L542
2602                     ; 1601     if (NewState != DISABLE)
2603  0d4e 7b02          	ld	a,(OFST+2,sp)
2604  0d50 2706          	jreq	L742
2605                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
2606  0d52 7218525c      	bset	21084,#4
2608  0d56 2028          	jra	L342
2609  0d58               L742:
2610                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2611  0d58 7219525c      	bres	21084,#4
2612  0d5c 2022          	jra	L342
2613  0d5e               L542:
2614                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
2615  0d5e a102          	cp	a,#2
2616  0d60 2610          	jrne	L552
2617                     ; 1613     if (NewState != DISABLE)
2618  0d62 7b02          	ld	a,(OFST+2,sp)
2619  0d64 2706          	jreq	L752
2620                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
2621  0d66 7210525d      	bset	21085,#0
2623  0d6a 2014          	jra	L342
2624  0d6c               L752:
2625                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2626  0d6c 7211525d      	bres	21085,#0
2627  0d70 200e          	jra	L342
2628  0d72               L552:
2629                     ; 1625     if (NewState != DISABLE)
2630  0d72 7b02          	ld	a,(OFST+2,sp)
2631  0d74 2706          	jreq	L562
2632                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
2633  0d76 7218525d      	bset	21085,#4
2635  0d7a 2004          	jra	L342
2636  0d7c               L562:
2637                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
2638  0d7c 7219525d      	bres	21085,#4
2639  0d80               L342:
2640                     ; 1634 }
2641  0d80 85            	popw	x
2642  0d81 81            	ret	
2643  0d82               LC013:
2644  0d82 89            	pushw	x
2645  0d83 5f            	clrw	x
2646  0d84 89            	pushw	x
2647  0d85 ae0000        	ldw	x,#L31
2648  0d88 cd0000        	call	_assert_failed
2650  0d8b 5b04          	addw	sp,#4
2651  0d8d 81            	ret	
2653                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
2653                     ; 1648 {
2654  0d8e               _TIM1_CCxNCmd:
2655  0d8e 89            	pushw	x
2656       00000000      OFST:	set	0
2658                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
2659  0d8f 9e            	ld	a,xh
2660  0d90 4d            	tnz	a
2661  0d91 270e          	jreq	L0451
2662  0d93 9e            	ld	a,xh
2663  0d94 4a            	dec	a
2664  0d95 270a          	jreq	L0451
2665  0d97 9e            	ld	a,xh
2666  0d98 a102          	cp	a,#2
2667  0d9a 2705          	jreq	L0451
2668  0d9c ae0672        	ldw	x,#1650
2669  0d9f ad43          	call	LC014
2670  0da1               L0451:
2671                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2672  0da1 7b02          	ld	a,(OFST+2,sp)
2673  0da3 2708          	jreq	L0551
2674  0da5 4a            	dec	a
2675  0da6 2705          	jreq	L0551
2676  0da8 ae0673        	ldw	x,#1651
2677  0dab ad37          	call	LC014
2678  0dad               L0551:
2679                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
2680  0dad 7b01          	ld	a,(OFST+1,sp)
2681  0daf 2610          	jrne	L172
2682                     ; 1656     if (NewState != DISABLE)
2683  0db1 7b02          	ld	a,(OFST+2,sp)
2684  0db3 2706          	jreq	L372
2685                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
2686  0db5 7214525c      	bset	21084,#2
2688  0db9 2027          	jra	L772
2689  0dbb               L372:
2690                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
2691  0dbb 7215525c      	bres	21084,#2
2692  0dbf 2021          	jra	L772
2693  0dc1               L172:
2694                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
2695  0dc1 4a            	dec	a
2696  0dc2 2610          	jrne	L103
2697                     ; 1668     if (NewState != DISABLE)
2698  0dc4 7b02          	ld	a,(OFST+2,sp)
2699  0dc6 2706          	jreq	L303
2700                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
2701  0dc8 721c525c      	bset	21084,#6
2703  0dcc 2014          	jra	L772
2704  0dce               L303:
2705                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
2706  0dce 721d525c      	bres	21084,#6
2707  0dd2 200e          	jra	L772
2708  0dd4               L103:
2709                     ; 1680     if (NewState != DISABLE)
2710  0dd4 7b02          	ld	a,(OFST+2,sp)
2711  0dd6 2706          	jreq	L113
2712                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
2713  0dd8 7214525d      	bset	21085,#2
2715  0ddc 2004          	jra	L772
2716  0dde               L113:
2717                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
2718  0dde 7215525d      	bres	21085,#2
2719  0de2               L772:
2720                     ; 1689 }
2721  0de2 85            	popw	x
2722  0de3 81            	ret	
2723  0de4               LC014:
2724  0de4 89            	pushw	x
2725  0de5 5f            	clrw	x
2726  0de6 89            	pushw	x
2727  0de7 ae0000        	ldw	x,#L31
2728  0dea cd0000        	call	_assert_failed
2730  0ded 5b04          	addw	sp,#4
2731  0def 81            	ret	
2733                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2733                     ; 1713 {
2734  0df0               _TIM1_SelectOCxM:
2735  0df0 89            	pushw	x
2736       00000000      OFST:	set	0
2738                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2739  0df1 9e            	ld	a,xh
2740  0df2 4d            	tnz	a
2741  0df3 2713          	jreq	L2651
2742  0df5 9e            	ld	a,xh
2743  0df6 4a            	dec	a
2744  0df7 270f          	jreq	L2651
2745  0df9 9e            	ld	a,xh
2746  0dfa a102          	cp	a,#2
2747  0dfc 270a          	jreq	L2651
2748  0dfe 9e            	ld	a,xh
2749  0dff a103          	cp	a,#3
2750  0e01 2705          	jreq	L2651
2751  0e03 ae06b3        	ldw	x,#1715
2752  0e06 ad71          	call	LC015
2753  0e08               L2651:
2754                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
2755  0e08 7b02          	ld	a,(OFST+2,sp)
2756  0e0a 2721          	jreq	L2751
2757  0e0c a110          	cp	a,#16
2758  0e0e 271d          	jreq	L2751
2759  0e10 a120          	cp	a,#32
2760  0e12 2719          	jreq	L2751
2761  0e14 a130          	cp	a,#48
2762  0e16 2715          	jreq	L2751
2763  0e18 a160          	cp	a,#96
2764  0e1a 2711          	jreq	L2751
2765  0e1c a170          	cp	a,#112
2766  0e1e 270d          	jreq	L2751
2767  0e20 a150          	cp	a,#80
2768  0e22 2709          	jreq	L2751
2769  0e24 a140          	cp	a,#64
2770  0e26 2705          	jreq	L2751
2771  0e28 ae06b4        	ldw	x,#1716
2772  0e2b ad4c          	call	LC015
2773  0e2d               L2751:
2774                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
2775  0e2d 7b01          	ld	a,(OFST+1,sp)
2776  0e2f 2610          	jrne	L513
2777                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2778  0e31 7211525c      	bres	21084,#0
2779                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
2779                     ; 1725                             | (uint8_t)TIM1_OCMode);
2780  0e35 c65258        	ld	a,21080
2781  0e38 a48f          	and	a,#143
2782  0e3a 1a02          	or	a,(OFST+2,sp)
2783  0e3c c75258        	ld	21080,a
2785  0e3f 2036          	jra	L713
2786  0e41               L513:
2787                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
2788  0e41 a101          	cp	a,#1
2789  0e43 2610          	jrne	L123
2790                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2791  0e45 7219525c      	bres	21084,#4
2792                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
2792                     ; 1734                             | (uint8_t)TIM1_OCMode);
2793  0e49 c65259        	ld	a,21081
2794  0e4c a48f          	and	a,#143
2795  0e4e 1a02          	or	a,(OFST+2,sp)
2796  0e50 c75259        	ld	21081,a
2798  0e53 2022          	jra	L713
2799  0e55               L123:
2800                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
2801  0e55 a102          	cp	a,#2
2802  0e57 2610          	jrne	L523
2803                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2804  0e59 7211525d      	bres	21085,#0
2805                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
2805                     ; 1743                             | (uint8_t)TIM1_OCMode);
2806  0e5d c6525a        	ld	a,21082
2807  0e60 a48f          	and	a,#143
2808  0e62 1a02          	or	a,(OFST+2,sp)
2809  0e64 c7525a        	ld	21082,a
2811  0e67 200e          	jra	L713
2812  0e69               L523:
2813                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
2814  0e69 7219525d      	bres	21085,#4
2815                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
2815                     ; 1752                             | (uint8_t)TIM1_OCMode);
2816  0e6d c6525b        	ld	a,21083
2817  0e70 a48f          	and	a,#143
2818  0e72 1a02          	or	a,(OFST+2,sp)
2819  0e74 c7525b        	ld	21083,a
2820  0e77               L713:
2821                     ; 1754 }
2822  0e77 85            	popw	x
2823  0e78 81            	ret	
2824  0e79               LC015:
2825  0e79 89            	pushw	x
2826  0e7a 5f            	clrw	x
2827  0e7b 89            	pushw	x
2828  0e7c ae0000        	ldw	x,#L31
2829  0e7f cd0000        	call	_assert_failed
2831  0e82 5b04          	addw	sp,#4
2832  0e84 81            	ret	
2834                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
2834                     ; 1763 {
2835  0e85               _TIM1_SetCounter:
2837                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
2838  0e85 9e            	ld	a,xh
2839  0e86 c7525e        	ld	21086,a
2840                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
2841  0e89 9f            	ld	a,xl
2842  0e8a c7525f        	ld	21087,a
2843                     ; 1767 }
2844  0e8d 81            	ret	
2846                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
2846                     ; 1776 {
2847  0e8e               _TIM1_SetAutoreload:
2849                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
2850  0e8e 9e            	ld	a,xh
2851  0e8f c75262        	ld	21090,a
2852                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
2853  0e92 9f            	ld	a,xl
2854  0e93 c75263        	ld	21091,a
2855                     ; 1780  }
2856  0e96 81            	ret	
2858                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
2858                     ; 1789 {
2859  0e97               _TIM1_SetCompare1:
2861                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2862  0e97 9e            	ld	a,xh
2863  0e98 c75265        	ld	21093,a
2864                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
2865  0e9b 9f            	ld	a,xl
2866  0e9c c75266        	ld	21094,a
2867                     ; 1793 }
2868  0e9f 81            	ret	
2870                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
2870                     ; 1802 {
2871  0ea0               _TIM1_SetCompare2:
2873                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2874  0ea0 9e            	ld	a,xh
2875  0ea1 c75267        	ld	21095,a
2876                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
2877  0ea4 9f            	ld	a,xl
2878  0ea5 c75268        	ld	21096,a
2879                     ; 1806 }
2880  0ea8 81            	ret	
2882                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
2882                     ; 1815 {
2883  0ea9               _TIM1_SetCompare3:
2885                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2886  0ea9 9e            	ld	a,xh
2887  0eaa c75269        	ld	21097,a
2888                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
2889  0ead 9f            	ld	a,xl
2890  0eae c7526a        	ld	21098,a
2891                     ; 1819 }
2892  0eb1 81            	ret	
2894                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
2894                     ; 1828 {
2895  0eb2               _TIM1_SetCompare4:
2897                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2898  0eb2 9e            	ld	a,xh
2899  0eb3 c7526b        	ld	21099,a
2900                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
2901  0eb6 9f            	ld	a,xl
2902  0eb7 c7526c        	ld	21100,a
2903                     ; 1832 }
2904  0eba 81            	ret	
2906                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
2906                     ; 1845 {
2907  0ebb               _TIM1_SetIC1Prescaler:
2908  0ebb 88            	push	a
2909       00000000      OFST:	set	0
2911                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
2912  0ebc 4d            	tnz	a
2913  0ebd 271a          	jreq	L0261
2914  0ebf a104          	cp	a,#4
2915  0ec1 2716          	jreq	L0261
2916  0ec3 a108          	cp	a,#8
2917  0ec5 2712          	jreq	L0261
2918  0ec7 a10c          	cp	a,#12
2919  0ec9 270e          	jreq	L0261
2920  0ecb ae0737        	ldw	x,#1847
2921  0ece 89            	pushw	x
2922  0ecf 5f            	clrw	x
2923  0ed0 89            	pushw	x
2924  0ed1 ae0000        	ldw	x,#L31
2925  0ed4 cd0000        	call	_assert_failed
2927  0ed7 5b04          	addw	sp,#4
2928  0ed9               L0261:
2929                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
2929                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
2930  0ed9 c65258        	ld	a,21080
2931  0edc a4f3          	and	a,#243
2932  0ede 1a01          	or	a,(OFST+1,sp)
2933  0ee0 c75258        	ld	21080,a
2934                     ; 1852 }
2935  0ee3 84            	pop	a
2936  0ee4 81            	ret	
2938                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
2938                     ; 1865 {
2939  0ee5               _TIM1_SetIC2Prescaler:
2940  0ee5 88            	push	a
2941       00000000      OFST:	set	0
2943                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
2944  0ee6 4d            	tnz	a
2945  0ee7 271a          	jreq	L2361
2946  0ee9 a104          	cp	a,#4
2947  0eeb 2716          	jreq	L2361
2948  0eed a108          	cp	a,#8
2949  0eef 2712          	jreq	L2361
2950  0ef1 a10c          	cp	a,#12
2951  0ef3 270e          	jreq	L2361
2952  0ef5 ae074c        	ldw	x,#1868
2953  0ef8 89            	pushw	x
2954  0ef9 5f            	clrw	x
2955  0efa 89            	pushw	x
2956  0efb ae0000        	ldw	x,#L31
2957  0efe cd0000        	call	_assert_failed
2959  0f01 5b04          	addw	sp,#4
2960  0f03               L2361:
2961                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
2961                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
2962  0f03 c65259        	ld	a,21081
2963  0f06 a4f3          	and	a,#243
2964  0f08 1a01          	or	a,(OFST+1,sp)
2965  0f0a c75259        	ld	21081,a
2966                     ; 1873 }
2967  0f0d 84            	pop	a
2968  0f0e 81            	ret	
2970                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
2970                     ; 1886 {
2971  0f0f               _TIM1_SetIC3Prescaler:
2972  0f0f 88            	push	a
2973       00000000      OFST:	set	0
2975                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
2976  0f10 4d            	tnz	a
2977  0f11 271a          	jreq	L4461
2978  0f13 a104          	cp	a,#4
2979  0f15 2716          	jreq	L4461
2980  0f17 a108          	cp	a,#8
2981  0f19 2712          	jreq	L4461
2982  0f1b a10c          	cp	a,#12
2983  0f1d 270e          	jreq	L4461
2984  0f1f ae0761        	ldw	x,#1889
2985  0f22 89            	pushw	x
2986  0f23 5f            	clrw	x
2987  0f24 89            	pushw	x
2988  0f25 ae0000        	ldw	x,#L31
2989  0f28 cd0000        	call	_assert_failed
2991  0f2b 5b04          	addw	sp,#4
2992  0f2d               L4461:
2993                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
2993                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
2994  0f2d c6525a        	ld	a,21082
2995  0f30 a4f3          	and	a,#243
2996  0f32 1a01          	or	a,(OFST+1,sp)
2997  0f34 c7525a        	ld	21082,a
2998                     ; 1894 }
2999  0f37 84            	pop	a
3000  0f38 81            	ret	
3002                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
3002                     ; 1907 {
3003  0f39               _TIM1_SetIC4Prescaler:
3004  0f39 88            	push	a
3005       00000000      OFST:	set	0
3007                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
3008  0f3a 4d            	tnz	a
3009  0f3b 271a          	jreq	L6561
3010  0f3d a104          	cp	a,#4
3011  0f3f 2716          	jreq	L6561
3012  0f41 a108          	cp	a,#8
3013  0f43 2712          	jreq	L6561
3014  0f45 a10c          	cp	a,#12
3015  0f47 270e          	jreq	L6561
3016  0f49 ae0776        	ldw	x,#1910
3017  0f4c 89            	pushw	x
3018  0f4d 5f            	clrw	x
3019  0f4e 89            	pushw	x
3020  0f4f ae0000        	ldw	x,#L31
3021  0f52 cd0000        	call	_assert_failed
3023  0f55 5b04          	addw	sp,#4
3024  0f57               L6561:
3025                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
3025                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
3026  0f57 c6525b        	ld	a,21083
3027  0f5a a4f3          	and	a,#243
3028  0f5c 1a01          	or	a,(OFST+1,sp)
3029  0f5e c7525b        	ld	21083,a
3030                     ; 1915 }
3031  0f61 84            	pop	a
3032  0f62 81            	ret	
3034                     ; 1922 uint16_t TIM1_GetCapture1(void)
3034                     ; 1923 {
3035  0f63               _TIM1_GetCapture1:
3036  0f63 5204          	subw	sp,#4
3037       00000004      OFST:	set	4
3039                     ; 1926   uint16_t tmpccr1 = 0;
3040                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
3042                     ; 1929   tmpccr1h = TIM1->CCR1H;
3043  0f65 c65265        	ld	a,21093
3044  0f68 6b02          	ld	(OFST-2,sp),a
3045                     ; 1930   tmpccr1l = TIM1->CCR1L;
3046  0f6a c65266        	ld	a,21094
3047  0f6d 6b01          	ld	(OFST-3,sp),a
3048                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
3049  0f6f 5f            	clrw	x
3050  0f70 97            	ld	xl,a
3051  0f71 1f03          	ldw	(OFST-1,sp),x
3052                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3053  0f73 5f            	clrw	x
3054  0f74 7b02          	ld	a,(OFST-2,sp)
3055  0f76 97            	ld	xl,a
3056  0f77 7b04          	ld	a,(OFST+0,sp)
3057  0f79 01            	rrwa	x,a
3058  0f7a 1a03          	or	a,(OFST-1,sp)
3059  0f7c 01            	rrwa	x,a
3060                     ; 1935   return (uint16_t)tmpccr1;
3062  0f7d 5b04          	addw	sp,#4
3063  0f7f 81            	ret	
3065                     ; 1943 uint16_t TIM1_GetCapture2(void)
3065                     ; 1944 {
3066  0f80               _TIM1_GetCapture2:
3067  0f80 5204          	subw	sp,#4
3068       00000004      OFST:	set	4
3070                     ; 1947   uint16_t tmpccr2 = 0;
3071                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
3073                     ; 1950   tmpccr2h = TIM1->CCR2H;
3074  0f82 c65267        	ld	a,21095
3075  0f85 6b02          	ld	(OFST-2,sp),a
3076                     ; 1951   tmpccr2l = TIM1->CCR2L;
3077  0f87 c65268        	ld	a,21096
3078  0f8a 6b01          	ld	(OFST-3,sp),a
3079                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
3080  0f8c 5f            	clrw	x
3081  0f8d 97            	ld	xl,a
3082  0f8e 1f03          	ldw	(OFST-1,sp),x
3083                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3084  0f90 5f            	clrw	x
3085  0f91 7b02          	ld	a,(OFST-2,sp)
3086  0f93 97            	ld	xl,a
3087  0f94 7b04          	ld	a,(OFST+0,sp)
3088  0f96 01            	rrwa	x,a
3089  0f97 1a03          	or	a,(OFST-1,sp)
3090  0f99 01            	rrwa	x,a
3091                     ; 1956   return (uint16_t)tmpccr2;
3093  0f9a 5b04          	addw	sp,#4
3094  0f9c 81            	ret	
3096                     ; 1964 uint16_t TIM1_GetCapture3(void)
3096                     ; 1965 {
3097  0f9d               _TIM1_GetCapture3:
3098  0f9d 5204          	subw	sp,#4
3099       00000004      OFST:	set	4
3101                     ; 1967   uint16_t tmpccr3 = 0;
3102                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
3104                     ; 1970   tmpccr3h = TIM1->CCR3H;
3105  0f9f c65269        	ld	a,21097
3106  0fa2 6b02          	ld	(OFST-2,sp),a
3107                     ; 1971   tmpccr3l = TIM1->CCR3L;
3108  0fa4 c6526a        	ld	a,21098
3109  0fa7 6b01          	ld	(OFST-3,sp),a
3110                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
3111  0fa9 5f            	clrw	x
3112  0faa 97            	ld	xl,a
3113  0fab 1f03          	ldw	(OFST-1,sp),x
3114                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3115  0fad 5f            	clrw	x
3116  0fae 7b02          	ld	a,(OFST-2,sp)
3117  0fb0 97            	ld	xl,a
3118  0fb1 7b04          	ld	a,(OFST+0,sp)
3119  0fb3 01            	rrwa	x,a
3120  0fb4 1a03          	or	a,(OFST-1,sp)
3121  0fb6 01            	rrwa	x,a
3122                     ; 1976   return (uint16_t)tmpccr3;
3124  0fb7 5b04          	addw	sp,#4
3125  0fb9 81            	ret	
3127                     ; 1984 uint16_t TIM1_GetCapture4(void)
3127                     ; 1985 {
3128  0fba               _TIM1_GetCapture4:
3129  0fba 5204          	subw	sp,#4
3130       00000004      OFST:	set	4
3132                     ; 1987   uint16_t tmpccr4 = 0;
3133                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
3135                     ; 1990   tmpccr4h = TIM1->CCR4H;
3136  0fbc c6526b        	ld	a,21099
3137  0fbf 6b02          	ld	(OFST-2,sp),a
3138                     ; 1991   tmpccr4l = TIM1->CCR4L;
3139  0fc1 c6526c        	ld	a,21100
3140  0fc4 6b01          	ld	(OFST-3,sp),a
3141                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
3142  0fc6 5f            	clrw	x
3143  0fc7 97            	ld	xl,a
3144  0fc8 1f03          	ldw	(OFST-1,sp),x
3145                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
3146  0fca 5f            	clrw	x
3147  0fcb 7b02          	ld	a,(OFST-2,sp)
3148  0fcd 97            	ld	xl,a
3149  0fce 7b04          	ld	a,(OFST+0,sp)
3150  0fd0 01            	rrwa	x,a
3151  0fd1 1a03          	or	a,(OFST-1,sp)
3152  0fd3 01            	rrwa	x,a
3153                     ; 1996   return (uint16_t)tmpccr4;
3155  0fd4 5b04          	addw	sp,#4
3156  0fd6 81            	ret	
3158                     ; 2004 uint16_t TIM1_GetCounter(void)
3158                     ; 2005 {
3159  0fd7               _TIM1_GetCounter:
3160  0fd7 89            	pushw	x
3161       00000002      OFST:	set	2
3163                     ; 2006   uint16_t tmpcntr = 0;
3164                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
3165  0fd8 c6525e        	ld	a,21086
3166  0fdb 97            	ld	xl,a
3167  0fdc 4f            	clr	a
3168  0fdd 02            	rlwa	x,a
3169  0fde 1f01          	ldw	(OFST-1,sp),x
3170                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
3171  0fe0 c6525f        	ld	a,21087
3172  0fe3 5f            	clrw	x
3173  0fe4 97            	ld	xl,a
3174  0fe5 01            	rrwa	x,a
3175  0fe6 1a02          	or	a,(OFST+0,sp)
3176  0fe8 01            	rrwa	x,a
3177  0fe9 1a01          	or	a,(OFST-1,sp)
3178  0feb 01            	rrwa	x,a
3180  0fec 5b02          	addw	sp,#2
3181  0fee 81            	ret	
3183                     ; 2019 uint16_t TIM1_GetPrescaler(void)
3183                     ; 2020 {
3184  0fef               _TIM1_GetPrescaler:
3185  0fef 89            	pushw	x
3186       00000002      OFST:	set	2
3188                     ; 2021   uint16_t temp = 0;
3189                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
3190  0ff0 c65260        	ld	a,21088
3191  0ff3 97            	ld	xl,a
3192  0ff4 4f            	clr	a
3193  0ff5 02            	rlwa	x,a
3194  0ff6 1f01          	ldw	(OFST-1,sp),x
3195                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
3196  0ff8 c65261        	ld	a,21089
3197  0ffb 5f            	clrw	x
3198  0ffc 97            	ld	xl,a
3199  0ffd 01            	rrwa	x,a
3200  0ffe 1a02          	or	a,(OFST+0,sp)
3201  1000 01            	rrwa	x,a
3202  1001 1a01          	or	a,(OFST-1,sp)
3203  1003 01            	rrwa	x,a
3205  1004 5b02          	addw	sp,#2
3206  1006 81            	ret	
3208                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
3208                     ; 2048 {
3209  1007               _TIM1_GetFlagStatus:
3210  1007 89            	pushw	x
3211  1008 89            	pushw	x
3212       00000002      OFST:	set	2
3214                     ; 2049   FlagStatus bitstatus = RESET;
3215                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
3217                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
3218  1009 a30001        	cpw	x,#1
3219  100c 2745          	jreq	L4071
3220  100e a30002        	cpw	x,#2
3221  1011 2740          	jreq	L4071
3222  1013 a30004        	cpw	x,#4
3223  1016 273b          	jreq	L4071
3224  1018 a30008        	cpw	x,#8
3225  101b 2736          	jreq	L4071
3226  101d a30010        	cpw	x,#16
3227  1020 2731          	jreq	L4071
3228  1022 a30020        	cpw	x,#32
3229  1025 272c          	jreq	L4071
3230  1027 a30040        	cpw	x,#64
3231  102a 2727          	jreq	L4071
3232  102c a30080        	cpw	x,#128
3233  102f 2722          	jreq	L4071
3234  1031 a30200        	cpw	x,#512
3235  1034 271d          	jreq	L4071
3236  1036 a30400        	cpw	x,#1024
3237  1039 2718          	jreq	L4071
3238  103b a30800        	cpw	x,#2048
3239  103e 2713          	jreq	L4071
3240  1040 a31000        	cpw	x,#4096
3241  1043 270e          	jreq	L4071
3242  1045 ae0805        	ldw	x,#2053
3243  1048 89            	pushw	x
3244  1049 5f            	clrw	x
3245  104a 89            	pushw	x
3246  104b ae0000        	ldw	x,#L31
3247  104e cd0000        	call	_assert_failed
3249  1051 5b04          	addw	sp,#4
3250  1053               L4071:
3251                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
3252  1053 c65255        	ld	a,21077
3253  1056 1404          	and	a,(OFST+2,sp)
3254  1058 6b01          	ld	(OFST-1,sp),a
3255                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
3256  105a 7b03          	ld	a,(OFST+1,sp)
3257  105c 6b02          	ld	(OFST+0,sp),a
3258                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
3259  105e c45256        	and	a,21078
3260  1061 1a01          	or	a,(OFST-1,sp)
3261  1063 2702          	jreq	L133
3262                     ; 2060     bitstatus = SET;
3263  1065 a601          	ld	a,#1
3265  1067               L133:
3266                     ; 2064     bitstatus = RESET;
3267                     ; 2066   return (FlagStatus)(bitstatus);
3269  1067 5b04          	addw	sp,#4
3270  1069 81            	ret	
3272                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
3272                     ; 2088 {
3273  106a               _TIM1_ClearFlag:
3274  106a 89            	pushw	x
3275       00000000      OFST:	set	0
3277                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
3278  106b 01            	rrwa	x,a
3279  106c 9f            	ld	a,xl
3280  106d a4e1          	and	a,#225
3281  106f 97            	ld	xl,a
3282  1070 4f            	clr	a
3283  1071 02            	rlwa	x,a
3284  1072 5d            	tnzw	x
3285  1073 2604          	jrne	L2171
3286  1075 1e01          	ldw	x,(OFST+1,sp)
3287  1077 260e          	jrne	L4171
3288  1079               L2171:
3289  1079 ae082a        	ldw	x,#2090
3290  107c 89            	pushw	x
3291  107d 5f            	clrw	x
3292  107e 89            	pushw	x
3293  107f ae0000        	ldw	x,#L31
3294  1082 cd0000        	call	_assert_failed
3296  1085 5b04          	addw	sp,#4
3297  1087               L4171:
3298                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
3299  1087 7b02          	ld	a,(OFST+2,sp)
3300  1089 43            	cpl	a
3301  108a c75255        	ld	21077,a
3302                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
3302                     ; 2095                         (uint8_t)0x1E);
3303  108d 7b01          	ld	a,(OFST+1,sp)
3304  108f 43            	cpl	a
3305  1090 a41e          	and	a,#30
3306  1092 c75256        	ld	21078,a
3307                     ; 2096 }
3308  1095 85            	popw	x
3309  1096 81            	ret	
3311                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
3311                     ; 2113 {
3312  1097               _TIM1_GetITStatus:
3313  1097 88            	push	a
3314  1098 89            	pushw	x
3315       00000002      OFST:	set	2
3317                     ; 2114   ITStatus bitstatus = RESET;
3318                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
3320                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
3321  1099 a101          	cp	a,#1
3322  109b 272a          	jreq	L6271
3323  109d a102          	cp	a,#2
3324  109f 2726          	jreq	L6271
3325  10a1 a104          	cp	a,#4
3326  10a3 2722          	jreq	L6271
3327  10a5 a108          	cp	a,#8
3328  10a7 271e          	jreq	L6271
3329  10a9 a110          	cp	a,#16
3330  10ab 271a          	jreq	L6271
3331  10ad a120          	cp	a,#32
3332  10af 2716          	jreq	L6271
3333  10b1 a140          	cp	a,#64
3334  10b3 2712          	jreq	L6271
3335  10b5 a180          	cp	a,#128
3336  10b7 270e          	jreq	L6271
3337  10b9 ae0846        	ldw	x,#2118
3338  10bc 89            	pushw	x
3339  10bd 5f            	clrw	x
3340  10be 89            	pushw	x
3341  10bf ae0000        	ldw	x,#L31
3342  10c2 cd0000        	call	_assert_failed
3344  10c5 5b04          	addw	sp,#4
3345  10c7               L6271:
3346                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
3347  10c7 c65255        	ld	a,21077
3348  10ca 1403          	and	a,(OFST+1,sp)
3349  10cc 6b01          	ld	(OFST-1,sp),a
3350                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
3351  10ce c65254        	ld	a,21076
3352  10d1 1403          	and	a,(OFST+1,sp)
3353  10d3 6b02          	ld	(OFST+0,sp),a
3354                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
3355  10d5 7b01          	ld	a,(OFST-1,sp)
3356  10d7 2708          	jreq	L533
3358  10d9 7b02          	ld	a,(OFST+0,sp)
3359  10db 2704          	jreq	L533
3360                     ; 2126     bitstatus = SET;
3361  10dd a601          	ld	a,#1
3363  10df 2001          	jra	L733
3364  10e1               L533:
3365                     ; 2130     bitstatus = RESET;
3366  10e1 4f            	clr	a
3367  10e2               L733:
3368                     ; 2132   return (ITStatus)(bitstatus);
3370  10e2 5b03          	addw	sp,#3
3371  10e4 81            	ret	
3373                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
3373                     ; 2150 {
3374  10e5               _TIM1_ClearITPendingBit:
3375  10e5 88            	push	a
3376       00000000      OFST:	set	0
3378                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3379  10e6 4d            	tnz	a
3380  10e7 260e          	jrne	L6371
3381  10e9 ae0868        	ldw	x,#2152
3382  10ec 89            	pushw	x
3383  10ed 5f            	clrw	x
3384  10ee 89            	pushw	x
3385  10ef ae0000        	ldw	x,#L31
3386  10f2 cd0000        	call	_assert_failed
3388  10f5 5b04          	addw	sp,#4
3389  10f7               L6371:
3390                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
3391  10f7 7b01          	ld	a,(OFST+1,sp)
3392  10f9 43            	cpl	a
3393  10fa c75255        	ld	21077,a
3394                     ; 2156 }
3395  10fd 84            	pop	a
3396  10fe 81            	ret	
3398                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
3398                     ; 2175                        uint8_t TIM1_ICSelection,
3398                     ; 2176                        uint8_t TIM1_ICFilter)
3398                     ; 2177 {
3399  10ff               L3_TI1_Config:
3400  10ff 89            	pushw	x
3401  1100 88            	push	a
3402       00000001      OFST:	set	1
3404                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3405  1101 7211525c      	bres	21084,#0
3406                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
3406                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
3407  1105 7b06          	ld	a,(OFST+5,sp)
3408  1107 97            	ld	xl,a
3409  1108 a610          	ld	a,#16
3410  110a 42            	mul	x,a
3411  110b 9f            	ld	a,xl
3412  110c 1a03          	or	a,(OFST+2,sp)
3413  110e 6b01          	ld	(OFST+0,sp),a
3414  1110 c65258        	ld	a,21080
3415  1113 a40c          	and	a,#12
3416  1115 1a01          	or	a,(OFST+0,sp)
3417  1117 c75258        	ld	21080,a
3418                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
3419  111a 7b02          	ld	a,(OFST+1,sp)
3420  111c 2706          	jreq	L143
3421                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3422  111e 7212525c      	bset	21084,#1
3424  1122 2004          	jra	L343
3425  1124               L143:
3426                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3427  1124 7213525c      	bres	21084,#1
3428  1128               L343:
3429                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
3430  1128 7210525c      	bset	21084,#0
3431                     ; 2197 }
3432  112c 5b03          	addw	sp,#3
3433  112e 81            	ret	
3435                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
3435                     ; 2216                        uint8_t TIM1_ICSelection,
3435                     ; 2217                        uint8_t TIM1_ICFilter)
3435                     ; 2218 {
3436  112f               L5_TI2_Config:
3437  112f 89            	pushw	x
3438  1130 88            	push	a
3439       00000001      OFST:	set	1
3441                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
3442  1131 7219525c      	bres	21084,#4
3443                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
3443                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
3444  1135 7b06          	ld	a,(OFST+5,sp)
3445  1137 97            	ld	xl,a
3446  1138 a610          	ld	a,#16
3447  113a 42            	mul	x,a
3448  113b 9f            	ld	a,xl
3449  113c 1a03          	or	a,(OFST+2,sp)
3450  113e 6b01          	ld	(OFST+0,sp),a
3451  1140 c65259        	ld	a,21081
3452  1143 a40c          	and	a,#12
3453  1145 1a01          	or	a,(OFST+0,sp)
3454  1147 c75259        	ld	21081,a
3455                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
3456  114a 7b02          	ld	a,(OFST+1,sp)
3457  114c 2706          	jreq	L543
3458                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3459  114e 721a525c      	bset	21084,#5
3461  1152 2004          	jra	L743
3462  1154               L543:
3463                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3464  1154 721b525c      	bres	21084,#5
3465  1158               L743:
3466                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
3467  1158 7218525c      	bset	21084,#4
3468                     ; 2236 }
3469  115c 5b03          	addw	sp,#3
3470  115e 81            	ret	
3472                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
3472                     ; 2255                        uint8_t TIM1_ICSelection,
3472                     ; 2256                        uint8_t TIM1_ICFilter)
3472                     ; 2257 {
3473  115f               L7_TI3_Config:
3474  115f 89            	pushw	x
3475  1160 88            	push	a
3476       00000001      OFST:	set	1
3478                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
3479  1161 7211525d      	bres	21085,#0
3480                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
3480                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
3481  1165 7b06          	ld	a,(OFST+5,sp)
3482  1167 97            	ld	xl,a
3483  1168 a610          	ld	a,#16
3484  116a 42            	mul	x,a
3485  116b 9f            	ld	a,xl
3486  116c 1a03          	or	a,(OFST+2,sp)
3487  116e 6b01          	ld	(OFST+0,sp),a
3488  1170 c6525a        	ld	a,21082
3489  1173 a40c          	and	a,#12
3490  1175 1a01          	or	a,(OFST+0,sp)
3491  1177 c7525a        	ld	21082,a
3492                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
3493  117a 7b02          	ld	a,(OFST+1,sp)
3494  117c 2706          	jreq	L153
3495                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3496  117e 7212525d      	bset	21085,#1
3498  1182 2004          	jra	L353
3499  1184               L153:
3500                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3501  1184 7213525d      	bres	21085,#1
3502  1188               L353:
3503                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
3504  1188 7210525d      	bset	21085,#0
3505                     ; 2276 }
3506  118c 5b03          	addw	sp,#3
3507  118e 81            	ret	
3509                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
3509                     ; 2295                        uint8_t TIM1_ICSelection,
3509                     ; 2296                        uint8_t TIM1_ICFilter)
3509                     ; 2297 {
3510  118f               L11_TI4_Config:
3511  118f 89            	pushw	x
3512  1190 88            	push	a
3513       00000001      OFST:	set	1
3515                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
3516  1191 7219525d      	bres	21085,#4
3517                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
3517                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
3518  1195 7b06          	ld	a,(OFST+5,sp)
3519  1197 97            	ld	xl,a
3520  1198 a610          	ld	a,#16
3521  119a 42            	mul	x,a
3522  119b 9f            	ld	a,xl
3523  119c 1a03          	or	a,(OFST+2,sp)
3524  119e 6b01          	ld	(OFST+0,sp),a
3525  11a0 c6525b        	ld	a,21083
3526  11a3 a40c          	and	a,#12
3527  11a5 1a01          	or	a,(OFST+0,sp)
3528  11a7 c7525b        	ld	21083,a
3529                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
3530  11aa 7b02          	ld	a,(OFST+1,sp)
3531  11ac 2706          	jreq	L553
3532                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
3533  11ae 721a525d      	bset	21085,#5
3535  11b2 2004          	jra	L753
3536  11b4               L553:
3537                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
3538  11b4 721b525d      	bres	21085,#5
3539  11b8               L753:
3540                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
3541  11b8 7218525d      	bset	21085,#4
3542                     ; 2317 }
3543  11bc 5b03          	addw	sp,#3
3544  11be 81            	ret	
3546                     	xdef	_TIM1_ClearITPendingBit
3547                     	xdef	_TIM1_GetITStatus
3548                     	xdef	_TIM1_ClearFlag
3549                     	xdef	_TIM1_GetFlagStatus
3550                     	xdef	_TIM1_GetPrescaler
3551                     	xdef	_TIM1_GetCounter
3552                     	xdef	_TIM1_GetCapture4
3553                     	xdef	_TIM1_GetCapture3
3554                     	xdef	_TIM1_GetCapture2
3555                     	xdef	_TIM1_GetCapture1
3556                     	xdef	_TIM1_SetIC4Prescaler
3557                     	xdef	_TIM1_SetIC3Prescaler
3558                     	xdef	_TIM1_SetIC2Prescaler
3559                     	xdef	_TIM1_SetIC1Prescaler
3560                     	xdef	_TIM1_SetCompare4
3561                     	xdef	_TIM1_SetCompare3
3562                     	xdef	_TIM1_SetCompare2
3563                     	xdef	_TIM1_SetCompare1
3564                     	xdef	_TIM1_SetAutoreload
3565                     	xdef	_TIM1_SetCounter
3566                     	xdef	_TIM1_SelectOCxM
3567                     	xdef	_TIM1_CCxNCmd
3568                     	xdef	_TIM1_CCxCmd
3569                     	xdef	_TIM1_OC4PolarityConfig
3570                     	xdef	_TIM1_OC3NPolarityConfig
3571                     	xdef	_TIM1_OC3PolarityConfig
3572                     	xdef	_TIM1_OC2NPolarityConfig
3573                     	xdef	_TIM1_OC2PolarityConfig
3574                     	xdef	_TIM1_OC1NPolarityConfig
3575                     	xdef	_TIM1_OC1PolarityConfig
3576                     	xdef	_TIM1_GenerateEvent
3577                     	xdef	_TIM1_OC4FastConfig
3578                     	xdef	_TIM1_OC3FastConfig
3579                     	xdef	_TIM1_OC2FastConfig
3580                     	xdef	_TIM1_OC1FastConfig
3581                     	xdef	_TIM1_OC4PreloadConfig
3582                     	xdef	_TIM1_OC3PreloadConfig
3583                     	xdef	_TIM1_OC2PreloadConfig
3584                     	xdef	_TIM1_OC1PreloadConfig
3585                     	xdef	_TIM1_CCPreloadControl
3586                     	xdef	_TIM1_SelectCOM
3587                     	xdef	_TIM1_ARRPreloadConfig
3588                     	xdef	_TIM1_ForcedOC4Config
3589                     	xdef	_TIM1_ForcedOC3Config
3590                     	xdef	_TIM1_ForcedOC2Config
3591                     	xdef	_TIM1_ForcedOC1Config
3592                     	xdef	_TIM1_CounterModeConfig
3593                     	xdef	_TIM1_PrescalerConfig
3594                     	xdef	_TIM1_EncoderInterfaceConfig
3595                     	xdef	_TIM1_SelectMasterSlaveMode
3596                     	xdef	_TIM1_SelectSlaveMode
3597                     	xdef	_TIM1_SelectOutputTrigger
3598                     	xdef	_TIM1_SelectOnePulseMode
3599                     	xdef	_TIM1_SelectHallSensor
3600                     	xdef	_TIM1_UpdateRequestConfig
3601                     	xdef	_TIM1_UpdateDisableConfig
3602                     	xdef	_TIM1_SelectInputTrigger
3603                     	xdef	_TIM1_TIxExternalClockConfig
3604                     	xdef	_TIM1_ETRConfig
3605                     	xdef	_TIM1_ETRClockMode2Config
3606                     	xdef	_TIM1_ETRClockMode1Config
3607                     	xdef	_TIM1_InternalClockConfig
3608                     	xdef	_TIM1_ITConfig
3609                     	xdef	_TIM1_CtrlPWMOutputs
3610                     	xdef	_TIM1_Cmd
3611                     	xdef	_TIM1_PWMIConfig
3612                     	xdef	_TIM1_ICInit
3613                     	xdef	_TIM1_BDTRConfig
3614                     	xdef	_TIM1_OC4Init
3615                     	xdef	_TIM1_OC3Init
3616                     	xdef	_TIM1_OC2Init
3617                     	xdef	_TIM1_OC1Init
3618                     	xdef	_TIM1_TimeBaseInit
3619                     	xdef	_TIM1_DeInit
3620                     	xref	_assert_failed
3621                     .const:	section	.text
3622  0000               L31:
3623  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
3624  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
3625  0024 38735f74696d  	dc.b	"8s_tim1.c",0
3626                     	end
