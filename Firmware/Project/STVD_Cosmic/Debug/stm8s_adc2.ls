   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 54 void ADC2_DeInit(void)
  20                     ; 55 {
  21                     	scross	off
  22  0000               _ADC2_DeInit:
  24                     ; 56   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  25  0000 725f5400      	clr	21504
  26                     ; 57   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  27  0004 725f5401      	clr	21505
  28                     ; 58   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  29  0008 725f5402      	clr	21506
  30                     ; 59   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  31  000c 725f5406      	clr	21510
  32                     ; 60   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  33  0010 725f5407      	clr	21511
  34                     ; 61 }
  35  0014 81            	ret	
  37                     ; 83 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
  37                     ; 84 {
  38  0015               _ADC2_Init:
  39  0015 89            	pushw	x
  40       00000000      OFST:	set	0
  42                     ; 86   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
  43  0016 9e            	ld	a,xh
  44  0017 4d            	tnz	a
  45  0018 270a          	jreq	L21
  46  001a 9e            	ld	a,xh
  47  001b 4a            	dec	a
  48  001c 2706          	jreq	L21
  49  001e ae0056        	ldw	x,#86
  50  0021 cd0135        	call	LC001
  51  0024               L21:
  52                     ; 87   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
  53  0024 7b02          	ld	a,(OFST+2,sp)
  54  0026 2742          	jreq	L22
  55  0028 a101          	cp	a,#1
  56  002a 273e          	jreq	L22
  57  002c a102          	cp	a,#2
  58  002e 273a          	jreq	L22
  59  0030 a103          	cp	a,#3
  60  0032 2736          	jreq	L22
  61  0034 a104          	cp	a,#4
  62  0036 2732          	jreq	L22
  63  0038 a105          	cp	a,#5
  64  003a 272e          	jreq	L22
  65  003c a106          	cp	a,#6
  66  003e 272a          	jreq	L22
  67  0040 a107          	cp	a,#7
  68  0042 2726          	jreq	L22
  69  0044 a108          	cp	a,#8
  70  0046 2722          	jreq	L22
  71  0048 a109          	cp	a,#9
  72  004a 271e          	jreq	L22
  73  004c a10a          	cp	a,#10
  74  004e 271a          	jreq	L22
  75  0050 a10b          	cp	a,#11
  76  0052 2716          	jreq	L22
  77  0054 a10c          	cp	a,#12
  78  0056 2712          	jreq	L22
  79  0058 a10d          	cp	a,#13
  80  005a 270e          	jreq	L22
  81  005c a10e          	cp	a,#14
  82  005e 270a          	jreq	L22
  83  0060 a10f          	cp	a,#15
  84  0062 2706          	jreq	L22
  85  0064 ae0057        	ldw	x,#87
  86  0067 cd0135        	call	LC001
  87  006a               L22:
  88                     ; 88   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
  89  006a 7b05          	ld	a,(OFST+5,sp)
  90  006c 2722          	jreq	L23
  91  006e a110          	cp	a,#16
  92  0070 271e          	jreq	L23
  93  0072 a120          	cp	a,#32
  94  0074 271a          	jreq	L23
  95  0076 a130          	cp	a,#48
  96  0078 2716          	jreq	L23
  97  007a a140          	cp	a,#64
  98  007c 2712          	jreq	L23
  99  007e a150          	cp	a,#80
 100  0080 270e          	jreq	L23
 101  0082 a160          	cp	a,#96
 102  0084 270a          	jreq	L23
 103  0086 a170          	cp	a,#112
 104  0088 2706          	jreq	L23
 105  008a ae0058        	ldw	x,#88
 106  008d cd0135        	call	LC001
 107  0090               L23:
 108                     ; 89   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 109  0090 7b06          	ld	a,(OFST+6,sp)
 110  0092 2709          	jreq	L24
 111  0094 4a            	dec	a
 112  0095 2706          	jreq	L24
 113  0097 ae0059        	ldw	x,#89
 114  009a cd0135        	call	LC001
 115  009d               L24:
 116                     ; 90   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 117  009d 7b07          	ld	a,(OFST+7,sp)
 118  009f 2709          	jreq	L25
 119  00a1 4a            	dec	a
 120  00a2 2706          	jreq	L25
 121  00a4 ae005a        	ldw	x,#90
 122  00a7 cd0135        	call	LC001
 123  00aa               L25:
 124                     ; 91   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 125  00aa 7b08          	ld	a,(OFST+8,sp)
 126  00ac 2709          	jreq	L26
 127  00ae a108          	cp	a,#8
 128  00b0 2705          	jreq	L26
 129  00b2 ae005b        	ldw	x,#91
 130  00b5 ad7e          	call	LC001
 131  00b7               L26:
 132                     ; 92   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 133  00b7 7b09          	ld	a,(OFST+9,sp)
 134  00b9 2745          	jreq	L27
 135  00bb a101          	cp	a,#1
 136  00bd 2741          	jreq	L27
 137  00bf a102          	cp	a,#2
 138  00c1 273d          	jreq	L27
 139  00c3 a103          	cp	a,#3
 140  00c5 2739          	jreq	L27
 141  00c7 a104          	cp	a,#4
 142  00c9 2735          	jreq	L27
 143  00cb a105          	cp	a,#5
 144  00cd 2731          	jreq	L27
 145  00cf a106          	cp	a,#6
 146  00d1 272d          	jreq	L27
 147  00d3 a107          	cp	a,#7
 148  00d5 2729          	jreq	L27
 149  00d7 a108          	cp	a,#8
 150  00d9 2725          	jreq	L27
 151  00db a109          	cp	a,#9
 152  00dd 2721          	jreq	L27
 153  00df a10a          	cp	a,#10
 154  00e1 271d          	jreq	L27
 155  00e3 a10b          	cp	a,#11
 156  00e5 2719          	jreq	L27
 157  00e7 a10c          	cp	a,#12
 158  00e9 2715          	jreq	L27
 159  00eb a10d          	cp	a,#13
 160  00ed 2711          	jreq	L27
 161  00ef a10e          	cp	a,#14
 162  00f1 270d          	jreq	L27
 163  00f3 a10f          	cp	a,#15
 164  00f5 2709          	jreq	L27
 165  00f7 a11f          	cp	a,#31
 166  00f9 2705          	jreq	L27
 167  00fb ae005c        	ldw	x,#92
 168  00fe ad35          	call	LC001
 169  0100               L27:
 170                     ; 93   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 171  0100 7b0a          	ld	a,(OFST+10,sp)
 172  0102 2708          	jreq	L201
 173  0104 4a            	dec	a
 174  0105 2705          	jreq	L201
 175  0107 ae005d        	ldw	x,#93
 176  010a ad29          	call	LC001
 177  010c               L201:
 178                     ; 98   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 179  010c 7b08          	ld	a,(OFST+8,sp)
 180  010e 88            	push	a
 181  010f 7b03          	ld	a,(OFST+3,sp)
 182  0111 97            	ld	xl,a
 183  0112 7b02          	ld	a,(OFST+2,sp)
 184  0114 95            	ld	xh,a
 185  0115 cd02b0        	call	_ADC2_ConversionConfig
 187  0118 84            	pop	a
 188                     ; 100   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 189  0119 7b05          	ld	a,(OFST+5,sp)
 190  011b ad6e          	call	_ADC2_PrescalerConfig
 192                     ; 105   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 193  011d 7b07          	ld	a,(OFST+7,sp)
 194  011f 97            	ld	xl,a
 195  0120 7b06          	ld	a,(OFST+6,sp)
 196  0122 95            	ld	xh,a
 197  0123 cd034a        	call	_ADC2_ExternalTriggerConfig
 199                     ; 110   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 200  0126 7b0a          	ld	a,(OFST+10,sp)
 201  0128 97            	ld	xl,a
 202  0129 7b09          	ld	a,(OFST+9,sp)
 203  012b 95            	ld	xh,a
 204  012c cd01cb        	call	_ADC2_SchmittTriggerConfig
 206                     ; 113   ADC2->CR1 |= ADC2_CR1_ADON;
 207  012f 72105401      	bset	21505,#0
 208                     ; 114 }
 209  0133 85            	popw	x
 210  0134 81            	ret	
 211  0135               LC001:
 212  0135 89            	pushw	x
 213  0136 5f            	clrw	x
 214  0137 89            	pushw	x
 215  0138 ae0000        	ldw	x,#L3
 216  013b cd0000        	call	_assert_failed
 218  013e 5b04          	addw	sp,#4
 219  0140 81            	ret	
 221                     ; 121 void ADC2_Cmd(FunctionalState NewState)
 221                     ; 122 {
 222  0141               _ADC2_Cmd:
 223  0141 88            	push	a
 224       00000000      OFST:	set	0
 226                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 227  0142 4d            	tnz	a
 228  0143 2711          	jreq	L421
 229  0145 4a            	dec	a
 230  0146 270e          	jreq	L421
 231  0148 ae007c        	ldw	x,#124
 232  014b 89            	pushw	x
 233  014c 5f            	clrw	x
 234  014d 89            	pushw	x
 235  014e ae0000        	ldw	x,#L3
 236  0151 cd0000        	call	_assert_failed
 238  0154 5b04          	addw	sp,#4
 239  0156               L421:
 240                     ; 126   if (NewState != DISABLE)
 241  0156 7b01          	ld	a,(OFST+1,sp)
 242  0158 2706          	jreq	L5
 243                     ; 128     ADC2->CR1 |= ADC2_CR1_ADON;
 244  015a 72105401      	bset	21505,#0
 246  015e 2004          	jra	L7
 247  0160               L5:
 248                     ; 132     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 249  0160 72115401      	bres	21505,#0
 250  0164               L7:
 251                     ; 134 }
 252  0164 84            	pop	a
 253  0165 81            	ret	
 255                     ; 141 void ADC2_ITConfig(FunctionalState NewState)
 255                     ; 142 {
 256  0166               _ADC2_ITConfig:
 257  0166 88            	push	a
 258       00000000      OFST:	set	0
 260                     ; 144   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 261  0167 4d            	tnz	a
 262  0168 2711          	jreq	L631
 263  016a 4a            	dec	a
 264  016b 270e          	jreq	L631
 265  016d ae0090        	ldw	x,#144
 266  0170 89            	pushw	x
 267  0171 5f            	clrw	x
 268  0172 89            	pushw	x
 269  0173 ae0000        	ldw	x,#L3
 270  0176 cd0000        	call	_assert_failed
 272  0179 5b04          	addw	sp,#4
 273  017b               L631:
 274                     ; 146   if (NewState != DISABLE)
 275  017b 7b01          	ld	a,(OFST+1,sp)
 276  017d 2706          	jreq	L11
 277                     ; 149     ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
 278  017f 721a5400      	bset	21504,#5
 280  0183 2004          	jra	L31
 281  0185               L11:
 282                     ; 154     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
 283  0185 721b5400      	bres	21504,#5
 284  0189               L31:
 285                     ; 156 }
 286  0189 84            	pop	a
 287  018a 81            	ret	
 289                     ; 164 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
 289                     ; 165 {
 290  018b               _ADC2_PrescalerConfig:
 291  018b 88            	push	a
 292       00000000      OFST:	set	0
 294                     ; 167   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
 295  018c 4d            	tnz	a
 296  018d 272a          	jreq	L051
 297  018f a110          	cp	a,#16
 298  0191 2726          	jreq	L051
 299  0193 a120          	cp	a,#32
 300  0195 2722          	jreq	L051
 301  0197 a130          	cp	a,#48
 302  0199 271e          	jreq	L051
 303  019b a140          	cp	a,#64
 304  019d 271a          	jreq	L051
 305  019f a150          	cp	a,#80
 306  01a1 2716          	jreq	L051
 307  01a3 a160          	cp	a,#96
 308  01a5 2712          	jreq	L051
 309  01a7 a170          	cp	a,#112
 310  01a9 270e          	jreq	L051
 311  01ab ae00a7        	ldw	x,#167
 312  01ae 89            	pushw	x
 313  01af 5f            	clrw	x
 314  01b0 89            	pushw	x
 315  01b1 ae0000        	ldw	x,#L3
 316  01b4 cd0000        	call	_assert_failed
 318  01b7 5b04          	addw	sp,#4
 319  01b9               L051:
 320                     ; 170   ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
 321  01b9 c65401        	ld	a,21505
 322  01bc a48f          	and	a,#143
 323  01be c75401        	ld	21505,a
 324                     ; 172   ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
 325  01c1 c65401        	ld	a,21505
 326  01c4 1a01          	or	a,(OFST+1,sp)
 327  01c6 c75401        	ld	21505,a
 328                     ; 173 }
 329  01c9 84            	pop	a
 330  01ca 81            	ret	
 332                     ; 183 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
 332                     ; 184 {
 333  01cb               _ADC2_SchmittTriggerConfig:
 334  01cb 89            	pushw	x
 335       00000000      OFST:	set	0
 337                     ; 186   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 338  01cc 9e            	ld	a,xh
 339  01cd 4d            	tnz	a
 340  01ce 2755          	jreq	L261
 341  01d0 9e            	ld	a,xh
 342  01d1 4a            	dec	a
 343  01d2 2751          	jreq	L261
 344  01d4 9e            	ld	a,xh
 345  01d5 a102          	cp	a,#2
 346  01d7 274c          	jreq	L261
 347  01d9 9e            	ld	a,xh
 348  01da a103          	cp	a,#3
 349  01dc 2747          	jreq	L261
 350  01de 9e            	ld	a,xh
 351  01df a104          	cp	a,#4
 352  01e1 2742          	jreq	L261
 353  01e3 9e            	ld	a,xh
 354  01e4 a105          	cp	a,#5
 355  01e6 273d          	jreq	L261
 356  01e8 9e            	ld	a,xh
 357  01e9 a106          	cp	a,#6
 358  01eb 2738          	jreq	L261
 359  01ed 9e            	ld	a,xh
 360  01ee a107          	cp	a,#7
 361  01f0 2733          	jreq	L261
 362  01f2 9e            	ld	a,xh
 363  01f3 a108          	cp	a,#8
 364  01f5 272e          	jreq	L261
 365  01f7 9e            	ld	a,xh
 366  01f8 a109          	cp	a,#9
 367  01fa 2729          	jreq	L261
 368  01fc 9e            	ld	a,xh
 369  01fd a10a          	cp	a,#10
 370  01ff 2724          	jreq	L261
 371  0201 9e            	ld	a,xh
 372  0202 a10b          	cp	a,#11
 373  0204 271f          	jreq	L261
 374  0206 9e            	ld	a,xh
 375  0207 a10c          	cp	a,#12
 376  0209 271a          	jreq	L261
 377  020b 9e            	ld	a,xh
 378  020c a10d          	cp	a,#13
 379  020e 2715          	jreq	L261
 380  0210 9e            	ld	a,xh
 381  0211 a10e          	cp	a,#14
 382  0213 2710          	jreq	L261
 383  0215 9e            	ld	a,xh
 384  0216 a10f          	cp	a,#15
 385  0218 270b          	jreq	L261
 386  021a 9e            	ld	a,xh
 387  021b a11f          	cp	a,#31
 388  021d 2706          	jreq	L261
 389  021f ae00ba        	ldw	x,#186
 390  0222 cd02a4        	call	LC005
 391  0225               L261:
 392                     ; 187   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 393  0225 7b02          	ld	a,(OFST+2,sp)
 394  0227 2708          	jreq	L271
 395  0229 4a            	dec	a
 396  022a 2705          	jreq	L271
 397  022c ae00bb        	ldw	x,#187
 398  022f ad73          	call	LC005
 399  0231               L271:
 400                     ; 189   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
 401  0231 7b01          	ld	a,(OFST+1,sp)
 402  0233 a11f          	cp	a,#31
 403  0235 261d          	jrne	L51
 404                     ; 191     if (NewState != DISABLE)
 405  0237 7b02          	ld	a,(OFST+2,sp)
 406  0239 270a          	jreq	L71
 407                     ; 193       ADC2->TDRL &= (uint8_t)0x0;
 408  023b 725f5407      	clr	21511
 409                     ; 194       ADC2->TDRH &= (uint8_t)0x0;
 410  023f 725f5406      	clr	21510
 412  0243 2057          	jra	L32
 413  0245               L71:
 414                     ; 198       ADC2->TDRL |= (uint8_t)0xFF;
 415  0245 c65407        	ld	a,21511
 416  0248 aaff          	or	a,#255
 417  024a c75407        	ld	21511,a
 418                     ; 199       ADC2->TDRH |= (uint8_t)0xFF;
 419  024d c65406        	ld	a,21510
 420  0250 aaff          	or	a,#255
 421  0252 2045          	jp	LC002
 422  0254               L51:
 423                     ; 202   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
 424  0254 a108          	cp	a,#8
 425  0256 0d02          	tnz	(OFST+2,sp)
 426  0258 2420          	jruge	L52
 427                     ; 204     if (NewState != DISABLE)
 428  025a 2711          	jreq	L72
 429                     ; 206       ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
 430  025c ad40          	call	LC004
 431  025e 2704          	jreq	L671
 432  0260               L002:
 433  0260 48            	sll	a
 434  0261 5a            	decw	x
 435  0262 26fc          	jrne	L002
 436  0264               L671:
 437  0264 43            	cpl	a
 438  0265 c45407        	and	a,21511
 439  0268               LC003:
 440  0268 c75407        	ld	21511,a
 442  026b 202f          	jra	L32
 443  026d               L72:
 444                     ; 210       ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
 445  026d ad2f          	call	LC004
 446  026f 2704          	jreq	L202
 447  0271               L402:
 448  0271 48            	sll	a
 449  0272 5a            	decw	x
 450  0273 26fc          	jrne	L402
 451  0275               L202:
 452  0275 ca5407        	or	a,21511
 453  0278 20ee          	jp	LC003
 454  027a               L52:
 455                     ; 215     if (NewState != DISABLE)
 456  027a 2710          	jreq	L53
 457                     ; 217       ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
 458  027c a008          	sub	a,#8
 459  027e ad1e          	call	LC004
 460  0280 2704          	jreq	L602
 461  0282               L012:
 462  0282 48            	sll	a
 463  0283 5a            	decw	x
 464  0284 26fc          	jrne	L012
 465  0286               L602:
 466  0286 43            	cpl	a
 467  0287 c45406        	and	a,21510
 469  028a 200d          	jp	LC002
 470  028c               L53:
 471                     ; 221       ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
 472  028c a008          	sub	a,#8
 473  028e ad0e          	call	LC004
 474  0290 2704          	jreq	L212
 475  0292               L412:
 476  0292 48            	sll	a
 477  0293 5a            	decw	x
 478  0294 26fc          	jrne	L412
 479  0296               L212:
 480  0296 ca5406        	or	a,21510
 481  0299               LC002:
 482  0299 c75406        	ld	21510,a
 483  029c               L32:
 484                     ; 224 }
 485  029c 85            	popw	x
 486  029d 81            	ret	
 487  029e               LC004:
 488  029e 5f            	clrw	x
 489  029f 97            	ld	xl,a
 490  02a0 a601          	ld	a,#1
 491  02a2 5d            	tnzw	x
 492  02a3 81            	ret	
 493  02a4               LC005:
 494  02a4 89            	pushw	x
 495  02a5 5f            	clrw	x
 496  02a6 89            	pushw	x
 497  02a7 ae0000        	ldw	x,#L3
 498  02aa cd0000        	call	_assert_failed
 500  02ad 5b04          	addw	sp,#4
 501  02af 81            	ret	
 503                     ; 236 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
 503                     ; 237 {
 504  02b0               _ADC2_ConversionConfig:
 505  02b0 89            	pushw	x
 506       00000000      OFST:	set	0
 508                     ; 239   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 509  02b1 9e            	ld	a,xh
 510  02b2 4d            	tnz	a
 511  02b3 270a          	jreq	L422
 512  02b5 9e            	ld	a,xh
 513  02b6 4a            	dec	a
 514  02b7 2706          	jreq	L422
 515  02b9 ae00ef        	ldw	x,#239
 516  02bc cd033e        	call	LC006
 517  02bf               L422:
 518                     ; 240   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 519  02bf 7b02          	ld	a,(OFST+2,sp)
 520  02c1 2741          	jreq	L432
 521  02c3 a101          	cp	a,#1
 522  02c5 273d          	jreq	L432
 523  02c7 a102          	cp	a,#2
 524  02c9 2739          	jreq	L432
 525  02cb a103          	cp	a,#3
 526  02cd 2735          	jreq	L432
 527  02cf a104          	cp	a,#4
 528  02d1 2731          	jreq	L432
 529  02d3 a105          	cp	a,#5
 530  02d5 272d          	jreq	L432
 531  02d7 a106          	cp	a,#6
 532  02d9 2729          	jreq	L432
 533  02db a107          	cp	a,#7
 534  02dd 2725          	jreq	L432
 535  02df a108          	cp	a,#8
 536  02e1 2721          	jreq	L432
 537  02e3 a109          	cp	a,#9
 538  02e5 271d          	jreq	L432
 539  02e7 a10a          	cp	a,#10
 540  02e9 2719          	jreq	L432
 541  02eb a10b          	cp	a,#11
 542  02ed 2715          	jreq	L432
 543  02ef a10c          	cp	a,#12
 544  02f1 2711          	jreq	L432
 545  02f3 a10d          	cp	a,#13
 546  02f5 270d          	jreq	L432
 547  02f7 a10e          	cp	a,#14
 548  02f9 2709          	jreq	L432
 549  02fb a10f          	cp	a,#15
 550  02fd 2705          	jreq	L432
 551  02ff ae00f0        	ldw	x,#240
 552  0302 ad3a          	call	LC006
 553  0304               L432:
 554                     ; 241   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 555  0304 7b05          	ld	a,(OFST+5,sp)
 556  0306 2709          	jreq	L442
 557  0308 a108          	cp	a,#8
 558  030a 2705          	jreq	L442
 559  030c ae00f1        	ldw	x,#241
 560  030f ad2d          	call	LC006
 561  0311               L442:
 562                     ; 244   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
 563  0311 72175402      	bres	21506,#3
 564                     ; 246   ADC2->CR2 |= (uint8_t)(ADC2_Align);
 565  0315 c65402        	ld	a,21506
 566  0318 1a05          	or	a,(OFST+5,sp)
 567  031a c75402        	ld	21506,a
 568                     ; 248   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
 569  031d 7b01          	ld	a,(OFST+1,sp)
 570  031f 4a            	dec	a
 571  0320 2606          	jrne	L14
 572                     ; 251     ADC2->CR1 |= ADC2_CR1_CONT;
 573  0322 72125401      	bset	21505,#1
 575  0326 2004          	jra	L34
 576  0328               L14:
 577                     ; 256     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
 578  0328 72135401      	bres	21505,#1
 579  032c               L34:
 580                     ; 260   ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
 581  032c c65400        	ld	a,21504
 582  032f a4f0          	and	a,#240
 583  0331 c75400        	ld	21504,a
 584                     ; 262   ADC2->CSR |= (uint8_t)(ADC2_Channel);
 585  0334 c65400        	ld	a,21504
 586  0337 1a02          	or	a,(OFST+2,sp)
 587  0339 c75400        	ld	21504,a
 588                     ; 263 }
 589  033c 85            	popw	x
 590  033d 81            	ret	
 591  033e               LC006:
 592  033e 89            	pushw	x
 593  033f 5f            	clrw	x
 594  0340 89            	pushw	x
 595  0341 ae0000        	ldw	x,#L3
 596  0344 cd0000        	call	_assert_failed
 598  0347 5b04          	addw	sp,#4
 599  0349 81            	ret	
 601                     ; 275 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
 601                     ; 276 {
 602  034a               _ADC2_ExternalTriggerConfig:
 603  034a 89            	pushw	x
 604       00000000      OFST:	set	0
 606                     ; 278   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 607  034b 9e            	ld	a,xh
 608  034c 4d            	tnz	a
 609  034d 2709          	jreq	L652
 610  034f 9e            	ld	a,xh
 611  0350 4a            	dec	a
 612  0351 2705          	jreq	L652
 613  0353 ae0116        	ldw	x,#278
 614  0356 ad2c          	call	LC007
 615  0358               L652:
 616                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 617  0358 7b02          	ld	a,(OFST+2,sp)
 618  035a 2708          	jreq	L662
 619  035c 4a            	dec	a
 620  035d 2705          	jreq	L662
 621  035f ae0117        	ldw	x,#279
 622  0362 ad20          	call	LC007
 623  0364               L662:
 624                     ; 282   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
 625  0364 c65402        	ld	a,21506
 626  0367 a4cf          	and	a,#207
 627  0369 c75402        	ld	21506,a
 628                     ; 284   if (NewState != DISABLE)
 629  036c 7b02          	ld	a,(OFST+2,sp)
 630  036e 2706          	jreq	L54
 631                     ; 287     ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
 632  0370 721c5402      	bset	21506,#6
 634  0374 2004          	jra	L74
 635  0376               L54:
 636                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
 637  0376 721d5402      	bres	21506,#6
 638  037a               L74:
 639                     ; 296   ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
 640  037a c65402        	ld	a,21506
 641  037d 1a01          	or	a,(OFST+1,sp)
 642  037f c75402        	ld	21506,a
 643                     ; 297 }
 644  0382 85            	popw	x
 645  0383 81            	ret	
 646  0384               LC007:
 647  0384 89            	pushw	x
 648  0385 5f            	clrw	x
 649  0386 89            	pushw	x
 650  0387 ae0000        	ldw	x,#L3
 651  038a cd0000        	call	_assert_failed
 653  038d 5b04          	addw	sp,#4
 654  038f 81            	ret	
 656                     ; 308 void ADC2_StartConversion(void)
 656                     ; 309 {
 657  0390               _ADC2_StartConversion:
 659                     ; 310   ADC2->CR1 |= ADC2_CR1_ADON;
 660  0390 72105401      	bset	21505,#0
 661                     ; 311 }
 662  0394 81            	ret	
 664                     ; 320 uint16_t ADC2_GetConversionValue(void)
 664                     ; 321 {
 665  0395               _ADC2_GetConversionValue:
 666  0395 5205          	subw	sp,#5
 667       00000005      OFST:	set	5
 669                     ; 322   uint16_t temph = 0;
 670                     ; 323   uint8_t templ = 0;
 671                     ; 325   if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
 672  0397 720754020e    	btjf	21506,#3,L15
 673                     ; 328     templ = ADC2->DRL;
 674  039c c65405        	ld	a,21509
 675  039f 6b03          	ld	(OFST-2,sp),a
 676                     ; 330     temph = ADC2->DRH;
 677  03a1 c65404        	ld	a,21508
 678  03a4 97            	ld	xl,a
 679                     ; 332     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
 680  03a5 7b03          	ld	a,(OFST-2,sp)
 681  03a7 02            	rlwa	x,a
 683  03a8 201a          	jra	L35
 684  03aa               L15:
 685                     ; 337     temph = ADC2->DRH;
 686  03aa c65404        	ld	a,21508
 687  03ad 97            	ld	xl,a
 688                     ; 339     templ = ADC2->DRL;
 689  03ae c65405        	ld	a,21509
 690  03b1 6b03          	ld	(OFST-2,sp),a
 691                     ; 341     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
 692  03b3 4f            	clr	a
 693  03b4 02            	rlwa	x,a
 694  03b5 1f01          	ldw	(OFST-4,sp),x
 695  03b7 7b03          	ld	a,(OFST-2,sp)
 696  03b9 97            	ld	xl,a
 697  03ba a640          	ld	a,#64
 698  03bc 42            	mul	x,a
 699  03bd 01            	rrwa	x,a
 700  03be 1a02          	or	a,(OFST-3,sp)
 701  03c0 01            	rrwa	x,a
 702  03c1 1a01          	or	a,(OFST-4,sp)
 703  03c3 01            	rrwa	x,a
 704  03c4               L35:
 705                     ; 344   return ((uint16_t)temph);
 707  03c4 5b05          	addw	sp,#5
 708  03c6 81            	ret	
 710                     ; 352 FlagStatus ADC2_GetFlagStatus(void)
 710                     ; 353 {
 711  03c7               _ADC2_GetFlagStatus:
 713                     ; 355   return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
 714  03c7 c65400        	ld	a,21504
 715  03ca a480          	and	a,#128
 717  03cc 81            	ret	
 719                     ; 363 void ADC2_ClearFlag(void)
 719                     ; 364 {
 720  03cd               _ADC2_ClearFlag:
 722                     ; 365   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
 723  03cd 721f5400      	bres	21504,#7
 724                     ; 366 }
 725  03d1 81            	ret	
 727                     ; 374 ITStatus ADC2_GetITStatus(void)
 727                     ; 375 {
 728  03d2               _ADC2_GetITStatus:
 730                     ; 376   return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
 731  03d2 c65400        	ld	a,21504
 732  03d5 a480          	and	a,#128
 734  03d7 81            	ret	
 736                     ; 384 void ADC2_ClearITPendingBit(void)
 736                     ; 385 {
 737  03d8               _ADC2_ClearITPendingBit:
 739                     ; 386   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
 740  03d8 721f5400      	bres	21504,#7
 741                     ; 387 }
 742  03dc 81            	ret	
 744                     	xdef	_ADC2_ClearITPendingBit
 745                     	xdef	_ADC2_GetITStatus
 746                     	xdef	_ADC2_ClearFlag
 747                     	xdef	_ADC2_GetFlagStatus
 748                     	xdef	_ADC2_GetConversionValue
 749                     	xdef	_ADC2_StartConversion
 750                     	xdef	_ADC2_ExternalTriggerConfig
 751                     	xdef	_ADC2_ConversionConfig
 752                     	xdef	_ADC2_SchmittTriggerConfig
 753                     	xdef	_ADC2_PrescalerConfig
 754                     	xdef	_ADC2_ITConfig
 755                     	xdef	_ADC2_Cmd
 756                     	xdef	_ADC2_Init
 757                     	xdef	_ADC2_DeInit
 758                     	xref	_assert_failed
 759                     .const:	section	.text
 760  0000               L3:
 761  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 762  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 763  0024 38735f616463  	dc.b	"8s_adc2.c",0
 764                     	end
