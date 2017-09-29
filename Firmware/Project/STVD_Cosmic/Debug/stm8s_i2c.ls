   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 67 void I2C_DeInit(void)
  20                     ; 68 {
  21                     	scross	off
  22  0000               _I2C_DeInit:
  24                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  25  0000 725f5210      	clr	21008
  26                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  27  0004 725f5211      	clr	21009
  28                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  29  0008 725f5212      	clr	21010
  30                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  31  000c 725f5213      	clr	21011
  32                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  33  0010 725f5214      	clr	21012
  34                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  35  0014 725f521a      	clr	21018
  36                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  37  0018 725f521b      	clr	21019
  38                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  39  001c 725f521c      	clr	21020
  40                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  41  0020 3502521d      	mov	21021,#2
  42                     ; 78 }
  43  0024 81            	ret	
  45                     .const:	section	.text
  46  0000               L45:
  47  0000 00061a81      	dc.l	400001
  48  0004               L26:
  49  0004 000186a1      	dc.l	100001
  50  0008               L46:
  51  0008 000f4240      	dc.l	1000000
  52                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
  52                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
  52                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
  52                     ; 99 {
  53                     	switch	.text
  54  0025               _I2C_Init:
  55  0025 5209          	subw	sp,#9
  56       00000009      OFST:	set	9
  58                     ; 100   uint16_t result = 0x0004;
  59                     ; 101   uint16_t tmpval = 0;
  60                     ; 102   uint8_t tmpccrh = 0;
  61  0027 0f07          	clr	(OFST-2,sp)
  62                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
  63  0029 7b13          	ld	a,(OFST+10,sp)
  64  002b 270e          	jreq	L21
  65  002d a101          	cp	a,#1
  66  002f 270a          	jreq	L21
  67  0031 a102          	cp	a,#2
  68  0033 2706          	jreq	L21
  69  0035 ae0069        	ldw	x,#105
  70  0038 cd017d        	call	LC001
  71  003b               L21:
  72                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
  73  003b 7b14          	ld	a,(OFST+11,sp)
  74  003d 270a          	jreq	L22
  75  003f a180          	cp	a,#128
  76  0041 2706          	jreq	L22
  77  0043 ae006a        	ldw	x,#106
  78  0046 cd017d        	call	LC001
  79  0049               L22:
  80                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
  81  0049 1e10          	ldw	x,(OFST+7,sp)
  82  004b a30400        	cpw	x,#1024
  83  004e 2506          	jrult	L03
  84  0050 ae006b        	ldw	x,#107
  85  0053 cd017d        	call	LC001
  86  0056               L03:
  87                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
  88  0056 7b12          	ld	a,(OFST+9,sp)
  89  0058 270a          	jreq	L04
  90  005a a140          	cp	a,#64
  91  005c 2706          	jreq	L04
  92  005e ae006c        	ldw	x,#108
  93  0061 cd017d        	call	LC001
  94  0064               L04:
  95                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
  96  0064 7b15          	ld	a,(OFST+12,sp)
  97  0066 2704          	jreq	L44
  98  0068 a119          	cp	a,#25
  99  006a 2506          	jrult	L64
 100  006c               L44:
 101  006c ae006d        	ldw	x,#109
 102  006f cd017d        	call	LC001
 103  0072               L64:
 104                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 105  0072 96            	ldw	x,sp
 106  0073 1c000c        	addw	x,#OFST+3
 107  0076 cd0000        	call	c_lzmp
 109  0079 270f          	jreq	L25
 110  007b 96            	ldw	x,sp
 111  007c 1c000c        	addw	x,#OFST+3
 112  007f cd0000        	call	c_ltor
 114  0082 ae0000        	ldw	x,#L45
 115  0085 cd0000        	call	c_lcmp
 117  0088 2506          	jrult	L65
 118  008a               L25:
 119  008a ae006e        	ldw	x,#110
 120  008d cd017d        	call	LC001
 121  0090               L65:
 122                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 123  0090 c65212        	ld	a,21010
 124  0093 a4c0          	and	a,#192
 125  0095 c75212        	ld	21010,a
 126                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 127  0098 c65212        	ld	a,21010
 128  009b 1a15          	or	a,(OFST+12,sp)
 129  009d c75212        	ld	21010,a
 130                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 131  00a0 72115210      	bres	21008,#0
 132                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 133  00a4 c6521c        	ld	a,21020
 134  00a7 a430          	and	a,#48
 135  00a9 c7521c        	ld	21020,a
 136                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 137  00ac 725f521b      	clr	21019
 138                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 139  00b0 96            	ldw	x,sp
 140  00b1 1c000c        	addw	x,#OFST+3
 141  00b4 cd0000        	call	c_ltor
 143  00b7 ae0004        	ldw	x,#L26
 144  00ba cd0000        	call	c_lcmp
 146  00bd 2560          	jrult	L5
 147                     ; 131     tmpccrh = I2C_CCRH_FS;
 148  00bf a680          	ld	a,#128
 149  00c1 6b07          	ld	(OFST-2,sp),a
 150                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 151  00c3 96            	ldw	x,sp
 152  00c4 0d12          	tnz	(OFST+9,sp)
 153  00c6 261d          	jrne	L7
 154                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 155  00c8 1c000c        	addw	x,#OFST+3
 156  00cb cd0000        	call	c_ltor
 158  00ce a603          	ld	a,#3
 159  00d0 cd0000        	call	c_smul
 161  00d3 96            	ldw	x,sp
 162  00d4 5c            	incw	x
 163  00d5 cd0000        	call	c_rtol
 165  00d8 7b15          	ld	a,(OFST+12,sp)
 166  00da cd0189        	call	LC002
 168  00dd 96            	ldw	x,sp
 169  00de cd0197        	call	LC003
 170  00e1 1f08          	ldw	(OFST-1,sp),x
 172  00e3 2021          	jra	L11
 173  00e5               L7:
 174                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 175  00e5 1c000c        	addw	x,#OFST+3
 176  00e8 cd0000        	call	c_ltor
 178  00eb a619          	ld	a,#25
 179  00ed cd0000        	call	c_smul
 181  00f0 96            	ldw	x,sp
 182  00f1 5c            	incw	x
 183  00f2 cd0000        	call	c_rtol
 185  00f5 7b15          	ld	a,(OFST+12,sp)
 186  00f7 cd0189        	call	LC002
 188  00fa 96            	ldw	x,sp
 189  00fb cd0197        	call	LC003
 190  00fe 1f08          	ldw	(OFST-1,sp),x
 191                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 192  0100 7b07          	ld	a,(OFST-2,sp)
 193  0102 aa40          	or	a,#64
 194  0104 6b07          	ld	(OFST-2,sp),a
 195  0106               L11:
 196                     ; 147     if (result < (uint16_t)0x01)
 197  0106 1e08          	ldw	x,(OFST-1,sp)
 198  0108 2603          	jrne	L31
 199                     ; 150       result = (uint16_t)0x0001;
 200  010a 5c            	incw	x
 201  010b 1f08          	ldw	(OFST-1,sp),x
 202  010d               L31:
 203                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 204  010d 7b15          	ld	a,(OFST+12,sp)
 205  010f 97            	ld	xl,a
 206  0110 a603          	ld	a,#3
 207  0112 42            	mul	x,a
 208  0113 a60a          	ld	a,#10
 209  0115 cd0000        	call	c_sdivx
 211  0118 5c            	incw	x
 212  0119 1f05          	ldw	(OFST-4,sp),x
 213                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 214  011b 7b06          	ld	a,(OFST-3,sp)
 216  011d 2028          	jra	L51
 217  011f               L5:
 218                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 219  011f 96            	ldw	x,sp
 220  0120 1c000c        	addw	x,#OFST+3
 221  0123 cd0000        	call	c_ltor
 223  0126 3803          	sll	c_lreg+3
 224  0128 3902          	rlc	c_lreg+2
 225  012a 3901          	rlc	c_lreg+1
 226  012c 96            	ldw	x,sp
 227  012d 3900          	rlc	c_lreg
 228  012f 5c            	incw	x
 229  0130 cd0000        	call	c_rtol
 231  0133 7b15          	ld	a,(OFST+12,sp)
 232  0135 ad52          	call	LC002
 234  0137 96            	ldw	x,sp
 235  0138 ad5d          	call	LC003
 236                     ; 167     if (result < (uint16_t)0x0004)
 237  013a a30004        	cpw	x,#4
 238  013d 2403          	jruge	L71
 239                     ; 170       result = (uint16_t)0x0004;
 240  013f ae0004        	ldw	x,#4
 241  0142               L71:
 242  0142 1f08          	ldw	(OFST-1,sp),x
 243                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 244  0144 7b15          	ld	a,(OFST+12,sp)
 245  0146 4c            	inc	a
 246  0147               L51:
 247  0147 c7521d        	ld	21021,a
 248                     ; 181   I2C->CCRL = (uint8_t)result;
 249  014a 7b09          	ld	a,(OFST+0,sp)
 250  014c c7521b        	ld	21019,a
 251                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 252  014f 7b08          	ld	a,(OFST-1,sp)
 253  0151 a40f          	and	a,#15
 254  0153 1a07          	or	a,(OFST-2,sp)
 255  0155 c7521c        	ld	21020,a
 256                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 257  0158 72105210      	bset	21008,#0
 258                     ; 188   I2C_AcknowledgeConfig(Ack);
 259  015c 7b13          	ld	a,(OFST+10,sp)
 260  015e cd027c        	call	_I2C_AcknowledgeConfig
 262                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 263  0161 7b11          	ld	a,(OFST+8,sp)
 264  0163 c75213        	ld	21011,a
 265                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 265                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 266  0166 1e10          	ldw	x,(OFST+7,sp)
 267  0168 4f            	clr	a
 268  0169 01            	rrwa	x,a
 269  016a 48            	sll	a
 270  016b 01            	rrwa	x,a
 271  016c 49            	rlc	a
 272  016d a406          	and	a,#6
 273  016f 6b04          	ld	(OFST-5,sp),a
 274  0171 7b14          	ld	a,(OFST+11,sp)
 275  0173 aa40          	or	a,#64
 276  0175 1a04          	or	a,(OFST-5,sp)
 277  0177 c75214        	ld	21012,a
 278                     ; 194 }
 279  017a 5b09          	addw	sp,#9
 280  017c 81            	ret	
 281  017d               LC001:
 282  017d 89            	pushw	x
 283  017e 5f            	clrw	x
 284  017f 89            	pushw	x
 285  0180 ae000c        	ldw	x,#L3
 286  0183 cd0000        	call	_assert_failed
 288  0186 5b04          	addw	sp,#4
 289  0188 81            	ret	
 290  0189               LC002:
 291  0189 b703          	ld	c_lreg+3,a
 292  018b 3f02          	clr	c_lreg+2
 293  018d 3f01          	clr	c_lreg+1
 294  018f 3f00          	clr	c_lreg
 295  0191 ae0008        	ldw	x,#L46
 296  0194 cc0000        	jp	c_lmul
 297  0197               LC003:
 298  0197 5c            	incw	x
 299  0198 cd0000        	call	c_ludv
 301  019b be02          	ldw	x,c_lreg+2
 302  019d 81            	ret	
 304                     ; 202 void I2C_Cmd(FunctionalState NewState)
 304                     ; 203 {
 305  019e               _I2C_Cmd:
 306  019e 88            	push	a
 307       00000000      OFST:	set	0
 309                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 310  019f 4d            	tnz	a
 311  01a0 2711          	jreq	L67
 312  01a2 4a            	dec	a
 313  01a3 270e          	jreq	L67
 314  01a5 ae00cd        	ldw	x,#205
 315  01a8 89            	pushw	x
 316  01a9 5f            	clrw	x
 317  01aa 89            	pushw	x
 318  01ab ae000c        	ldw	x,#L3
 319  01ae cd0000        	call	_assert_failed
 321  01b1 5b04          	addw	sp,#4
 322  01b3               L67:
 323                     ; 207   if (NewState != DISABLE)
 324  01b3 7b01          	ld	a,(OFST+1,sp)
 325  01b5 2706          	jreq	L12
 326                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 327  01b7 72105210      	bset	21008,#0
 329  01bb 2004          	jra	L32
 330  01bd               L12:
 331                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 332  01bd 72115210      	bres	21008,#0
 333  01c1               L32:
 334                     ; 217 }
 335  01c1 84            	pop	a
 336  01c2 81            	ret	
 338                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 338                     ; 226 {
 339  01c3               _I2C_GeneralCallCmd:
 340  01c3 88            	push	a
 341       00000000      OFST:	set	0
 343                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 344  01c4 4d            	tnz	a
 345  01c5 2711          	jreq	L011
 346  01c7 4a            	dec	a
 347  01c8 270e          	jreq	L011
 348  01ca ae00e4        	ldw	x,#228
 349  01cd 89            	pushw	x
 350  01ce 5f            	clrw	x
 351  01cf 89            	pushw	x
 352  01d0 ae000c        	ldw	x,#L3
 353  01d3 cd0000        	call	_assert_failed
 355  01d6 5b04          	addw	sp,#4
 356  01d8               L011:
 357                     ; 230   if (NewState != DISABLE)
 358  01d8 7b01          	ld	a,(OFST+1,sp)
 359  01da 2706          	jreq	L52
 360                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 361  01dc 721c5210      	bset	21008,#6
 363  01e0 2004          	jra	L72
 364  01e2               L52:
 365                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 366  01e2 721d5210      	bres	21008,#6
 367  01e6               L72:
 368                     ; 240 }
 369  01e6 84            	pop	a
 370  01e7 81            	ret	
 372                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 372                     ; 251 {
 373  01e8               _I2C_GenerateSTART:
 374  01e8 88            	push	a
 375       00000000      OFST:	set	0
 377                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 378  01e9 4d            	tnz	a
 379  01ea 2711          	jreq	L221
 380  01ec 4a            	dec	a
 381  01ed 270e          	jreq	L221
 382  01ef ae00fd        	ldw	x,#253
 383  01f2 89            	pushw	x
 384  01f3 5f            	clrw	x
 385  01f4 89            	pushw	x
 386  01f5 ae000c        	ldw	x,#L3
 387  01f8 cd0000        	call	_assert_failed
 389  01fb 5b04          	addw	sp,#4
 390  01fd               L221:
 391                     ; 255   if (NewState != DISABLE)
 392  01fd 7b01          	ld	a,(OFST+1,sp)
 393  01ff 2706          	jreq	L13
 394                     ; 258     I2C->CR2 |= I2C_CR2_START;
 395  0201 72105211      	bset	21009,#0
 397  0205 2004          	jra	L33
 398  0207               L13:
 399                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 400  0207 72115211      	bres	21009,#0
 401  020b               L33:
 402                     ; 265 }
 403  020b 84            	pop	a
 404  020c 81            	ret	
 406                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 406                     ; 274 {
 407  020d               _I2C_GenerateSTOP:
 408  020d 88            	push	a
 409       00000000      OFST:	set	0
 411                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412  020e 4d            	tnz	a
 413  020f 2711          	jreq	L431
 414  0211 4a            	dec	a
 415  0212 270e          	jreq	L431
 416  0214 ae0114        	ldw	x,#276
 417  0217 89            	pushw	x
 418  0218 5f            	clrw	x
 419  0219 89            	pushw	x
 420  021a ae000c        	ldw	x,#L3
 421  021d cd0000        	call	_assert_failed
 423  0220 5b04          	addw	sp,#4
 424  0222               L431:
 425                     ; 278   if (NewState != DISABLE)
 426  0222 7b01          	ld	a,(OFST+1,sp)
 427  0224 2706          	jreq	L53
 428                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 429  0226 72125211      	bset	21009,#1
 431  022a 2004          	jra	L73
 432  022c               L53:
 433                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 434  022c 72135211      	bres	21009,#1
 435  0230               L73:
 436                     ; 288 }
 437  0230 84            	pop	a
 438  0231 81            	ret	
 440                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 440                     ; 297 {
 441  0232               _I2C_SoftwareResetCmd:
 442  0232 88            	push	a
 443       00000000      OFST:	set	0
 445                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 446  0233 4d            	tnz	a
 447  0234 2711          	jreq	L641
 448  0236 4a            	dec	a
 449  0237 270e          	jreq	L641
 450  0239 ae012b        	ldw	x,#299
 451  023c 89            	pushw	x
 452  023d 5f            	clrw	x
 453  023e 89            	pushw	x
 454  023f ae000c        	ldw	x,#L3
 455  0242 cd0000        	call	_assert_failed
 457  0245 5b04          	addw	sp,#4
 458  0247               L641:
 459                     ; 301   if (NewState != DISABLE)
 460  0247 7b01          	ld	a,(OFST+1,sp)
 461  0249 2706          	jreq	L14
 462                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 463  024b 721e5211      	bset	21009,#7
 465  024f 2004          	jra	L34
 466  0251               L14:
 467                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 468  0251 721f5211      	bres	21009,#7
 469  0255               L34:
 470                     ; 311 }
 471  0255 84            	pop	a
 472  0256 81            	ret	
 474                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 474                     ; 321 {
 475  0257               _I2C_StretchClockCmd:
 476  0257 88            	push	a
 477       00000000      OFST:	set	0
 479                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 480  0258 4d            	tnz	a
 481  0259 2711          	jreq	L061
 482  025b 4a            	dec	a
 483  025c 270e          	jreq	L061
 484  025e ae0143        	ldw	x,#323
 485  0261 89            	pushw	x
 486  0262 5f            	clrw	x
 487  0263 89            	pushw	x
 488  0264 ae000c        	ldw	x,#L3
 489  0267 cd0000        	call	_assert_failed
 491  026a 5b04          	addw	sp,#4
 492  026c               L061:
 493                     ; 325   if (NewState != DISABLE)
 494  026c 7b01          	ld	a,(OFST+1,sp)
 495  026e 2706          	jreq	L54
 496                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 497  0270 721f5210      	bres	21008,#7
 499  0274 2004          	jra	L74
 500  0276               L54:
 501                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 502  0276 721e5210      	bset	21008,#7
 503  027a               L74:
 504                     ; 336 }
 505  027a 84            	pop	a
 506  027b 81            	ret	
 508                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 508                     ; 346 {
 509  027c               _I2C_AcknowledgeConfig:
 510  027c 88            	push	a
 511       00000000      OFST:	set	0
 513                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 514  027d 4d            	tnz	a
 515  027e 2716          	jreq	L271
 516  0280 a101          	cp	a,#1
 517  0282 2712          	jreq	L271
 518  0284 a102          	cp	a,#2
 519  0286 270e          	jreq	L271
 520  0288 ae015c        	ldw	x,#348
 521  028b 89            	pushw	x
 522  028c 5f            	clrw	x
 523  028d 89            	pushw	x
 524  028e ae000c        	ldw	x,#L3
 525  0291 cd0000        	call	_assert_failed
 527  0294 5b04          	addw	sp,#4
 528  0296               L271:
 529                     ; 350   if (Ack == I2C_ACK_NONE)
 530  0296 7b01          	ld	a,(OFST+1,sp)
 531  0298 2606          	jrne	L15
 532                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 533  029a 72155211      	bres	21009,#2
 535  029e 2011          	jra	L35
 536  02a0               L15:
 537                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 538  02a0 72145211      	bset	21009,#2
 539                     ; 360     if (Ack == I2C_ACK_CURR)
 540  02a4 4a            	dec	a
 541  02a5 2606          	jrne	L55
 542                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 543  02a7 72175211      	bres	21009,#3
 545  02ab 2004          	jra	L35
 546  02ad               L55:
 547                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 548  02ad 72165211      	bset	21009,#3
 549  02b1               L35:
 550                     ; 371 }
 551  02b1 84            	pop	a
 552  02b2 81            	ret	
 554                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
 554                     ; 382 {
 555  02b3               _I2C_ITConfig:
 556  02b3 89            	pushw	x
 557       00000000      OFST:	set	0
 559                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
 560  02b4 9e            	ld	a,xh
 561  02b5 4a            	dec	a
 562  02b6 2723          	jreq	L402
 563  02b8 9e            	ld	a,xh
 564  02b9 a102          	cp	a,#2
 565  02bb 271e          	jreq	L402
 566  02bd 9e            	ld	a,xh
 567  02be a104          	cp	a,#4
 568  02c0 2719          	jreq	L402
 569  02c2 9e            	ld	a,xh
 570  02c3 a103          	cp	a,#3
 571  02c5 2714          	jreq	L402
 572  02c7 9e            	ld	a,xh
 573  02c8 a105          	cp	a,#5
 574  02ca 270f          	jreq	L402
 575  02cc 9e            	ld	a,xh
 576  02cd a106          	cp	a,#6
 577  02cf 270a          	jreq	L402
 578  02d1 9e            	ld	a,xh
 579  02d2 a107          	cp	a,#7
 580  02d4 2705          	jreq	L402
 581  02d6 ae0180        	ldw	x,#384
 582  02d9 ad22          	call	LC004
 583  02db               L402:
 584                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 585  02db 7b02          	ld	a,(OFST+2,sp)
 586  02dd 2708          	jreq	L412
 587  02df 4a            	dec	a
 588  02e0 2705          	jreq	L412
 589  02e2 ae0181        	ldw	x,#385
 590  02e5 ad16          	call	LC004
 591  02e7               L412:
 592                     ; 387   if (NewState != DISABLE)
 593  02e7 7b02          	ld	a,(OFST+2,sp)
 594  02e9 2707          	jreq	L16
 595                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
 596  02eb c6521a        	ld	a,21018
 597  02ee 1a01          	or	a,(OFST+1,sp)
 599  02f0 2006          	jra	L36
 600  02f2               L16:
 601                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
 602  02f2 7b01          	ld	a,(OFST+1,sp)
 603  02f4 43            	cpl	a
 604  02f5 c4521a        	and	a,21018
 605  02f8               L36:
 606  02f8 c7521a        	ld	21018,a
 607                     ; 397 }
 608  02fb 85            	popw	x
 609  02fc 81            	ret	
 610  02fd               LC004:
 611  02fd 89            	pushw	x
 612  02fe 5f            	clrw	x
 613  02ff 89            	pushw	x
 614  0300 ae000c        	ldw	x,#L3
 615  0303 cd0000        	call	_assert_failed
 617  0306 5b04          	addw	sp,#4
 618  0308 81            	ret	
 620                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
 620                     ; 406 {
 621  0309               _I2C_FastModeDutyCycleConfig:
 622  0309 88            	push	a
 623       00000000      OFST:	set	0
 625                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
 626  030a 4d            	tnz	a
 627  030b 2712          	jreq	L622
 628  030d a140          	cp	a,#64
 629  030f 270e          	jreq	L622
 630  0311 ae0198        	ldw	x,#408
 631  0314 89            	pushw	x
 632  0315 5f            	clrw	x
 633  0316 89            	pushw	x
 634  0317 ae000c        	ldw	x,#L3
 635  031a cd0000        	call	_assert_failed
 637  031d 5b04          	addw	sp,#4
 638  031f               L622:
 639                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
 640  031f 7b01          	ld	a,(OFST+1,sp)
 641  0321 a140          	cp	a,#64
 642  0323 2606          	jrne	L56
 643                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
 644  0325 721c521c      	bset	21020,#6
 646  0329 2004          	jra	L76
 647  032b               L56:
 648                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
 649  032b 721d521c      	bres	21020,#6
 650  032f               L76:
 651                     ; 420 }
 652  032f 84            	pop	a
 653  0330 81            	ret	
 655                     ; 427 uint8_t I2C_ReceiveData(void)
 655                     ; 428 {
 656  0331               _I2C_ReceiveData:
 658                     ; 430   return ((uint8_t)I2C->DR);
 659  0331 c65216        	ld	a,21014
 661  0334 81            	ret	
 663                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
 663                     ; 441 {
 664  0335               _I2C_Send7bitAddress:
 665  0335 89            	pushw	x
 666       00000000      OFST:	set	0
 668                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
 669  0336 9e            	ld	a,xh
 670  0337 a501          	bcp	a,#1
 671  0339 2705          	jreq	L042
 672  033b ae01bb        	ldw	x,#443
 673  033e ad19          	call	LC005
 674  0340               L042:
 675                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
 676  0340 7b02          	ld	a,(OFST+2,sp)
 677  0342 2708          	jreq	L052
 678  0344 4a            	dec	a
 679  0345 2705          	jreq	L052
 680  0347 ae01bc        	ldw	x,#444
 681  034a ad0d          	call	LC005
 682  034c               L052:
 683                     ; 447   Address &= (uint8_t)0xFE;
 684  034c 7b01          	ld	a,(OFST+1,sp)
 685  034e a4fe          	and	a,#254
 686  0350 6b01          	ld	(OFST+1,sp),a
 687                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
 688  0352 1a02          	or	a,(OFST+2,sp)
 689  0354 c75216        	ld	21014,a
 690                     ; 451 }
 691  0357 85            	popw	x
 692  0358 81            	ret	
 693  0359               LC005:
 694  0359 89            	pushw	x
 695  035a 5f            	clrw	x
 696  035b 89            	pushw	x
 697  035c ae000c        	ldw	x,#L3
 698  035f cd0000        	call	_assert_failed
 700  0362 5b04          	addw	sp,#4
 701  0364 81            	ret	
 703                     ; 458 void I2C_SendData(uint8_t Data)
 703                     ; 459 {
 704  0365               _I2C_SendData:
 706                     ; 461   I2C->DR = Data;
 707  0365 c75216        	ld	21014,a
 708                     ; 462 }
 709  0368 81            	ret	
 711                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
 711                     ; 579 {
 712  0369               _I2C_CheckEvent:
 713  0369 89            	pushw	x
 714  036a 5206          	subw	sp,#6
 715       00000006      OFST:	set	6
 717                     ; 580   __IO uint16_t lastevent = 0x00;
 718  036c 5f            	clrw	x
 719  036d 1f04          	ldw	(OFST-2,sp),x
 720                     ; 581   uint8_t flag1 = 0x00 ;
 721                     ; 582   uint8_t flag2 = 0x00;
 722                     ; 583   ErrorStatus status = ERROR;
 723                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
 724  036f 1e07          	ldw	x,(OFST+1,sp)
 725  0371 a30682        	cpw	x,#1666
 726  0374 275b          	jreq	L462
 727  0376 a30202        	cpw	x,#514
 728  0379 2756          	jreq	L462
 729  037b a31200        	cpw	x,#4608
 730  037e 2751          	jreq	L462
 731  0380 a30240        	cpw	x,#576
 732  0383 274c          	jreq	L462
 733  0385 a30350        	cpw	x,#848
 734  0388 2747          	jreq	L462
 735  038a a30684        	cpw	x,#1668
 736  038d 2742          	jreq	L462
 737  038f a30794        	cpw	x,#1940
 738  0392 273d          	jreq	L462
 739  0394 a30004        	cpw	x,#4
 740  0397 2738          	jreq	L462
 741  0399 a30010        	cpw	x,#16
 742  039c 2733          	jreq	L462
 743  039e a30301        	cpw	x,#769
 744  03a1 272e          	jreq	L462
 745  03a3 a30782        	cpw	x,#1922
 746  03a6 2729          	jreq	L462
 747  03a8 a30302        	cpw	x,#770
 748  03ab 2724          	jreq	L462
 749  03ad a30340        	cpw	x,#832
 750  03b0 271f          	jreq	L462
 751  03b2 a30784        	cpw	x,#1924
 752  03b5 271a          	jreq	L462
 753  03b7 a30780        	cpw	x,#1920
 754  03ba 2715          	jreq	L462
 755  03bc a30308        	cpw	x,#776
 756  03bf 2710          	jreq	L462
 757  03c1 ae024a        	ldw	x,#586
 758  03c4 89            	pushw	x
 759  03c5 5f            	clrw	x
 760  03c6 89            	pushw	x
 761  03c7 ae000c        	ldw	x,#L3
 762  03ca cd0000        	call	_assert_failed
 764  03cd 5b04          	addw	sp,#4
 765  03cf 1e07          	ldw	x,(OFST+1,sp)
 766  03d1               L462:
 767                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
 768  03d1 a30004        	cpw	x,#4
 769  03d4 2609          	jrne	L17
 770                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
 771  03d6 c65218        	ld	a,21016
 772  03d9 a404          	and	a,#4
 773  03db 5f            	clrw	x
 774  03dc 97            	ld	xl,a
 776  03dd 201a          	jra	L37
 777  03df               L17:
 778                     ; 594     flag1 = I2C->SR1;
 779  03df c65217        	ld	a,21015
 780  03e2 6b03          	ld	(OFST-3,sp),a
 781                     ; 595     flag2 = I2C->SR3;
 782  03e4 c65219        	ld	a,21017
 783  03e7 6b06          	ld	(OFST+0,sp),a
 784                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
 785  03e9 5f            	clrw	x
 786  03ea 7b03          	ld	a,(OFST-3,sp)
 787  03ec 97            	ld	xl,a
 788  03ed 1f01          	ldw	(OFST-5,sp),x
 789  03ef 5f            	clrw	x
 790  03f0 7b06          	ld	a,(OFST+0,sp)
 791  03f2 97            	ld	xl,a
 792  03f3 7b02          	ld	a,(OFST-4,sp)
 793  03f5 01            	rrwa	x,a
 794  03f6 1a01          	or	a,(OFST-5,sp)
 795  03f8 01            	rrwa	x,a
 796  03f9               L37:
 797  03f9 1f04          	ldw	(OFST-2,sp),x
 798                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
 799  03fb 1e04          	ldw	x,(OFST-2,sp)
 800  03fd 01            	rrwa	x,a
 801  03fe 1408          	and	a,(OFST+2,sp)
 802  0400 01            	rrwa	x,a
 803  0401 1407          	and	a,(OFST+1,sp)
 804  0403 01            	rrwa	x,a
 805  0404 1307          	cpw	x,(OFST+1,sp)
 806  0406 2604          	jrne	L57
 807                     ; 602     status = SUCCESS;
 808  0408 a601          	ld	a,#1
 810  040a 2001          	jra	L77
 811  040c               L57:
 812                     ; 607     status = ERROR;
 813  040c 4f            	clr	a
 814  040d               L77:
 815                     ; 611   return status;
 817  040d 5b08          	addw	sp,#8
 818  040f 81            	ret	
 820                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
 820                     ; 629 {
 821  0410               _I2C_GetLastEvent:
 822  0410 5206          	subw	sp,#6
 823       00000006      OFST:	set	6
 825                     ; 630   __IO uint16_t lastevent = 0;
 826  0412 5f            	clrw	x
 827  0413 1f05          	ldw	(OFST-1,sp),x
 828                     ; 631   uint16_t flag1 = 0;
 829                     ; 632   uint16_t flag2 = 0;
 830                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
 831  0415 7205521805    	btjf	21016,#2,L101
 832                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
 833  041a ae0004        	ldw	x,#4
 835  041d 2013          	jra	L301
 836  041f               L101:
 837                     ; 641     flag1 = I2C->SR1;
 838  041f c65217        	ld	a,21015
 839  0422 97            	ld	xl,a
 840  0423 1f01          	ldw	(OFST-5,sp),x
 841                     ; 642     flag2 = I2C->SR3;
 842  0425 c65219        	ld	a,21017
 843  0428 5f            	clrw	x
 844  0429 97            	ld	xl,a
 845  042a 1f03          	ldw	(OFST-3,sp),x
 846                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
 847  042c 7b02          	ld	a,(OFST-4,sp)
 848  042e 01            	rrwa	x,a
 849  042f 1a01          	or	a,(OFST-5,sp)
 850  0431 01            	rrwa	x,a
 851  0432               L301:
 852  0432 1f05          	ldw	(OFST-1,sp),x
 853                     ; 648   return (I2C_Event_TypeDef)lastevent;
 854  0434 1e05          	ldw	x,(OFST-1,sp)
 856  0436 5b06          	addw	sp,#6
 857  0438 81            	ret	
 859                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
 859                     ; 680 {
 860  0439               _I2C_GetFlagStatus:
 861  0439 89            	pushw	x
 862  043a 89            	pushw	x
 863       00000002      OFST:	set	2
 865                     ; 681   uint8_t tempreg = 0;
 866  043b 0f02          	clr	(OFST+0,sp)
 867                     ; 682   uint8_t regindex = 0;
 868                     ; 683   FlagStatus bitstatus = RESET;
 869                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
 870  043d a30180        	cpw	x,#384
 871  0440 2759          	jreq	L003
 872  0442 a30140        	cpw	x,#320
 873  0445 2754          	jreq	L003
 874  0447 a30110        	cpw	x,#272
 875  044a 274f          	jreq	L003
 876  044c a30108        	cpw	x,#264
 877  044f 274a          	jreq	L003
 878  0451 a30104        	cpw	x,#260
 879  0454 2745          	jreq	L003
 880  0456 a30102        	cpw	x,#258
 881  0459 2740          	jreq	L003
 882  045b a30101        	cpw	x,#257
 883  045e 273b          	jreq	L003
 884  0460 a30220        	cpw	x,#544
 885  0463 2736          	jreq	L003
 886  0465 a30208        	cpw	x,#520
 887  0468 2731          	jreq	L003
 888  046a a30204        	cpw	x,#516
 889  046d 272c          	jreq	L003
 890  046f a30202        	cpw	x,#514
 891  0472 2727          	jreq	L003
 892  0474 a30201        	cpw	x,#513
 893  0477 2722          	jreq	L003
 894  0479 a30310        	cpw	x,#784
 895  047c 271d          	jreq	L003
 896  047e a30304        	cpw	x,#772
 897  0481 2718          	jreq	L003
 898  0483 a30302        	cpw	x,#770
 899  0486 2713          	jreq	L003
 900  0488 a30301        	cpw	x,#769
 901  048b 270e          	jreq	L003
 902  048d ae02ae        	ldw	x,#686
 903  0490 89            	pushw	x
 904  0491 5f            	clrw	x
 905  0492 89            	pushw	x
 906  0493 ae000c        	ldw	x,#L3
 907  0496 cd0000        	call	_assert_failed
 909  0499 5b04          	addw	sp,#4
 910  049b               L003:
 911                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
 912  049b 7b03          	ld	a,(OFST+1,sp)
 913  049d 6b01          	ld	(OFST-1,sp),a
 914                     ; 691   switch (regindex)
 916                     ; 708     default:
 916                     ; 709       break;
 917  049f 4a            	dec	a
 918  04a0 2708          	jreq	L501
 919  04a2 4a            	dec	a
 920  04a3 270a          	jreq	L701
 921  04a5 4a            	dec	a
 922  04a6 270c          	jreq	L111
 923  04a8 200f          	jra	L711
 924  04aa               L501:
 925                     ; 694     case 0x01:
 925                     ; 695       tempreg = (uint8_t)I2C->SR1;
 926  04aa c65217        	ld	a,21015
 927                     ; 696       break;
 928  04ad 2008          	jp	LC006
 929  04af               L701:
 930                     ; 699     case 0x02:
 930                     ; 700       tempreg = (uint8_t)I2C->SR2;
 931  04af c65218        	ld	a,21016
 932                     ; 701       break;
 933  04b2 2003          	jp	LC006
 934  04b4               L111:
 935                     ; 704     case 0x03:
 935                     ; 705       tempreg = (uint8_t)I2C->SR3;
 936  04b4 c65219        	ld	a,21017
 937  04b7               LC006:
 938  04b7 6b02          	ld	(OFST+0,sp),a
 939                     ; 706       break;
 940                     ; 708     default:
 940                     ; 709       break;
 941  04b9               L711:
 942                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
 943  04b9 7b04          	ld	a,(OFST+2,sp)
 944  04bb 1502          	bcp	a,(OFST+0,sp)
 945  04bd 2704          	jreq	L121
 946                     ; 716     bitstatus = SET;
 947  04bf a601          	ld	a,#1
 949  04c1 2001          	jra	L321
 950  04c3               L121:
 951                     ; 721     bitstatus = RESET;
 952  04c3 4f            	clr	a
 953  04c4               L321:
 954                     ; 724   return bitstatus;
 956  04c4 5b04          	addw	sp,#4
 957  04c6 81            	ret	
 959                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
 959                     ; 760 {
 960  04c7               _I2C_ClearFlag:
 961  04c7 89            	pushw	x
 962  04c8 89            	pushw	x
 963       00000002      OFST:	set	2
 965                     ; 761   uint16_t flagpos = 0;
 966                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
 967  04c9 01            	rrwa	x,a
 968  04ca 9f            	ld	a,xl
 969  04cb a4fd          	and	a,#253
 970  04cd 97            	ld	xl,a
 971  04ce 4f            	clr	a
 972  04cf 02            	rlwa	x,a
 973  04d0 5d            	tnzw	x
 974  04d1 2604          	jrne	L603
 975  04d3 1e03          	ldw	x,(OFST+1,sp)
 976  04d5 260e          	jrne	L013
 977  04d7               L603:
 978  04d7 ae02fb        	ldw	x,#763
 979  04da 89            	pushw	x
 980  04db 5f            	clrw	x
 981  04dc 89            	pushw	x
 982  04dd ae000c        	ldw	x,#L3
 983  04e0 cd0000        	call	_assert_failed
 985  04e3 5b04          	addw	sp,#4
 986  04e5               L013:
 987                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
 988  04e5 7b04          	ld	a,(OFST+2,sp)
 989  04e7 5f            	clrw	x
 990  04e8 02            	rlwa	x,a
 991  04e9 1f01          	ldw	(OFST-1,sp),x
 992                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
 993  04eb 7b02          	ld	a,(OFST+0,sp)
 994  04ed 43            	cpl	a
 995  04ee c75218        	ld	21016,a
 996                     ; 769 }
 997  04f1 5b04          	addw	sp,#4
 998  04f3 81            	ret	
1000                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
1000                     ; 792 {
1001  04f4               _I2C_GetITStatus:
1002  04f4 89            	pushw	x
1003  04f5 5204          	subw	sp,#4
1004       00000004      OFST:	set	4
1006                     ; 793   ITStatus bitstatus = RESET;
1007                     ; 794   __IO uint8_t enablestatus = 0;
1008  04f7 0f03          	clr	(OFST-1,sp)
1009                     ; 795   uint16_t tempregister = 0;
1010                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
1011  04f9 a31680        	cpw	x,#5760
1012  04fc 2745          	jreq	L223
1013  04fe a31640        	cpw	x,#5696
1014  0501 2740          	jreq	L223
1015  0503 a31210        	cpw	x,#4624
1016  0506 273b          	jreq	L223
1017  0508 a31208        	cpw	x,#4616
1018  050b 2736          	jreq	L223
1019  050d a31204        	cpw	x,#4612
1020  0510 2731          	jreq	L223
1021  0512 a31202        	cpw	x,#4610
1022  0515 272c          	jreq	L223
1023  0517 a31201        	cpw	x,#4609
1024  051a 2727          	jreq	L223
1025  051c a32220        	cpw	x,#8736
1026  051f 2722          	jreq	L223
1027  0521 a32108        	cpw	x,#8456
1028  0524 271d          	jreq	L223
1029  0526 a32104        	cpw	x,#8452
1030  0529 2718          	jreq	L223
1031  052b a32102        	cpw	x,#8450
1032  052e 2713          	jreq	L223
1033  0530 a32101        	cpw	x,#8449
1034  0533 270e          	jreq	L223
1035  0535 ae031e        	ldw	x,#798
1036  0538 89            	pushw	x
1037  0539 5f            	clrw	x
1038  053a 89            	pushw	x
1039  053b ae000c        	ldw	x,#L3
1040  053e cd0000        	call	_assert_failed
1042  0541 5b04          	addw	sp,#4
1043  0543               L223:
1044                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
1045  0543 7b05          	ld	a,(OFST+1,sp)
1046  0545 a407          	and	a,#7
1047  0547 5f            	clrw	x
1048  0548 97            	ld	xl,a
1049  0549 1f01          	ldw	(OFST-3,sp),x
1050                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
1051  054b c6521a        	ld	a,21018
1052  054e 1402          	and	a,(OFST-2,sp)
1053  0550 6b03          	ld	(OFST-1,sp),a
1054                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
1055  0552 7b05          	ld	a,(OFST+1,sp)
1056  0554 a430          	and	a,#48
1057  0556 97            	ld	xl,a
1058  0557 4f            	clr	a
1059  0558 02            	rlwa	x,a
1060  0559 a30100        	cpw	x,#256
1061  055c 260d          	jrne	L521
1062                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
1063  055e c65217        	ld	a,21015
1064  0561 1506          	bcp	a,(OFST+2,sp)
1065  0563 2715          	jreq	L531
1067  0565 0d03          	tnz	(OFST-1,sp)
1068  0567 2711          	jreq	L531
1069                     ; 811       bitstatus = SET;
1071  0569 200b          	jp	LC008
1072                     ; 816       bitstatus = RESET;
1073  056b               L521:
1074                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
1075  056b c65218        	ld	a,21016
1076  056e 1506          	bcp	a,(OFST+2,sp)
1077  0570 2708          	jreq	L531
1079  0572 0d03          	tnz	(OFST-1,sp)
1080  0574 2704          	jreq	L531
1081                     ; 825       bitstatus = SET;
1082  0576               LC008:
1083  0576 a601          	ld	a,#1
1085  0578 2001          	jra	L331
1086  057a               L531:
1087                     ; 830       bitstatus = RESET;
1088  057a 4f            	clr	a
1089  057b               L331:
1090                     ; 834   return  bitstatus;
1092  057b 5b06          	addw	sp,#6
1093  057d 81            	ret	
1095                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
1095                     ; 872 {
1096  057e               _I2C_ClearITPendingBit:
1097  057e 89            	pushw	x
1098  057f 89            	pushw	x
1099       00000002      OFST:	set	2
1101                     ; 873   uint16_t flagpos = 0;
1102                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
1103  0580 a32220        	cpw	x,#8736
1104  0583 2722          	jreq	L433
1105  0585 a32108        	cpw	x,#8456
1106  0588 271d          	jreq	L433
1107  058a a32104        	cpw	x,#8452
1108  058d 2718          	jreq	L433
1109  058f a32102        	cpw	x,#8450
1110  0592 2713          	jreq	L433
1111  0594 a32101        	cpw	x,#8449
1112  0597 270e          	jreq	L433
1113  0599 ae036c        	ldw	x,#876
1114  059c 89            	pushw	x
1115  059d 5f            	clrw	x
1116  059e 89            	pushw	x
1117  059f ae000c        	ldw	x,#L3
1118  05a2 cd0000        	call	_assert_failed
1120  05a5 5b04          	addw	sp,#4
1121  05a7               L433:
1122                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
1123  05a7 7b04          	ld	a,(OFST+2,sp)
1124  05a9 5f            	clrw	x
1125  05aa 02            	rlwa	x,a
1126  05ab 1f01          	ldw	(OFST-1,sp),x
1127                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
1128  05ad 7b02          	ld	a,(OFST+0,sp)
1129  05af 43            	cpl	a
1130  05b0 c75218        	ld	21016,a
1131                     ; 883 }
1132  05b3 5b04          	addw	sp,#4
1133  05b5 81            	ret	
1135                     	xdef	_I2C_ClearITPendingBit
1136                     	xdef	_I2C_GetITStatus
1137                     	xdef	_I2C_ClearFlag
1138                     	xdef	_I2C_GetFlagStatus
1139                     	xdef	_I2C_GetLastEvent
1140                     	xdef	_I2C_CheckEvent
1141                     	xdef	_I2C_SendData
1142                     	xdef	_I2C_Send7bitAddress
1143                     	xdef	_I2C_ReceiveData
1144                     	xdef	_I2C_ITConfig
1145                     	xdef	_I2C_FastModeDutyCycleConfig
1146                     	xdef	_I2C_AcknowledgeConfig
1147                     	xdef	_I2C_StretchClockCmd
1148                     	xdef	_I2C_SoftwareResetCmd
1149                     	xdef	_I2C_GenerateSTOP
1150                     	xdef	_I2C_GenerateSTART
1151                     	xdef	_I2C_GeneralCallCmd
1152                     	xdef	_I2C_Cmd
1153                     	xdef	_I2C_Init
1154                     	xdef	_I2C_DeInit
1155                     	xref	_assert_failed
1156                     	switch	.const
1157  000c               L3:
1158  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1159  001e 6970685f6472  	dc.b	"iph_driver\src\stm"
1160  0030 38735f693263  	dc.b	"8s_i2c.c",0
1161                     	xref.b	c_lreg
1162                     	xref.b	c_x
1163                     	xref	c_sdivx
1164                     	xref	c_ludv
1165                     	xref	c_rtol
1166                     	xref	c_smul
1167                     	xref	c_lmul
1168                     	xref	c_lcmp
1169                     	xref	c_ltor
1170                     	xref	c_lzmp
1171                     	end
