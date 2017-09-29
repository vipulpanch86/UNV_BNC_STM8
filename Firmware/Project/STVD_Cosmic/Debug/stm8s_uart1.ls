   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 53 void UART1_DeInit(void)
  20                     ; 54 {
  21                     	scross	off
  22  0000               _UART1_DeInit:
  24                     ; 57   (void)UART1->SR;
  25  0000 c65230        	ld	a,21040
  26                     ; 58   (void)UART1->DR;
  27  0003 c65231        	ld	a,21041
  28                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  29  0006 725f5233      	clr	21043
  30                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  31  000a 725f5232      	clr	21042
  32                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  33  000e 725f5234      	clr	21044
  34                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  35  0012 725f5235      	clr	21045
  36                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  37  0016 725f5236      	clr	21046
  38                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  39  001a 725f5237      	clr	21047
  40                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  41  001e 725f5238      	clr	21048
  42                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  43  0022 725f5239      	clr	21049
  44                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  45  0026 725f523a      	clr	21050
  46                     ; 71 }
  47  002a 81            	ret	
  49                     .const:	section	.text
  50  0000               L01:
  51  0000 00098969      	dc.l	625001
  52  0004               L07:
  53  0004 00000064      	dc.l	100
  54                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
  54                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
  54                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
  54                     ; 93 {
  55                     	switch	.text
  56  002b               _UART1_Init:
  57  002b 520c          	subw	sp,#12
  58       0000000c      OFST:	set	12
  60                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
  62                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
  63  002d 96            	ldw	x,sp
  64  002e 1c000f        	addw	x,#OFST+3
  65  0031 cd0000        	call	c_ltor
  67  0034 ae0000        	ldw	x,#L01
  68  0037 cd0000        	call	c_lcmp
  70  003a 2506          	jrult	L21
  71  003c ae0061        	ldw	x,#97
  72  003f cd01e0        	call	LC001
  73  0042               L21:
  74                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
  75  0042 7b13          	ld	a,(OFST+7,sp)
  76  0044 270a          	jreq	L22
  77  0046 a110          	cp	a,#16
  78  0048 2706          	jreq	L22
  79  004a ae0062        	ldw	x,#98
  80  004d cd01e0        	call	LC001
  81  0050               L22:
  82                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
  83  0050 7b14          	ld	a,(OFST+8,sp)
  84  0052 2712          	jreq	L23
  85  0054 a110          	cp	a,#16
  86  0056 270e          	jreq	L23
  87  0058 a120          	cp	a,#32
  88  005a 270a          	jreq	L23
  89  005c a130          	cp	a,#48
  90  005e 2706          	jreq	L23
  91  0060 ae0063        	ldw	x,#99
  92  0063 cd01e0        	call	LC001
  93  0066               L23:
  94                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
  95  0066 7b15          	ld	a,(OFST+9,sp)
  96  0068 270e          	jreq	L24
  97  006a a104          	cp	a,#4
  98  006c 270a          	jreq	L24
  99  006e a106          	cp	a,#6
 100  0070 2706          	jreq	L24
 101  0072 ae0064        	ldw	x,#100
 102  0075 cd01e0        	call	LC001
 103  0078               L24:
 104                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 105  0078 7b17          	ld	a,(OFST+11,sp)
 106  007a a108          	cp	a,#8
 107  007c 2722          	jreq	L25
 108  007e a140          	cp	a,#64
 109  0080 271e          	jreq	L25
 110  0082 a104          	cp	a,#4
 111  0084 271a          	jreq	L25
 112  0086 a180          	cp	a,#128
 113  0088 2716          	jreq	L25
 114  008a a10c          	cp	a,#12
 115  008c 2712          	jreq	L25
 116  008e a144          	cp	a,#68
 117  0090 270e          	jreq	L25
 118  0092 a1c0          	cp	a,#192
 119  0094 270a          	jreq	L25
 120  0096 a188          	cp	a,#136
 121  0098 2706          	jreq	L25
 122  009a ae0065        	ldw	x,#101
 123  009d cd01e0        	call	LC001
 124  00a0               L25:
 125                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 126  00a0 7b16          	ld	a,(OFST+10,sp)
 127  00a2 a488          	and	a,#136
 128  00a4 a188          	cp	a,#136
 129  00a6 2718          	jreq	L65
 130  00a8 7b16          	ld	a,(OFST+10,sp)
 131  00aa a444          	and	a,#68
 132  00ac a144          	cp	a,#68
 133  00ae 2710          	jreq	L65
 134  00b0 7b16          	ld	a,(OFST+10,sp)
 135  00b2 a422          	and	a,#34
 136  00b4 a122          	cp	a,#34
 137  00b6 2708          	jreq	L65
 138  00b8 7b16          	ld	a,(OFST+10,sp)
 139  00ba a411          	and	a,#17
 140  00bc a111          	cp	a,#17
 141  00be 2606          	jrne	L06
 142  00c0               L65:
 143  00c0 ae0066        	ldw	x,#102
 144  00c3 cd01e0        	call	LC001
 145  00c6               L06:
 146                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 147  00c6 72195234      	bres	21044,#4
 148                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 149  00ca c65234        	ld	a,21044
 150  00cd 1a13          	or	a,(OFST+7,sp)
 151  00cf c75234        	ld	21044,a
 152                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 153  00d2 c65236        	ld	a,21046
 154  00d5 a4cf          	and	a,#207
 155  00d7 c75236        	ld	21046,a
 156                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 157  00da c65236        	ld	a,21046
 158  00dd 1a14          	or	a,(OFST+8,sp)
 159  00df c75236        	ld	21046,a
 160                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 161  00e2 c65234        	ld	a,21044
 162  00e5 a4f9          	and	a,#249
 163  00e7 c75234        	ld	21044,a
 164                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 165  00ea c65234        	ld	a,21044
 166  00ed 1a15          	or	a,(OFST+9,sp)
 167  00ef c75234        	ld	21044,a
 168                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 169  00f2 725f5232      	clr	21042
 170                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 171  00f6 c65233        	ld	a,21043
 172  00f9 a40f          	and	a,#15
 173  00fb c75233        	ld	21043,a
 174                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 175  00fe c65233        	ld	a,21043
 176  0101 a4f0          	and	a,#240
 177  0103 c75233        	ld	21043,a
 178                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 179  0106 96            	ldw	x,sp
 180  0107 cd01ec        	call	LC002
 182  010a 96            	ldw	x,sp
 183  010b 5c            	incw	x
 184  010c cd0000        	call	c_rtol
 186  010f cd0000        	call	_CLK_GetClockFreq
 188  0112 96            	ldw	x,sp
 189  0113 5c            	incw	x
 190  0114 cd0000        	call	c_ludv
 192  0117 96            	ldw	x,sp
 193  0118 1c0009        	addw	x,#OFST-3
 194  011b cd0000        	call	c_rtol
 196                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 197  011e 96            	ldw	x,sp
 198  011f cd01ec        	call	LC002
 200  0122 96            	ldw	x,sp
 201  0123 5c            	incw	x
 202  0124 cd0000        	call	c_rtol
 204  0127 cd0000        	call	_CLK_GetClockFreq
 206  012a a664          	ld	a,#100
 207  012c cd0000        	call	c_smul
 209  012f 96            	ldw	x,sp
 210  0130 5c            	incw	x
 211  0131 cd0000        	call	c_ludv
 213  0134 96            	ldw	x,sp
 214  0135 1c0005        	addw	x,#OFST-7
 215  0138 cd0000        	call	c_rtol
 217                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 218  013b 96            	ldw	x,sp
 219  013c 1c0009        	addw	x,#OFST-3
 220  013f cd0000        	call	c_ltor
 222  0142 a664          	ld	a,#100
 223  0144 cd0000        	call	c_smul
 225  0147 96            	ldw	x,sp
 226  0148 5c            	incw	x
 227  0149 cd0000        	call	c_rtol
 229  014c 96            	ldw	x,sp
 230  014d 1c0005        	addw	x,#OFST-7
 231  0150 cd0000        	call	c_ltor
 233  0153 96            	ldw	x,sp
 234  0154 5c            	incw	x
 235  0155 cd0000        	call	c_lsub
 237  0158 a604          	ld	a,#4
 238  015a cd0000        	call	c_llsh
 240  015d ae0004        	ldw	x,#L07
 241  0160 cd0000        	call	c_ludv
 243  0163 b603          	ld	a,c_lreg+3
 244  0165 a40f          	and	a,#15
 245  0167 ca5233        	or	a,21043
 246  016a c75233        	ld	21043,a
 247                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 248  016d 96            	ldw	x,sp
 249  016e 1c0009        	addw	x,#OFST-3
 250  0171 cd0000        	call	c_ltor
 252  0174 a604          	ld	a,#4
 253  0176 cd0000        	call	c_lursh
 255  0179 b603          	ld	a,c_lreg+3
 256  017b a4f0          	and	a,#240
 257  017d b703          	ld	c_lreg+3,a
 258  017f 3f02          	clr	c_lreg+2
 259  0181 3f01          	clr	c_lreg+1
 260  0183 3f00          	clr	c_lreg
 261  0185 ca5233        	or	a,21043
 262  0188 c75233        	ld	21043,a
 263                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 264  018b c65232        	ld	a,21042
 265  018e 1a0c          	or	a,(OFST+0,sp)
 266  0190 c75232        	ld	21042,a
 267                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 268  0193 c65235        	ld	a,21045
 269  0196 a4f3          	and	a,#243
 270  0198 c75235        	ld	21045,a
 271                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 272  019b c65236        	ld	a,21046
 273  019e a4f8          	and	a,#248
 274  01a0 c75236        	ld	21046,a
 275                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 275                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 276  01a3 7b16          	ld	a,(OFST+10,sp)
 277  01a5 a407          	and	a,#7
 278  01a7 ca5236        	or	a,21046
 279  01aa c75236        	ld	21046,a
 280                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 281  01ad 7b17          	ld	a,(OFST+11,sp)
 282  01af a504          	bcp	a,#4
 283  01b1 2706          	jreq	L5
 284                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 285  01b3 72165235      	bset	21045,#3
 287  01b7 2004          	jra	L7
 288  01b9               L5:
 289                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 290  01b9 72175235      	bres	21045,#3
 291  01bd               L7:
 292                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 293  01bd a508          	bcp	a,#8
 294  01bf 2706          	jreq	L11
 295                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 296  01c1 72145235      	bset	21045,#2
 298  01c5 2004          	jra	L31
 299  01c7               L11:
 300                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 301  01c7 72155235      	bres	21045,#2
 302  01cb               L31:
 303                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 304  01cb 7b16          	ld	a,(OFST+10,sp)
 305  01cd 2a06          	jrpl	L51
 306                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 307  01cf 72175236      	bres	21046,#3
 309  01d3 2008          	jra	L71
 310  01d5               L51:
 311                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 312  01d5 a408          	and	a,#8
 313  01d7 ca5236        	or	a,21046
 314  01da c75236        	ld	21046,a
 315  01dd               L71:
 316                     ; 176 }
 317  01dd 5b0c          	addw	sp,#12
 318  01df 81            	ret	
 319  01e0               LC001:
 320  01e0 89            	pushw	x
 321  01e1 5f            	clrw	x
 322  01e2 89            	pushw	x
 323  01e3 ae0008        	ldw	x,#L3
 324  01e6 cd0000        	call	_assert_failed
 326  01e9 5b04          	addw	sp,#4
 327  01eb 81            	ret	
 328  01ec               LC002:
 329  01ec 1c000f        	addw	x,#OFST+3
 330  01ef cd0000        	call	c_ltor
 332  01f2 a604          	ld	a,#4
 333  01f4 cc0000        	jp	c_llsh
 335                     ; 184 void UART1_Cmd(FunctionalState NewState)
 335                     ; 185 {
 336  01f7               _UART1_Cmd:
 338                     ; 186   if (NewState != DISABLE)
 339  01f7 4d            	tnz	a
 340  01f8 2705          	jreq	L12
 341                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 342  01fa 721b5234      	bres	21044,#5
 344  01fe 81            	ret	
 345  01ff               L12:
 346                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 347  01ff 721a5234      	bset	21044,#5
 348                     ; 196 }
 349  0203 81            	ret	
 351                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 351                     ; 212 {
 352  0204               _UART1_ITConfig:
 353  0204 89            	pushw	x
 354  0205 89            	pushw	x
 355       00000002      OFST:	set	2
 357                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 359                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 360  0206 a30100        	cpw	x,#256
 361  0209 271e          	jreq	L201
 362  020b a30277        	cpw	x,#631
 363  020e 2719          	jreq	L201
 364  0210 a30266        	cpw	x,#614
 365  0213 2714          	jreq	L201
 366  0215 a30205        	cpw	x,#517
 367  0218 270f          	jreq	L201
 368  021a a30244        	cpw	x,#580
 369  021d 270a          	jreq	L201
 370  021f a30346        	cpw	x,#838
 371  0222 2705          	jreq	L201
 372  0224 ae00d8        	ldw	x,#216
 373  0227 ad70          	call	LC006
 374  0229               L201:
 375                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 376  0229 7b07          	ld	a,(OFST+5,sp)
 377  022b 2708          	jreq	L211
 378  022d 4a            	dec	a
 379  022e 2705          	jreq	L211
 380  0230 ae00d9        	ldw	x,#217
 381  0233 ad64          	call	LC006
 382  0235               L211:
 383                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 384  0235 7b03          	ld	a,(OFST+1,sp)
 385  0237 6b01          	ld	(OFST-1,sp),a
 386                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 387  0239 7b04          	ld	a,(OFST+2,sp)
 388  023b a40f          	and	a,#15
 389  023d 5f            	clrw	x
 390  023e 97            	ld	xl,a
 391  023f a601          	ld	a,#1
 392  0241 5d            	tnzw	x
 393  0242 2704          	jreq	L611
 394  0244               L021:
 395  0244 48            	sll	a
 396  0245 5a            	decw	x
 397  0246 26fc          	jrne	L021
 398  0248               L611:
 399  0248 6b02          	ld	(OFST+0,sp),a
 400                     ; 224   if (NewState != DISABLE)
 401  024a 7b07          	ld	a,(OFST+5,sp)
 402  024c 271f          	jreq	L52
 403                     ; 227     if (uartreg == 0x01)
 404  024e 7b01          	ld	a,(OFST-1,sp)
 405  0250 a101          	cp	a,#1
 406  0252 2607          	jrne	L72
 407                     ; 229       UART1->CR1 |= itpos;
 408  0254 c65234        	ld	a,21044
 409  0257 1a02          	or	a,(OFST+0,sp)
 411  0259 201e          	jp	LC004
 412  025b               L72:
 413                     ; 231     else if (uartreg == 0x02)
 414  025b a102          	cp	a,#2
 415  025d 2607          	jrne	L33
 416                     ; 233       UART1->CR2 |= itpos;
 417  025f c65235        	ld	a,21045
 418  0262 1a02          	or	a,(OFST+0,sp)
 420  0264 2022          	jp	LC005
 421  0266               L33:
 422                     ; 237       UART1->CR4 |= itpos;
 423  0266 c65237        	ld	a,21047
 424  0269 1a02          	or	a,(OFST+0,sp)
 425  026b 2026          	jp	LC003
 426  026d               L52:
 427                     ; 243     if (uartreg == 0x01)
 428  026d 7b01          	ld	a,(OFST-1,sp)
 429  026f a101          	cp	a,#1
 430  0271 260b          	jrne	L14
 431                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 432  0273 7b02          	ld	a,(OFST+0,sp)
 433  0275 43            	cpl	a
 434  0276 c45234        	and	a,21044
 435  0279               LC004:
 436  0279 c75234        	ld	21044,a
 438  027c 2018          	jra	L73
 439  027e               L14:
 440                     ; 247     else if (uartreg == 0x02)
 441  027e a102          	cp	a,#2
 442  0280 260b          	jrne	L54
 443                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 444  0282 7b02          	ld	a,(OFST+0,sp)
 445  0284 43            	cpl	a
 446  0285 c45235        	and	a,21045
 447  0288               LC005:
 448  0288 c75235        	ld	21045,a
 450  028b 2009          	jra	L73
 451  028d               L54:
 452                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 453  028d 7b02          	ld	a,(OFST+0,sp)
 454  028f 43            	cpl	a
 455  0290 c45237        	and	a,21047
 456  0293               LC003:
 457  0293 c75237        	ld	21047,a
 458  0296               L73:
 459                     ; 257 }
 460  0296 5b04          	addw	sp,#4
 461  0298 81            	ret	
 462  0299               LC006:
 463  0299 89            	pushw	x
 464  029a 5f            	clrw	x
 465  029b 89            	pushw	x
 466  029c ae0008        	ldw	x,#L3
 467  029f cd0000        	call	_assert_failed
 469  02a2 5b04          	addw	sp,#4
 470  02a4 81            	ret	
 472                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 472                     ; 266 {
 473  02a5               _UART1_HalfDuplexCmd:
 474  02a5 88            	push	a
 475       00000000      OFST:	set	0
 477                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478  02a6 4d            	tnz	a
 479  02a7 2711          	jreq	L031
 480  02a9 4a            	dec	a
 481  02aa 270e          	jreq	L031
 482  02ac ae010b        	ldw	x,#267
 483  02af 89            	pushw	x
 484  02b0 5f            	clrw	x
 485  02b1 89            	pushw	x
 486  02b2 ae0008        	ldw	x,#L3
 487  02b5 cd0000        	call	_assert_failed
 489  02b8 5b04          	addw	sp,#4
 490  02ba               L031:
 491                     ; 269   if (NewState != DISABLE)
 492  02ba 7b01          	ld	a,(OFST+1,sp)
 493  02bc 2706          	jreq	L15
 494                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 495  02be 72165238      	bset	21048,#3
 497  02c2 2004          	jra	L35
 498  02c4               L15:
 499                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 500  02c4 72175238      	bres	21048,#3
 501  02c8               L35:
 502                     ; 277 }
 503  02c8 84            	pop	a
 504  02c9 81            	ret	
 506                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
 506                     ; 286 {
 507  02ca               _UART1_IrDAConfig:
 508  02ca 88            	push	a
 509       00000000      OFST:	set	0
 511                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
 512  02cb a101          	cp	a,#1
 513  02cd 2711          	jreq	L241
 514  02cf 4d            	tnz	a
 515  02d0 270e          	jreq	L241
 516  02d2 ae011f        	ldw	x,#287
 517  02d5 89            	pushw	x
 518  02d6 5f            	clrw	x
 519  02d7 89            	pushw	x
 520  02d8 ae0008        	ldw	x,#L3
 521  02db cd0000        	call	_assert_failed
 523  02de 5b04          	addw	sp,#4
 524  02e0               L241:
 525                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
 526  02e0 7b01          	ld	a,(OFST+1,sp)
 527  02e2 2706          	jreq	L55
 528                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
 529  02e4 72145238      	bset	21048,#2
 531  02e8 2004          	jra	L75
 532  02ea               L55:
 533                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
 534  02ea 72155238      	bres	21048,#2
 535  02ee               L75:
 536                     ; 297 }
 537  02ee 84            	pop	a
 538  02ef 81            	ret	
 540                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
 540                     ; 306 {
 541  02f0               _UART1_IrDACmd:
 542  02f0 88            	push	a
 543       00000000      OFST:	set	0
 545                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 546  02f1 4d            	tnz	a
 547  02f2 2711          	jreq	L451
 548  02f4 4a            	dec	a
 549  02f5 270e          	jreq	L451
 550  02f7 ae0134        	ldw	x,#308
 551  02fa 89            	pushw	x
 552  02fb 5f            	clrw	x
 553  02fc 89            	pushw	x
 554  02fd ae0008        	ldw	x,#L3
 555  0300 cd0000        	call	_assert_failed
 557  0303 5b04          	addw	sp,#4
 558  0305               L451:
 559                     ; 310   if (NewState != DISABLE)
 560  0305 7b01          	ld	a,(OFST+1,sp)
 561  0307 2706          	jreq	L16
 562                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
 563  0309 72125238      	bset	21048,#1
 565  030d 2004          	jra	L36
 566  030f               L16:
 567                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
 568  030f 72135238      	bres	21048,#1
 569  0313               L36:
 570                     ; 320 }
 571  0313 84            	pop	a
 572  0314 81            	ret	
 574                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
 574                     ; 330 {
 575  0315               _UART1_LINBreakDetectionConfig:
 576  0315 88            	push	a
 577       00000000      OFST:	set	0
 579                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
 580  0316 4d            	tnz	a
 581  0317 2711          	jreq	L661
 582  0319 4a            	dec	a
 583  031a 270e          	jreq	L661
 584  031c ae014b        	ldw	x,#331
 585  031f 89            	pushw	x
 586  0320 5f            	clrw	x
 587  0321 89            	pushw	x
 588  0322 ae0008        	ldw	x,#L3
 589  0325 cd0000        	call	_assert_failed
 591  0328 5b04          	addw	sp,#4
 592  032a               L661:
 593                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
 594  032a 7b01          	ld	a,(OFST+1,sp)
 595  032c 2706          	jreq	L56
 596                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
 597  032e 721a5237      	bset	21047,#5
 599  0332 2004          	jra	L76
 600  0334               L56:
 601                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
 602  0334 721b5237      	bres	21047,#5
 603  0338               L76:
 604                     ; 341 }
 605  0338 84            	pop	a
 606  0339 81            	ret	
 608                     ; 349 void UART1_LINCmd(FunctionalState NewState)
 608                     ; 350 {
 609  033a               _UART1_LINCmd:
 610  033a 88            	push	a
 611       00000000      OFST:	set	0
 613                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 614  033b 4d            	tnz	a
 615  033c 2711          	jreq	L002
 616  033e 4a            	dec	a
 617  033f 270e          	jreq	L002
 618  0341 ae015f        	ldw	x,#351
 619  0344 89            	pushw	x
 620  0345 5f            	clrw	x
 621  0346 89            	pushw	x
 622  0347 ae0008        	ldw	x,#L3
 623  034a cd0000        	call	_assert_failed
 625  034d 5b04          	addw	sp,#4
 626  034f               L002:
 627                     ; 353   if (NewState != DISABLE)
 628  034f 7b01          	ld	a,(OFST+1,sp)
 629  0351 2706          	jreq	L17
 630                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
 631  0353 721c5236      	bset	21046,#6
 633  0357 2004          	jra	L37
 634  0359               L17:
 635                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
 636  0359 721d5236      	bres	21046,#6
 637  035d               L37:
 638                     ; 363 }
 639  035d 84            	pop	a
 640  035e 81            	ret	
 642                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
 642                     ; 372 {
 643  035f               _UART1_SmartCardCmd:
 644  035f 88            	push	a
 645       00000000      OFST:	set	0
 647                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 648  0360 4d            	tnz	a
 649  0361 2711          	jreq	L212
 650  0363 4a            	dec	a
 651  0364 270e          	jreq	L212
 652  0366 ae0175        	ldw	x,#373
 653  0369 89            	pushw	x
 654  036a 5f            	clrw	x
 655  036b 89            	pushw	x
 656  036c ae0008        	ldw	x,#L3
 657  036f cd0000        	call	_assert_failed
 659  0372 5b04          	addw	sp,#4
 660  0374               L212:
 661                     ; 375   if (NewState != DISABLE)
 662  0374 7b01          	ld	a,(OFST+1,sp)
 663  0376 2706          	jreq	L57
 664                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
 665  0378 721a5238      	bset	21048,#5
 667  037c 2004          	jra	L77
 668  037e               L57:
 669                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
 670  037e 721b5238      	bres	21048,#5
 671  0382               L77:
 672                     ; 385 }
 673  0382 84            	pop	a
 674  0383 81            	ret	
 676                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
 676                     ; 395 {
 677  0384               _UART1_SmartCardNACKCmd:
 678  0384 88            	push	a
 679       00000000      OFST:	set	0
 681                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 682  0385 4d            	tnz	a
 683  0386 2711          	jreq	L422
 684  0388 4a            	dec	a
 685  0389 270e          	jreq	L422
 686  038b ae018c        	ldw	x,#396
 687  038e 89            	pushw	x
 688  038f 5f            	clrw	x
 689  0390 89            	pushw	x
 690  0391 ae0008        	ldw	x,#L3
 691  0394 cd0000        	call	_assert_failed
 693  0397 5b04          	addw	sp,#4
 694  0399               L422:
 695                     ; 398   if (NewState != DISABLE)
 696  0399 7b01          	ld	a,(OFST+1,sp)
 697  039b 2706          	jreq	L101
 698                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
 699  039d 72185238      	bset	21048,#4
 701  03a1 2004          	jra	L301
 702  03a3               L101:
 703                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
 704  03a3 72195238      	bres	21048,#4
 705  03a7               L301:
 706                     ; 408 }
 707  03a7 84            	pop	a
 708  03a8 81            	ret	
 710                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
 710                     ; 417 {
 711  03a9               _UART1_WakeUpConfig:
 712  03a9 88            	push	a
 713       00000000      OFST:	set	0
 715                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
 716  03aa 4d            	tnz	a
 717  03ab 2712          	jreq	L632
 718  03ad a108          	cp	a,#8
 719  03af 270e          	jreq	L632
 720  03b1 ae01a2        	ldw	x,#418
 721  03b4 89            	pushw	x
 722  03b5 5f            	clrw	x
 723  03b6 89            	pushw	x
 724  03b7 ae0008        	ldw	x,#L3
 725  03ba cd0000        	call	_assert_failed
 727  03bd 5b04          	addw	sp,#4
 728  03bf               L632:
 729                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
 730  03bf 72175234      	bres	21044,#3
 731                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
 732  03c3 c65234        	ld	a,21044
 733  03c6 1a01          	or	a,(OFST+1,sp)
 734  03c8 c75234        	ld	21044,a
 735                     ; 422 }
 736  03cb 84            	pop	a
 737  03cc 81            	ret	
 739                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
 739                     ; 431 {
 740  03cd               _UART1_ReceiverWakeUpCmd:
 741  03cd 88            	push	a
 742       00000000      OFST:	set	0
 744                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 745  03ce 4d            	tnz	a
 746  03cf 2711          	jreq	L052
 747  03d1 4a            	dec	a
 748  03d2 270e          	jreq	L052
 749  03d4 ae01b0        	ldw	x,#432
 750  03d7 89            	pushw	x
 751  03d8 5f            	clrw	x
 752  03d9 89            	pushw	x
 753  03da ae0008        	ldw	x,#L3
 754  03dd cd0000        	call	_assert_failed
 756  03e0 5b04          	addw	sp,#4
 757  03e2               L052:
 758                     ; 434   if (NewState != DISABLE)
 759  03e2 7b01          	ld	a,(OFST+1,sp)
 760  03e4 2706          	jreq	L501
 761                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
 762  03e6 72125235      	bset	21045,#1
 764  03ea 2004          	jra	L701
 765  03ec               L501:
 766                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
 767  03ec 72135235      	bres	21045,#1
 768  03f0               L701:
 769                     ; 444 }
 770  03f0 84            	pop	a
 771  03f1 81            	ret	
 773                     ; 451 uint8_t UART1_ReceiveData8(void)
 773                     ; 452 {
 774  03f2               _UART1_ReceiveData8:
 776                     ; 453   return ((uint8_t)UART1->DR);
 777  03f2 c65231        	ld	a,21041
 779  03f5 81            	ret	
 781                     ; 461 uint16_t UART1_ReceiveData9(void)
 781                     ; 462 {
 782  03f6               _UART1_ReceiveData9:
 783  03f6 89            	pushw	x
 784       00000002      OFST:	set	2
 786                     ; 463   uint16_t temp = 0;
 787                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
 788  03f7 c65234        	ld	a,21044
 789  03fa a480          	and	a,#128
 790  03fc 5f            	clrw	x
 791  03fd 02            	rlwa	x,a
 792  03fe 58            	sllw	x
 793  03ff 1f01          	ldw	(OFST-1,sp),x
 794                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
 795  0401 c65231        	ld	a,21041
 796  0404 5f            	clrw	x
 797  0405 97            	ld	xl,a
 798  0406 01            	rrwa	x,a
 799  0407 1a02          	or	a,(OFST+0,sp)
 800  0409 01            	rrwa	x,a
 801  040a 1a01          	or	a,(OFST-1,sp)
 802  040c a401          	and	a,#1
 803  040e 01            	rrwa	x,a
 805  040f 5b02          	addw	sp,#2
 806  0411 81            	ret	
 808                     ; 474 void UART1_SendData8(uint8_t Data)
 808                     ; 475 {
 809  0412               _UART1_SendData8:
 811                     ; 477   UART1->DR = Data;
 812  0412 c75231        	ld	21041,a
 813                     ; 478 }
 814  0415 81            	ret	
 816                     ; 486 void UART1_SendData9(uint16_t Data)
 816                     ; 487 {
 817  0416               _UART1_SendData9:
 818  0416 89            	pushw	x
 819       00000000      OFST:	set	0
 821                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
 822  0417 721d5234      	bres	21044,#6
 823                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
 824  041b 54            	srlw	x
 825  041c 54            	srlw	x
 826  041d 9f            	ld	a,xl
 827  041e a440          	and	a,#64
 828  0420 ca5234        	or	a,21044
 829  0423 c75234        	ld	21044,a
 830                     ; 493   UART1->DR   = (uint8_t)(Data);
 831  0426 7b02          	ld	a,(OFST+2,sp)
 832  0428 c75231        	ld	21041,a
 833                     ; 494 }
 834  042b 85            	popw	x
 835  042c 81            	ret	
 837                     ; 501 void UART1_SendBreak(void)
 837                     ; 502 {
 838  042d               _UART1_SendBreak:
 840                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
 841  042d 72105235      	bset	21045,#0
 842                     ; 504 }
 843  0431 81            	ret	
 845                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
 845                     ; 512 {
 846  0432               _UART1_SetAddress:
 847  0432 88            	push	a
 848       00000000      OFST:	set	0
 850                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
 851  0433 a110          	cp	a,#16
 852  0435 250e          	jrult	L272
 853  0437 ae0202        	ldw	x,#514
 854  043a 89            	pushw	x
 855  043b 5f            	clrw	x
 856  043c 89            	pushw	x
 857  043d ae0008        	ldw	x,#L3
 858  0440 cd0000        	call	_assert_failed
 860  0443 5b04          	addw	sp,#4
 861  0445               L272:
 862                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
 863  0445 c65237        	ld	a,21047
 864  0448 a4f0          	and	a,#240
 865  044a c75237        	ld	21047,a
 866                     ; 519   UART1->CR4 |= UART1_Address;
 867  044d c65237        	ld	a,21047
 868  0450 1a01          	or	a,(OFST+1,sp)
 869  0452 c75237        	ld	21047,a
 870                     ; 520 }
 871  0455 84            	pop	a
 872  0456 81            	ret	
 874                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
 874                     ; 529 {
 875  0457               _UART1_SetGuardTime:
 877                     ; 531   UART1->GTR = UART1_GuardTime;
 878  0457 c75239        	ld	21049,a
 879                     ; 532 }
 880  045a 81            	ret	
 882                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
 882                     ; 557 {
 883  045b               _UART1_SetPrescaler:
 885                     ; 559   UART1->PSCR = UART1_Prescaler;
 886  045b c7523a        	ld	21050,a
 887                     ; 560 }
 888  045e 81            	ret	
 890                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
 890                     ; 569 {
 891  045f               _UART1_GetFlagStatus:
 892  045f 89            	pushw	x
 893  0460 88            	push	a
 894       00000001      OFST:	set	1
 896                     ; 570   FlagStatus status = RESET;
 897                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
 898  0461 a30080        	cpw	x,#128
 899  0464 273b          	jreq	L013
 900  0466 a30040        	cpw	x,#64
 901  0469 2736          	jreq	L013
 902  046b a30020        	cpw	x,#32
 903  046e 2731          	jreq	L013
 904  0470 a30010        	cpw	x,#16
 905  0473 272c          	jreq	L013
 906  0475 a30008        	cpw	x,#8
 907  0478 2727          	jreq	L013
 908  047a a30004        	cpw	x,#4
 909  047d 2722          	jreq	L013
 910  047f a30002        	cpw	x,#2
 911  0482 271d          	jreq	L013
 912  0484 a30001        	cpw	x,#1
 913  0487 2718          	jreq	L013
 914  0489 a30101        	cpw	x,#257
 915  048c 2713          	jreq	L013
 916  048e a30210        	cpw	x,#528
 917  0491 270e          	jreq	L013
 918  0493 ae023d        	ldw	x,#573
 919  0496 89            	pushw	x
 920  0497 5f            	clrw	x
 921  0498 89            	pushw	x
 922  0499 ae0008        	ldw	x,#L3
 923  049c cd0000        	call	_assert_failed
 925  049f 5b04          	addw	sp,#4
 926  04a1               L013:
 927                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
 928  04a1 1e02          	ldw	x,(OFST+1,sp)
 929  04a3 a30210        	cpw	x,#528
 930  04a6 2605          	jrne	L111
 931                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 932  04a8 c65237        	ld	a,21047
 933                     ; 582       status = SET;
 935  04ab 2008          	jp	LC009
 936                     ; 587       status = RESET;
 937  04ad               L111:
 938                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
 939  04ad a30101        	cpw	x,#257
 940  04b0 260b          	jrne	L121
 941                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 942  04b2 c65235        	ld	a,21045
 943  04b5               LC009:
 944  04b5 1503          	bcp	a,(OFST+2,sp)
 945  04b7 270b          	jreq	L131
 946                     ; 595       status = SET;
 947  04b9               LC008:
 948  04b9 a601          	ld	a,#1
 950  04bb 2008          	jra	L711
 951                     ; 600       status = RESET;
 952  04bd               L121:
 953                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
 954  04bd c65230        	ld	a,21040
 955  04c0 1503          	bcp	a,(OFST+2,sp)
 956                     ; 608       status = SET;
 958  04c2 26f5          	jrne	LC008
 959  04c4               L131:
 960                     ; 613       status = RESET;
 961  04c4 4f            	clr	a
 962  04c5               L711:
 963                     ; 617   return status;
 965  04c5 5b03          	addw	sp,#3
 966  04c7 81            	ret	
 968                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
 968                     ; 647 {
 969  04c8               _UART1_ClearFlag:
 970  04c8 89            	pushw	x
 971       00000000      OFST:	set	0
 973                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
 974  04c9 a30020        	cpw	x,#32
 975  04cc 2713          	jreq	L223
 976  04ce a30210        	cpw	x,#528
 977  04d1 270e          	jreq	L223
 978  04d3 ae0288        	ldw	x,#648
 979  04d6 89            	pushw	x
 980  04d7 5f            	clrw	x
 981  04d8 89            	pushw	x
 982  04d9 ae0008        	ldw	x,#L3
 983  04dc cd0000        	call	_assert_failed
 985  04df 5b04          	addw	sp,#4
 986  04e1               L223:
 987                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
 988  04e1 1e01          	ldw	x,(OFST+1,sp)
 989  04e3 a30020        	cpw	x,#32
 990  04e6 2606          	jrne	L531
 991                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
 992  04e8 35df5230      	mov	21040,#223
 994  04ec 2004          	jra	L731
 995  04ee               L531:
 996                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
 997  04ee 72195237      	bres	21047,#4
 998  04f2               L731:
 999                     ; 660 }
1000  04f2 85            	popw	x
1001  04f3 81            	ret	
1003                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
1003                     ; 676 {
1004  04f4               _UART1_GetITStatus:
1005  04f4 89            	pushw	x
1006  04f5 89            	pushw	x
1007       00000002      OFST:	set	2
1009                     ; 677   ITStatus pendingbitstatus = RESET;
1010                     ; 678   uint8_t itpos = 0;
1011                     ; 679   uint8_t itmask1 = 0;
1012                     ; 680   uint8_t itmask2 = 0;
1013                     ; 681   uint8_t enablestatus = 0;
1014                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
1015  04f6 a30277        	cpw	x,#631
1016  04f9 272c          	jreq	L433
1017  04fb a30266        	cpw	x,#614
1018  04fe 2727          	jreq	L433
1019  0500 a30255        	cpw	x,#597
1020  0503 2722          	jreq	L433
1021  0505 a30244        	cpw	x,#580
1022  0508 271d          	jreq	L433
1023  050a a30235        	cpw	x,#565
1024  050d 2718          	jreq	L433
1025  050f a30346        	cpw	x,#838
1026  0512 2713          	jreq	L433
1027  0514 a30100        	cpw	x,#256
1028  0517 270e          	jreq	L433
1029  0519 ae02ac        	ldw	x,#684
1030  051c 89            	pushw	x
1031  051d 5f            	clrw	x
1032  051e 89            	pushw	x
1033  051f ae0008        	ldw	x,#L3
1034  0522 cd0000        	call	_assert_failed
1036  0525 5b04          	addw	sp,#4
1037  0527               L433:
1038                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1039  0527 7b04          	ld	a,(OFST+2,sp)
1040  0529 a40f          	and	a,#15
1041  052b 5f            	clrw	x
1042  052c 97            	ld	xl,a
1043  052d a601          	ld	a,#1
1044  052f 5d            	tnzw	x
1045  0530 2704          	jreq	L043
1046  0532               L243:
1047  0532 48            	sll	a
1048  0533 5a            	decw	x
1049  0534 26fc          	jrne	L243
1050  0536               L043:
1051  0536 6b01          	ld	(OFST-1,sp),a
1052                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
1053  0538 7b04          	ld	a,(OFST+2,sp)
1054  053a 4e            	swap	a
1055  053b a40f          	and	a,#15
1056  053d 6b02          	ld	(OFST+0,sp),a
1057                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1058  053f 5f            	clrw	x
1059  0540 97            	ld	xl,a
1060  0541 a601          	ld	a,#1
1061  0543 5d            	tnzw	x
1062  0544 2704          	jreq	L443
1063  0546               L643:
1064  0546 48            	sll	a
1065  0547 5a            	decw	x
1066  0548 26fc          	jrne	L643
1067  054a               L443:
1068  054a 6b02          	ld	(OFST+0,sp),a
1069                     ; 695   if (UART1_IT == UART1_IT_PE)
1070  054c 1e03          	ldw	x,(OFST+1,sp)
1071  054e a30100        	cpw	x,#256
1072  0551 260c          	jrne	L141
1073                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
1074  0553 c65234        	ld	a,21044
1075  0556 1402          	and	a,(OFST+0,sp)
1076  0558 6b02          	ld	(OFST+0,sp),a
1077                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
1078  055a c65230        	ld	a,21040
1080                     ; 704       pendingbitstatus = SET;
1082  055d 200f          	jp	LC012
1083                     ; 709       pendingbitstatus = RESET;
1084  055f               L141:
1085                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
1086  055f a30346        	cpw	x,#838
1087  0562 2616          	jrne	L151
1088                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
1089  0564 c65237        	ld	a,21047
1090  0567 1402          	and	a,(OFST+0,sp)
1091  0569 6b02          	ld	(OFST+0,sp),a
1092                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
1093  056b c65237        	ld	a,21047
1095  056e               LC012:
1096  056e 1501          	bcp	a,(OFST-1,sp)
1097  0570 271a          	jreq	L161
1098  0572 7b02          	ld	a,(OFST+0,sp)
1099  0574 2716          	jreq	L161
1100                     ; 721       pendingbitstatus = SET;
1101  0576               LC011:
1102  0576 a601          	ld	a,#1
1104  0578 2013          	jra	L741
1105                     ; 726       pendingbitstatus = RESET;
1106  057a               L151:
1107                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
1108  057a c65235        	ld	a,21045
1109  057d 1402          	and	a,(OFST+0,sp)
1110  057f 6b02          	ld	(OFST+0,sp),a
1111                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
1112  0581 c65230        	ld	a,21040
1113  0584 1501          	bcp	a,(OFST-1,sp)
1114  0586 2704          	jreq	L161
1116  0588 7b02          	ld	a,(OFST+0,sp)
1117                     ; 737       pendingbitstatus = SET;
1119  058a 26ea          	jrne	LC011
1120  058c               L161:
1121                     ; 742       pendingbitstatus = RESET;
1122  058c 4f            	clr	a
1123  058d               L741:
1124                     ; 747   return  pendingbitstatus;
1126  058d 5b04          	addw	sp,#4
1127  058f 81            	ret	
1129                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
1129                     ; 776 {
1130  0590               _UART1_ClearITPendingBit:
1131  0590 89            	pushw	x
1132       00000000      OFST:	set	0
1134                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
1135  0591 a30255        	cpw	x,#597
1136  0594 2713          	jreq	L653
1137  0596 a30346        	cpw	x,#838
1138  0599 270e          	jreq	L653
1139  059b ae0309        	ldw	x,#777
1140  059e 89            	pushw	x
1141  059f 5f            	clrw	x
1142  05a0 89            	pushw	x
1143  05a1 ae0008        	ldw	x,#L3
1144  05a4 cd0000        	call	_assert_failed
1146  05a7 5b04          	addw	sp,#4
1147  05a9               L653:
1148                     ; 780   if (UART1_IT == UART1_IT_RXNE)
1149  05a9 1e01          	ldw	x,(OFST+1,sp)
1150  05ab a30255        	cpw	x,#597
1151  05ae 2606          	jrne	L561
1152                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
1153  05b0 35df5230      	mov	21040,#223
1155  05b4 2004          	jra	L761
1156  05b6               L561:
1157                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
1158  05b6 72195237      	bres	21047,#4
1159  05ba               L761:
1160                     ; 789 }
1161  05ba 85            	popw	x
1162  05bb 81            	ret	
1164                     	xdef	_UART1_ClearITPendingBit
1165                     	xdef	_UART1_GetITStatus
1166                     	xdef	_UART1_ClearFlag
1167                     	xdef	_UART1_GetFlagStatus
1168                     	xdef	_UART1_SetPrescaler
1169                     	xdef	_UART1_SetGuardTime
1170                     	xdef	_UART1_SetAddress
1171                     	xdef	_UART1_SendBreak
1172                     	xdef	_UART1_SendData9
1173                     	xdef	_UART1_SendData8
1174                     	xdef	_UART1_ReceiveData9
1175                     	xdef	_UART1_ReceiveData8
1176                     	xdef	_UART1_ReceiverWakeUpCmd
1177                     	xdef	_UART1_WakeUpConfig
1178                     	xdef	_UART1_SmartCardNACKCmd
1179                     	xdef	_UART1_SmartCardCmd
1180                     	xdef	_UART1_LINCmd
1181                     	xdef	_UART1_LINBreakDetectionConfig
1182                     	xdef	_UART1_IrDACmd
1183                     	xdef	_UART1_IrDAConfig
1184                     	xdef	_UART1_HalfDuplexCmd
1185                     	xdef	_UART1_ITConfig
1186                     	xdef	_UART1_Cmd
1187                     	xdef	_UART1_Init
1188                     	xdef	_UART1_DeInit
1189                     	xref	_assert_failed
1190                     	xref	_CLK_GetClockFreq
1191                     	switch	.const
1192  0008               L3:
1193  0008 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1194  001a 6970685f6472  	dc.b	"iph_driver\src\stm"
1195  002c 38735f756172  	dc.b	"8s_uart1.c",0
1196                     	xref.b	c_lreg
1197                     	xref.b	c_x
1198                     	xref	c_lursh
1199                     	xref	c_lsub
1200                     	xref	c_smul
1201                     	xref	c_ludv
1202                     	xref	c_rtol
1203                     	xref	c_llsh
1204                     	xref	c_lcmp
1205                     	xref	c_ltor
1206                     	end
