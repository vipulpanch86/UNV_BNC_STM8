   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  20                     ; 88 {
  21                     	scross	off
  22  0000               _FLASH_Unlock:
  23  0000 88            	push	a
  24       00000000      OFST:	set	0
  26                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  27  0001 a1fd          	cp	a,#253
  28  0003 2712          	jreq	L01
  29  0005 a1f7          	cp	a,#247
  30  0007 270e          	jreq	L01
  31  0009 ae005a        	ldw	x,#90
  32  000c 89            	pushw	x
  33  000d 5f            	clrw	x
  34  000e 89            	pushw	x
  35  000f ae0010        	ldw	x,#L3
  36  0012 cd0000        	call	_assert_failed
  38  0015 5b04          	addw	sp,#4
  39  0017               L01:
  40                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  41  0017 7b01          	ld	a,(OFST+1,sp)
  42  0019 a1fd          	cp	a,#253
  43  001b 260a          	jrne	L5
  44                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  45  001d 35565062      	mov	20578,#86
  46                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  47  0021 35ae5062      	mov	20578,#174
  49  0025 2008          	jra	L7
  50  0027               L5:
  51                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  52  0027 35ae5064      	mov	20580,#174
  53                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
  54  002b 35565064      	mov	20580,#86
  55  002f               L7:
  56                     ; 104 }
  57  002f 84            	pop	a
  58  0030 81            	ret	
  60                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
  60                     ; 113 {
  61  0031               _FLASH_Lock:
  62  0031 88            	push	a
  63       00000000      OFST:	set	0
  65                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  66  0032 a1fd          	cp	a,#253
  67  0034 2712          	jreq	L22
  68  0036 a1f7          	cp	a,#247
  69  0038 270e          	jreq	L22
  70  003a ae0073        	ldw	x,#115
  71  003d 89            	pushw	x
  72  003e 5f            	clrw	x
  73  003f 89            	pushw	x
  74  0040 ae0010        	ldw	x,#L3
  75  0043 cd0000        	call	_assert_failed
  77  0046 5b04          	addw	sp,#4
  78  0048               L22:
  79                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
  80  0048 c6505f        	ld	a,20575
  81  004b 1401          	and	a,(OFST+1,sp)
  82  004d c7505f        	ld	20575,a
  83                     ; 119 }
  84  0050 84            	pop	a
  85  0051 81            	ret	
  87                     ; 126 void FLASH_DeInit(void)
  87                     ; 127 {
  88  0052               _FLASH_DeInit:
  90                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
  91  0052 725f505a      	clr	20570
  92                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
  93  0056 725f505b      	clr	20571
  94                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
  95  005a 35ff505c      	mov	20572,#255
  96                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
  97  005e 7217505f      	bres	20575,#3
  98                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
  99  0062 7213505f      	bres	20575,#1
 100                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 101  0066 c6505f        	ld	a,20575
 102                     ; 134 }
 103  0069 81            	ret	
 105                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 105                     ; 143 {
 106  006a               _FLASH_ITConfig:
 107  006a 88            	push	a
 108       00000000      OFST:	set	0
 110                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 111  006b 4d            	tnz	a
 112  006c 2711          	jreq	L63
 113  006e 4a            	dec	a
 114  006f 270e          	jreq	L63
 115  0071 ae0091        	ldw	x,#145
 116  0074 89            	pushw	x
 117  0075 5f            	clrw	x
 118  0076 89            	pushw	x
 119  0077 ae0010        	ldw	x,#L3
 120  007a cd0000        	call	_assert_failed
 122  007d 5b04          	addw	sp,#4
 123  007f               L63:
 124                     ; 147   if(NewState != DISABLE)
 125  007f 7b01          	ld	a,(OFST+1,sp)
 126  0081 2706          	jreq	L11
 127                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 128  0083 7212505a      	bset	20570,#1
 130  0087 2004          	jra	L31
 131  0089               L11:
 132                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 133  0089 7213505a      	bres	20570,#1
 134  008d               L31:
 135                     ; 155 }
 136  008d 84            	pop	a
 137  008e 81            	ret	
 139                     .const:	section	.text
 140  0000               L25:
 141  0000 00008000      	dc.l	32768
 142  0004               L45:
 143  0004 00028000      	dc.l	163840
 144  0008               L65:
 145  0008 00004000      	dc.l	16384
 146  000c               L06:
 147  000c 00004800      	dc.l	18432
 148                     ; 164 void FLASH_EraseByte(uint32_t Address)
 148                     ; 165 {
 149                     	switch	.text
 150  008f               _FLASH_EraseByte:
 151       00000000      OFST:	set	0
 153                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 154  008f 96            	ldw	x,sp
 155  0090 1c0003        	addw	x,#OFST+3
 156  0093 cd0000        	call	c_ltor
 158  0096 ae0000        	ldw	x,#L25
 159  0099 cd0000        	call	c_lcmp
 161  009c 250f          	jrult	L05
 162  009e 96            	ldw	x,sp
 163  009f 1c0003        	addw	x,#OFST+3
 164  00a2 cd0000        	call	c_ltor
 166  00a5 ae0004        	ldw	x,#L45
 167  00a8 cd0000        	call	c_lcmp
 169  00ab 252c          	jrult	L26
 170  00ad               L05:
 171  00ad 96            	ldw	x,sp
 172  00ae 1c0003        	addw	x,#OFST+3
 173  00b1 cd0000        	call	c_ltor
 175  00b4 ae0008        	ldw	x,#L65
 176  00b7 cd0000        	call	c_lcmp
 178  00ba 250f          	jrult	L44
 179  00bc 96            	ldw	x,sp
 180  00bd 1c0003        	addw	x,#OFST+3
 181  00c0 cd0000        	call	c_ltor
 183  00c3 ae000c        	ldw	x,#L06
 184  00c6 cd0000        	call	c_lcmp
 186  00c9 250e          	jrult	L26
 187  00cb               L44:
 188  00cb ae00a7        	ldw	x,#167
 189  00ce 89            	pushw	x
 190  00cf 5f            	clrw	x
 191  00d0 89            	pushw	x
 192  00d1 ae0010        	ldw	x,#L3
 193  00d4 cd0000        	call	_assert_failed
 195  00d7 5b04          	addw	sp,#4
 196  00d9               L26:
 197                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 198  00d9 7b04          	ld	a,(OFST+4,sp)
 199  00db b700          	ld	c_x,a
 200  00dd 1e05          	ldw	x,(OFST+5,sp)
 201  00df bf01          	ldw	c_x+1,x
 202  00e1 4f            	clr	a
 203  00e2 92bd0000      	ldf	[c_x.e],a
 204                     ; 171 }
 205  00e6 81            	ret	
 207                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 207                     ; 182 {
 208  00e7               _FLASH_ProgramByte:
 209       00000000      OFST:	set	0
 211                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 212  00e7 96            	ldw	x,sp
 213  00e8 1c0003        	addw	x,#OFST+3
 214  00eb cd0000        	call	c_ltor
 216  00ee ae0000        	ldw	x,#L25
 217  00f1 cd0000        	call	c_lcmp
 219  00f4 250f          	jrult	L47
 220  00f6 96            	ldw	x,sp
 221  00f7 1c0003        	addw	x,#OFST+3
 222  00fa cd0000        	call	c_ltor
 224  00fd ae0004        	ldw	x,#L45
 225  0100 cd0000        	call	c_lcmp
 227  0103 252c          	jrult	L67
 228  0105               L47:
 229  0105 96            	ldw	x,sp
 230  0106 1c0003        	addw	x,#OFST+3
 231  0109 cd0000        	call	c_ltor
 233  010c ae0008        	ldw	x,#L65
 234  010f cd0000        	call	c_lcmp
 236  0112 250f          	jrult	L07
 237  0114 96            	ldw	x,sp
 238  0115 1c0003        	addw	x,#OFST+3
 239  0118 cd0000        	call	c_ltor
 241  011b ae000c        	ldw	x,#L06
 242  011e cd0000        	call	c_lcmp
 244  0121 250e          	jrult	L67
 245  0123               L07:
 246  0123 ae00b8        	ldw	x,#184
 247  0126 89            	pushw	x
 248  0127 5f            	clrw	x
 249  0128 89            	pushw	x
 250  0129 ae0010        	ldw	x,#L3
 251  012c cd0000        	call	_assert_failed
 253  012f 5b04          	addw	sp,#4
 254  0131               L67:
 255                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 256  0131 7b07          	ld	a,(OFST+7,sp)
 257  0133 88            	push	a
 258  0134 7b05          	ld	a,(OFST+5,sp)
 259  0136 b700          	ld	c_x,a
 260  0138 1e06          	ldw	x,(OFST+6,sp)
 261  013a bf01          	ldw	c_x+1,x
 262  013c 84            	pop	a
 263  013d 92bd0000      	ldf	[c_x.e],a
 264                     ; 186 }
 265  0141 81            	ret	
 267                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 267                     ; 196 {
 268  0142               _FLASH_ReadByte:
 269       00000000      OFST:	set	0
 271                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 272  0142 96            	ldw	x,sp
 273  0143 1c0003        	addw	x,#OFST+3
 274  0146 cd0000        	call	c_ltor
 276  0149 ae0000        	ldw	x,#L25
 277  014c cd0000        	call	c_lcmp
 279  014f 250f          	jrult	L011
 280  0151 96            	ldw	x,sp
 281  0152 1c0003        	addw	x,#OFST+3
 282  0155 cd0000        	call	c_ltor
 284  0158 ae0004        	ldw	x,#L45
 285  015b cd0000        	call	c_lcmp
 287  015e 252c          	jrult	L211
 288  0160               L011:
 289  0160 96            	ldw	x,sp
 290  0161 1c0003        	addw	x,#OFST+3
 291  0164 cd0000        	call	c_ltor
 293  0167 ae0008        	ldw	x,#L65
 294  016a cd0000        	call	c_lcmp
 296  016d 250f          	jrult	L401
 297  016f 96            	ldw	x,sp
 298  0170 1c0003        	addw	x,#OFST+3
 299  0173 cd0000        	call	c_ltor
 301  0176 ae000c        	ldw	x,#L06
 302  0179 cd0000        	call	c_lcmp
 304  017c 250e          	jrult	L211
 305  017e               L401:
 306  017e ae00c6        	ldw	x,#198
 307  0181 89            	pushw	x
 308  0182 5f            	clrw	x
 309  0183 89            	pushw	x
 310  0184 ae0010        	ldw	x,#L3
 311  0187 cd0000        	call	_assert_failed
 313  018a 5b04          	addw	sp,#4
 314  018c               L211:
 315                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 316  018c 7b04          	ld	a,(OFST+4,sp)
 317  018e b700          	ld	c_x,a
 318  0190 1e05          	ldw	x,(OFST+5,sp)
 319  0192 bf01          	ldw	c_x+1,x
 320  0194 92bc0000      	ldf	a,[c_x.e]
 322  0198 81            	ret	
 324                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 324                     ; 213 {
 325  0199               _FLASH_ProgramWord:
 326       00000000      OFST:	set	0
 328                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 329  0199 96            	ldw	x,sp
 330  019a 1c0003        	addw	x,#OFST+3
 331  019d cd0000        	call	c_ltor
 333  01a0 ae0000        	ldw	x,#L25
 334  01a3 cd0000        	call	c_lcmp
 336  01a6 250f          	jrult	L421
 337  01a8 96            	ldw	x,sp
 338  01a9 1c0003        	addw	x,#OFST+3
 339  01ac cd0000        	call	c_ltor
 341  01af ae0004        	ldw	x,#L45
 342  01b2 cd0000        	call	c_lcmp
 344  01b5 252c          	jrult	L621
 345  01b7               L421:
 346  01b7 96            	ldw	x,sp
 347  01b8 1c0003        	addw	x,#OFST+3
 348  01bb cd0000        	call	c_ltor
 350  01be ae0008        	ldw	x,#L65
 351  01c1 cd0000        	call	c_lcmp
 353  01c4 250f          	jrult	L021
 354  01c6 96            	ldw	x,sp
 355  01c7 1c0003        	addw	x,#OFST+3
 356  01ca cd0000        	call	c_ltor
 358  01cd ae000c        	ldw	x,#L06
 359  01d0 cd0000        	call	c_lcmp
 361  01d3 250e          	jrult	L621
 362  01d5               L021:
 363  01d5 ae00d7        	ldw	x,#215
 364  01d8 89            	pushw	x
 365  01d9 5f            	clrw	x
 366  01da 89            	pushw	x
 367  01db ae0010        	ldw	x,#L3
 368  01de cd0000        	call	_assert_failed
 370  01e1 5b04          	addw	sp,#4
 371  01e3               L621:
 372                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 373  01e3 721c505b      	bset	20571,#6
 374                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 375  01e7 721d505c      	bres	20572,#6
 376                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 377  01eb 7b07          	ld	a,(OFST+7,sp)
 378  01ed 88            	push	a
 379  01ee 7b05          	ld	a,(OFST+5,sp)
 380  01f0 b700          	ld	c_x,a
 381  01f2 1e06          	ldw	x,(OFST+6,sp)
 382  01f4 bf01          	ldw	c_x+1,x
 383  01f6 84            	pop	a
 384  01f7 92bd0000      	ldf	[c_x.e],a
 385                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 386  01fb 7b08          	ld	a,(OFST+8,sp)
 387  01fd 88            	push	a
 388  01fe 7b05          	ld	a,(OFST+5,sp)
 389  0200 b700          	ld	c_x,a
 390  0202 1e06          	ldw	x,(OFST+6,sp)
 391  0204 bf01          	ldw	c_x+1,x
 392  0206 ae0001        	ldw	x,#1
 393  0209 84            	pop	a
 394  020a 92a70000      	ldf	([c_x.e],x),a
 395                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 396  020e 7b09          	ld	a,(OFST+9,sp)
 397  0210 88            	push	a
 398  0211 7b05          	ld	a,(OFST+5,sp)
 399  0213 b700          	ld	c_x,a
 400  0215 1e06          	ldw	x,(OFST+6,sp)
 401  0217 bf01          	ldw	c_x+1,x
 402  0219 ae0002        	ldw	x,#2
 403  021c 84            	pop	a
 404  021d 92a70000      	ldf	([c_x.e],x),a
 405                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 406  0221 7b0a          	ld	a,(OFST+10,sp)
 407  0223 88            	push	a
 408  0224 7b05          	ld	a,(OFST+5,sp)
 409  0226 b700          	ld	c_x,a
 410  0228 1e06          	ldw	x,(OFST+6,sp)
 411  022a bf01          	ldw	c_x+1,x
 412  022c ae0003        	ldw	x,#3
 413  022f 84            	pop	a
 414  0230 92a70000      	ldf	([c_x.e],x),a
 415                     ; 229 }
 416  0234 81            	ret	
 418                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 418                     ; 238 {
 419  0235               _FLASH_ProgramOptionByte:
 420  0235 89            	pushw	x
 421       00000000      OFST:	set	0
 423                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 424  0236 a34800        	cpw	x,#18432
 425  0239 2505          	jrult	L431
 426  023b a34880        	cpw	x,#18560
 427  023e 250e          	jrult	L631
 428  0240               L431:
 429  0240 ae00f0        	ldw	x,#240
 430  0243 89            	pushw	x
 431  0244 5f            	clrw	x
 432  0245 89            	pushw	x
 433  0246 ae0010        	ldw	x,#L3
 434  0249 cd0000        	call	_assert_failed
 436  024c 5b04          	addw	sp,#4
 437  024e               L631:
 438                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 439  024e 721e505b      	bset	20571,#7
 440                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 441  0252 721f505c      	bres	20572,#7
 442                     ; 247   if(Address == 0x4800)
 443  0256 1e01          	ldw	x,(OFST+1,sp)
 444  0258 a34800        	cpw	x,#18432
 445  025b 2605          	jrne	L51
 446                     ; 250     *((NEAR uint8_t*)Address) = Data;
 447  025d 7b05          	ld	a,(OFST+5,sp)
 448  025f f7            	ld	(x),a
 450  0260 2006          	jra	L71
 451  0262               L51:
 452                     ; 255     *((NEAR uint8_t*)Address) = Data;
 453  0262 7b05          	ld	a,(OFST+5,sp)
 454  0264 f7            	ld	(x),a
 455                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 456  0265 43            	cpl	a
 457  0266 e701          	ld	(1,x),a
 458  0268               L71:
 459                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 460  0268 a6fd          	ld	a,#253
 461  026a cd03c2        	call	_FLASH_WaitForLastOperation
 463                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 464  026d 721f505b      	bres	20571,#7
 465                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 466  0271 721e505c      	bset	20572,#7
 467                     ; 263 }
 468  0275 85            	popw	x
 469  0276 81            	ret	
 471                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 471                     ; 271 {
 472  0277               _FLASH_EraseOptionByte:
 473  0277 89            	pushw	x
 474       00000000      OFST:	set	0
 476                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 477  0278 a34800        	cpw	x,#18432
 478  027b 2505          	jrult	L641
 479  027d a34880        	cpw	x,#18560
 480  0280 250e          	jrult	L051
 481  0282               L641:
 482  0282 ae0111        	ldw	x,#273
 483  0285 89            	pushw	x
 484  0286 5f            	clrw	x
 485  0287 89            	pushw	x
 486  0288 ae0010        	ldw	x,#L3
 487  028b cd0000        	call	_assert_failed
 489  028e 5b04          	addw	sp,#4
 490  0290               L051:
 491                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 492  0290 721e505b      	bset	20571,#7
 493                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 494  0294 721f505c      	bres	20572,#7
 495                     ; 280   if(Address == 0x4800)
 496  0298 1e01          	ldw	x,(OFST+1,sp)
 497  029a a34800        	cpw	x,#18432
 498  029d 2603          	jrne	L12
 499                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 500  029f 7f            	clr	(x)
 502  02a0 2005          	jra	L32
 503  02a2               L12:
 504                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 505  02a2 7f            	clr	(x)
 506                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 507  02a3 a6ff          	ld	a,#255
 508  02a5 e701          	ld	(1,x),a
 509  02a7               L32:
 510                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 511  02a7 a6fd          	ld	a,#253
 512  02a9 cd03c2        	call	_FLASH_WaitForLastOperation
 514                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 515  02ac 721f505b      	bres	20571,#7
 516                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 517  02b0 721e505c      	bset	20572,#7
 518                     ; 296 }
 519  02b4 85            	popw	x
 520  02b5 81            	ret	
 522                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 522                     ; 304 {
 523  02b6               _FLASH_ReadOptionByte:
 524  02b6 89            	pushw	x
 525  02b7 5204          	subw	sp,#4
 526       00000004      OFST:	set	4
 528                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 529                     ; 306   uint16_t res_value = 0;
 530                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 531  02b9 a34800        	cpw	x,#18432
 532  02bc 2505          	jrult	L061
 533  02be a34880        	cpw	x,#18560
 534  02c1 250e          	jrult	L261
 535  02c3               L061:
 536  02c3 ae0135        	ldw	x,#309
 537  02c6 89            	pushw	x
 538  02c7 5f            	clrw	x
 539  02c8 89            	pushw	x
 540  02c9 ae0010        	ldw	x,#L3
 541  02cc cd0000        	call	_assert_failed
 543  02cf 5b04          	addw	sp,#4
 544  02d1               L261:
 545                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 546  02d1 1e05          	ldw	x,(OFST+1,sp)
 547  02d3 f6            	ld	a,(x)
 548  02d4 6b01          	ld	(OFST-3,sp),a
 549                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 550  02d6 e601          	ld	a,(1,x)
 551  02d8 6b02          	ld	(OFST-2,sp),a
 552                     ; 315   if(Address == 0x4800)	 
 553  02da a34800        	cpw	x,#18432
 554  02dd 2606          	jrne	L52
 555                     ; 317     res_value =	 value_optbyte;
 556  02df 7b01          	ld	a,(OFST-3,sp)
 557  02e1 5f            	clrw	x
 558  02e2 97            	ld	xl,a
 560  02e3 201c          	jra	L72
 561  02e5               L52:
 562                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 563  02e5 43            	cpl	a
 564  02e6 1101          	cp	a,(OFST-3,sp)
 565  02e8 2614          	jrne	L13
 566                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 567  02ea 7b01          	ld	a,(OFST-3,sp)
 568  02ec 97            	ld	xl,a
 569  02ed 4f            	clr	a
 570  02ee 02            	rlwa	x,a
 571  02ef 1f03          	ldw	(OFST-1,sp),x
 572                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 573  02f1 5f            	clrw	x
 574  02f2 7b02          	ld	a,(OFST-2,sp)
 575  02f4 97            	ld	xl,a
 576  02f5 01            	rrwa	x,a
 577  02f6 1a04          	or	a,(OFST+0,sp)
 578  02f8 01            	rrwa	x,a
 579  02f9 1a03          	or	a,(OFST-1,sp)
 580  02fb 01            	rrwa	x,a
 582  02fc 2003          	jra	L72
 583  02fe               L13:
 584                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 585  02fe ae5555        	ldw	x,#21845
 586  0301               L72:
 587                     ; 331   return(res_value);
 589  0301 5b06          	addw	sp,#6
 590  0303 81            	ret	
 592                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 592                     ; 341 {
 593  0304               _FLASH_SetLowPowerMode:
 594  0304 88            	push	a
 595       00000000      OFST:	set	0
 597                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 598  0305 a104          	cp	a,#4
 599  0307 2719          	jreq	L471
 600  0309 a108          	cp	a,#8
 601  030b 2715          	jreq	L471
 602  030d 4d            	tnz	a
 603  030e 2712          	jreq	L471
 604  0310 a10c          	cp	a,#12
 605  0312 270e          	jreq	L471
 606  0314 ae0157        	ldw	x,#343
 607  0317 89            	pushw	x
 608  0318 5f            	clrw	x
 609  0319 89            	pushw	x
 610  031a ae0010        	ldw	x,#L3
 611  031d cd0000        	call	_assert_failed
 613  0320 5b04          	addw	sp,#4
 614  0322               L471:
 615                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 616  0322 c6505a        	ld	a,20570
 617  0325 a4f3          	and	a,#243
 618  0327 c7505a        	ld	20570,a
 619                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 620  032a c6505a        	ld	a,20570
 621  032d 1a01          	or	a,(OFST+1,sp)
 622  032f c7505a        	ld	20570,a
 623                     ; 350 }
 624  0332 84            	pop	a
 625  0333 81            	ret	
 627                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 627                     ; 359 {
 628  0334               _FLASH_SetProgrammingTime:
 629  0334 88            	push	a
 630       00000000      OFST:	set	0
 632                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 633  0335 4d            	tnz	a
 634  0336 2711          	jreq	L602
 635  0338 4a            	dec	a
 636  0339 270e          	jreq	L602
 637  033b ae0169        	ldw	x,#361
 638  033e 89            	pushw	x
 639  033f 5f            	clrw	x
 640  0340 89            	pushw	x
 641  0341 ae0010        	ldw	x,#L3
 642  0344 cd0000        	call	_assert_failed
 644  0347 5b04          	addw	sp,#4
 645  0349               L602:
 646                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 647  0349 7211505a      	bres	20570,#0
 648                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 649  034d c6505a        	ld	a,20570
 650  0350 1a01          	or	a,(OFST+1,sp)
 651  0352 c7505a        	ld	20570,a
 652                     ; 365 }
 653  0355 84            	pop	a
 654  0356 81            	ret	
 656                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
 656                     ; 373 {
 657  0357               _FLASH_GetLowPowerMode:
 659                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
 660  0357 c6505a        	ld	a,20570
 661  035a a40c          	and	a,#12
 663  035c 81            	ret	
 665                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 665                     ; 383 {
 666  035d               _FLASH_GetProgrammingTime:
 668                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 669  035d c6505a        	ld	a,20570
 670  0360 a401          	and	a,#1
 672  0362 81            	ret	
 674                     ; 392 uint32_t FLASH_GetBootSize(void)
 674                     ; 393 {
 675  0363               _FLASH_GetBootSize:
 676  0363 5204          	subw	sp,#4
 677       00000004      OFST:	set	4
 679                     ; 394   uint32_t temp = 0;
 680                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
 681  0365 c6505d        	ld	a,20573
 682  0368 5f            	clrw	x
 683  0369 97            	ld	xl,a
 684  036a 90ae0200      	ldw	y,#512
 685  036e cd0000        	call	c_umul
 687  0371 96            	ldw	x,sp
 688  0372 5c            	incw	x
 689  0373 cd0000        	call	c_rtol
 691                     ; 400   if(FLASH->FPR == 0xFF)
 692  0376 c6505d        	ld	a,20573
 693  0379 4c            	inc	a
 694  037a 260d          	jrne	L53
 695                     ; 402     temp += 512;
 696  037c ae0200        	ldw	x,#512
 697  037f bf02          	ldw	c_lreg+2,x
 698  0381 5f            	clrw	x
 699  0382 bf00          	ldw	c_lreg,x
 700  0384 96            	ldw	x,sp
 701  0385 5c            	incw	x
 702  0386 cd0000        	call	c_lgadd
 704  0389               L53:
 705                     ; 406   return(temp);
 706  0389 96            	ldw	x,sp
 707  038a 5c            	incw	x
 708  038b cd0000        	call	c_ltor
 711  038e 5b04          	addw	sp,#4
 712  0390 81            	ret	
 714                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
 714                     ; 418 {
 715  0391               _FLASH_GetFlagStatus:
 716  0391 88            	push	a
 717  0392 88            	push	a
 718       00000001      OFST:	set	1
 720                     ; 419   FlagStatus status = RESET;
 721                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
 722  0393 a140          	cp	a,#64
 723  0395 271d          	jreq	L622
 724  0397 a108          	cp	a,#8
 725  0399 2719          	jreq	L622
 726  039b a104          	cp	a,#4
 727  039d 2715          	jreq	L622
 728  039f a102          	cp	a,#2
 729  03a1 2711          	jreq	L622
 730  03a3 4a            	dec	a
 731  03a4 270e          	jreq	L622
 732  03a6 ae01a5        	ldw	x,#421
 733  03a9 89            	pushw	x
 734  03aa 5f            	clrw	x
 735  03ab 89            	pushw	x
 736  03ac ae0010        	ldw	x,#L3
 737  03af cd0000        	call	_assert_failed
 739  03b2 5b04          	addw	sp,#4
 740  03b4               L622:
 741                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 742  03b4 c6505f        	ld	a,20575
 743  03b7 1502          	bcp	a,(OFST+1,sp)
 744  03b9 2704          	jreq	L73
 745                     ; 426     status = SET; /* FLASH_FLAG is set */
 746  03bb a601          	ld	a,#1
 748  03bd 2001          	jra	L14
 749  03bf               L73:
 750                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
 751  03bf 4f            	clr	a
 752  03c0               L14:
 753                     ; 434   return status;
 755  03c0 85            	popw	x
 756  03c1 81            	ret	
 758                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
 758                     ; 550 {
 759  03c2               _FLASH_WaitForLastOperation:
 760  03c2 5203          	subw	sp,#3
 761       00000003      OFST:	set	3
 763                     ; 551   uint8_t flagstatus = 0x00;
 764  03c4 0f03          	clr	(OFST+0,sp)
 765                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
 766  03c6 aeffff        	ldw	x,#65535
 767  03c9 1f01          	ldw	(OFST-2,sp),x
 768                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 769  03cb a1fd          	cp	a,#253
 770  03cd 2620          	jrne	L16
 772  03cf 200a          	jra	L74
 773  03d1               L54:
 774                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
 774                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
 775  03d1 c6505f        	ld	a,20575
 776  03d4 a405          	and	a,#5
 777  03d6 6b03          	ld	(OFST+0,sp),a
 778                     ; 563         timeout--;
 779  03d8 5a            	decw	x
 780  03d9 1f01          	ldw	(OFST-2,sp),x
 781  03db               L74:
 782                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
 783  03db 7b03          	ld	a,(OFST+0,sp)
 784  03dd 2618          	jrne	L55
 786  03df 1e01          	ldw	x,(OFST-2,sp)
 787  03e1 26ee          	jrne	L54
 788  03e3 2012          	jra	L55
 789  03e5               L75:
 790                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
 790                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
 791  03e5 c6505f        	ld	a,20575
 792  03e8 a441          	and	a,#65
 793  03ea 6b03          	ld	(OFST+0,sp),a
 794                     ; 572         timeout--;
 795  03ec 5a            	decw	x
 796  03ed 1f01          	ldw	(OFST-2,sp),x
 797  03ef               L16:
 798                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
 799  03ef 7b03          	ld	a,(OFST+0,sp)
 800  03f1 2604          	jrne	L55
 802  03f3 1e01          	ldw	x,(OFST-2,sp)
 803  03f5 26ee          	jrne	L75
 804  03f7               L55:
 805                     ; 583   if(timeout == 0x00 )
 806  03f7 1e01          	ldw	x,(OFST-2,sp)
 807  03f9 2602          	jrne	L76
 808                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
 809  03fb a602          	ld	a,#2
 810  03fd               L76:
 811                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
 813  03fd 5b03          	addw	sp,#3
 814  03ff 81            	ret	
 816                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
 816                     ; 599 {
 817  0400               _FLASH_EraseBlock:
 818  0400 89            	pushw	x
 819  0401 5207          	subw	sp,#7
 820       00000007      OFST:	set	7
 822                     ; 600   uint32_t startaddress = 0;
 823                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 824  0403 7b0c          	ld	a,(OFST+5,sp)
 825  0405 a1fd          	cp	a,#253
 826  0407 270b          	jreq	L242
 827  0409 a1f7          	cp	a,#247
 828  040b 2707          	jreq	L242
 829  040d ae0262        	ldw	x,#610
 830  0410 ad72          	call	LC001
 831  0412 7b0c          	ld	a,(OFST+5,sp)
 832  0414               L242:
 833                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 834  0414 a1fd          	cp	a,#253
 835  0416 2611          	jrne	L17
 836                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 837  0418 1e08          	ldw	x,(OFST+1,sp)
 838  041a a30400        	cpw	x,#1024
 839  041d 2505          	jrult	L052
 840  041f ae0265        	ldw	x,#613
 841  0422 ad60          	call	LC001
 842  0424               L052:
 843                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 844  0424 ae8000        	ldw	x,#32768
 846  0427 200f          	jra	L37
 847  0429               L17:
 848                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 849  0429 1e08          	ldw	x,(OFST+1,sp)
 850  042b a30010        	cpw	x,#16
 851  042e 2505          	jrult	L652
 852  0430 ae026a        	ldw	x,#618
 853  0433 ad4f          	call	LC001
 854  0435               L652:
 855                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 856  0435 ae4000        	ldw	x,#16384
 857  0438               L37:
 858  0438 1f03          	ldw	(OFST-4,sp),x
 859  043a 5f            	clrw	x
 860  043b 1f01          	ldw	(OFST-6,sp),x
 861                     ; 624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
 862  043d a680          	ld	a,#128
 863  043f 1e08          	ldw	x,(OFST+1,sp)
 864  0441 cd0000        	call	c_cmulx
 866  0444 96            	ldw	x,sp
 867  0445 5c            	incw	x
 868  0446 cd0000        	call	c_ladd
 870  0449 450100        	mov	c_x,c_lreg+1
 871  044c b600          	ld	a,c_x
 872  044e be02          	ldw	x,c_lreg+2
 873  0450 6b05          	ld	(OFST-2,sp),a
 874  0452 1f06          	ldw	(OFST-1,sp),x
 875                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
 876  0454 721a505b      	bset	20571,#5
 877                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
 878  0458 721b505c      	bres	20572,#5
 879                     ; 639     *pwFlash = (uint8_t)0;
 880  045c b700          	ld	c_x,a
 881  045e bf01          	ldw	c_x+1,x
 882  0460 4f            	clr	a
 883  0461 92bd0000      	ldf	[c_x.e],a
 884                     ; 640   *(pwFlash + 1) = (uint8_t)0;
 885  0465 7b05          	ld	a,(OFST-2,sp)
 886  0467 b700          	ld	c_x,a
 887  0469 ae0001        	ldw	x,#1
 888  046c 4f            	clr	a
 889  046d 92a70000      	ldf	([c_x.e],x),a
 890                     ; 641   *(pwFlash + 2) = (uint8_t)0;
 891  0471 1e06          	ldw	x,(OFST-1,sp)
 892  0473 bf01          	ldw	c_x+1,x
 893  0475 ae0002        	ldw	x,#2
 894  0478 92a70000      	ldf	([c_x.e],x),a
 895                     ; 642   *(pwFlash + 3) = (uint8_t)0;    
 896  047c 5c            	incw	x
 897  047d 92a70000      	ldf	([c_x.e],x),a
 898                     ; 644 }
 899  0481 5b09          	addw	sp,#9
 900  0483 81            	ret	
 901  0484               LC001:
 902  0484 89            	pushw	x
 903  0485 5f            	clrw	x
 904  0486 89            	pushw	x
 905  0487 ae0010        	ldw	x,#L3
 906  048a cd0000        	call	_assert_failed
 908  048d 5b04          	addw	sp,#4
 909  048f 81            	ret	
 911                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
 911                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
 911                     ; 657 {
 912  0490               _FLASH_ProgramBlock:
 913  0490 89            	pushw	x
 914  0491 5206          	subw	sp,#6
 915       00000006      OFST:	set	6
 917                     ; 658   uint16_t Count = 0;
 918                     ; 659   uint32_t startaddress = 0;
 919                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 920  0493 7b0b          	ld	a,(OFST+5,sp)
 921  0495 a1fd          	cp	a,#253
 922  0497 2709          	jreq	L072
 923  0499 a1f7          	cp	a,#247
 924  049b 2705          	jreq	L072
 925  049d ae0296        	ldw	x,#662
 926  04a0 ad7e          	call	LC002
 927  04a2               L072:
 928                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
 929  04a2 7b0c          	ld	a,(OFST+6,sp)
 930  04a4 2709          	jreq	L003
 931  04a6 a110          	cp	a,#16
 932  04a8 2705          	jreq	L003
 933  04aa ae0297        	ldw	x,#663
 934  04ad ad71          	call	LC002
 935  04af               L003:
 936                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 937  04af 7b0b          	ld	a,(OFST+5,sp)
 938  04b1 a1fd          	cp	a,#253
 939  04b3 2611          	jrne	L57
 940                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 941  04b5 1e07          	ldw	x,(OFST+1,sp)
 942  04b7 a30400        	cpw	x,#1024
 943  04ba 2505          	jrult	L603
 944  04bc ae029a        	ldw	x,#666
 945  04bf ad5f          	call	LC002
 946  04c1               L603:
 947                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 948  04c1 ae8000        	ldw	x,#32768
 950  04c4 200f          	jra	L77
 951  04c6               L57:
 952                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 953  04c6 1e07          	ldw	x,(OFST+1,sp)
 954  04c8 a30010        	cpw	x,#16
 955  04cb 2505          	jrult	L413
 956  04cd ae029f        	ldw	x,#671
 957  04d0 ad4e          	call	LC002
 958  04d2               L413:
 959                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 960  04d2 ae4000        	ldw	x,#16384
 961  04d5               L77:
 962  04d5 1f03          	ldw	(OFST-3,sp),x
 963  04d7 5f            	clrw	x
 964  04d8 1f01          	ldw	(OFST-5,sp),x
 965                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
 966  04da a680          	ld	a,#128
 967  04dc 1e07          	ldw	x,(OFST+1,sp)
 968  04de cd0000        	call	c_cmulx
 970  04e1 96            	ldw	x,sp
 971  04e2 5c            	incw	x
 972  04e3 cd0000        	call	c_lgadd
 974                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
 975  04e6 7b0c          	ld	a,(OFST+6,sp)
 976  04e8 260a          	jrne	L101
 977                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
 978  04ea 7210505b      	bset	20571,#0
 979                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
 980  04ee 7211505c      	bres	20572,#0
 982  04f2 2008          	jra	L301
 983  04f4               L101:
 984                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
 985  04f4 7218505b      	bset	20571,#4
 986                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
 987  04f8 7219505c      	bres	20572,#4
 988  04fc               L301:
 989                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 990  04fc 5f            	clrw	x
 991  04fd 1f05          	ldw	(OFST-1,sp),x
 992  04ff               L501:
 993                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
 994  04ff 1e0d          	ldw	x,(OFST+7,sp)
 995  0501 72fb05        	addw	x,(OFST-1,sp)
 996  0504 f6            	ld	a,(x)
 997  0505 88            	push	a
 998  0506 7b03          	ld	a,(OFST-3,sp)
 999  0508 b700          	ld	c_x,a
1000  050a 1e04          	ldw	x,(OFST-2,sp)
1001  050c bf01          	ldw	c_x+1,x
1002  050e 84            	pop	a
1003  050f 1e05          	ldw	x,(OFST-1,sp)
1004  0511 92a70000      	ldf	([c_x.e],x),a
1005                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1006  0515 5c            	incw	x
1007  0516 1f05          	ldw	(OFST-1,sp),x
1009  0518 a30080        	cpw	x,#128
1010  051b 25e2          	jrult	L501
1011                     ; 697 }
1012  051d 5b08          	addw	sp,#8
1013  051f 81            	ret	
1014  0520               LC002:
1015  0520 89            	pushw	x
1016  0521 5f            	clrw	x
1017  0522 89            	pushw	x
1018  0523 ae0010        	ldw	x,#L3
1019  0526 cd0000        	call	_assert_failed
1021  0529 5b04          	addw	sp,#4
1022  052b 81            	ret	
1024                     	xdef	_FLASH_WaitForLastOperation
1025                     	xdef	_FLASH_ProgramBlock
1026                     	xdef	_FLASH_EraseBlock
1027                     	xdef	_FLASH_GetFlagStatus
1028                     	xdef	_FLASH_GetBootSize
1029                     	xdef	_FLASH_GetProgrammingTime
1030                     	xdef	_FLASH_GetLowPowerMode
1031                     	xdef	_FLASH_SetProgrammingTime
1032                     	xdef	_FLASH_SetLowPowerMode
1033                     	xdef	_FLASH_EraseOptionByte
1034                     	xdef	_FLASH_ProgramOptionByte
1035                     	xdef	_FLASH_ReadOptionByte
1036                     	xdef	_FLASH_ProgramWord
1037                     	xdef	_FLASH_ReadByte
1038                     	xdef	_FLASH_ProgramByte
1039                     	xdef	_FLASH_EraseByte
1040                     	xdef	_FLASH_ITConfig
1041                     	xdef	_FLASH_DeInit
1042                     	xdef	_FLASH_Lock
1043                     	xdef	_FLASH_Unlock
1044                     	xref	_assert_failed
1045                     	switch	.const
1046  0010               L3:
1047  0010 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
1048  0022 6970685f6472  	dc.b	"iph_driver\src\stm"
1049  0034 38735f666c61  	dc.b	"8s_flash.c",0
1050                     	xref.b	c_lreg
1051                     	xref.b	c_x
1052                     	xref.b	c_y
1053                     	xref	c_ladd
1054                     	xref	c_cmulx
1055                     	xref	c_lgadd
1056                     	xref	c_rtol
1057                     	xref	c_umul
1058                     	xref	c_lcmp
1059                     	xref	c_ltor
1060                     	end
