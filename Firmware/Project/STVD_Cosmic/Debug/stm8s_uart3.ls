   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 54 void UART3_DeInit(void)
  20                     ; 55 {
  21                     	scross	off
  22  0000               _UART3_DeInit:
  24                     ; 58   (void) UART3->SR;
  25  0000 c65240        	ld	a,21056
  26                     ; 59   (void) UART3->DR;
  27  0003 c65241        	ld	a,21057
  28                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  29  0006 725f5243      	clr	21059
  30                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  31  000a 725f5242      	clr	21058
  32                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  33  000e 725f5244      	clr	21060
  34                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  35  0012 725f5245      	clr	21061
  36                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  37  0016 725f5246      	clr	21062
  38                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  39  001a 725f5247      	clr	21063
  40                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  41  001e 725f5249      	clr	21065
  42                     ; 69 }
  43  0022 81            	ret	
  45                     .const:	section	.text
  46  0000               L04:
  47  0000 00098969      	dc.l	625001
  48  0004               L26:
  49  0004 00000064      	dc.l	100
  50                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
  50                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
  50                     ; 85                 UART3_Mode_TypeDef Mode)
  50                     ; 86 {
  51                     	switch	.text
  52  0023               _UART3_Init:
  53  0023 520e          	subw	sp,#14
  54       0000000e      OFST:	set	14
  56                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
  58                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
  60                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
  61  0025 7b15          	ld	a,(OFST+7,sp)
  62  0027 270a          	jreq	L21
  63  0029 a110          	cp	a,#16
  64  002b 2706          	jreq	L21
  65  002d ae005b        	ldw	x,#91
  66  0030 cd0178        	call	LC001
  67  0033               L21:
  68                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
  69  0033 7b16          	ld	a,(OFST+8,sp)
  70  0035 270a          	jreq	L22
  71  0037 a120          	cp	a,#32
  72  0039 2706          	jreq	L22
  73  003b ae005c        	ldw	x,#92
  74  003e cd0178        	call	LC001
  75  0041               L22:
  76                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
  77  0041 7b17          	ld	a,(OFST+9,sp)
  78  0043 270e          	jreq	L23
  79  0045 a104          	cp	a,#4
  80  0047 270a          	jreq	L23
  81  0049 a106          	cp	a,#6
  82  004b 2706          	jreq	L23
  83  004d ae005d        	ldw	x,#93
  84  0050 cd0178        	call	LC001
  85  0053               L23:
  86                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
  87  0053 96            	ldw	x,sp
  88  0054 1c0011        	addw	x,#OFST+3
  89  0057 cd0000        	call	c_ltor
  91  005a ae0000        	ldw	x,#L04
  92  005d cd0000        	call	c_lcmp
  94  0060 2506          	jrult	L24
  95  0062 ae005e        	ldw	x,#94
  96  0065 cd0178        	call	LC001
  97  0068               L24:
  98                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
  99  0068 7b18          	ld	a,(OFST+10,sp)
 100  006a a108          	cp	a,#8
 101  006c 2722          	jreq	L25
 102  006e a140          	cp	a,#64
 103  0070 271e          	jreq	L25
 104  0072 a104          	cp	a,#4
 105  0074 271a          	jreq	L25
 106  0076 a180          	cp	a,#128
 107  0078 2716          	jreq	L25
 108  007a a10c          	cp	a,#12
 109  007c 2712          	jreq	L25
 110  007e a144          	cp	a,#68
 111  0080 270e          	jreq	L25
 112  0082 a1c0          	cp	a,#192
 113  0084 270a          	jreq	L25
 114  0086 a188          	cp	a,#136
 115  0088 2706          	jreq	L25
 116  008a ae005f        	ldw	x,#95
 117  008d cd0178        	call	LC001
 118  0090               L25:
 119                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 120  0090 72195244      	bres	21060,#4
 121                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 122  0094 c65244        	ld	a,21060
 123  0097 1a15          	or	a,(OFST+7,sp)
 124  0099 c75244        	ld	21060,a
 125                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 126  009c c65246        	ld	a,21062
 127  009f a4cf          	and	a,#207
 128  00a1 c75246        	ld	21062,a
 129                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 130  00a4 c65246        	ld	a,21062
 131  00a7 1a16          	or	a,(OFST+8,sp)
 132  00a9 c75246        	ld	21062,a
 133                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 134  00ac c65244        	ld	a,21060
 135  00af a4f9          	and	a,#249
 136  00b1 c75244        	ld	21060,a
 137                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 138  00b4 c65244        	ld	a,21060
 139  00b7 1a17          	or	a,(OFST+9,sp)
 140  00b9 c75244        	ld	21060,a
 141                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 142  00bc 725f5242      	clr	21058
 143                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 144  00c0 c65243        	ld	a,21059
 145  00c3 a40f          	and	a,#15
 146  00c5 c75243        	ld	21059,a
 147                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 148  00c8 c65243        	ld	a,21059
 149  00cb a4f0          	and	a,#240
 150  00cd c75243        	ld	21059,a
 151                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 152  00d0 96            	ldw	x,sp
 153  00d1 cd0184        	call	LC002
 155  00d4 96            	ldw	x,sp
 156  00d5 5c            	incw	x
 157  00d6 cd0000        	call	c_rtol
 159  00d9 cd0000        	call	_CLK_GetClockFreq
 161  00dc 96            	ldw	x,sp
 162  00dd 5c            	incw	x
 163  00de cd0000        	call	c_ludv
 165  00e1 96            	ldw	x,sp
 166  00e2 1c000b        	addw	x,#OFST-3
 167  00e5 cd0000        	call	c_rtol
 169                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 170  00e8 96            	ldw	x,sp
 171  00e9 cd0184        	call	LC002
 173  00ec 96            	ldw	x,sp
 174  00ed 5c            	incw	x
 175  00ee cd0000        	call	c_rtol
 177  00f1 cd0000        	call	_CLK_GetClockFreq
 179  00f4 a664          	ld	a,#100
 180  00f6 cd0000        	call	c_smul
 182  00f9 96            	ldw	x,sp
 183  00fa 5c            	incw	x
 184  00fb cd0000        	call	c_ludv
 186  00fe 96            	ldw	x,sp
 187  00ff 1c0007        	addw	x,#OFST-7
 188  0102 cd0000        	call	c_rtol
 190                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 190                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 191  0105 96            	ldw	x,sp
 192  0106 1c000b        	addw	x,#OFST-3
 193  0109 cd0000        	call	c_ltor
 195  010c a664          	ld	a,#100
 196  010e cd0000        	call	c_smul
 198  0111 96            	ldw	x,sp
 199  0112 5c            	incw	x
 200  0113 cd0000        	call	c_rtol
 202  0116 96            	ldw	x,sp
 203  0117 1c0007        	addw	x,#OFST-7
 204  011a cd0000        	call	c_ltor
 206  011d 96            	ldw	x,sp
 207  011e 5c            	incw	x
 208  011f cd0000        	call	c_lsub
 210  0122 a604          	ld	a,#4
 211  0124 cd0000        	call	c_llsh
 213  0127 ae0004        	ldw	x,#L26
 214  012a cd0000        	call	c_ludv
 216  012d b603          	ld	a,c_lreg+3
 217  012f a40f          	and	a,#15
 218  0131 6b05          	ld	(OFST-9,sp),a
 219                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 220  0133 96            	ldw	x,sp
 221  0134 1c000b        	addw	x,#OFST-3
 222  0137 cd0000        	call	c_ltor
 224  013a a604          	ld	a,#4
 225  013c cd0000        	call	c_lursh
 227  013f b603          	ld	a,c_lreg+3
 228  0141 a4f0          	and	a,#240
 229  0143 b703          	ld	c_lreg+3,a
 230  0145 3f02          	clr	c_lreg+2
 231  0147 3f01          	clr	c_lreg+1
 232  0149 3f00          	clr	c_lreg
 233  014b 6b06          	ld	(OFST-8,sp),a
 234                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 235  014d 1a05          	or	a,(OFST-9,sp)
 236  014f c75243        	ld	21059,a
 237                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 238  0152 7b0e          	ld	a,(OFST+0,sp)
 239  0154 c75242        	ld	21058,a
 240                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 241  0157 7b18          	ld	a,(OFST+10,sp)
 242  0159 a504          	bcp	a,#4
 243  015b 2706          	jreq	L5
 244                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 245  015d 72165245      	bset	21061,#3
 247  0161 2004          	jra	L7
 248  0163               L5:
 249                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 250  0163 72175245      	bres	21061,#3
 251  0167               L7:
 252                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 253  0167 a508          	bcp	a,#8
 254  0169 2706          	jreq	L11
 255                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 256  016b 72145245      	bset	21061,#2
 258  016f 2004          	jra	L31
 259  0171               L11:
 260                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 261  0171 72155245      	bres	21061,#2
 262  0175               L31:
 263                     ; 152 }
 264  0175 5b0e          	addw	sp,#14
 265  0177 81            	ret	
 266  0178               LC001:
 267  0178 89            	pushw	x
 268  0179 5f            	clrw	x
 269  017a 89            	pushw	x
 270  017b ae0008        	ldw	x,#L3
 271  017e cd0000        	call	_assert_failed
 273  0181 5b04          	addw	sp,#4
 274  0183 81            	ret	
 275  0184               LC002:
 276  0184 1c0011        	addw	x,#OFST+3
 277  0187 cd0000        	call	c_ltor
 279  018a a604          	ld	a,#4
 280  018c cc0000        	jp	c_llsh
 282                     ; 160 void UART3_Cmd(FunctionalState NewState)
 282                     ; 161 {
 283  018f               _UART3_Cmd:
 285                     ; 162   if (NewState != DISABLE)
 286  018f 4d            	tnz	a
 287  0190 2705          	jreq	L51
 288                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 289  0192 721b5244      	bres	21060,#5
 291  0196 81            	ret	
 292  0197               L51:
 293                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 294  0197 721a5244      	bset	21060,#5
 295                     ; 172 }
 296  019b 81            	ret	
 298                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 298                     ; 190 {
 299  019c               _UART3_ITConfig:
 300  019c 89            	pushw	x
 301  019d 89            	pushw	x
 302       00000002      OFST:	set	2
 304                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 306                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 307  019e a30100        	cpw	x,#256
 308  01a1 2724          	jreq	L47
 309  01a3 a30277        	cpw	x,#631
 310  01a6 271f          	jreq	L47
 311  01a8 a30266        	cpw	x,#614
 312  01ab 271a          	jreq	L47
 313  01ad a30205        	cpw	x,#517
 314  01b0 2715          	jreq	L47
 315  01b2 a30244        	cpw	x,#580
 316  01b5 2710          	jreq	L47
 317  01b7 a30412        	cpw	x,#1042
 318  01ba 270b          	jreq	L47
 319  01bc a30346        	cpw	x,#838
 320  01bf 2706          	jreq	L47
 321  01c1 ae00c2        	ldw	x,#194
 322  01c4 cd0251        	call	LC007
 323  01c7               L47:
 324                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 325  01c7 7b07          	ld	a,(OFST+5,sp)
 326  01c9 2708          	jreq	L401
 327  01cb 4a            	dec	a
 328  01cc 2705          	jreq	L401
 329  01ce ae00c3        	ldw	x,#195
 330  01d1 ad7e          	call	LC007
 331  01d3               L401:
 332                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 333  01d3 7b03          	ld	a,(OFST+1,sp)
 334  01d5 6b01          	ld	(OFST-1,sp),a
 335                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 336  01d7 7b04          	ld	a,(OFST+2,sp)
 337  01d9 a40f          	and	a,#15
 338  01db 5f            	clrw	x
 339  01dc 97            	ld	xl,a
 340  01dd a601          	ld	a,#1
 341  01df 5d            	tnzw	x
 342  01e0 2704          	jreq	L011
 343  01e2               L211:
 344  01e2 48            	sll	a
 345  01e3 5a            	decw	x
 346  01e4 26fc          	jrne	L211
 347  01e6               L011:
 348  01e6 6b02          	ld	(OFST+0,sp),a
 349                     ; 203   if (NewState != DISABLE)
 350  01e8 7b07          	ld	a,(OFST+5,sp)
 351  01ea 272a          	jreq	L12
 352                     ; 206     if (uartreg == 0x01)
 353  01ec 7b01          	ld	a,(OFST-1,sp)
 354  01ee a101          	cp	a,#1
 355  01f0 2607          	jrne	L32
 356                     ; 208       UART3->CR1 |= itpos;
 357  01f2 c65244        	ld	a,21060
 358  01f5 1a02          	or	a,(OFST+0,sp)
 360  01f7 2029          	jp	LC005
 361  01f9               L32:
 362                     ; 210     else if (uartreg == 0x02)
 363  01f9 a102          	cp	a,#2
 364  01fb 2607          	jrne	L72
 365                     ; 212       UART3->CR2 |= itpos;
 366  01fd c65245        	ld	a,21061
 367  0200 1a02          	or	a,(OFST+0,sp)
 369  0202 202d          	jp	LC004
 370  0204               L72:
 371                     ; 214     else if (uartreg == 0x03)
 372  0204 a103          	cp	a,#3
 373  0206 2607          	jrne	L33
 374                     ; 216       UART3->CR4 |= itpos;
 375  0208 c65247        	ld	a,21063
 376  020b 1a02          	or	a,(OFST+0,sp)
 378  020d 2031          	jp	LC006
 379  020f               L33:
 380                     ; 220       UART3->CR6 |= itpos;
 381  020f c65249        	ld	a,21065
 382  0212 1a02          	or	a,(OFST+0,sp)
 383  0214 2035          	jp	LC003
 384  0216               L12:
 385                     ; 226     if (uartreg == 0x01)
 386  0216 7b01          	ld	a,(OFST-1,sp)
 387  0218 a101          	cp	a,#1
 388  021a 260b          	jrne	L14
 389                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 390  021c 7b02          	ld	a,(OFST+0,sp)
 391  021e 43            	cpl	a
 392  021f c45244        	and	a,21060
 393  0222               LC005:
 394  0222 c75244        	ld	21060,a
 396  0225 2027          	jra	L73
 397  0227               L14:
 398                     ; 230     else if (uartreg == 0x02)
 399  0227 a102          	cp	a,#2
 400  0229 260b          	jrne	L54
 401                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 402  022b 7b02          	ld	a,(OFST+0,sp)
 403  022d 43            	cpl	a
 404  022e c45245        	and	a,21061
 405  0231               LC004:
 406  0231 c75245        	ld	21061,a
 408  0234 2018          	jra	L73
 409  0236               L54:
 410                     ; 234     else if (uartreg == 0x03)
 411  0236 a103          	cp	a,#3
 412  0238 260b          	jrne	L15
 413                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
 414  023a 7b02          	ld	a,(OFST+0,sp)
 415  023c 43            	cpl	a
 416  023d c45247        	and	a,21063
 417  0240               LC006:
 418  0240 c75247        	ld	21063,a
 420  0243 2009          	jra	L73
 421  0245               L15:
 422                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
 423  0245 7b02          	ld	a,(OFST+0,sp)
 424  0247 43            	cpl	a
 425  0248 c45249        	and	a,21065
 426  024b               LC003:
 427  024b c75249        	ld	21065,a
 428  024e               L73:
 429                     ; 243 }
 430  024e 5b04          	addw	sp,#4
 431  0250 81            	ret	
 432  0251               LC007:
 433  0251 89            	pushw	x
 434  0252 5f            	clrw	x
 435  0253 89            	pushw	x
 436  0254 ae0008        	ldw	x,#L3
 437  0257 cd0000        	call	_assert_failed
 439  025a 5b04          	addw	sp,#4
 440  025c 81            	ret	
 442                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 442                     ; 253 {
 443  025d               _UART3_LINBreakDetectionConfig:
 444  025d 88            	push	a
 445       00000000      OFST:	set	0
 447                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 448  025e 4d            	tnz	a
 449  025f 2711          	jreq	L221
 450  0261 4a            	dec	a
 451  0262 270e          	jreq	L221
 452  0264 ae00ff        	ldw	x,#255
 453  0267 89            	pushw	x
 454  0268 5f            	clrw	x
 455  0269 89            	pushw	x
 456  026a ae0008        	ldw	x,#L3
 457  026d cd0000        	call	_assert_failed
 459  0270 5b04          	addw	sp,#4
 460  0272               L221:
 461                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 462  0272 7b01          	ld	a,(OFST+1,sp)
 463  0274 2706          	jreq	L55
 464                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
 465  0276 721a5247      	bset	21063,#5
 467  027a 2004          	jra	L75
 468  027c               L55:
 469                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
 470  027c 721b5247      	bres	21063,#5
 471  0280               L75:
 472                     ; 265 }
 473  0280 84            	pop	a
 474  0281 81            	ret	
 476                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
 476                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
 476                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
 476                     ; 280 {
 477  0282               _UART3_LINConfig:
 478  0282 89            	pushw	x
 479       00000000      OFST:	set	0
 481                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
 482  0283 9e            	ld	a,xh
 483  0284 4d            	tnz	a
 484  0285 2709          	jreq	L431
 485  0287 9e            	ld	a,xh
 486  0288 4a            	dec	a
 487  0289 2705          	jreq	L431
 488  028b ae011a        	ldw	x,#282
 489  028e ad46          	call	LC008
 490  0290               L431:
 491                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
 492  0290 7b02          	ld	a,(OFST+2,sp)
 493  0292 4a            	dec	a
 494  0293 2709          	jreq	L441
 495  0295 7b02          	ld	a,(OFST+2,sp)
 496  0297 2705          	jreq	L441
 497  0299 ae011b        	ldw	x,#283
 498  029c ad38          	call	LC008
 499  029e               L441:
 500                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
 501  029e 7b05          	ld	a,(OFST+5,sp)
 502  02a0 2708          	jreq	L451
 503  02a2 4a            	dec	a
 504  02a3 2705          	jreq	L451
 505  02a5 ae011c        	ldw	x,#284
 506  02a8 ad2c          	call	LC008
 507  02aa               L451:
 508                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
 509  02aa 7b01          	ld	a,(OFST+1,sp)
 510  02ac 2706          	jreq	L16
 511                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
 512  02ae 721a5249      	bset	21065,#5
 514  02b2 2004          	jra	L36
 515  02b4               L16:
 516                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
 517  02b4 721b5249      	bres	21065,#5
 518  02b8               L36:
 519                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
 520  02b8 7b02          	ld	a,(OFST+2,sp)
 521  02ba 2706          	jreq	L56
 522                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
 523  02bc 72185249      	bset	21065,#4
 525  02c0 2004          	jra	L76
 526  02c2               L56:
 527                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
 528  02c2 72195249      	bres	21065,#4
 529  02c6               L76:
 530                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
 531  02c6 7b05          	ld	a,(OFST+5,sp)
 532  02c8 2706          	jreq	L17
 533                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
 534  02ca 721e5249      	bset	21065,#7
 536  02ce 2004          	jra	L37
 537  02d0               L17:
 538                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
 539  02d0 721f5249      	bres	21065,#7
 540  02d4               L37:
 541                     ; 312 }
 542  02d4 85            	popw	x
 543  02d5 81            	ret	
 544  02d6               LC008:
 545  02d6 89            	pushw	x
 546  02d7 5f            	clrw	x
 547  02d8 89            	pushw	x
 548  02d9 ae0008        	ldw	x,#L3
 549  02dc cd0000        	call	_assert_failed
 551  02df 5b04          	addw	sp,#4
 552  02e1 81            	ret	
 554                     ; 320 void UART3_LINCmd(FunctionalState NewState)
 554                     ; 321 {
 555  02e2               _UART3_LINCmd:
 556  02e2 88            	push	a
 557       00000000      OFST:	set	0
 559                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 560  02e3 4d            	tnz	a
 561  02e4 2711          	jreq	L661
 562  02e6 4a            	dec	a
 563  02e7 270e          	jreq	L661
 564  02e9 ae0143        	ldw	x,#323
 565  02ec 89            	pushw	x
 566  02ed 5f            	clrw	x
 567  02ee 89            	pushw	x
 568  02ef ae0008        	ldw	x,#L3
 569  02f2 cd0000        	call	_assert_failed
 571  02f5 5b04          	addw	sp,#4
 572  02f7               L661:
 573                     ; 325   if (NewState != DISABLE)
 574  02f7 7b01          	ld	a,(OFST+1,sp)
 575  02f9 2706          	jreq	L57
 576                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
 577  02fb 721c5246      	bset	21062,#6
 579  02ff 2004          	jra	L77
 580  0301               L57:
 581                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
 582  0301 721d5246      	bres	21062,#6
 583  0305               L77:
 584                     ; 335 }
 585  0305 84            	pop	a
 586  0306 81            	ret	
 588                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
 588                     ; 344 {
 589  0307               _UART3_WakeUpConfig:
 590  0307 88            	push	a
 591       00000000      OFST:	set	0
 593                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
 594  0308 4d            	tnz	a
 595  0309 2712          	jreq	L002
 596  030b a108          	cp	a,#8
 597  030d 270e          	jreq	L002
 598  030f ae015a        	ldw	x,#346
 599  0312 89            	pushw	x
 600  0313 5f            	clrw	x
 601  0314 89            	pushw	x
 602  0315 ae0008        	ldw	x,#L3
 603  0318 cd0000        	call	_assert_failed
 605  031b 5b04          	addw	sp,#4
 606  031d               L002:
 607                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
 608  031d 72175244      	bres	21060,#3
 609                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
 610  0321 c65244        	ld	a,21060
 611  0324 1a01          	or	a,(OFST+1,sp)
 612  0326 c75244        	ld	21060,a
 613                     ; 350 }
 614  0329 84            	pop	a
 615  032a 81            	ret	
 617                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
 617                     ; 359 {
 618  032b               _UART3_ReceiverWakeUpCmd:
 619  032b 88            	push	a
 620       00000000      OFST:	set	0
 622                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 623  032c 4d            	tnz	a
 624  032d 2711          	jreq	L212
 625  032f 4a            	dec	a
 626  0330 270e          	jreq	L212
 627  0332 ae0169        	ldw	x,#361
 628  0335 89            	pushw	x
 629  0336 5f            	clrw	x
 630  0337 89            	pushw	x
 631  0338 ae0008        	ldw	x,#L3
 632  033b cd0000        	call	_assert_failed
 634  033e 5b04          	addw	sp,#4
 635  0340               L212:
 636                     ; 363   if (NewState != DISABLE)
 637  0340 7b01          	ld	a,(OFST+1,sp)
 638  0342 2706          	jreq	L101
 639                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
 640  0344 72125245      	bset	21061,#1
 642  0348 2004          	jra	L301
 643  034a               L101:
 644                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
 645  034a 72135245      	bres	21061,#1
 646  034e               L301:
 647                     ; 373 }
 648  034e 84            	pop	a
 649  034f 81            	ret	
 651                     ; 380 uint8_t UART3_ReceiveData8(void)
 651                     ; 381 {
 652  0350               _UART3_ReceiveData8:
 654                     ; 382   return ((uint8_t)UART3->DR);
 655  0350 c65241        	ld	a,21057
 657  0353 81            	ret	
 659                     ; 390 uint16_t UART3_ReceiveData9(void)
 659                     ; 391 {
 660  0354               _UART3_ReceiveData9:
 661  0354 89            	pushw	x
 662       00000002      OFST:	set	2
 664                     ; 392   uint16_t temp = 0;
 665                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
 666  0355 c65244        	ld	a,21060
 667  0358 a480          	and	a,#128
 668  035a 5f            	clrw	x
 669  035b 02            	rlwa	x,a
 670  035c 58            	sllw	x
 671  035d 1f01          	ldw	(OFST-1,sp),x
 672                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
 673  035f c65241        	ld	a,21057
 674  0362 5f            	clrw	x
 675  0363 97            	ld	xl,a
 676  0364 01            	rrwa	x,a
 677  0365 1a02          	or	a,(OFST+0,sp)
 678  0367 01            	rrwa	x,a
 679  0368 1a01          	or	a,(OFST-1,sp)
 680  036a a401          	and	a,#1
 681  036c 01            	rrwa	x,a
 683  036d 5b02          	addw	sp,#2
 684  036f 81            	ret	
 686                     ; 403 void UART3_SendData8(uint8_t Data)
 686                     ; 404 {
 687  0370               _UART3_SendData8:
 689                     ; 406   UART3->DR = Data;
 690  0370 c75241        	ld	21057,a
 691                     ; 407 }
 692  0373 81            	ret	
 694                     ; 414 void UART3_SendData9(uint16_t Data)
 694                     ; 415 {
 695  0374               _UART3_SendData9:
 696  0374 89            	pushw	x
 697       00000000      OFST:	set	0
 699                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
 700  0375 721d5244      	bres	21060,#6
 701                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
 702  0379 54            	srlw	x
 703  037a 54            	srlw	x
 704  037b 9f            	ld	a,xl
 705  037c a440          	and	a,#64
 706  037e ca5244        	or	a,21060
 707  0381 c75244        	ld	21060,a
 708                     ; 423   UART3->DR   = (uint8_t)(Data);                    
 709  0384 7b02          	ld	a,(OFST+2,sp)
 710  0386 c75241        	ld	21057,a
 711                     ; 424 }
 712  0389 85            	popw	x
 713  038a 81            	ret	
 715                     ; 431 void UART3_SendBreak(void)
 715                     ; 432 {
 716  038b               _UART3_SendBreak:
 718                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
 719  038b 72105245      	bset	21061,#0
 720                     ; 434 }
 721  038f 81            	ret	
 723                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
 723                     ; 442 {
 724  0390               _UART3_SetAddress:
 725  0390 88            	push	a
 726       00000000      OFST:	set	0
 728                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
 729  0391 a110          	cp	a,#16
 730  0393 250e          	jrult	L432
 731  0395 ae01bc        	ldw	x,#444
 732  0398 89            	pushw	x
 733  0399 5f            	clrw	x
 734  039a 89            	pushw	x
 735  039b ae0008        	ldw	x,#L3
 736  039e cd0000        	call	_assert_failed
 738  03a1 5b04          	addw	sp,#4
 739  03a3               L432:
 740                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
 741  03a3 c65247        	ld	a,21063
 742  03a6 a4f0          	and	a,#240
 743  03a8 c75247        	ld	21063,a
 744                     ; 449   UART3->CR4 |= UART3_Address;
 745  03ab c65247        	ld	a,21063
 746  03ae 1a01          	or	a,(OFST+1,sp)
 747  03b0 c75247        	ld	21063,a
 748                     ; 450 }
 749  03b3 84            	pop	a
 750  03b4 81            	ret	
 752                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
 752                     ; 459 {
 753  03b5               _UART3_GetFlagStatus:
 754  03b5 89            	pushw	x
 755  03b6 88            	push	a
 756       00000001      OFST:	set	1
 758                     ; 460   FlagStatus status = RESET;
 759                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
 760  03b7 a30080        	cpw	x,#128
 761  03ba 2745          	jreq	L642
 762  03bc a30040        	cpw	x,#64
 763  03bf 2740          	jreq	L642
 764  03c1 a30020        	cpw	x,#32
 765  03c4 273b          	jreq	L642
 766  03c6 a30010        	cpw	x,#16
 767  03c9 2736          	jreq	L642
 768  03cb a30008        	cpw	x,#8
 769  03ce 2731          	jreq	L642
 770  03d0 a30004        	cpw	x,#4
 771  03d3 272c          	jreq	L642
 772  03d5 a30002        	cpw	x,#2
 773  03d8 2727          	jreq	L642
 774  03da a30001        	cpw	x,#1
 775  03dd 2722          	jreq	L642
 776  03df a30101        	cpw	x,#257
 777  03e2 271d          	jreq	L642
 778  03e4 a30301        	cpw	x,#769
 779  03e7 2718          	jreq	L642
 780  03e9 a30302        	cpw	x,#770
 781  03ec 2713          	jreq	L642
 782  03ee a30210        	cpw	x,#528
 783  03f1 270e          	jreq	L642
 784  03f3 ae01cf        	ldw	x,#463
 785  03f6 89            	pushw	x
 786  03f7 5f            	clrw	x
 787  03f8 89            	pushw	x
 788  03f9 ae0008        	ldw	x,#L3
 789  03fc cd0000        	call	_assert_failed
 791  03ff 5b04          	addw	sp,#4
 792  0401               L642:
 793                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
 794  0401 1e02          	ldw	x,(OFST+1,sp)
 795  0403 a30210        	cpw	x,#528
 796  0406 2609          	jrne	L501
 797                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
 798  0408 c65247        	ld	a,21063
 799  040b 1503          	bcp	a,(OFST+2,sp)
 800  040d 2725          	jreq	L131
 801                     ; 471       status = SET;
 803  040f 201f          	jp	LC010
 804                     ; 476       status = RESET;
 805  0411               L501:
 806                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
 807  0411 a30101        	cpw	x,#257
 808  0414 2609          	jrne	L511
 809                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
 810  0416 c65245        	ld	a,21061
 811  0419 1503          	bcp	a,(OFST+2,sp)
 812  041b 2717          	jreq	L131
 813                     ; 484       status = SET;
 815  041d 2011          	jp	LC010
 816                     ; 489       status = RESET;
 817  041f               L511:
 818                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
 819  041f a30302        	cpw	x,#770
 820  0422 2705          	jreq	L721
 822  0424 a30301        	cpw	x,#769
 823  0427 260f          	jrne	L521
 824  0429               L721:
 825                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
 826  0429 c65249        	ld	a,21065
 827  042c 1503          	bcp	a,(OFST+2,sp)
 828  042e 2704          	jreq	L131
 829                     ; 497       status = SET;
 830  0430               LC010:
 831  0430 a601          	ld	a,#1
 833  0432 2001          	jra	L311
 834  0434               L131:
 835                     ; 502       status = RESET;
 836  0434 4f            	clr	a
 837  0435               L311:
 838                     ; 520   return  status;
 840  0435 5b03          	addw	sp,#3
 841  0437 81            	ret	
 842  0438               L521:
 843                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
 844  0438 c65240        	ld	a,21056
 845  043b 1503          	bcp	a,(OFST+2,sp)
 846  043d 27f5          	jreq	L131
 847                     ; 510       status = SET;
 849  043f 20ef          	jp	LC010
 850                     ; 515       status = RESET;
 852                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
 852                     ; 552 {
 853  0441               _UART3_ClearFlag:
 854  0441 89            	pushw	x
 855       00000000      OFST:	set	0
 857                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
 858  0442 a30020        	cpw	x,#32
 859  0445 271d          	jreq	L062
 860  0447 a30302        	cpw	x,#770
 861  044a 2718          	jreq	L062
 862  044c a30301        	cpw	x,#769
 863  044f 2713          	jreq	L062
 864  0451 a30210        	cpw	x,#528
 865  0454 270e          	jreq	L062
 866  0456 ae022a        	ldw	x,#554
 867  0459 89            	pushw	x
 868  045a 5f            	clrw	x
 869  045b 89            	pushw	x
 870  045c ae0008        	ldw	x,#L3
 871  045f cd0000        	call	_assert_failed
 873  0462 5b04          	addw	sp,#4
 874  0464               L062:
 875                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
 876  0464 1e01          	ldw	x,(OFST+1,sp)
 877  0466 a30020        	cpw	x,#32
 878  0469 2606          	jrne	L341
 879                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
 880  046b 35df5240      	mov	21056,#223
 882  046f 201a          	jra	L541
 883  0471               L341:
 884                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
 885  0471 a30210        	cpw	x,#528
 886  0474 2606          	jrne	L741
 887                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
 888  0476 72195247      	bres	21063,#4
 890  047a 200f          	jra	L541
 891  047c               L741:
 892                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
 893  047c a30302        	cpw	x,#770
 894  047f 2606          	jrne	L351
 895                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
 896  0481 72135249      	bres	21065,#1
 898  0485 2004          	jra	L541
 899  0487               L351:
 900                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
 901  0487 72115249      	bres	21065,#0
 902  048b               L541:
 903                     ; 576 }
 904  048b 85            	popw	x
 905  048c 81            	ret	
 907                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
 907                     ; 592 {
 908  048d               _UART3_GetITStatus:
 909  048d 89            	pushw	x
 910  048e 89            	pushw	x
 911       00000002      OFST:	set	2
 913                     ; 593   ITStatus pendingbitstatus = RESET;
 914                     ; 594   uint8_t itpos = 0;
 915                     ; 595   uint8_t itmask1 = 0;
 916                     ; 596   uint8_t itmask2 = 0;
 917                     ; 597   uint8_t enablestatus = 0;
 918                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
 919  048f a30277        	cpw	x,#631
 920  0492 2731          	jreq	L272
 921  0494 a30266        	cpw	x,#614
 922  0497 272c          	jreq	L272
 923  0499 a30255        	cpw	x,#597
 924  049c 2727          	jreq	L272
 925  049e a30244        	cpw	x,#580
 926  04a1 2722          	jreq	L272
 927  04a3 a30235        	cpw	x,#565
 928  04a6 271d          	jreq	L272
 929  04a8 a30346        	cpw	x,#838
 930  04ab 2718          	jreq	L272
 931  04ad a30412        	cpw	x,#1042
 932  04b0 2713          	jreq	L272
 933  04b2 a30100        	cpw	x,#256
 934  04b5 270e          	jreq	L272
 935  04b7 ae0258        	ldw	x,#600
 936  04ba 89            	pushw	x
 937  04bb 5f            	clrw	x
 938  04bc 89            	pushw	x
 939  04bd ae0008        	ldw	x,#L3
 940  04c0 cd0000        	call	_assert_failed
 942  04c3 5b04          	addw	sp,#4
 943  04c5               L272:
 944                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 945  04c5 7b04          	ld	a,(OFST+2,sp)
 946  04c7 a40f          	and	a,#15
 947  04c9 5f            	clrw	x
 948  04ca 97            	ld	xl,a
 949  04cb a601          	ld	a,#1
 950  04cd 5d            	tnzw	x
 951  04ce 2704          	jreq	L672
 952  04d0               L003:
 953  04d0 48            	sll	a
 954  04d1 5a            	decw	x
 955  04d2 26fc          	jrne	L003
 956  04d4               L672:
 957  04d4 6b01          	ld	(OFST-1,sp),a
 958                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
 959  04d6 7b04          	ld	a,(OFST+2,sp)
 960  04d8 4e            	swap	a
 961  04d9 a40f          	and	a,#15
 962  04db 6b02          	ld	(OFST+0,sp),a
 963                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
 964  04dd 5f            	clrw	x
 965  04de 97            	ld	xl,a
 966  04df a601          	ld	a,#1
 967  04e1 5d            	tnzw	x
 968  04e2 2704          	jreq	L203
 969  04e4               L403:
 970  04e4 48            	sll	a
 971  04e5 5a            	decw	x
 972  04e6 26fc          	jrne	L403
 973  04e8               L203:
 974  04e8 6b02          	ld	(OFST+0,sp),a
 975                     ; 610   if (UART3_IT == UART3_IT_PE)
 976  04ea 1e03          	ldw	x,(OFST+1,sp)
 977  04ec a30100        	cpw	x,#256
 978  04ef 260c          	jrne	L751
 979                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
 980  04f1 c65244        	ld	a,21060
 981  04f4 1402          	and	a,(OFST+0,sp)
 982  04f6 6b02          	ld	(OFST+0,sp),a
 983                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
 984  04f8 c65240        	ld	a,21056
 986                     ; 619       pendingbitstatus = SET;
 988  04fb 2020          	jp	LC013
 989                     ; 624       pendingbitstatus = RESET;
 990  04fd               L751:
 991                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
 992  04fd a30346        	cpw	x,#838
 993  0500 260c          	jrne	L761
 994                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
 995  0502 c65247        	ld	a,21063
 996  0505 1402          	and	a,(OFST+0,sp)
 997  0507 6b02          	ld	(OFST+0,sp),a
 998                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
 999  0509 c65247        	ld	a,21063
1001                     ; 635       pendingbitstatus = SET;
1003  050c 200f          	jp	LC013
1004                     ; 640       pendingbitstatus = RESET;
1005  050e               L761:
1006                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
1007  050e a30412        	cpw	x,#1042
1008  0511 2616          	jrne	L771
1009                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
1010  0513 c65249        	ld	a,21065
1011  0516 1402          	and	a,(OFST+0,sp)
1012  0518 6b02          	ld	(OFST+0,sp),a
1013                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
1014  051a c65249        	ld	a,21065
1016  051d               LC013:
1017  051d 1501          	bcp	a,(OFST-1,sp)
1018  051f 271a          	jreq	L702
1019  0521 7b02          	ld	a,(OFST+0,sp)
1020  0523 2716          	jreq	L702
1021                     ; 651       pendingbitstatus = SET;
1022  0525               LC012:
1023  0525 a601          	ld	a,#1
1025  0527 2013          	jra	L561
1026                     ; 656       pendingbitstatus = RESET;
1027  0529               L771:
1028                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
1029  0529 c65245        	ld	a,21061
1030  052c 1402          	and	a,(OFST+0,sp)
1031  052e 6b02          	ld	(OFST+0,sp),a
1032                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
1033  0530 c65240        	ld	a,21056
1034  0533 1501          	bcp	a,(OFST-1,sp)
1035  0535 2704          	jreq	L702
1037  0537 7b02          	ld	a,(OFST+0,sp)
1038                     ; 667       pendingbitstatus = SET;
1040  0539 26ea          	jrne	LC012
1041  053b               L702:
1042                     ; 672       pendingbitstatus = RESET;
1043  053b 4f            	clr	a
1044  053c               L561:
1045                     ; 676   return  pendingbitstatus;
1047  053c 5b04          	addw	sp,#4
1048  053e 81            	ret	
1050                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
1050                     ; 707 {
1051  053f               _UART3_ClearITPendingBit:
1052  053f 89            	pushw	x
1053       00000000      OFST:	set	0
1055                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
1056  0540 a30255        	cpw	x,#597
1057  0543 2718          	jreq	L413
1058  0545 a30412        	cpw	x,#1042
1059  0548 2713          	jreq	L413
1060  054a a30346        	cpw	x,#838
1061  054d 270e          	jreq	L413
1062  054f ae02c5        	ldw	x,#709
1063  0552 89            	pushw	x
1064  0553 5f            	clrw	x
1065  0554 89            	pushw	x
1066  0555 ae0008        	ldw	x,#L3
1067  0558 cd0000        	call	_assert_failed
1069  055b 5b04          	addw	sp,#4
1070  055d               L413:
1071                     ; 712   if (UART3_IT == UART3_IT_RXNE)
1072  055d 1e01          	ldw	x,(OFST+1,sp)
1073  055f a30255        	cpw	x,#597
1074  0562 2606          	jrne	L312
1075                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
1076  0564 35df5240      	mov	21056,#223
1078  0568 200f          	jra	L512
1079  056a               L312:
1080                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
1081  056a a30346        	cpw	x,#838
1082  056d 2606          	jrne	L712
1083                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
1084  056f 72195247      	bres	21063,#4
1086  0573 2004          	jra	L512
1087  0575               L712:
1088                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
1089  0575 72135249      	bres	21065,#1
1090  0579               L512:
1091                     ; 726 }
1092  0579 85            	popw	x
1093  057a 81            	ret	
1095                     	xdef	_UART3_ClearITPendingBit
1096                     	xdef	_UART3_GetITStatus
1097                     	xdef	_UART3_ClearFlag
1098                     	xdef	_UART3_GetFlagStatus
1099                     	xdef	_UART3_SetAddress
1100                     	xdef	_UART3_SendBreak
1101                     	xdef	_UART3_SendData9
1102                     	xdef	_UART3_SendData8
1103                     	xdef	_UART3_ReceiveData9
1104                     	xdef	_UART3_ReceiveData8
1105                     	xdef	_UART3_WakeUpConfig
1106                     	xdef	_UART3_ReceiverWakeUpCmd
1107                     	xdef	_UART3_LINCmd
1108                     	xdef	_UART3_LINConfig
1109                     	xdef	_UART3_LINBreakDetectionConfig
1110                     	xdef	_UART3_ITConfig
1111                     	xdef	_UART3_Cmd
1112                     	xdef	_UART3_Init
1113                     	xdef	_UART3_DeInit
1114                     	xref	_assert_failed
1115                     	xref	_CLK_GetClockFreq
1116                     	switch	.const
1117  0008               L3:
1118  0008 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1119  001a 6970685f6472  	dc.b	"iph_driver\src\stm"
1120  002c 38735f756172  	dc.b	"8s_uart3.c",0
1121                     	xref.b	c_lreg
1122                     	xref.b	c_x
1123                     	xref	c_lursh
1124                     	xref	c_lsub
1125                     	xref	c_smul
1126                     	xref	c_ludv
1127                     	xref	c_rtol
1128                     	xref	c_llsh
1129                     	xref	c_lcmp
1130                     	xref	c_ltor
1131                     	end
