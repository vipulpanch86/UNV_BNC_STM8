   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               _EEAddress:
  22  0000 0000          	dc.w	0
  23  0002               _EETimeout:
  24  0002 0000a000      	dc.l	40960
  25                     ; 114 void EE_DeInit(void)
  25                     ; 115 {
  26                     	scross	off
  27                     	switch	.text
  28  0000               _EE_DeInit:
  30                     ; 116   BSP_EepromDeInit(); 
  32                     ; 117 }
  33  0000 cc0000        	jp	_BSP_EepromDeInit
  35                     ; 124 void EE_Init(void)
  35                     ; 125 {
  36  0003               _EE_Init:
  38                     ; 126   BSP_EepromInit();
  39  0003 cd0000        	call	_BSP_EepromInit
  41                     ; 130   I2C_Cmd( ENABLE);
  42  0006 a601          	ld	a,#1
  43  0008 cd0000        	call	_I2C_Cmd
  45                     ; 132   I2C_Init(I2C_SPEED, I2C_SLAVE_ADDRESS7, I2C_DUTYCYCLE_2, I2C_ACK_CURR, 
  45                     ; 133            I2C_ADDMODE_7BIT, 16);
  46  000b 4b10          	push	#16
  47  000d 4b00          	push	#0
  48  000f 4b01          	push	#1
  49  0011 4b00          	push	#0
  50  0013 ae00a0        	ldw	x,#160
  51  0016 89            	pushw	x
  52  0017 ae0d40        	ldw	x,#3392
  53  001a 89            	pushw	x
  54  001b ae0003        	ldw	x,#3
  55  001e 89            	pushw	x
  56  001f cd0000        	call	_I2C_Init
  58  0022 5b0a          	addw	sp,#10
  59                     ; 137   EEAddress = EE_HW_ADDRESS;
  60  0024 ae00a0        	ldw	x,#160
  61  0027 cf0000        	ldw	_EEAddress,x
  62                     ; 139 }
  63  002a 81            	ret	
  65                     ; 162 uint32_t EE_ReadBuffer(uint8_t* pBuffer, uint16_t ReadAddr, uint16_t* NumByteToRead)
  65                     ; 163 {
  66  002b               _EE_ReadBuffer:
  67  002b 89            	pushw	x
  68       00000000      OFST:	set	0
  70                     ; 166   EETimeout = EE_LONG_TIMEOUT;
  71  002c aea000        	ldw	x,#40960
  72  002f cf0004        	ldw	_EETimeout+2,x
  73  0032 5f            	clrw	x
  74  0033 cf0002        	ldw	_EETimeout,x
  76  0036 2005          	jra	L7
  77  0038               L3:
  78                     ; 169     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
  79  0038 cd0239        	call	LC005
  84  003b 2717          	jreq	L471
  85  003d               L7:
  86                     ; 167   while(I2C_GetFlagStatus( I2C_FLAG_BUSBUSY))
  87  003d ae0302        	ldw	x,#770
  88  0040 cd0000        	call	_I2C_GetFlagStatus
  90  0043 4d            	tnz	a
  91  0044 26f2          	jrne	L3
  92                     ; 173   I2C_GenerateSTART(ENABLE);
  93  0046 4c            	inc	a
  94  0047 cd0000        	call	_I2C_GenerateSTART
  96                     ; 176   EETimeout = EE_FLAG_TIMEOUT;
  97  004a cd0220        	call	LC002
  99  004d 2008          	jra	L12
 100  004f               L51:
 101                     ; 179     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 102  004f cd0213        	call	LC001
 104  0052 2603          	jrne	L12
 108  0054               L471:
 109  0054 cc0233        	jp	LC004
 110  0057               L12:
 111                     ; 177   while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
 112  0057 ae0301        	ldw	x,#769
 113  005a cd0000        	call	_I2C_CheckEvent
 115  005d 4d            	tnz	a
 116  005e 27ef          	jreq	L51
 117                     ; 183   I2C_Send7bitAddress( (uint8_t)EEAddress, I2C_DIRECTION_TX);
 118  0060 c60001        	ld	a,_EEAddress+1
 119  0063 5f            	clrw	x
 120  0064 95            	ld	xh,a
 121  0065 cd0000        	call	_I2C_Send7bitAddress
 123                     ; 186   EETimeout = EE_FLAG_TIMEOUT;
 124  0068 cd0220        	call	LC002
 126  006b 2005          	jra	L33
 127  006d               L72:
 128                     ; 189     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 129  006d cd0213        	call	LC001
 134  0070 27e2          	jreq	L471
 135  0072               L33:
 136                     ; 187   while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 137  0072 ae0782        	ldw	x,#1922
 138  0075 cd0000        	call	_I2C_CheckEvent
 140  0078 4d            	tnz	a
 141  0079 27f2          	jreq	L72
 142                     ; 195   I2C_SendData( (uint8_t)((ReadAddr & 0xFF00) >> 8));    
 143  007b 7b05          	ld	a,(OFST+5,sp)
 144  007d cd0000        	call	_I2C_SendData
 146                     ; 198   EETimeout = EE_FLAG_TIMEOUT;
 147  0080 cd0220        	call	LC002
 149  0083 2005          	jra	L54
 150  0085               L14:
 151                     ; 201     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 152  0085 cd0213        	call	LC001
 157  0088 27ca          	jreq	L471
 158  008a               L54:
 159                     ; 199   while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 160  008a ae0784        	ldw	x,#1924
 161  008d cd0000        	call	_I2C_CheckEvent
 163  0090 4d            	tnz	a
 164  0091 27f2          	jreq	L14
 165                     ; 205   I2C_SendData( (uint8_t)(ReadAddr & 0x00FF));    
 166  0093 7b06          	ld	a,(OFST+6,sp)
 167  0095 cd0000        	call	_I2C_SendData
 169                     ; 210   EETimeout = EE_FLAG_TIMEOUT;
 170  0098 cd0220        	call	LC002
 172  009b 2005          	jra	L75
 173  009d               L35:
 174                     ; 213     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 175  009d cd0213        	call	LC001
 180  00a0 2714          	jreq	L671
 181  00a2               L75:
 182                     ; 211   while(I2C_GetFlagStatus(I2C_FLAG_TRANSFERFINISHED) == RESET)
 183  00a2 cd022b        	call	LC003
 184  00a5 27f6          	jreq	L35
 185                     ; 217   I2C_GenerateSTART( ENABLE);
 186  00a7 a601          	ld	a,#1
 187  00a9 cd0000        	call	_I2C_GenerateSTART
 189                     ; 220   EETimeout = EE_FLAG_TIMEOUT;
 190  00ac cd0220        	call	LC002
 192  00af 2008          	jra	L17
 193  00b1               L56:
 194                     ; 223     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 195  00b1 cd0213        	call	LC001
 197  00b4 2603          	jrne	L17
 201  00b6               L671:
 202  00b6 cc0233        	jp	LC004
 203  00b9               L17:
 204                     ; 221   while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT))
 205  00b9 ae0301        	ldw	x,#769
 206  00bc cd0000        	call	_I2C_CheckEvent
 208  00bf 4d            	tnz	a
 209  00c0 27ef          	jreq	L56
 210                     ; 227   I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_RX);
 211  00c2 c60001        	ld	a,_EEAddress+1
 212  00c5 ae0001        	ldw	x,#1
 213  00c8 95            	ld	xh,a
 214  00c9 cd0000        	call	_I2C_Send7bitAddress
 216                     ; 230   if ((uint16_t)(*NumByteToRead)> 3) 
 217  00cc 1607          	ldw	y,(OFST+7,sp)
 218  00ce 90fe          	ldw	y,(y)
 219  00d0 90a30004      	cpw	y,#4
 220  00d4 2520          	jrult	L77
 221                     ; 233       EETimeout = EE_FLAG_TIMEOUT;
 222  00d6 cd0220        	call	LC002
 224  00d9 2005          	jra	L501
 225  00db               L101:
 226                     ; 236         if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 227  00db cd0213        	call	LC001
 232  00de 27d6          	jreq	L671
 233  00e0               L501:
 234                     ; 234       while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
 235  00e0 cd022b        	call	LC003
 236  00e3 27f6          	jreq	L101
 237                     ; 240       *pBuffer = I2C_ReceiveData();
 238  00e5 cd0000        	call	_I2C_ReceiveData
 240  00e8 1e01          	ldw	x,(OFST+1,sp)
 241  00ea f7            	ld	(x),a
 242                     ; 243       *pBuffer++;
 243  00eb 5c            	incw	x
 244  00ec 1f01          	ldw	(OFST+1,sp),x
 245                     ; 246       (uint16_t)(*NumByteToRead)--;
 246  00ee 1e07          	ldw	x,(OFST+7,sp)
 247  00f0 9093          	ldw	y,x
 248  00f2 fe            	ldw	x,(x)
 249  00f3 5a            	decw	x
 250  00f4 90ff          	ldw	(y),x
 251  00f6               L77:
 252                     ; 251   if ((uint16_t)(*NumByteToRead) == 3)  
 253  00f6 1607          	ldw	y,(OFST+7,sp)
 254  00f8 90fe          	ldw	y,(y)
 255  00fa 90a30003      	cpw	y,#3
 256  00fe 2651          	jrne	L311
 257                     ; 255       EETimeout = EE_FLAG_TIMEOUT;
 258  0100 cd0220        	call	LC002
 260  0103 2005          	jra	L121
 261  0105               L511:
 262                     ; 258         if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 263  0105 cd0213        	call	LC001
 268  0108 2732          	jreq	L002
 269  010a               L121:
 270                     ; 256       while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
 271  010a cd022b        	call	LC003
 272  010d 27f6          	jreq	L511
 273                     ; 262       I2C_AcknowledgeConfig(I2C_ACK_NONE);
 274  010f 4f            	clr	a
 275  0110 cd0000        	call	_I2C_AcknowledgeConfig
 277                     ; 265       EE_EnterCriticalSection_UserCallback();
 278  0113 cd0636        	call	_EE_EnterCriticalSection_UserCallback
 280                     ; 268       *pBuffer = I2C_ReceiveData();
 281  0116 cd0000        	call	_I2C_ReceiveData
 283  0119 1e01          	ldw	x,(OFST+1,sp)
 284  011b f7            	ld	(x),a
 285                     ; 271       *pBuffer++;
 286  011c 5c            	incw	x
 287  011d 1f01          	ldw	(OFST+1,sp),x
 288                     ; 274       I2C_GenerateSTOP(ENABLE);
 289  011f a601          	ld	a,#1
 290  0121 cd0000        	call	_I2C_GenerateSTOP
 292                     ; 277       *pBuffer = I2C_ReceiveData();
 293  0124 cd0000        	call	_I2C_ReceiveData
 295  0127 1e01          	ldw	x,(OFST+1,sp)
 296  0129 f7            	ld	(x),a
 297                     ; 280        EE_ExitCriticalSection_UserCallback();
 298  012a cd0638        	call	_EE_ExitCriticalSection_UserCallback
 300                     ; 283       *pBuffer++;
 301  012d 1e01          	ldw	x,(OFST+1,sp)
 302  012f 5c            	incw	x
 303  0130 1f01          	ldw	(OFST+1,sp),x
 304                     ; 286       EETimeout = EE_FLAG_TIMEOUT;
 305  0132 cd0220        	call	LC002
 307  0135 2008          	jra	L331
 308  0137               L721:
 309                     ; 289         if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 310  0137 cd0213        	call	LC001
 312  013a 2603          	jrne	L331
 316  013c               L002:
 317  013c cc0233        	jp	LC004
 318  013f               L331:
 319                     ; 287       while (I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET)
 320  013f ae0140        	ldw	x,#320
 321  0142 cd0000        	call	_I2C_GetFlagStatus
 323  0145 4d            	tnz	a
 324  0146 27ef          	jreq	L721
 325                     ; 292       *pBuffer = I2C_ReceiveData();
 326  0148 cd0000        	call	_I2C_ReceiveData
 328  014b 1e01          	ldw	x,(OFST+1,sp)
 329  014d f7            	ld	(x),a
 330                     ; 295       NumByteToRead = 0;
 331  014e 5f            	clrw	x
 332  014f 1f07          	ldw	(OFST+7,sp),x
 333  0151               L311:
 334                     ; 301   if ((uint16_t)(*NumByteToRead) == 2)
 335  0151 1607          	ldw	y,(OFST+7,sp)
 336  0153 90fe          	ldw	y,(y)
 337  0155 90a30002      	cpw	y,#2
 338  0159 264b          	jrne	L141
 339                     ; 304     I2C_AcknowledgeConfig(I2C_ACK_NEXT);
 340  015b a602          	ld	a,#2
 341  015d cd0000        	call	_I2C_AcknowledgeConfig
 343                     ; 307     EETimeout = EE_FLAG_TIMEOUT;
 344  0160 cd0220        	call	LC002
 346  0163 2005          	jra	L741
 347  0165               L341:
 348                     ; 310       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 349  0165 cd0213        	call	LC001
 354  0168 27d2          	jreq	L002
 355  016a               L741:
 356                     ; 308     while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET)
 357  016a ae0102        	ldw	x,#258
 358  016d cd0000        	call	_I2C_GetFlagStatus
 360  0170 4d            	tnz	a
 361  0171 27f2          	jreq	L341
 362                     ; 314      (void)I2C->SR3;
 363  0173 c65219        	ld	a,21017
 364                     ; 317     I2C_AcknowledgeConfig(I2C_ACK_NONE);
 365  0176 4f            	clr	a
 366  0177 cd0000        	call	_I2C_AcknowledgeConfig
 368                     ; 320       EETimeout = EE_FLAG_TIMEOUT;
 369  017a cd0220        	call	LC002
 371  017d 2005          	jra	L161
 372  017f               L551:
 373                     ; 323         if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 374  017f cd0213        	call	LC001
 379  0182 2734          	jreq	L202
 380  0184               L161:
 381                     ; 321       while (I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED) == RESET)
 382  0184 cd022b        	call	LC003
 383  0187 27f6          	jreq	L551
 384                     ; 327     EE_EnterCriticalSection_UserCallback();
 385  0189 cd0636        	call	_EE_EnterCriticalSection_UserCallback
 387                     ; 330       I2C_GenerateSTOP(ENABLE);
 388  018c a601          	ld	a,#1
 389  018e cd0000        	call	_I2C_GenerateSTOP
 391                     ; 333       *pBuffer = I2C_ReceiveData();
 392  0191 cd0000        	call	_I2C_ReceiveData
 394  0194 1e01          	ldw	x,(OFST+1,sp)
 395  0196 f7            	ld	(x),a
 396                     ; 336       *pBuffer++;  
 397  0197 5c            	incw	x
 398  0198 1f01          	ldw	(OFST+1,sp),x
 399                     ; 339        EE_ExitCriticalSection_UserCallback();
 400  019a cd0638        	call	_EE_ExitCriticalSection_UserCallback
 402                     ; 342       *pBuffer = I2C_ReceiveData();
 403  019d cd0000        	call	_I2C_ReceiveData
 405  01a0 1e01          	ldw	x,(OFST+1,sp)
 406  01a2 f7            	ld	(x),a
 407                     ; 345       NumByteToRead = 0;   
 408  01a3 5f            	clrw	x
 409  01a4 1f07          	ldw	(OFST+7,sp),x
 410  01a6               L141:
 411                     ; 350   if ((uint16_t)(*NumByteToRead) < 2)
 412  01a6 1607          	ldw	y,(OFST+7,sp)
 413  01a8 90fe          	ldw	y,(y)
 414  01aa 90a30002      	cpw	y,#2
 415  01ae 245b          	jruge	L761
 416                     ; 353     EETimeout = EE_FLAG_TIMEOUT;
 417  01b0 ad6e          	call	LC002
 419  01b2 2006          	jra	L571
 420  01b4               L171:
 421                     ; 356       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 422  01b4 ad5d          	call	LC001
 424  01b6 2602          	jrne	L571
 428  01b8               L202:
 429  01b8 2079          	jp	LC004
 430  01ba               L571:
 431                     ; 354     while(I2C_GetFlagStatus( I2C_FLAG_ADDRESSSENTMATCHED) == RESET)
 432  01ba ae0102        	ldw	x,#258
 433  01bd cd0000        	call	_I2C_GetFlagStatus
 435  01c0 4d            	tnz	a
 436  01c1 27f1          	jreq	L171
 437                     ; 360     I2C_AcknowledgeConfig(I2C_ACK_NONE);   
 438  01c3 4f            	clr	a
 439  01c4 cd0000        	call	_I2C_AcknowledgeConfig
 441                     ; 363     EE_EnterCriticalSection_UserCallback();
 442  01c7 cd0636        	call	_EE_EnterCriticalSection_UserCallback
 444                     ; 366     (void)EE_I2C->SR3;
 445  01ca c65219        	ld	a,21017
 446                     ; 369     I2C_GenerateSTOP( ENABLE);
 447  01cd a601          	ld	a,#1
 448  01cf cd0000        	call	_I2C_GenerateSTOP
 450                     ; 372     EE_ExitCriticalSection_UserCallback();
 451  01d2 cd0638        	call	_EE_ExitCriticalSection_UserCallback
 453                     ; 375     EETimeout = EE_FLAG_TIMEOUT;
 454  01d5 ad49          	call	LC002
 456  01d7 2004          	jra	L702
 457  01d9               L302:
 458                     ; 378       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 459  01d9 ad38          	call	LC001
 464  01db 27db          	jreq	L202
 465  01dd               L702:
 466                     ; 376     while(I2C_GetFlagStatus( I2C_FLAG_RXNOTEMPTY) == RESET)
 467  01dd ae0140        	ldw	x,#320
 468  01e0 cd0000        	call	_I2C_GetFlagStatus
 470  01e3 4d            	tnz	a
 471  01e4 27f3          	jreq	L302
 472                     ; 382     *pBuffer = I2C_ReceiveData();
 473  01e6 cd0000        	call	_I2C_ReceiveData
 475  01e9 1e01          	ldw	x,(OFST+1,sp)
 476  01eb f7            	ld	(x),a
 477                     ; 385     (uint16_t)(*NumByteToRead)--;        
 478  01ec 1e07          	ldw	x,(OFST+7,sp)
 479  01ee 9093          	ldw	y,x
 480  01f0 fe            	ldw	x,(x)
 481  01f1 5a            	decw	x
 482  01f2 90ff          	ldw	(y),x
 483                     ; 388     EETimeout = EE_FLAG_TIMEOUT;
 484  01f4 ad2a          	call	LC002
 486  01f6 2009          	jra	L122
 487  01f8               L512:
 488                     ; 391       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 489  01f8 ad3f          	call	LC005
 491  01fa 2605          	jrne	L122
 493  01fc cd0634        	call	_EE_TIMEOUT_UserCallback
 496  01ff 200f          	jra	L402
 497  0201               L122:
 498                     ; 389     while(EE_I2C->CR2 & I2C_CR2_STOP)
 499  0201 72025211f2    	btjt	21009,#1,L512
 500                     ; 395     I2C_AcknowledgeConfig( I2C_ACK_CURR);    
 501  0206 a601          	ld	a,#1
 502  0208 cd0000        	call	_I2C_AcknowledgeConfig
 504  020b               L761:
 505                     ; 398   return EE_OK;  
 506  020b 5f            	clrw	x
 507  020c bf02          	ldw	c_lreg+2,x
 508  020e bf00          	ldw	c_lreg,x
 510  0210               L402:
 511  0210 5b02          	addw	sp,#2
 512  0212 81            	ret	
 513  0213               LC001:
 514  0213 ae0002        	ldw	x,#_EETimeout
 515  0216 cd0000        	call	c_ltor
 517  0219 4c            	inc	a
 518  021a cd0000        	call	c_lgsbc
 520  021d cc0000        	jp	c_lrzmp
 521  0220               LC002:
 522  0220 ae1000        	ldw	x,#4096
 523  0223 cf0004        	ldw	_EETimeout+2,x
 524  0226 5f            	clrw	x
 525  0227 cf0002        	ldw	_EETimeout,x
 526  022a 81            	ret	
 527  022b               LC003:
 528  022b ae0104        	ldw	x,#260
 529  022e cd0000        	call	_I2C_GetFlagStatus
 531  0231 4d            	tnz	a
 532  0232 81            	ret	
 533  0233               LC004:
 534  0233 cd0634        	call	_EE_TIMEOUT_UserCallback
 535  0236 5b02          	addw	sp,#2
 536  0238 81            	ret	
 537  0239               LC005:
 538  0239 ae0002        	ldw	x,#_EETimeout
 539  023c cd0000        	call	c_ltor
 541  023f a601          	ld	a,#1
 542  0241 cd0000        	call	c_lgsbc
 544  0244 cc0000        	jp	c_lrzmp
 546                     ; 409 void EE_WriteBuffer(uint8_t* pBuffer, uint16_t WriteAddr, uint16_t NumByteToWrite)
 546                     ; 410 {
 547  0247               _EE_WriteBuffer:
 548  0247 89            	pushw	x
 549  0248 5207          	subw	sp,#7
 550       00000007      OFST:	set	7
 552                     ; 411   uint8_t NumOfPage = 0, NumOfSingle = 0, count = 0;
 555                     ; 412   uint16_t Addr = 0;
 556                     ; 414   Addr = WriteAddr % EE_PAGESIZE;
 557  024a 7b0d          	ld	a,(OFST+6,sp)
 558  024c a41f          	and	a,#31
 559  024e 5f            	clrw	x
 560  024f 02            	rlwa	x,a
 561  0250 1f03          	ldw	(OFST-4,sp),x
 562                     ; 415   count = (uint8_t)(EE_PAGESIZE - (uint16_t)Addr);
 563  0252 a620          	ld	a,#32
 564  0254 1004          	sub	a,(OFST-3,sp)
 565  0256 6b07          	ld	(OFST+0,sp),a
 566                     ; 416   NumOfPage =  (uint8_t)(NumByteToWrite / EE_PAGESIZE);
 567  0258 1e0e          	ldw	x,(OFST+7,sp)
 568  025a 54            	srlw	x
 569  025b 54            	srlw	x
 570  025c 54            	srlw	x
 571  025d 54            	srlw	x
 572  025e 54            	srlw	x
 573  025f 9f            	ld	a,xl
 574  0260 6b06          	ld	(OFST-1,sp),a
 575                     ; 417   NumOfSingle = (uint8_t)(NumByteToWrite % EE_PAGESIZE);
 576  0262 7b0f          	ld	a,(OFST+8,sp)
 577  0264 a41f          	and	a,#31
 578  0266 6b05          	ld	(OFST-2,sp),a
 579                     ; 420   if (Addr == 0)
 580  0268 1e03          	ldw	x,(OFST-4,sp)
 581  026a 2703cc02ff    	jrne	L722
 582                     ; 423     if (NumOfPage == 0)
 583  026f 0d06          	tnz	(OFST-1,sp)
 584  0271 265d          	jrne	L152
 585                     ; 426       EEDataNum = NumOfSingle;
 586  0273 c70000        	ld	_EEDataNum,a
 587                     ; 428       EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 588  0276 ae0000        	ldw	x,#_EEDataNum
 589  0279 89            	pushw	x
 590  027a 1e0e          	ldw	x,(OFST+7,sp)
 591  027c 89            	pushw	x
 592  027d 1e0c          	ldw	x,(OFST+5,sp)
 593  027f cd046d        	call	_EE_WritePage
 595  0282 5b04          	addw	sp,#4
 596                     ; 430       EETimeout = EE_LONG_TIMEOUT;
 597  0284 cd0462        	call	LC010
 599  0287 2005          	jra	L732
 600  0289               L332:
 601                     ; 433         if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 602  0289 cd0454        	call	LC009
 607  028c 2725          	jreq	LC006
 608  028e               L732:
 609                     ; 431       while (EEDataNum > 0)
 610  028e 725d0000      	tnz	_EEDataNum
 611  0292 26f5          	jrne	L332
 612                     ; 435       EE_WaitEepromStandbyState();
 615  0294 cc044e        	jp	LC007
 616  0297               L742:
 617                     ; 443         EEDataNum = EE_PAGESIZE;
 618  0297 35200000      	mov	_EEDataNum,#32
 619                     ; 444         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 620  029b ae0000        	ldw	x,#_EEDataNum
 621  029e 89            	pushw	x
 622  029f 1e0e          	ldw	x,(OFST+7,sp)
 623  02a1 89            	pushw	x
 624  02a2 1e0c          	ldw	x,(OFST+5,sp)
 625  02a4 cd046d        	call	_EE_WritePage
 627  02a7 5b04          	addw	sp,#4
 628                     ; 446         EETimeout = EE_LONG_TIMEOUT;
 629  02a9 cd0462        	call	LC010
 631  02ac 200b          	jra	L162
 632  02ae               L552:
 633                     ; 449           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 634  02ae cd0454        	call	LC009
 636  02b1 2606          	jrne	L162
 638  02b3               LC006:
 639  02b3 cd0634        	call	_EE_TIMEOUT_UserCallback
 642  02b6               L203:
 643  02b6 5b09          	addw	sp,#9
 644  02b8 81            	ret	
 645  02b9               L162:
 646                     ; 447         while (EEDataNum > 0)
 647  02b9 725d0000      	tnz	_EEDataNum
 648  02bd 26ef          	jrne	L552
 649                     ; 451         EE_WaitEepromStandbyState();
 650  02bf cd0555        	call	_EE_WaitEepromStandbyState
 652                     ; 452         WriteAddr +=  EE_PAGESIZE;
 653  02c2 1e0c          	ldw	x,(OFST+5,sp)
 654  02c4 1c0020        	addw	x,#32
 655  02c7 1f0c          	ldw	(OFST+5,sp),x
 656                     ; 453         pBuffer += EE_PAGESIZE;
 657  02c9 1e08          	ldw	x,(OFST+1,sp)
 658  02cb 1c0020        	addw	x,#32
 659  02ce 1f08          	ldw	(OFST+1,sp),x
 660  02d0               L152:
 661                     ; 440       while (NumOfPage--)
 662  02d0 7b06          	ld	a,(OFST-1,sp)
 663  02d2 0a06          	dec	(OFST-1,sp)
 664  02d4 4d            	tnz	a
 665  02d5 26c0          	jrne	L742
 666                     ; 456       if (NumOfSingle != 0)
 667  02d7 7b05          	ld	a,(OFST-2,sp)
 668  02d9 27db          	jreq	L203
 669                     ; 459         EEDataNum = NumOfSingle;
 670  02db c70000        	ld	_EEDataNum,a
 671                     ; 460         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 672  02de ae0000        	ldw	x,#_EEDataNum
 673  02e1 89            	pushw	x
 674  02e2 1e0e          	ldw	x,(OFST+7,sp)
 675  02e4 89            	pushw	x
 676  02e5 1e0c          	ldw	x,(OFST+5,sp)
 677  02e7 cd046d        	call	_EE_WritePage
 679  02ea 5b04          	addw	sp,#4
 680                     ; 462         EETimeout = EE_LONG_TIMEOUT;
 681  02ec cd0462        	call	LC010
 683  02ef 2005          	jra	L572
 684  02f1               L172:
 685                     ; 465           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 686  02f1 cd0454        	call	LC009
 691  02f4 27bd          	jreq	LC006
 692  02f6               L572:
 693                     ; 463         while (EEDataNum > 0)
 694  02f6 725d0000      	tnz	_EEDataNum
 695  02fa 26f5          	jrne	L172
 696                     ; 467         EE_WaitEepromStandbyState();
 698  02fc cc044e        	jp	LC007
 699  02ff               L722:
 700                     ; 475     if (NumOfPage == 0)
 701  02ff 7b06          	ld	a,(OFST-1,sp)
 702  0301 2703cc039a    	jrne	L503
 703                     ; 479       if (NumByteToWrite > count)
 704  0306 7b07          	ld	a,(OFST+0,sp)
 705  0308 5f            	clrw	x
 706  0309 97            	ld	xl,a
 707  030a bf00          	ldw	c_x,x
 708  030c 1e0e          	ldw	x,(OFST+7,sp)
 709  030e b300          	cpw	x,c_x
 710  0310 2362          	jrule	L703
 711                     ; 482         EEDataNum = count;
 712  0312 c70000        	ld	_EEDataNum,a
 713                     ; 484         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 714  0315 ae0000        	ldw	x,#_EEDataNum
 715  0318 89            	pushw	x
 716  0319 1e0e          	ldw	x,(OFST+7,sp)
 717  031b 89            	pushw	x
 718  031c 1e0c          	ldw	x,(OFST+5,sp)
 719  031e cd046d        	call	_EE_WritePage
 721  0321 5b04          	addw	sp,#4
 722                     ; 486         EETimeout = EE_LONG_TIMEOUT;
 723  0323 cd0462        	call	LC010
 725  0326 2005          	jra	L513
 726  0328               L113:
 727                     ; 489           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 728  0328 cd0454        	call	LC009
 733  032b 2786          	jreq	LC006
 734  032d               L513:
 735                     ; 487         while (EEDataNum > 0)
 736  032d 725d0000      	tnz	_EEDataNum
 737  0331 26f5          	jrne	L113
 738                     ; 491         EE_WaitEepromStandbyState();
 739  0333 cd0555        	call	_EE_WaitEepromStandbyState
 741                     ; 494         EEDataNum = (uint8_t)(NumByteToWrite - count);
 742  0336 7b0f          	ld	a,(OFST+8,sp)
 743  0338 1007          	sub	a,(OFST+0,sp)
 744  033a c70000        	ld	_EEDataNum,a
 745                     ; 496         EE_WritePage((uint8_t*)(pBuffer + count), (WriteAddr + count), (uint8_t*)(&EEDataNum));
 746  033d ae0000        	ldw	x,#_EEDataNum
 747  0340 89            	pushw	x
 748  0341 7b0e          	ld	a,(OFST+7,sp)
 749  0343 97            	ld	xl,a
 750  0344 7b0f          	ld	a,(OFST+8,sp)
 751  0346 1b09          	add	a,(OFST+2,sp)
 752  0348 2401          	jrnc	L242
 753  034a 5c            	incw	x
 754  034b               L242:
 755  034b 02            	rlwa	x,a
 756  034c 89            	pushw	x
 757  034d 01            	rrwa	x,a
 758  034e 7b0c          	ld	a,(OFST+5,sp)
 759  0350 97            	ld	xl,a
 760  0351 7b0d          	ld	a,(OFST+6,sp)
 761  0353 1b0b          	add	a,(OFST+4,sp)
 762  0355 2401          	jrnc	L442
 763  0357 5c            	incw	x
 764  0358               L442:
 765  0358 02            	rlwa	x,a
 766  0359 cd046d        	call	_EE_WritePage
 768  035c 5b04          	addw	sp,#4
 769                     ; 498         EETimeout = EE_LONG_TIMEOUT;
 770  035e cd0462        	call	LC010
 772  0361 2008          	jra	L723
 773  0363               L323:
 774                     ; 501           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 775  0363 cd0454        	call	LC009
 780  0366 2603cc02b3    	jreq	LC006
 781  036b               L723:
 782                     ; 499         while (EEDataNum > 0)
 783  036b 725d0000      	tnz	_EEDataNum
 784  036f 26f2          	jrne	L323
 785                     ; 503         EE_WaitEepromStandbyState();
 788  0371 cc044e        	jp	LC007
 789  0374               L703:
 790                     ; 508         EEDataNum = NumOfSingle;
 791  0374 7b05          	ld	a,(OFST-2,sp)
 792  0376 c70000        	ld	_EEDataNum,a
 793                     ; 509         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 794  0379 ae0000        	ldw	x,#_EEDataNum
 795  037c 89            	pushw	x
 796  037d 1e0e          	ldw	x,(OFST+7,sp)
 797  037f 89            	pushw	x
 798  0380 1e0c          	ldw	x,(OFST+5,sp)
 799  0382 cd046d        	call	_EE_WritePage
 801  0385 5b04          	addw	sp,#4
 802                     ; 511         EETimeout = EE_LONG_TIMEOUT;
 803  0387 cd0462        	call	LC010
 805  038a 2005          	jra	L343
 806  038c               L733:
 807                     ; 514           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 808  038c cd0454        	call	LC009
 813  038f 27d7          	jreq	LC006
 814  0391               L343:
 815                     ; 512         while (EEDataNum > 0)
 816  0391 725d0000      	tnz	_EEDataNum
 817  0395 26f5          	jrne	L733
 818                     ; 516         EE_WaitEepromStandbyState();
 820  0397 cc044e        	jp	LC007
 821  039a               L503:
 822                     ; 522       NumByteToWrite -= count;
 823  039a 7b07          	ld	a,(OFST+0,sp)
 824  039c 5f            	clrw	x
 825  039d 97            	ld	xl,a
 826  039e 1f01          	ldw	(OFST-6,sp),x
 827  03a0 1e0e          	ldw	x,(OFST+7,sp)
 828  03a2 72f001        	subw	x,(OFST-6,sp)
 829  03a5 1f0e          	ldw	(OFST+7,sp),x
 830                     ; 523       NumOfPage = (uint8_t)(NumByteToWrite / EE_PAGESIZE);
 831  03a7 54            	srlw	x
 832  03a8 54            	srlw	x
 833  03a9 54            	srlw	x
 834  03aa 54            	srlw	x
 835  03ab 54            	srlw	x
 836  03ac 9f            	ld	a,xl
 837  03ad 6b06          	ld	(OFST-1,sp),a
 838                     ; 524       NumOfSingle = (uint8_t)(NumByteToWrite % EE_PAGESIZE);
 839  03af 7b0f          	ld	a,(OFST+8,sp)
 840  03b1 a41f          	and	a,#31
 841  03b3 6b05          	ld	(OFST-2,sp),a
 842                     ; 526       if (count != 0)
 843  03b5 7b07          	ld	a,(OFST+0,sp)
 844  03b7 2769          	jreq	L173
 845                     ; 529         EEDataNum = count;
 846  03b9 c70000        	ld	_EEDataNum,a
 847                     ; 530         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 848  03bc ae0000        	ldw	x,#_EEDataNum
 849  03bf 89            	pushw	x
 850  03c0 1e0e          	ldw	x,(OFST+7,sp)
 851  03c2 89            	pushw	x
 852  03c3 1e0c          	ldw	x,(OFST+5,sp)
 853  03c5 cd046d        	call	_EE_WritePage
 855  03c8 5b04          	addw	sp,#4
 856                     ; 532         EETimeout = EE_LONG_TIMEOUT;
 857  03ca cd0462        	call	LC010
 859  03cd 2005          	jra	L163
 860  03cf               L553:
 861                     ; 535           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 862  03cf cd0454        	call	LC009
 867  03d2 2794          	jreq	LC006
 868  03d4               L163:
 869                     ; 533         while (EEDataNum > 0)
 870  03d4 725d0000      	tnz	_EEDataNum
 871  03d8 26f5          	jrne	L553
 872                     ; 537         EE_WaitEepromStandbyState();
 873  03da cd0555        	call	_EE_WaitEepromStandbyState
 875                     ; 538         WriteAddr += count;
 876  03dd 7b07          	ld	a,(OFST+0,sp)
 877  03df 5f            	clrw	x
 878  03e0 97            	ld	xl,a
 879  03e1 72fb0c        	addw	x,(OFST+5,sp)
 880  03e4 1f0c          	ldw	(OFST+5,sp),x
 881                     ; 539         pBuffer += count;
 882  03e6 5f            	clrw	x
 883  03e7 97            	ld	xl,a
 884  03e8 1f01          	ldw	(OFST-6,sp),x
 885  03ea 72fb08        	addw	x,(OFST+1,sp)
 886  03ed 2031          	jp	LC008
 887  03ef               L763:
 888                     ; 545         EEDataNum = EE_PAGESIZE;
 889  03ef 35200000      	mov	_EEDataNum,#32
 890                     ; 546         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 891  03f3 ae0000        	ldw	x,#_EEDataNum
 892  03f6 89            	pushw	x
 893  03f7 1e0e          	ldw	x,(OFST+7,sp)
 894  03f9 89            	pushw	x
 895  03fa 1e0c          	ldw	x,(OFST+5,sp)
 896  03fc ad6f          	call	_EE_WritePage
 898  03fe 5b04          	addw	sp,#4
 899                     ; 548         EETimeout = EE_LONG_TIMEOUT;
 900  0400 ad60          	call	LC010
 902  0402 2007          	jra	L104
 903  0404               L573:
 904                     ; 551           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 905  0404 ad4e          	call	LC009
 910  0406 2603cc02b3    	jreq	LC006
 911  040b               L104:
 912                     ; 549         while (EEDataNum > 0)
 913  040b 725d0000      	tnz	_EEDataNum
 914  040f 26f3          	jrne	L573
 915                     ; 553         EE_WaitEepromStandbyState();
 916  0411 cd0555        	call	_EE_WaitEepromStandbyState
 918                     ; 554         WriteAddr +=  EE_PAGESIZE;
 919  0414 1e0c          	ldw	x,(OFST+5,sp)
 920  0416 1c0020        	addw	x,#32
 921  0419 1f0c          	ldw	(OFST+5,sp),x
 922                     ; 555         pBuffer += EE_PAGESIZE;
 923  041b 1e08          	ldw	x,(OFST+1,sp)
 924  041d 1c0020        	addw	x,#32
 925  0420               LC008:
 926  0420 1f08          	ldw	(OFST+1,sp),x
 927  0422               L173:
 928                     ; 542       while (NumOfPage--)
 929  0422 7b06          	ld	a,(OFST-1,sp)
 930  0424 0a06          	dec	(OFST-1,sp)
 931  0426 4d            	tnz	a
 932  0427 26c6          	jrne	L763
 933                     ; 557       if (NumOfSingle != 0)
 934  0429 7b05          	ld	a,(OFST-2,sp)
 935  042b 2603cc02b6    	jreq	L203
 936                     ; 560         EEDataNum = NumOfSingle;
 937  0430 c70000        	ld	_EEDataNum,a
 938                     ; 561         EE_WritePage(pBuffer, WriteAddr, (uint8_t*)(&EEDataNum));
 939  0433 ae0000        	ldw	x,#_EEDataNum
 940  0436 89            	pushw	x
 941  0437 1e0e          	ldw	x,(OFST+7,sp)
 942  0439 89            	pushw	x
 943  043a 1e0c          	ldw	x,(OFST+5,sp)
 944  043c ad2f          	call	_EE_WritePage
 946  043e 5b04          	addw	sp,#4
 947                     ; 563         EETimeout = EE_LONG_TIMEOUT;
 948  0440 ad20          	call	LC010
 950  0442 2004          	jra	L514
 951  0444               L114:
 952                     ; 566           if((EETimeout--) == 0) {EE_TIMEOUT_UserCallback(); return;};
 953  0444 ad0e          	call	LC009
 958  0446 27c0          	jreq	LC006
 959  0448               L514:
 960                     ; 564         while (EEDataNum > 0)
 961  0448 725d0000      	tnz	_EEDataNum
 962  044c 26f6          	jrne	L114
 963                     ; 568         EE_WaitEepromStandbyState();
 964  044e               LC007:
 965  044e cd0555        	call	_EE_WaitEepromStandbyState
 967                     ; 572 }
 968  0451 cc02b6        	jra	L203
 969  0454               LC009:
 970  0454 ae0002        	ldw	x,#_EETimeout
 971  0457 cd0000        	call	c_ltor
 973  045a a601          	ld	a,#1
 974  045c cd0000        	call	c_lgsbc
 976  045f cc0000        	jp	c_lrzmp
 977  0462               LC010:
 978  0462 aea000        	ldw	x,#40960
 979  0465 cf0004        	ldw	_EETimeout+2,x
 980  0468 5f            	clrw	x
 981  0469 cf0002        	ldw	_EETimeout,x
 982  046c 81            	ret	
 984                     ; 597 uint32_t EE_WritePage(uint8_t* pBuffer, uint16_t WriteAddr, uint8_t* NumByteToWrite)
 984                     ; 598 {
 985  046d               _EE_WritePage:
 986  046d 89            	pushw	x
 987       00000000      OFST:	set	0
 989                     ; 602   EEDataWritePointer = NumByteToWrite;  
 990  046e 1e07          	ldw	x,(OFST+7,sp)
 991  0470 cf0001        	ldw	_EEDataWritePointer,x
 992                     ; 605   EETimeout = EE_LONG_TIMEOUT;
 993  0473 aea000        	ldw	x,#40960
 994  0476 cd054d        	call	LC014
 996  0479 2010          	jra	L724
 997  047b               L324:
 998                     ; 608     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
 999  047b ae0002        	ldw	x,#_EETimeout
1000  047e cd0000        	call	c_ltor
1002  0481 a601          	ld	a,#1
1003  0483 cd0000        	call	c_lgsbc
1005  0486 cd0000        	call	c_lrzmp
1010  0489 2717          	jreq	L253
1011  048b               L724:
1012                     ; 606   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
1013  048b ae0302        	ldw	x,#770
1014  048e cd0000        	call	_I2C_GetFlagStatus
1016  0491 4d            	tnz	a
1017  0492 26e7          	jrne	L324
1018                     ; 612   I2C_GenerateSTART( ENABLE);
1019  0494 4c            	inc	a
1020  0495 cd0000        	call	_I2C_GenerateSTART
1022                     ; 615   EETimeout = EE_FLAG_TIMEOUT;
1023  0498 cd054a        	call	LC013
1025  049b 200b          	jra	L144
1026  049d               L534:
1027                     ; 618     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1028  049d cd053d        	call	LC012
1030  04a0 2606          	jrne	L144
1034  04a2               L253:
1035  04a2 cd0634        	call	_EE_TIMEOUT_UserCallback
1036  04a5 5b02          	addw	sp,#2
1037  04a7 81            	ret	
1038  04a8               L144:
1039                     ; 616   while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1040  04a8 ae0301        	ldw	x,#769
1041  04ab cd0000        	call	_I2C_CheckEvent
1043  04ae 4d            	tnz	a
1044  04af 27ec          	jreq	L534
1045                     ; 622   EETimeout = EE_FLAG_TIMEOUT;
1046  04b1 cd054a        	call	LC013
1047                     ; 623   I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_TX);
1048  04b4 c60001        	ld	a,_EEAddress+1
1049  04b7 95            	ld	xh,a
1050  04b8 cd0000        	call	_I2C_Send7bitAddress
1052                     ; 626   EETimeout = EE_FLAG_TIMEOUT;
1053  04bb cd054a        	call	LC013
1055  04be 2004          	jra	L354
1056  04c0               L744:
1057                     ; 629     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1058  04c0 ad7b          	call	LC012
1063  04c2 27de          	jreq	L253
1064  04c4               L354:
1065                     ; 627   while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
1066  04c4 ae0782        	ldw	x,#1922
1067  04c7 cd0000        	call	_I2C_CheckEvent
1069  04ca 4d            	tnz	a
1070  04cb 27f3          	jreq	L744
1071                     ; 640   I2C_SendData( (uint8_t)((WriteAddr & 0xFF00) >> 8));
1072  04cd 7b05          	ld	a,(OFST+5,sp)
1073  04cf cd0000        	call	_I2C_SendData
1075                     ; 643   EETimeout = EE_FLAG_TIMEOUT;  
1076  04d2 ad76          	call	LC013
1078  04d4 2004          	jra	L564
1079  04d6               L164:
1080                     ; 646     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1081  04d6 ad65          	call	LC012
1086  04d8 2716          	jreq	LC011
1087  04da               L564:
1088                     ; 644   while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1089  04da ae0784        	ldw	x,#1924
1090  04dd cd0000        	call	_I2C_CheckEvent
1092  04e0 4d            	tnz	a
1093  04e1 27f3          	jreq	L164
1094                     ; 650   I2C_SendData( (uint8_t)(WriteAddr & 0x00FF));
1095  04e3 7b06          	ld	a,(OFST+6,sp)
1096  04e5 cd0000        	call	_I2C_SendData
1098                     ; 655   EETimeout = EE_FLAG_TIMEOUT; 
1099  04e8 ad60          	call	LC013
1101  04ea 200a          	jra	L774
1102  04ec               L374:
1103                     ; 658     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1104  04ec ad4f          	call	LC012
1106  04ee 2606          	jrne	L774
1108  04f0               LC011:
1109  04f0 cd0634        	call	_EE_TIMEOUT_UserCallback
1112  04f3               L453:
1113  04f3 5b02          	addw	sp,#2
1114  04f5 81            	ret	
1115  04f6               L774:
1116                     ; 656   while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED))
1117  04f6 ae0784        	ldw	x,#1924
1118  04f9 cd0000        	call	_I2C_CheckEvent
1120  04fc 4d            	tnz	a
1121  04fd 27ed          	jreq	L374
1123  04ff 2021          	jra	L705
1124  0501               L505:
1125                     ; 665     I2C_SendData( *pBuffer);
1126  0501 1e01          	ldw	x,(OFST+1,sp)
1127  0503 f6            	ld	a,(x)
1128  0504 cd0000        	call	_I2C_SendData
1130                     ; 669     EETimeout = EE_LONG_TIMEOUT;
1131  0507 aea000        	ldw	x,#40960
1132  050a ad41          	call	LC014
1134  050c 2007          	jra	L715
1135  050e               L315:
1136                     ; 672       if((EETimeout--) == 0) EE_TIMEOUT_UserCallback();
1137  050e ad2d          	call	LC012
1139  0510 2603          	jrne	L715
1141  0512 cd0634        	call	_EE_TIMEOUT_UserCallback
1143  0515               L715:
1144                     ; 670     while(!I2C_GetFlagStatus( I2C_FLAG_TRANSFERFINISHED))
1145  0515 ae0104        	ldw	x,#260
1146  0518 cd0000        	call	_I2C_GetFlagStatus
1148  051b 4d            	tnz	a
1149  051c 27f0          	jreq	L315
1150                     ; 674     (uint16_t)(*EEDataWritePointer)--;
1151  051e 723a0001      	dec	[_EEDataWritePointer.w]
1152  0522               L705:
1153                     ; 662   while((uint16_t)(*EEDataWritePointer) > 0)
1154  0522 72c60001      	ld	a,[_EEDataWritePointer.w]
1155  0526 5f            	clrw	x
1156  0527 97            	ld	xl,a
1157  0528 5d            	tnzw	x
1158  0529 26d6          	jrne	L505
1159                     ; 678     I2C_GenerateSTOP(ENABLE);
1160  052b a601          	ld	a,#1
1161  052d cd0000        	call	_I2C_GenerateSTOP
1163                     ; 681     (void)EE_I2C->SR1;
1164  0530 c65217        	ld	a,21015
1165                     ; 682     (void)EE_I2C->SR3;
1166  0533 c65219        	ld	a,21017
1167                     ; 685   return EE_OK;  
1168  0536 5f            	clrw	x
1169  0537 bf02          	ldw	c_lreg+2,x
1170  0539 bf00          	ldw	c_lreg,x
1172  053b 20b6          	jra	L453
1173  053d               LC012:
1174  053d ae0002        	ldw	x,#_EETimeout
1175  0540 cd0000        	call	c_ltor
1177  0543 4c            	inc	a
1178  0544 cd0000        	call	c_lgsbc
1180  0547 cc0000        	jp	c_lrzmp
1181  054a               LC013:
1182  054a ae1000        	ldw	x,#4096
1183  054d               LC014:
1184  054d cf0004        	ldw	_EETimeout+2,x
1185  0550 5f            	clrw	x
1186  0551 cf0002        	ldw	_EETimeout,x
1187  0554 81            	ret	
1189                     .const:	section	.text
1190  0000               L614:
1191  0000 00000096      	dc.l	150
1192                     ; 706 uint32_t EE_WaitEepromStandbyState(void) 
1192                     ; 707 {
1193                     	switch	.text
1194  0555               _EE_WaitEepromStandbyState:
1195  0555 5207          	subw	sp,#7
1196       00000007      OFST:	set	7
1198                     ; 708   __IO uint8_t tmpSR1 = 0;
1199  0557 0f07          	clr	(OFST+0,sp)
1200                     ; 709   __IO uint32_t EETrials = 0;
1201  0559 5f            	clrw	x
1202  055a 1f05          	ldw	(OFST-2,sp),x
1203  055c 1f03          	ldw	(OFST-4,sp),x
1204                     ; 712   EETimeout = EE_LONG_TIMEOUT;
1205  055e aea000        	ldw	x,#40960
1206  0561 cd062c        	call	LC017
1208  0564 2005          	jra	L135
1209  0566               L525:
1210                     ; 715     if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1211  0566 cd061e        	call	LC016
1216  0569 2725          	jreq	LC015
1217  056b               L135:
1218                     ; 713   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
1219  056b ae0302        	ldw	x,#770
1220  056e cd0000        	call	_I2C_GetFlagStatus
1222  0571 4d            	tnz	a
1223  0572 26f2          	jrne	L525
1224  0574               L735:
1225                     ; 724     I2C_GenerateSTART(ENABLE);
1226  0574 a601          	ld	a,#1
1227  0576 cd0000        	call	_I2C_GenerateSTART
1229                     ; 727     EETimeout = EE_FLAG_TIMEOUT;
1230  0579 ae1000        	ldw	x,#4096
1231  057c cd062c        	call	LC017
1233  057f 2015          	jra	L745
1234  0581               L345:
1235                     ; 730       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1236  0581 ae0002        	ldw	x,#_EETimeout
1237  0584 cd0000        	call	c_ltor
1239  0587 4c            	inc	a
1240  0588 cd0000        	call	c_lgsbc
1242  058b cd0000        	call	c_lrzmp
1244  058e 2606          	jrne	L745
1246  0590               LC015:
1247  0590 cd0634        	call	_EE_TIMEOUT_UserCallback
1250  0593               L224:
1251  0593 5b07          	addw	sp,#7
1252  0595 81            	ret	
1253  0596               L745:
1254                     ; 728     while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT))
1255  0596 ae0301        	ldw	x,#769
1256  0599 cd0000        	call	_I2C_CheckEvent
1258  059c 4d            	tnz	a
1259  059d 27e2          	jreq	L345
1260                     ; 734     I2C_Send7bitAddress((uint8_t)EEAddress, I2C_DIRECTION_TX);
1261  059f c60001        	ld	a,_EEAddress+1
1262  05a2 5f            	clrw	x
1263  05a3 95            	ld	xh,a
1264  05a4 cd0000        	call	_I2C_Send7bitAddress
1266                     ; 737     EETimeout = EE_LONG_TIMEOUT;
1267  05a7 aea000        	ldw	x,#40960
1268  05aa cd062c        	call	LC017
1269  05ad               L555:
1270                     ; 741       tmpSR1 = EE_I2C->SR1;
1271  05ad c65217        	ld	a,21015
1272  05b0 6b07          	ld	(OFST+0,sp),a
1273                     ; 744       if((EETimeout--) == 0) return EE_TIMEOUT_UserCallback();
1274  05b2 ad6a          	call	LC016
1279  05b4 27da          	jreq	LC015
1280                     ; 748     while((I2C_GetFlagStatus(I2C_FLAG_ADDRESSSENTMATCHED)== RESET) & 
1280                     ; 749           (I2C_GetFlagStatus(I2C_FLAG_ACKNOWLEDGEFAILURE)== RESET));
1281  05b6 ae0204        	ldw	x,#516
1282  05b9 cd0000        	call	_I2C_GetFlagStatus
1284  05bc 4d            	tnz	a
1285  05bd 2605          	jrne	L673
1286  05bf ae0001        	ldw	x,#1
1287  05c2 2001          	jra	L204
1288  05c4               L673:
1289  05c4 5f            	clrw	x
1290  05c5               L204:
1291  05c5 1f01          	ldw	(OFST-6,sp),x
1292  05c7 ae0102        	ldw	x,#258
1293  05ca cd0000        	call	_I2C_GetFlagStatus
1295  05cd 4d            	tnz	a
1296  05ce 2605          	jrne	L404
1297  05d0 ae0001        	ldw	x,#1
1298  05d3 2001          	jra	L014
1299  05d5               L404:
1300  05d5 5f            	clrw	x
1301  05d6               L014:
1302  05d6 01            	rrwa	x,a
1303  05d7 1402          	and	a,(OFST-5,sp)
1304  05d9 01            	rrwa	x,a
1305  05da 1401          	and	a,(OFST-6,sp)
1306  05dc 01            	rrwa	x,a
1307  05dd 5d            	tnzw	x
1308  05de 26cd          	jrne	L555
1309                     ; 750   tmpSR1 = EE_I2C->SR1;   
1310  05e0 c65217        	ld	a,21015
1311  05e3 6b07          	ld	(OFST+0,sp),a
1312                     ; 752     if (tmpSR1 & I2C_SR1_ADDR)
1313  05e5 7b07          	ld	a,(OFST+0,sp)
1314  05e7 a502          	bcp	a,#2
1315  05e9 270f          	jreq	L565
1316                     ; 756       (void)EE_I2C->SR3;
1317  05eb c65219        	ld	a,21017
1318                     ; 759       I2C_GenerateSTOP(ENABLE);
1319  05ee a601          	ld	a,#1
1320  05f0 cd0000        	call	_I2C_GenerateSTOP
1322                     ; 762       return EE_OK;
1323  05f3 5f            	clrw	x
1324  05f4 bf02          	ldw	c_lreg+2,x
1325  05f6 bf00          	ldw	c_lreg,x
1327  05f8 2099          	jra	L224
1328  05fa               L565:
1329                     ; 767       I2C_ClearFlag(I2C_FLAG_ACKNOWLEDGEFAILURE);                  
1330  05fa ae0204        	ldw	x,#516
1331  05fd cd0000        	call	_I2C_ClearFlag
1333                     ; 771     if (EETrials++ == EE_MAX_TRIALS_NUMBER)
1334  0600 96            	ldw	x,sp
1335  0601 1c0003        	addw	x,#OFST-4
1336  0604 cd0000        	call	c_ltor
1338  0607 96            	ldw	x,sp
1339  0608 1c0003        	addw	x,#OFST-4
1340  060b a601          	ld	a,#1
1341  060d cd0000        	call	c_lgadc
1343  0610 ae0000        	ldw	x,#L614
1344  0613 cd0000        	call	c_lcmp
1346  0616 2703cc0574    	jrne	L735
1347                     ; 774       return EE_TIMEOUT_UserCallback();
1350  061b cc0590        	jp	LC015
1351  061e               LC016:
1352  061e ae0002        	ldw	x,#_EETimeout
1353  0621 cd0000        	call	c_ltor
1355  0624 a601          	ld	a,#1
1356  0626 cd0000        	call	c_lgsbc
1358  0629 cc0000        	jp	c_lrzmp
1359  062c               LC017:
1360  062c cf0004        	ldw	_EETimeout+2,x
1361  062f 5f            	clrw	x
1362  0630 cf0002        	ldw	_EETimeout,x
1363  0633 81            	ret	
1365                     ; 785 uint32_t EE_TIMEOUT_UserCallback(void)
1365                     ; 786 {
1366  0634               _EE_TIMEOUT_UserCallback:
1368  0634               L375:
1369  0634 20fe          	jra	L375
1371                     ; 805 void EE_EnterCriticalSection_UserCallback(void)
1371                     ; 806 {
1372  0636               _EE_EnterCriticalSection_UserCallback:
1374                     ; 807   disableInterrupts();  
1376  0636 9b            	sim	
1378                     ; 808 }
1379  0637 81            	ret	
1381                     ; 820 void EE_ExitCriticalSection_UserCallback(void)
1381                     ; 821 {
1382  0638               _EE_ExitCriticalSection_UserCallback:
1384                     ; 822   enableInterrupts();
1386  0638 9a            	rim	
1388                     ; 823 }
1389  0639 81            	ret	
1391                     	switch	.bss
1392  0000               _EEDataNum:
1393  0000 00            	ds.b	1
1394                     	xdef	_EEDataNum
1395  0001               _EEDataWritePointer:
1396  0001 0000          	ds.b	2
1397                     	xdef	_EEDataWritePointer
1398                     	xdef	_EETimeout
1399                     	xdef	_EEAddress
1400                     	xdef	_EE_ExitCriticalSection_UserCallback
1401                     	xdef	_EE_EnterCriticalSection_UserCallback
1402                     	xdef	_EE_TIMEOUT_UserCallback
1403                     	xdef	_EE_WaitEepromStandbyState
1404                     	xdef	_EE_WriteBuffer
1405                     	xdef	_EE_WritePage
1406                     	xdef	_EE_ReadBuffer
1407                     	xdef	_EE_Init
1408                     	xdef	_EE_DeInit
1409                     	xref	_TurretExecute
1410                     	xref	_SensorCounter
1411                     	xref	_CounterMode
1412                     	xref	_FlagSensorEn
1413                     	xref	_FlagUvDetect
1414                     	xref	_FlagAddCount
1415                     	xref	_FlagAutoCount
1416                     	xref	_FlagValueCount
1417                     	xref	_BSP_EepromInit
1418                     	xref	_BSP_EepromDeInit
1419                     	xref	_SystemTimer
1420                     	xref	_AdcValue
1421                     	xref	_BuzzerOnTime
1422                     	xref	_I2C_ClearFlag
1423                     	xref	_I2C_GetFlagStatus
1424                     	xref	_I2C_CheckEvent
1425                     	xref	_I2C_SendData
1426                     	xref	_I2C_Send7bitAddress
1427                     	xref	_I2C_ReceiveData
1428                     	xref	_I2C_AcknowledgeConfig
1429                     	xref	_I2C_GenerateSTOP
1430                     	xref	_I2C_GenerateSTART
1431                     	xref	_I2C_Cmd
1432                     	xref	_I2C_Init
1433                     	xref.b	c_lreg
1434                     	xref.b	c_x
1435                     	xref	c_lcmp
1436                     	xref	c_lgadc
1437                     	xref	c_lrzmp
1438                     	xref	c_lgsbc
1439                     	xref	c_ltor
1440                     	end
