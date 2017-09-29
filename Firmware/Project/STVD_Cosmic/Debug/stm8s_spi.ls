   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 50 void SPI_DeInit(void)
  20                     ; 51 {
  21                     	scross	off
  22  0000               _SPI_DeInit:
  24                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  25  0000 725f5200      	clr	20992
  26                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  27  0004 725f5201      	clr	20993
  28                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  29  0008 725f5202      	clr	20994
  30                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  31  000c 35025203      	mov	20995,#2
  32                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  33  0010 35075205      	mov	20997,#7
  34                     ; 57 }
  35  0014 81            	ret	
  37                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
  37                     ; 79 {
  38  0015               _SPI_Init:
  39  0015 89            	pushw	x
  40  0016 88            	push	a
  41       00000001      OFST:	set	1
  43                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
  44  0017 9e            	ld	a,xh
  45  0018 4d            	tnz	a
  46  0019 270b          	jreq	L21
  47  001b 9e            	ld	a,xh
  48  001c a180          	cp	a,#128
  49  001e 2706          	jreq	L21
  50  0020 ae0051        	ldw	x,#81
  51  0023 cd00d7        	call	LC001
  52  0026               L21:
  53                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
  54  0026 7b03          	ld	a,(OFST+2,sp)
  55  0028 2722          	jreq	L22
  56  002a a108          	cp	a,#8
  57  002c 271e          	jreq	L22
  58  002e a110          	cp	a,#16
  59  0030 271a          	jreq	L22
  60  0032 a118          	cp	a,#24
  61  0034 2716          	jreq	L22
  62  0036 a120          	cp	a,#32
  63  0038 2712          	jreq	L22
  64  003a a128          	cp	a,#40
  65  003c 270e          	jreq	L22
  66  003e a130          	cp	a,#48
  67  0040 270a          	jreq	L22
  68  0042 a138          	cp	a,#56
  69  0044 2706          	jreq	L22
  70  0046 ae0052        	ldw	x,#82
  71  0049 cd00d7        	call	LC001
  72  004c               L22:
  73                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
  74  004c 7b06          	ld	a,(OFST+5,sp)
  75  004e a104          	cp	a,#4
  76  0050 2709          	jreq	L23
  77  0052 7b06          	ld	a,(OFST+5,sp)
  78  0054 2705          	jreq	L23
  79  0056 ae0053        	ldw	x,#83
  80  0059 ad7c          	call	LC001
  81  005b               L23:
  82                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
  83  005b 7b07          	ld	a,(OFST+6,sp)
  84  005d 2709          	jreq	L24
  85  005f a102          	cp	a,#2
  86  0061 2705          	jreq	L24
  87  0063 ae0054        	ldw	x,#84
  88  0066 ad6f          	call	LC001
  89  0068               L24:
  90                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
  91  0068 7b08          	ld	a,(OFST+7,sp)
  92  006a 2708          	jreq	L25
  93  006c 4a            	dec	a
  94  006d 2705          	jreq	L25
  95  006f ae0055        	ldw	x,#85
  96  0072 ad63          	call	LC001
  97  0074               L25:
  98                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
  99  0074 7b09          	ld	a,(OFST+8,sp)
 100  0076 2711          	jreq	L26
 101  0078 a104          	cp	a,#4
 102  007a 270d          	jreq	L26
 103  007c a180          	cp	a,#128
 104  007e 2709          	jreq	L26
 105  0080 a1c0          	cp	a,#192
 106  0082 2705          	jreq	L26
 107  0084 ae0056        	ldw	x,#86
 108  0087 ad4e          	call	LC001
 109  0089               L26:
 110                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 111  0089 7b0a          	ld	a,(OFST+9,sp)
 112  008b a102          	cp	a,#2
 113  008d 2709          	jreq	L27
 114  008f 7b0a          	ld	a,(OFST+9,sp)
 115  0091 2705          	jreq	L27
 116  0093 ae0057        	ldw	x,#87
 117  0096 ad3f          	call	LC001
 118  0098               L27:
 119                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 120  0098 7b0b          	ld	a,(OFST+10,sp)
 121  009a 2605          	jrne	L001
 122  009c ae0058        	ldw	x,#88
 123  009f ad36          	call	LC001
 124  00a1               L001:
 125                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 125                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 126  00a1 7b07          	ld	a,(OFST+6,sp)
 127  00a3 1a08          	or	a,(OFST+7,sp)
 128  00a5 6b01          	ld	(OFST+0,sp),a
 129  00a7 7b02          	ld	a,(OFST+1,sp)
 130  00a9 1a03          	or	a,(OFST+2,sp)
 131  00ab 1a01          	or	a,(OFST+0,sp)
 132  00ad c75200        	ld	20992,a
 133                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 134  00b0 7b09          	ld	a,(OFST+8,sp)
 135  00b2 1a0a          	or	a,(OFST+9,sp)
 136  00b4 c75201        	ld	20993,a
 137                     ; 97   if (Mode == SPI_MODE_MASTER)
 138  00b7 7b06          	ld	a,(OFST+5,sp)
 139  00b9 a104          	cp	a,#4
 140  00bb 2606          	jrne	L5
 141                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 142  00bd 72105201      	bset	20993,#0
 144  00c1 2004          	jra	L7
 145  00c3               L5:
 146                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 147  00c3 72115201      	bres	20993,#0
 148  00c7               L7:
 149                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 150  00c7 c65200        	ld	a,20992
 151  00ca 1a06          	or	a,(OFST+5,sp)
 152  00cc c75200        	ld	20992,a
 153                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 154  00cf 7b0b          	ld	a,(OFST+10,sp)
 155  00d1 c75205        	ld	20997,a
 156                     ; 111 }
 157  00d4 5b03          	addw	sp,#3
 158  00d6 81            	ret	
 159  00d7               LC001:
 160  00d7 89            	pushw	x
 161  00d8 5f            	clrw	x
 162  00d9 89            	pushw	x
 163  00da ae0000        	ldw	x,#L3
 164  00dd cd0000        	call	_assert_failed
 166  00e0 5b04          	addw	sp,#4
 167  00e2 81            	ret	
 169                     ; 119 void SPI_Cmd(FunctionalState NewState)
 169                     ; 120 {
 170  00e3               _SPI_Cmd:
 171  00e3 88            	push	a
 172       00000000      OFST:	set	0
 174                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175  00e4 4d            	tnz	a
 176  00e5 2711          	jreq	L211
 177  00e7 4a            	dec	a
 178  00e8 270e          	jreq	L211
 179  00ea ae007a        	ldw	x,#122
 180  00ed 89            	pushw	x
 181  00ee 5f            	clrw	x
 182  00ef 89            	pushw	x
 183  00f0 ae0000        	ldw	x,#L3
 184  00f3 cd0000        	call	_assert_failed
 186  00f6 5b04          	addw	sp,#4
 187  00f8               L211:
 188                     ; 124   if (NewState != DISABLE)
 189  00f8 7b01          	ld	a,(OFST+1,sp)
 190  00fa 2706          	jreq	L11
 191                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 192  00fc 721c5200      	bset	20992,#6
 194  0100 2004          	jra	L31
 195  0102               L11:
 196                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 197  0102 721d5200      	bres	20992,#6
 198  0106               L31:
 199                     ; 132 }
 200  0106 84            	pop	a
 201  0107 81            	ret	
 203                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 203                     ; 142 {
 204  0108               _SPI_ITConfig:
 205  0108 89            	pushw	x
 206  0109 88            	push	a
 207       00000001      OFST:	set	1
 209                     ; 143   uint8_t itpos = 0;
 210                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 211  010a 9e            	ld	a,xh
 212  010b a117          	cp	a,#23
 213  010d 2714          	jreq	L421
 214  010f 9e            	ld	a,xh
 215  0110 a106          	cp	a,#6
 216  0112 270f          	jreq	L421
 217  0114 9e            	ld	a,xh
 218  0115 a105          	cp	a,#5
 219  0117 270a          	jreq	L421
 220  0119 9e            	ld	a,xh
 221  011a a134          	cp	a,#52
 222  011c 2705          	jreq	L421
 223  011e ae0091        	ldw	x,#145
 224  0121 ad32          	call	LC002
 225  0123               L421:
 226                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 227  0123 7b03          	ld	a,(OFST+2,sp)
 228  0125 2708          	jreq	L431
 229  0127 4a            	dec	a
 230  0128 2705          	jreq	L431
 231  012a ae0092        	ldw	x,#146
 232  012d ad26          	call	LC002
 233  012f               L431:
 234                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 235  012f 7b02          	ld	a,(OFST+1,sp)
 236  0131 a40f          	and	a,#15
 237  0133 5f            	clrw	x
 238  0134 97            	ld	xl,a
 239  0135 a601          	ld	a,#1
 240  0137 5d            	tnzw	x
 241  0138 2704          	jreq	L041
 242  013a               L241:
 243  013a 48            	sll	a
 244  013b 5a            	decw	x
 245  013c 26fc          	jrne	L241
 246  013e               L041:
 247  013e 6b01          	ld	(OFST+0,sp),a
 248                     ; 151   if (NewState != DISABLE)
 249  0140 0d03          	tnz	(OFST+2,sp)
 250  0142 2707          	jreq	L51
 251                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 252  0144 c65202        	ld	a,20994
 253  0147 1a01          	or	a,(OFST+0,sp)
 255  0149 2004          	jra	L71
 256  014b               L51:
 257                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 258  014b 43            	cpl	a
 259  014c c45202        	and	a,20994
 260  014f               L71:
 261  014f c75202        	ld	20994,a
 262                     ; 159 }
 263  0152 5b03          	addw	sp,#3
 264  0154 81            	ret	
 265  0155               LC002:
 266  0155 89            	pushw	x
 267  0156 5f            	clrw	x
 268  0157 89            	pushw	x
 269  0158 ae0000        	ldw	x,#L3
 270  015b cd0000        	call	_assert_failed
 272  015e 5b04          	addw	sp,#4
 273  0160 81            	ret	
 275                     ; 166 void SPI_SendData(uint8_t Data)
 275                     ; 167 {
 276  0161               _SPI_SendData:
 278                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 279  0161 c75204        	ld	20996,a
 280                     ; 169 }
 281  0164 81            	ret	
 283                     ; 176 uint8_t SPI_ReceiveData(void)
 283                     ; 177 {
 284  0165               _SPI_ReceiveData:
 286                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 287  0165 c65204        	ld	a,20996
 289  0168 81            	ret	
 291                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 291                     ; 188 {
 292  0169               _SPI_NSSInternalSoftwareCmd:
 293  0169 88            	push	a
 294       00000000      OFST:	set	0
 296                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297  016a 4d            	tnz	a
 298  016b 2711          	jreq	L651
 299  016d 4a            	dec	a
 300  016e 270e          	jreq	L651
 301  0170 ae00be        	ldw	x,#190
 302  0173 89            	pushw	x
 303  0174 5f            	clrw	x
 304  0175 89            	pushw	x
 305  0176 ae0000        	ldw	x,#L3
 306  0179 cd0000        	call	_assert_failed
 308  017c 5b04          	addw	sp,#4
 309  017e               L651:
 310                     ; 192   if (NewState != DISABLE)
 311  017e 7b01          	ld	a,(OFST+1,sp)
 312  0180 2706          	jreq	L12
 313                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 314  0182 72105201      	bset	20993,#0
 316  0186 2004          	jra	L32
 317  0188               L12:
 318                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 319  0188 72115201      	bres	20993,#0
 320  018c               L32:
 321                     ; 200 }
 322  018c 84            	pop	a
 323  018d 81            	ret	
 325                     ; 207 void SPI_TransmitCRC(void)
 325                     ; 208 {
 326  018e               _SPI_TransmitCRC:
 328                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 329  018e 72185201      	bset	20993,#4
 330                     ; 210 }
 331  0192 81            	ret	
 333                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 333                     ; 219 {
 334  0193               _SPI_CalculateCRCCmd:
 335  0193 88            	push	a
 336       00000000      OFST:	set	0
 338                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 339  0194 4d            	tnz	a
 340  0195 2711          	jreq	L271
 341  0197 4a            	dec	a
 342  0198 270e          	jreq	L271
 343  019a ae00dd        	ldw	x,#221
 344  019d 89            	pushw	x
 345  019e 5f            	clrw	x
 346  019f 89            	pushw	x
 347  01a0 ae0000        	ldw	x,#L3
 348  01a3 cd0000        	call	_assert_failed
 350  01a6 5b04          	addw	sp,#4
 351  01a8               L271:
 352                     ; 223   if (NewState != DISABLE)
 353  01a8 7b01          	ld	a,(OFST+1,sp)
 354  01aa 2706          	jreq	L52
 355                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 356  01ac 721a5201      	bset	20993,#5
 358  01b0 2004          	jra	L72
 359  01b2               L52:
 360                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 361  01b2 721b5201      	bres	20993,#5
 362  01b6               L72:
 363                     ; 231 }
 364  01b6 84            	pop	a
 365  01b7 81            	ret	
 367                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 367                     ; 239 {
 368  01b8               _SPI_GetCRC:
 369  01b8 88            	push	a
 370  01b9 88            	push	a
 371       00000001      OFST:	set	1
 373                     ; 240   uint8_t crcreg = 0;
 374                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
 375  01ba a101          	cp	a,#1
 376  01bc 2711          	jreq	L402
 377  01be 4d            	tnz	a
 378  01bf 270e          	jreq	L402
 379  01c1 ae00f3        	ldw	x,#243
 380  01c4 89            	pushw	x
 381  01c5 5f            	clrw	x
 382  01c6 89            	pushw	x
 383  01c7 ae0000        	ldw	x,#L3
 384  01ca cd0000        	call	_assert_failed
 386  01cd 5b04          	addw	sp,#4
 387  01cf               L402:
 388                     ; 245   if (SPI_CRC != SPI_CRC_RX)
 389  01cf 7b02          	ld	a,(OFST+1,sp)
 390  01d1 2705          	jreq	L13
 391                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
 392  01d3 c65207        	ld	a,20999
 394  01d6 2003          	jra	L33
 395  01d8               L13:
 396                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
 397  01d8 c65206        	ld	a,20998
 398  01db               L33:
 399                     ; 255   return crcreg;
 401  01db 85            	popw	x
 402  01dc 81            	ret	
 404                     ; 263 void SPI_ResetCRC(void)
 404                     ; 264 {
 405  01dd               _SPI_ResetCRC:
 407                     ; 267   SPI_CalculateCRCCmd(ENABLE);
 408  01dd a601          	ld	a,#1
 409  01df adb2          	call	_SPI_CalculateCRCCmd
 411                     ; 270   SPI_Cmd(ENABLE);
 412  01e1 a601          	ld	a,#1
 414                     ; 271 }
 415  01e3 cc00e3        	jp	_SPI_Cmd
 417                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
 417                     ; 279 {
 418  01e6               _SPI_GetCRCPolynomial:
 420                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
 421  01e6 c65205        	ld	a,20997
 423  01e9 81            	ret	
 425                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 425                     ; 289 {
 426  01ea               _SPI_BiDirectionalLineConfig:
 427  01ea 88            	push	a
 428       00000000      OFST:	set	0
 430                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
 431  01eb 4d            	tnz	a
 432  01ec 2711          	jreq	L622
 433  01ee 4a            	dec	a
 434  01ef 270e          	jreq	L622
 435  01f1 ae0123        	ldw	x,#291
 436  01f4 89            	pushw	x
 437  01f5 5f            	clrw	x
 438  01f6 89            	pushw	x
 439  01f7 ae0000        	ldw	x,#L3
 440  01fa cd0000        	call	_assert_failed
 442  01fd 5b04          	addw	sp,#4
 443  01ff               L622:
 444                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
 445  01ff 7b01          	ld	a,(OFST+1,sp)
 446  0201 2706          	jreq	L53
 447                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 448  0203 721c5201      	bset	20993,#6
 450  0207 2004          	jra	L73
 451  0209               L53:
 452                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 453  0209 721d5201      	bres	20993,#6
 454  020d               L73:
 455                     ; 301 }
 456  020d 84            	pop	a
 457  020e 81            	ret	
 459                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
 459                     ; 312 {
 460  020f               _SPI_GetFlagStatus:
 461  020f 88            	push	a
 462  0210 88            	push	a
 463       00000001      OFST:	set	1
 465                     ; 313   FlagStatus status = RESET;
 466                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
 467  0211 a140          	cp	a,#64
 468  0213 2726          	jreq	L042
 469  0215 a120          	cp	a,#32
 470  0217 2722          	jreq	L042
 471  0219 a110          	cp	a,#16
 472  021b 271e          	jreq	L042
 473  021d a108          	cp	a,#8
 474  021f 271a          	jreq	L042
 475  0221 a102          	cp	a,#2
 476  0223 2716          	jreq	L042
 477  0225 a101          	cp	a,#1
 478  0227 2712          	jreq	L042
 479  0229 a180          	cp	a,#128
 480  022b 270e          	jreq	L042
 481  022d ae013b        	ldw	x,#315
 482  0230 89            	pushw	x
 483  0231 5f            	clrw	x
 484  0232 89            	pushw	x
 485  0233 ae0000        	ldw	x,#L3
 486  0236 cd0000        	call	_assert_failed
 488  0239 5b04          	addw	sp,#4
 489  023b               L042:
 490                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
 491  023b c65203        	ld	a,20995
 492  023e 1502          	bcp	a,(OFST+1,sp)
 493  0240 2704          	jreq	L14
 494                     ; 320     status = SET; /* SPI_FLAG is set */
 495  0242 a601          	ld	a,#1
 497  0244 2001          	jra	L34
 498  0246               L14:
 499                     ; 324     status = RESET; /* SPI_FLAG is reset*/
 500  0246 4f            	clr	a
 501  0247               L34:
 502                     ; 328   return status;
 504  0247 85            	popw	x
 505  0248 81            	ret	
 507                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
 507                     ; 347 {
 508  0249               _SPI_ClearFlag:
 509  0249 88            	push	a
 510       00000000      OFST:	set	0
 512                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
 513  024a a110          	cp	a,#16
 514  024c 2712          	jreq	L252
 515  024e a108          	cp	a,#8
 516  0250 270e          	jreq	L252
 517  0252 ae015c        	ldw	x,#348
 518  0255 89            	pushw	x
 519  0256 5f            	clrw	x
 520  0257 89            	pushw	x
 521  0258 ae0000        	ldw	x,#L3
 522  025b cd0000        	call	_assert_failed
 524  025e 5b04          	addw	sp,#4
 525  0260               L252:
 526                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
 527  0260 7b01          	ld	a,(OFST+1,sp)
 528  0262 43            	cpl	a
 529  0263 c75203        	ld	20995,a
 530                     ; 351 }
 531  0266 84            	pop	a
 532  0267 81            	ret	
 534                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
 534                     ; 367 {
 535  0268               _SPI_GetITStatus:
 536  0268 88            	push	a
 537  0269 89            	pushw	x
 538       00000002      OFST:	set	2
 540                     ; 368   ITStatus pendingbitstatus = RESET;
 541                     ; 369   uint8_t itpos = 0;
 542                     ; 370   uint8_t itmask1 = 0;
 543                     ; 371   uint8_t itmask2 = 0;
 544                     ; 372   uint8_t enablestatus = 0;
 545                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
 546  026a a165          	cp	a,#101
 547  026c 2722          	jreq	L462
 548  026e a155          	cp	a,#85
 549  0270 271e          	jreq	L462
 550  0272 a145          	cp	a,#69
 551  0274 271a          	jreq	L462
 552  0276 a134          	cp	a,#52
 553  0278 2716          	jreq	L462
 554  027a a117          	cp	a,#23
 555  027c 2712          	jreq	L462
 556  027e a106          	cp	a,#6
 557  0280 270e          	jreq	L462
 558  0282 ae0175        	ldw	x,#373
 559  0285 89            	pushw	x
 560  0286 5f            	clrw	x
 561  0287 89            	pushw	x
 562  0288 ae0000        	ldw	x,#L3
 563  028b cd0000        	call	_assert_failed
 565  028e 5b04          	addw	sp,#4
 566  0290               L462:
 567                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
 568  0290 7b03          	ld	a,(OFST+1,sp)
 569  0292 a40f          	and	a,#15
 570  0294 5f            	clrw	x
 571  0295 97            	ld	xl,a
 572  0296 a601          	ld	a,#1
 573  0298 5d            	tnzw	x
 574  0299 2704          	jreq	L072
 575  029b               L272:
 576  029b 48            	sll	a
 577  029c 5a            	decw	x
 578  029d 26fc          	jrne	L272
 579  029f               L072:
 580  029f 6b01          	ld	(OFST-1,sp),a
 581                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
 582  02a1 7b03          	ld	a,(OFST+1,sp)
 583  02a3 4e            	swap	a
 584  02a4 a40f          	and	a,#15
 585  02a6 6b02          	ld	(OFST+0,sp),a
 586                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
 587  02a8 5f            	clrw	x
 588  02a9 97            	ld	xl,a
 589  02aa a601          	ld	a,#1
 590  02ac 5d            	tnzw	x
 591  02ad 2704          	jreq	L472
 592  02af               L672:
 593  02af 48            	sll	a
 594  02b0 5a            	decw	x
 595  02b1 26fc          	jrne	L672
 596  02b3               L472:
 597                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
 598  02b3 c45203        	and	a,20995
 599  02b6 6b02          	ld	(OFST+0,sp),a
 600                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
 601  02b8 c65202        	ld	a,20994
 602  02bb 1501          	bcp	a,(OFST-1,sp)
 603  02bd 2708          	jreq	L54
 605  02bf 7b02          	ld	a,(OFST+0,sp)
 606  02c1 2704          	jreq	L54
 607                     ; 387     pendingbitstatus = SET;
 608  02c3 a601          	ld	a,#1
 610  02c5 2001          	jra	L74
 611  02c7               L54:
 612                     ; 392     pendingbitstatus = RESET;
 613  02c7 4f            	clr	a
 614  02c8               L74:
 615                     ; 395   return  pendingbitstatus;
 617  02c8 5b03          	addw	sp,#3
 618  02ca 81            	ret	
 620                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
 620                     ; 413 {
 621  02cb               _SPI_ClearITPendingBit:
 622  02cb 88            	push	a
 623  02cc 88            	push	a
 624       00000001      OFST:	set	1
 626                     ; 414   uint8_t itpos = 0;
 627                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
 628  02cd a145          	cp	a,#69
 629  02cf 2712          	jreq	L603
 630  02d1 a134          	cp	a,#52
 631  02d3 270e          	jreq	L603
 632  02d5 ae019f        	ldw	x,#415
 633  02d8 89            	pushw	x
 634  02d9 5f            	clrw	x
 635  02da 89            	pushw	x
 636  02db ae0000        	ldw	x,#L3
 637  02de cd0000        	call	_assert_failed
 639  02e1 5b04          	addw	sp,#4
 640  02e3               L603:
 641                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
 642  02e3 7b02          	ld	a,(OFST+1,sp)
 643  02e5 4e            	swap	a
 644  02e6 a40f          	and	a,#15
 645  02e8 5f            	clrw	x
 646  02e9 97            	ld	xl,a
 647  02ea a601          	ld	a,#1
 648  02ec 5d            	tnzw	x
 649  02ed 2704          	jreq	L213
 650  02ef               L413:
 651  02ef 48            	sll	a
 652  02f0 5a            	decw	x
 653  02f1 26fc          	jrne	L413
 654  02f3               L213:
 655                     ; 422   SPI->SR = (uint8_t)(~itpos);
 656  02f3 43            	cpl	a
 657  02f4 c75203        	ld	20995,a
 658                     ; 424 }
 659  02f7 85            	popw	x
 660  02f8 81            	ret	
 662                     	xdef	_SPI_ClearITPendingBit
 663                     	xdef	_SPI_GetITStatus
 664                     	xdef	_SPI_ClearFlag
 665                     	xdef	_SPI_GetFlagStatus
 666                     	xdef	_SPI_BiDirectionalLineConfig
 667                     	xdef	_SPI_GetCRCPolynomial
 668                     	xdef	_SPI_ResetCRC
 669                     	xdef	_SPI_GetCRC
 670                     	xdef	_SPI_CalculateCRCCmd
 671                     	xdef	_SPI_TransmitCRC
 672                     	xdef	_SPI_NSSInternalSoftwareCmd
 673                     	xdef	_SPI_ReceiveData
 674                     	xdef	_SPI_SendData
 675                     	xdef	_SPI_ITConfig
 676                     	xdef	_SPI_Cmd
 677                     	xdef	_SPI_Init
 678                     	xdef	_SPI_DeInit
 679                     	xref	_assert_failed
 680                     .const:	section	.text
 681  0000               L3:
 682  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 683  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 684  0024 38735f737069  	dc.b	"8s_spi.c",0
 685                     	end
