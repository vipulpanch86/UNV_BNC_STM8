   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L14_PF_PROC_HOME_LIST:
  23  0000 0305          	dc.w	L3_ProcHomeTestKeypad
  25  0002 0532          	dc.w	L5_ProcHomeWelcomeMsg
  27  0004 067e          	dc.w	L7_ProcHomeTestStart
  29  0006 06d9          	dc.w	L11_ProcHomeTestEnd
  31  0008 0736          	dc.w	L31_ProcHomeIdle
  33  000a 0a7b          	dc.w	L51_ProcHomeEdit
  35  000c 0c87          	dc.w	L71_ProcHomeStartHMotor
  37  000e 0d45          	dc.w	L12_ProcHomeStartSMotor
  39  0010 0fb8          	dc.w	L32_ProcHomeStartBCoil
  41  0012 10be          	dc.w	L52_ProcHomeStopHMotor
  43  0014 102e          	dc.w	L72_ProcHomeStartSCoil
  45  0016 1264          	dc.w	L13_ProcHomeWriteMemory
  47  0018 1293          	dc.w	L33_ProcHomeBeep
  49  001a 130e          	dc.w	L53_ProcHomeError01
  51  001c 1325          	dc.w	L73_ProcHomeError02
  52  001e               L34_REG_ID_ACC_CTR_LIST:
  53  001e 09            	dc.b	9
  54  001f 0a            	dc.b	10
  55  0020 0b            	dc.b	11
  56  0021 0c            	dc.b	12
  57  0022 0d            	dc.b	13
  58  0023               L54_REG_ID_SET_CNT_LIST:
  59  0023 05            	dc.b	5
  60  0024 06            	dc.b	6
  61  0025 ff            	dc.b	255
  62  0026 07            	dc.b	7
  63  0027 08            	dc.b	8
  64                     	switch	.data
  65  0000               L74_pfProcHome:
  66  0000 0000          	dc.w	0
  67                     ; 105 static uint8_t SwitchHomeSubProcess(void *param, UI_MSG_T *pMsg)
  67                     ; 106 {
  68                     	scross	off
  69                     	switch	.text
  70  0000               L15_SwitchHomeSubProcess:
  71  0000 89            	pushw	x
  72       00000000      OFST:	set	0
  74                     ; 107   UI_ClearAllMessage();
  75  0001 cd0000        	call	_UI_ClearAllMessage
  77                     ; 109   return (pfProcHome(param, pMsg));	
  78  0004 1e05          	ldw	x,(OFST+5,sp)
  79  0006 89            	pushw	x
  80  0007 1e03          	ldw	x,(OFST+3,sp)
  81  0009 72cd0000      	call	[L74_pfProcHome.w]
  84  000d 5b04          	addw	sp,#4
  85  000f 81            	ret	
  87                     	switch	.const
  88  0028               L55_charCountMode:
  89  0028 43            	dc.b	67
  90  0029 42            	dc.b	66
  91  002a 46            	dc.b	70
  92  002b 53            	dc.b	83
  93  002c 56            	dc.b	86
  94  002d               L75_COUNT_MODE_LED_LIST:
  95  002d 00            	dc.b	0
  96  002e 01            	dc.b	1
  97  002f 02            	dc.b	2
  98  0030 03            	dc.b	3
  99  0031 04            	dc.b	4
 100                     	switch	.data
 101  0002               L16_lacsDispEn:
 102  0002 01            	dc.b	1
 103  0003               L36_BkupSysTimer:
 104  0003 00000000      	dc.l	0
 105                     	switch	.const
 106  0032               L63:
 107  0032 0000000a      	dc.l	10
 108  0036               L24:
 109  0036 00000014      	dc.l	20
 110  003a               L64:
 111  003a 00000032      	dc.l	50
 112  003e               L25:
 113  003e 00000064      	dc.l	100
 114  0042               L65:
 115  0042 000001f4      	dc.l	500
 116  0046               L26:
 117  0046 000003e8      	dc.l	1000
 118  004a               L211:
 119  004a 00002710      	dc.l	10000
 120  004e               L411:
 121  004e 000186a0      	dc.l	100000
 122                     ; 117 static void HomeDispCounter(void)
 122                     ; 118 {
 123                     	switch	.text
 124  0010               L35_HomeDispCounter:
 125  0010 523a          	subw	sp,#58
 126       0000003a      OFST:	set	58
 128                     ; 119   const char charCountMode[COUNT_MODE_MAX] =
 128                     ; 120   {
 128                     ; 121     'C',
 128                     ; 122     'B',
 128                     ; 123     'F',
 128                     ; 124     'S',
 128                     ; 125     'V'
 128                     ; 126   };
 129  0012 96            	ldw	x,sp
 130  0013 1c0007        	addw	x,#OFST-51
 131  0016 90ae0028      	ldw	y,#L55_charCountMode
 132  001a a605          	ld	a,#5
 133  001c cd0000        	call	c_xymvx
 135                     ; 127   const uint8_t COUNT_MODE_LED_LIST[COUNT_MODE_MAX] =
 135                     ; 128   {
 135                     ; 129     DISP_LED_VERIFY,
 135                     ; 130     DISP_LED_BATCH,
 135                     ; 131     DISP_LED_FREE,
 135                     ; 132     DISP_LED_STAMP,
 135                     ; 133     DISP_LED_VALUE
 135                     ; 134   };
 136  001f 96            	ldw	x,sp
 137  0020 1c000c        	addw	x,#OFST-46
 138  0023 90ae002d      	ldw	y,#L75_COUNT_MODE_LED_LIST
 139  0027 a605          	ld	a,#5
 140  0029 cd0000        	call	c_xymvx
 142                     ; 141   uint32_t noteSetCount = 0, valueCounter = 0, accSensorCount = 0;
 143  002c 5f            	clrw	x
 144  002d 1f31          	ldw	(OFST-9,sp),x
 145  002f 1f2f          	ldw	(OFST-11,sp),x
 147  0031 1f16          	ldw	(OFST-36,sp),x
 148  0033 1f14          	ldw	(OFST-38,sp),x
 150  0035 1f1a          	ldw	(OFST-32,sp),x
 151  0037 1f18          	ldw	(OFST-34,sp),x
 152                     ; 90   return FlagAutoCount;
 153  0039 c60000        	ld	a,_FlagAutoCount
 154  003c 6b1c          	ld	(OFST-30,sp),a
 157                     ; 110   return FlagAddCount;
 158  003e c60000        	ld	a,_FlagAddCount
 159  0041 6b1d          	ld	(OFST-29,sp),a
 162                     ; 70   return FlagValueCount;
 163  0043 c60000        	ld	a,_FlagValueCount
 164  0046 6b11          	ld	(OFST-41,sp),a
 167                     ; 150   return FlagSensorEn;
 168  0048 c60000        	ld	a,_FlagSensorEn
 169  004b 6b12          	ld	(OFST-40,sp),a
 172                     ; 130   return FlagUvDetect;
 173  004d c60000        	ld	a,_FlagUvDetect
 174  0050 6b13          	ld	(OFST-39,sp),a
 177                     ; 170   return CounterMode;
 178  0052 c60000        	ld	a,_CounterMode
 179  0055 6b26          	ld	(OFST-20,sp),a
 182                     ; 190   return SensorCounter;
 183  0057 ce0002        	ldw	x,_SensorCounter+2
 184  005a 1f35          	ldw	(OFST-5,sp),x
 185  005c ce0000        	ldw	x,_SensorCounter
 186  005f 1f33          	ldw	(OFST-7,sp),x
 189                     ; 151   REG_GetValue(&valueCounter, REG_ID_VALUE_COUNTER);
 190  0061 4b04          	push	#4
 191  0063 96            	ldw	x,sp
 192  0064 1c0015        	addw	x,#OFST-37
 193  0067 cd0000        	call	_REG_GetValue
 195  006a 84            	pop	a
 196                     ; 152   REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
 197  006b 7b26          	ld	a,(OFST-20,sp)
 198  006d 5f            	clrw	x
 199  006e 97            	ld	xl,a
 200  006f d6001e        	ld	a,(L34_REG_ID_ACC_CTR_LIST,x)
 201  0072 88            	push	a
 202  0073 96            	ldw	x,sp
 203  0074 1c0019        	addw	x,#OFST-33
 204  0077 cd0000        	call	_REG_GetValue
 206  007a 84            	pop	a
 207                     ; 153   REG_GetValue(&noteSetCount, REG_ID_SET_CNT_LIST[cntMode]);
 208  007b 7b26          	ld	a,(OFST-20,sp)
 209  007d 5f            	clrw	x
 210  007e 97            	ld	xl,a
 211  007f d60023        	ld	a,(L54_REG_ID_SET_CNT_LIST,x)
 212  0082 88            	push	a
 213  0083 96            	ldw	x,sp
 214  0084 1c0030        	addw	x,#OFST-10
 215  0087 cd0000        	call	_REG_GetValue
 217  008a 84            	pop	a
 218                     ; 156   DISP_ClearAll();
 219  008b cd0000        	call	_DISP_ClearAll
 221                     ; 158   DISP_Led(DISP_LED_ADD, (uint8_t)flagAddCount);
 222  008e 7b1d          	ld	a,(OFST-29,sp)
 223  0090 ae0500        	ldw	x,#1280
 224  0093 97            	ld	xl,a
 225  0094 cd0000        	call	_DISP_Led
 227                     ; 159   DISP_Led(DISP_LED_AUTO, (uint8_t)flagAutoCount);
 228  0097 7b1c          	ld	a,(OFST-30,sp)
 229  0099 ae0700        	ldw	x,#1792
 230  009c 97            	ld	xl,a
 231  009d cd0000        	call	_DISP_Led
 233                     ; 160   DISP_Led(DISP_LED_MANUAL, (uint8_t)~flagAutoCount);
 234  00a0 7b1c          	ld	a,(OFST-30,sp)
 235  00a2 43            	cpl	a
 236  00a3 ae0800        	ldw	x,#2048
 237  00a6 97            	ld	xl,a
 238  00a7 cd0000        	call	_DISP_Led
 240                     ; 161   DISP_Led(DISP_LED_UV, (uint8_t)flagUVDetect);
 241  00aa 7b13          	ld	a,(OFST-39,sp)
 242  00ac ae0600        	ldw	x,#1536
 243  00af 97            	ld	xl,a
 244  00b0 cd0000        	call	_DISP_Led
 246                     ; 162   DISP_Led(COUNT_MODE_LED_LIST[cntMode], TRUE);
 247  00b3 96            	ldw	x,sp
 248  00b4 1c000c        	addw	x,#OFST-46
 249  00b7 9f            	ld	a,xl
 250  00b8 5e            	swapw	x
 251  00b9 1b26          	add	a,(OFST-20,sp)
 252  00bb 2401          	jrnc	L43
 253  00bd 5c            	incw	x
 254  00be               L43:
 255  00be 02            	rlwa	x,a
 256  00bf f6            	ld	a,(x)
 257  00c0 ae0001        	ldw	x,#1
 258  00c3 95            	ld	xh,a
 259  00c4 cd0000        	call	_DISP_Led
 261                     ; 164   if(cntMode == COUNT_MODE_V)
 262  00c7 7b26          	ld	a,(OFST-20,sp)
 263  00c9 a104          	cp	a,#4
 264  00cb 2679          	jrne	L501
 265                     ; 166     if(noteSetCount == 10)
 266  00cd 96            	ldw	x,sp
 267  00ce 1c002f        	addw	x,#OFST-11
 268  00d1 cd0000        	call	c_ltor
 270  00d4 ae0032        	ldw	x,#L63
 271  00d7 cd0000        	call	c_lcmp
 273  00da 2605          	jrne	L701
 274                     ; 168       DISP_Led(DISP_LED_V_10, TRUE);
 275  00dc ae0901        	ldw	x,#2305
 278  00df 2062          	jp	LC001
 279  00e1               L701:
 280                     ; 170     else if(noteSetCount == 20)
 281  00e1 96            	ldw	x,sp
 282  00e2 1c002f        	addw	x,#OFST-11
 283  00e5 cd0000        	call	c_ltor
 285  00e8 ae0036        	ldw	x,#L24
 286  00eb cd0000        	call	c_lcmp
 288  00ee 2605          	jrne	L311
 289                     ; 172       DISP_Led(DISP_LED_V_20, TRUE);
 290  00f0 ae0a01        	ldw	x,#2561
 293  00f3 204e          	jp	LC001
 294  00f5               L311:
 295                     ; 174     else if(noteSetCount == 50)
 296  00f5 96            	ldw	x,sp
 297  00f6 1c002f        	addw	x,#OFST-11
 298  00f9 cd0000        	call	c_ltor
 300  00fc ae003a        	ldw	x,#L64
 301  00ff cd0000        	call	c_lcmp
 303  0102 2605          	jrne	L711
 304                     ; 176       DISP_Led(DISP_LED_V_50, TRUE);
 305  0104 ae0b01        	ldw	x,#2817
 308  0107 203a          	jp	LC001
 309  0109               L711:
 310                     ; 178     else if(noteSetCount == 100)
 311  0109 96            	ldw	x,sp
 312  010a 1c002f        	addw	x,#OFST-11
 313  010d cd0000        	call	c_ltor
 315  0110 ae003e        	ldw	x,#L25
 316  0113 cd0000        	call	c_lcmp
 318  0116 2605          	jrne	L321
 319                     ; 180       DISP_Led(DISP_LED_V_100, TRUE);
 320  0118 ae0c01        	ldw	x,#3073
 323  011b 2026          	jp	LC001
 324  011d               L321:
 325                     ; 182     else if(noteSetCount == 500)
 326  011d 96            	ldw	x,sp
 327  011e 1c002f        	addw	x,#OFST-11
 328  0121 cd0000        	call	c_ltor
 330  0124 ae0042        	ldw	x,#L65
 331  0127 cd0000        	call	c_lcmp
 333  012a 2605          	jrne	L721
 334                     ; 184       DISP_Led(DISP_LED_V_500, TRUE);
 335  012c ae0d01        	ldw	x,#3329
 338  012f 2012          	jp	LC001
 339  0131               L721:
 340                     ; 186     else if(noteSetCount == 1000)
 341  0131 96            	ldw	x,sp
 342  0132 1c002f        	addw	x,#OFST-11
 343  0135 cd0000        	call	c_ltor
 345  0138 ae0046        	ldw	x,#L26
 346  013b cd0000        	call	c_lcmp
 348  013e 2606          	jrne	L501
 349                     ; 188       DISP_Led(DISP_LED_V_1000, TRUE);
 350  0140 ae0e01        	ldw	x,#3585
 351  0143               LC001:
 352  0143 cd0000        	call	_DISP_Led
 354  0146               L501:
 355                     ; 196   memset(&strTopDisp[0], ' ', sizeof(strTopDisp));
 356  0146 ae0008        	ldw	x,#8
 357  0149 89            	pushw	x
 358  014a 4b20          	push	#32
 359  014c 96            	ldw	x,sp
 360  014d 1c002a        	addw	x,#OFST-16
 361  0150 cd0000        	call	_memset
 363  0153 5b03          	addw	sp,#3
 364                     ; 197   memset(&strBotDisp[0], ' ', sizeof(strBotDisp));
 365  0155 ae0008        	ldw	x,#8
 366  0158 89            	pushw	x
 367  0159 4b20          	push	#32
 368  015b 96            	ldw	x,sp
 369  015c 1c0021        	addw	x,#OFST-25
 370  015f cd0000        	call	_memset
 372  0162 5b03          	addw	sp,#3
 373                     ; 199   if(flagAddCount == TRUE)
 374  0164 7b1d          	ld	a,(OFST-29,sp)
 375  0166 4a            	dec	a
 376  0167 2617          	jrne	L531
 377                     ; 201     TopDispValue = accSensorCount;
 378  0169 1e1a          	ldw	x,(OFST-32,sp)
 379  016b 1f39          	ldw	(OFST-1,sp),x
 380  016d 1e18          	ldw	x,(OFST-34,sp)
 381  016f 1f37          	ldw	(OFST-3,sp),x
 382                     ; 202     BotDispValue = (sensorCounter > 0) ? sensorCounter : noteSetCount;
 383  0171 96            	ldw	x,sp
 384  0172 1c0033        	addw	x,#OFST-7
 385  0175 cd0000        	call	c_lzmp
 387  0178 96            	ldw	x,sp
 388  0179 2732          	jreq	L401
 389  017b               LC008:
 390  017b 1c0033        	addw	x,#OFST-7
 392  017e 2030          	jra	L011
 396  0180               L531:
 397                     ; 206     if(flagValueEnable)
 398  0180 7b11          	ld	a,(OFST-41,sp)
 399  0182 2738          	jreq	L141
 400                     ; 208       TopDispValue = (cntMode == COUNT_MODE_V) ? valueCounter : sensorCounter;
 401  0184 7b26          	ld	a,(OFST-20,sp)
 402  0186 a104          	cp	a,#4
 403  0188 96            	ldw	x,sp
 404  0189 2605          	jrne	L67
 405  018b 1c0014        	addw	x,#OFST-38
 407  018e 2003          	jra	L001
 408  0190               L67:
 409  0190 1c0033        	addw	x,#OFST-7
 411  0193               L001:
 412  0193 cd0000        	call	c_ltor
 413  0196 96            	ldw	x,sp
 414  0197 1c0037        	addw	x,#OFST-3
 415  019a cd0000        	call	c_rtol
 417                     ; 209       BotDispValue = (cntMode == COUNT_MODE_V) ?
 417                     ; 210                ((sensorCounter > 0) ? sensorCounter : noteSetCount) : noteSetCount;
 418  019d 7b26          	ld	a,(OFST-20,sp)
 419  019f a104          	cp	a,#4
 420  01a1 96            	ldw	x,sp
 421  01a2 2609          	jrne	L401
 422  01a4 1c0033        	addw	x,#OFST-7
 423  01a7 cd0000        	call	c_lzmp
 425  01aa 96            	ldw	x,sp
 427  01ab 26ce          	jrne	LC008
 428  01ad               L401:
 430  01ad 1c002f        	addw	x,#OFST-11
 432  01b0               L011:
 433  01b0 cd0000        	call	c_ltor
 434  01b3 96            	ldw	x,sp
 435  01b4 1c0033        	addw	x,#OFST-7
 436  01b7 cd0000        	call	c_rtol
 439  01ba 2010          	jra	L731
 440  01bc               L141:
 441                     ; 214       TopDispValue = sensorCounter;
 442  01bc 1e35          	ldw	x,(OFST-5,sp)
 443  01be 1f39          	ldw	(OFST-1,sp),x
 444  01c0 1e33          	ldw	x,(OFST-7,sp)
 445  01c2 1f37          	ldw	(OFST-3,sp),x
 446                     ; 215       BotDispValue = noteSetCount;
 447  01c4 1e31          	ldw	x,(OFST-9,sp)
 448  01c6 1f35          	ldw	(OFST-5,sp),x
 449  01c8 1e2f          	ldw	x,(OFST-11,sp)
 450  01ca 1f33          	ldw	(OFST-7,sp),x
 451  01cc               L731:
 452                     ; 220   if(TopDispValue > (MAX_LCD_RESLN / 10))
 453  01cc 96            	ldw	x,sp
 454  01cd cd02fb        	call	LC010
 455  01d0 cd0000        	call	c_lcmp
 457  01d3 2403cc0274    	jrult	L541
 458                     ; 223     if(flagSensorEnable)
 459  01d8 0d12          	tnz	(OFST-40,sp)
 460  01da 96            	ldw	x,sp
 461  01db 270a          	jreq	L741
 462                     ; 225       if(TopDispValue > MAX_LCD_RESLN)
 463  01dd cd02f1        	call	LC009
 464  01e0 cd0000        	call	c_lcmp
 466  01e3 2578          	jrult	L161
 467                     ; 227         sprintf((char *)&strTopDisp[0], "%lu%c", TopDispValue / (MAX_LCD_RESLN + 1), LCD_WRAP_CHAR);
 472  01e5 2044          	jp	LC006
 473                     ; 231         sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
 475  01e7               L741:
 476                     ; 236       if(TopDispValue > MAX_LCD_RESLN)
 477  01e7 cd02f1        	call	LC009
 478  01ea cd0000        	call	c_lcmp
 480  01ed 256e          	jrult	L161
 481                     ; 328   return SystemTimer;
 482  01ef ce0002        	ldw	x,_SystemTimer+2
 483  01f2 1f05          	ldw	(OFST-53,sp),x
 484  01f4 ce0000        	ldw	x,_SystemTimer
 485  01f7 1f03          	ldw	(OFST-55,sp),x
 488                     ; 240         if(abs((int32_t)(SysTimer - BkupSysTimer)) >= 1000)
 489  01f9 96            	ldw	x,sp
 490  01fa 1c0003        	addw	x,#OFST-55
 491  01fd cd0000        	call	c_ltor
 493  0200 ae0003        	ldw	x,#L36_BkupSysTimer
 494  0203 cd0000        	call	c_lsub
 496  0206 be02          	ldw	x,c_lreg+2
 497  0208 cd0000        	call	_abs
 499  020b a303e8        	cpw	x,#1000
 500  020e 2f15          	jrslt	L361
 501                     ; 242           BkupSysTimer = SysTimer;
 502  0210 1e05          	ldw	x,(OFST-53,sp)
 503  0212 cf0005        	ldw	L36_BkupSysTimer+2,x
 504  0215 1e03          	ldw	x,(OFST-55,sp)
 505  0217 cf0003        	ldw	L36_BkupSysTimer,x
 506                     ; 243           lacsDispEn = (uint8_t)((lacsDispEn == TRUE) ? FALSE : TRUE);
 507  021a c60002        	ld	a,L16_lacsDispEn
 508  021d 4a            	dec	a
 509  021e 2702          	jreq	L621
 510  0220 a601          	ld	a,#1
 511  0222               L621:
 512  0222 c70002        	ld	L16_lacsDispEn,a
 513  0225               L361:
 514                     ; 246         if(lacsDispEn == TRUE)
 515  0225 c60002        	ld	a,L16_lacsDispEn
 516  0228 4a            	dec	a
 517  0229 2624          	jrne	L561
 518                     ; 248           sprintf((char *)&strTopDisp[0], "%lu%c", TopDispValue / (MAX_LCD_RESLN + 1), LCD_WRAP_CHAR);
 522  022b               LC006:
 523  022b 4b4c          	push	#76
 524  022d 96            	ldw	x,sp
 525  022e 1c0038        	addw	x,#OFST-2
 526  0231 cd0000        	call	c_ltor
 527  0234 ae004e        	ldw	x,#L411
 528  0237 cd0000        	call	c_ludv
 529  023a be02          	ldw	x,c_lreg+2
 530  023c 89            	pushw	x
 531  023d be00          	ldw	x,c_lreg
 532  023f 89            	pushw	x
 533  0240 ae029f        	ldw	x,#L351
 534  0243 89            	pushw	x
 535  0244 96            	ldw	x,sp
 536  0245 1c002e        	addw	x,#OFST-12
 537  0248 cd0000        	call	_sprintf
 538  024b 5b07          	addw	sp,#7
 540  024d 2049          	jra	L371
 541  024f               L561:
 542                     ; 252           sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT,
 542                     ; 253                   TopDispValue % (MAX_LCD_RESLN + 1));
 543  024f 96            	ldw	x,sp
 544  0250 cd02f1        	call	LC009
 545  0253 cd0000        	call	c_lumd
 547  0256 be02          	ldw	x,c_lreg+2
 548  0258 89            	pushw	x
 549  0259 be00          	ldw	x,c_lreg
 551  025b 2005          	jp	LC004
 552  025d               L161:
 553                     ; 258         sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
 554  025d 1e39          	ldw	x,(OFST-1,sp)
 555  025f 89            	pushw	x
 556  0260 1e39          	ldw	x,(OFST-1,sp)
 558  0262               LC004:
 559  0262 89            	pushw	x
 560  0263 ce0000        	ldw	x,_pDisp
 561  0266 ee06          	ldw	x,(6,x)
 562  0268 89            	pushw	x
 563  0269 96            	ldw	x,sp
 564  026a 1c002d        	addw	x,#OFST-13
 565  026d cd0000        	call	_sprintf
 566  0270 5b06          	addw	sp,#6
 567  0272 2024          	jra	L371
 568  0274               L541:
 569                     ; 264     sprintf((char *)&strTopDisp[0], DISP_UPPER_STR_FORMAT, TopDispValue);
 570  0274 1e39          	ldw	x,(OFST-1,sp)
 571  0276 89            	pushw	x
 572  0277 1e39          	ldw	x,(OFST-1,sp)
 573  0279 89            	pushw	x
 574  027a ce0000        	ldw	x,_pDisp
 575  027d ee06          	ldw	x,(6,x)
 576  027f 89            	pushw	x
 577  0280 96            	ldw	x,sp
 578  0281 1c002d        	addw	x,#OFST-13
 579  0284 cd0000        	call	_sprintf
 581  0287 5b06          	addw	sp,#6
 582                     ; 265     strTopDisp[0] = (char)charCountMode[cntMode];
 583  0289 96            	ldw	x,sp
 584  028a 1c0007        	addw	x,#OFST-51
 585  028d 9f            	ld	a,xl
 586  028e 5e            	swapw	x
 587  028f 1b26          	add	a,(OFST-20,sp)
 588  0291 2401          	jrnc	L041
 589  0293 5c            	incw	x
 590  0294               L041:
 591  0294 02            	rlwa	x,a
 592  0295 f6            	ld	a,(x)
 593  0296 6b27          	ld	(OFST-19,sp),a
 594  0298               L371:
 595                     ; 269   if(BotDispValue > 0)
 596  0298 96            	ldw	x,sp
 597  0299 1c0033        	addw	x,#OFST-7
 598  029c cd0000        	call	c_lzmp
 600  029f 2715          	jreq	L571
 601                     ; 271     sprintf((char *)&strBotDisp[0], DISP_LOWER_STR_FORMAT, BotDispValue);
 602  02a1 1e35          	ldw	x,(OFST-5,sp)
 603  02a3 89            	pushw	x
 604  02a4 1e35          	ldw	x,(OFST-5,sp)
 605  02a6 89            	pushw	x
 606  02a7 ce0000        	ldw	x,_pDisp
 607  02aa ee08          	ldw	x,(8,x)
 608  02ac 89            	pushw	x
 609  02ad 96            	ldw	x,sp
 610  02ae 1c0024        	addw	x,#OFST-22
 611  02b1 cd0000        	call	_sprintf
 613  02b4 5b06          	addw	sp,#6
 614  02b6               L571:
 615                     ; 274   DISP_UpperPutStr((char *)&strTopDisp[0], 0);
 616  02b6 4b00          	push	#0
 617  02b8 96            	ldw	x,sp
 618  02b9 1c0028        	addw	x,#OFST-18
 619  02bc cd0000        	call	_DISP_UpperPutStr
 621  02bf 84            	pop	a
 622                     ; 275   DISP_LowerPutStr((char *)&strBotDisp[0], 0);
 623  02c0 4b00          	push	#0
 624  02c2 96            	ldw	x,sp
 625  02c3 1c001f        	addw	x,#OFST-27
 626  02c6 cd0000        	call	_DISP_LowerPutStr
 628  02c9 84            	pop	a
 629                     ; 277   DISP_TurrPutStr((char *)&strTopDisp[DISP_UPPER_MAX_NB - DISP_TURRET_MAX_NB], 0);
 630  02ca 4b00          	push	#0
 631  02cc 96            	ldw	x,sp
 632  02cd 1c0028        	addw	x,#OFST-18
 633  02d0 1f02          	ldw	(OFST-56,sp),x
 634  02d2 ce0000        	ldw	x,_pDisp
 635  02d5 e601          	ld	a,(1,x)
 636  02d7 5f            	clrw	x
 637  02d8 97            	ld	xl,a
 638  02d9 1d0004        	subw	x,#4
 639  02dc 72fb02        	addw	x,(OFST-56,sp)
 640  02df cd0000        	call	_DISP_TurrPutStr
 642  02e2 84            	pop	a
 643                     ; 278   TURR_PutVal((uint16_t)(TopDispValue % 10000)); /* Pending - Magic Number */
 644  02e3 96            	ldw	x,sp
 645  02e4 ad15          	call	LC010
 646  02e6 cd0000        	call	c_lumd
 648  02e9 be02          	ldw	x,c_lreg+2
 649  02eb cd0000        	call	_TURR_PutVal
 651                     ; 190   }
 652  02ee 5b3a          	addw	sp,#58
 653  02f0 81            	ret	
 654  02f1               LC009:
 655  02f1 1c0037        	addw	x,#OFST-3
 656  02f4 cd0000        	call	c_ltor
 658  02f7 ae004e        	ldw	x,#L411
 659  02fa 81            	ret	
 660  02fb               LC010:
 661  02fb 1c0037        	addw	x,#OFST-3
 662  02fe cd0000        	call	c_ltor
 664  0301 ae004a        	ldw	x,#L211
 665  0304 81            	ret	
 667                     	switch	.const
 668  0052               L562_msg:
 669  0052 00            	dc.b	0
 670  0053 00            	dc.b	0
 672                     ; 287 static uint8_t ProcHomeTestKeypad(void *param, UI_MSG_T *pMsg)
 672                     ; 288 {
 673                     	switch	.text
 674  0305               L3_ProcHomeTestKeypad:
 675  0305 89            	pushw	x
 676  0306 89            	pushw	x
 677       00000002      OFST:	set	2
 679                     ; 294   switch(pMsg->message)
 680  0307 1e07          	ldw	x,(OFST+5,sp)
 681  0309 e601          	ld	a,(1,x)
 683                     ; 468     default:
 683                     ; 469       break;
 684  030b 2706          	jreq	L771
 685  030d 4a            	dec	a
 686  030e 2711          	jreq	L102
 687  0310 cc0522        	jra	L372
 688  0313               L771:
 689                     ; 296     case UIMSG_INIT:
 689                     ; 297       //BeepOn = FALSE;
 689                     ; 298       UI_SetRefreshMsg(KEY_CHECK_REFRESH * 2);
 690  0313 ae03e8        	ldw	x,#1000
 691  0316 89            	pushw	x
 692  0317 5f            	clrw	x
 693  0318 89            	pushw	x
 694  0319 cd0000        	call	_UI_SetRefreshMsg
 696  031c 5b04          	addw	sp,#4
 697                     ; 299       break;
 698  031e cc0522        	jra	L372
 699  0321               L102:
 700                     ; 303       UI_SetRefreshMsg(KEY_CHECK_REFRESH);
 701  0321 ae01f4        	ldw	x,#500
 702  0324 89            	pushw	x
 703  0325 5f            	clrw	x
 704  0326 89            	pushw	x
 705  0327 cd0000        	call	_UI_SetRefreshMsg
 707  032a 5b04          	addw	sp,#4
 708                     ; 305       DISP_ClearAll();
 709  032c cd0000        	call	_DISP_ClearAll
 711                     ; 307       if(KPD_IsPressed(KPD_KEY_DIG0) == KEY_STATE_PRESSED)
 712  032f 4f            	clr	a
 713  0330 cd0000        	call	_KPD_IsPressed
 715  0333 4a            	dec	a
 716  0334 260b          	jrne	L572
 717                     ; 338   BuzzerOnTime = buzzTime;
 718  0336 cd0527        	call	LC012
 719                     ; 310         DISP_UpperPutStr("KEY-0", 0);
 720  0339 4b00          	push	#0
 721  033b ae0299        	ldw	x,#L772
 724  033e cc04f9        	jp	LC011
 725  0341               L572:
 726                     ; 313       if(KPD_IsPressed(KPD_KEY_DIG1) == KEY_STATE_PRESSED)
 727  0341 a601          	ld	a,#1
 728  0343 cd0000        	call	_KPD_IsPressed
 730  0346 4a            	dec	a
 731  0347 260b          	jrne	L303
 732                     ; 338   BuzzerOnTime = buzzTime;
 733  0349 cd0527        	call	LC012
 734                     ; 316         DISP_UpperPutStr("KEY-1", 0);
 735  034c 4b00          	push	#0
 736  034e ae0293        	ldw	x,#L503
 739  0351 cc04f9        	jp	LC011
 740  0354               L303:
 741                     ; 319       if(KPD_IsPressed(KPD_KEY_DIG2) == KEY_STATE_PRESSED)
 742  0354 a602          	ld	a,#2
 743  0356 cd0000        	call	_KPD_IsPressed
 745  0359 4a            	dec	a
 746  035a 260b          	jrne	L113
 747                     ; 338   BuzzerOnTime = buzzTime;
 748  035c cd0527        	call	LC012
 749                     ; 322         DISP_UpperPutStr("KEY-2", 0);
 750  035f 4b00          	push	#0
 751  0361 ae028d        	ldw	x,#L313
 754  0364 cc04f9        	jp	LC011
 755  0367               L113:
 756                     ; 325       if(KPD_IsPressed(KPD_KEY_DIG3) == KEY_STATE_PRESSED)
 757  0367 a603          	ld	a,#3
 758  0369 cd0000        	call	_KPD_IsPressed
 760  036c 4a            	dec	a
 761  036d 260b          	jrne	L713
 762                     ; 338   BuzzerOnTime = buzzTime;
 763  036f cd0527        	call	LC012
 764                     ; 328         DISP_UpperPutStr("KEY-3", 0);
 765  0372 4b00          	push	#0
 766  0374 ae0287        	ldw	x,#L123
 769  0377 cc04f9        	jp	LC011
 770  037a               L713:
 771                     ; 331       if(KPD_IsPressed(KPD_KEY_DIG4) == KEY_STATE_PRESSED)
 772  037a a604          	ld	a,#4
 773  037c cd0000        	call	_KPD_IsPressed
 775  037f 4a            	dec	a
 776  0380 260b          	jrne	L523
 777                     ; 338   BuzzerOnTime = buzzTime;
 778  0382 cd0527        	call	LC012
 779                     ; 334         DISP_UpperPutStr("KEY-4", 0);
 780  0385 4b00          	push	#0
 781  0387 ae0281        	ldw	x,#L723
 784  038a cc04f9        	jp	LC011
 785  038d               L523:
 786                     ; 337       if(KPD_IsPressed(KPD_KEY_DIG5) == KEY_STATE_PRESSED)
 787  038d a605          	ld	a,#5
 788  038f cd0000        	call	_KPD_IsPressed
 790  0392 4a            	dec	a
 791  0393 260b          	jrne	L333
 792                     ; 338   BuzzerOnTime = buzzTime;
 793  0395 cd0527        	call	LC012
 794                     ; 340         DISP_UpperPutStr("KEY-5", 0);
 795  0398 4b00          	push	#0
 796  039a ae027b        	ldw	x,#L533
 799  039d cc04f9        	jp	LC011
 800  03a0               L333:
 801                     ; 343       if(KPD_IsPressed(KPD_KEY_DIG6) == KEY_STATE_PRESSED)
 802  03a0 a606          	ld	a,#6
 803  03a2 cd0000        	call	_KPD_IsPressed
 805  03a5 4a            	dec	a
 806  03a6 260b          	jrne	L143
 807                     ; 338   BuzzerOnTime = buzzTime;
 808  03a8 cd0527        	call	LC012
 809                     ; 346         DISP_UpperPutStr("KEY-6", 0);
 810  03ab 4b00          	push	#0
 811  03ad ae0275        	ldw	x,#L343
 814  03b0 cc04f9        	jp	LC011
 815  03b3               L143:
 816                     ; 349       if(KPD_IsPressed(KPD_KEY_DIG7) == KEY_STATE_PRESSED)
 817  03b3 a607          	ld	a,#7
 818  03b5 cd0000        	call	_KPD_IsPressed
 820  03b8 4a            	dec	a
 821  03b9 260b          	jrne	L743
 822                     ; 338   BuzzerOnTime = buzzTime;
 823  03bb cd0527        	call	LC012
 824                     ; 352         DISP_UpperPutStr("KEY-7", 0);
 825  03be 4b00          	push	#0
 826  03c0 ae026f        	ldw	x,#L153
 829  03c3 cc04f9        	jp	LC011
 830  03c6               L743:
 831                     ; 355       if(KPD_IsPressed(KPD_KEY_DIG8) == KEY_STATE_PRESSED)
 832  03c6 a608          	ld	a,#8
 833  03c8 cd0000        	call	_KPD_IsPressed
 835  03cb 4a            	dec	a
 836  03cc 260b          	jrne	L553
 837                     ; 338   BuzzerOnTime = buzzTime;
 838  03ce cd0527        	call	LC012
 839                     ; 358         DISP_UpperPutStr("KEY-8", 0);
 840  03d1 4b00          	push	#0
 841  03d3 ae0269        	ldw	x,#L753
 844  03d6 cc04f9        	jp	LC011
 845  03d9               L553:
 846                     ; 361       if(KPD_IsPressed(KPD_KEY_DIG9) == KEY_STATE_PRESSED)
 847  03d9 a609          	ld	a,#9
 848  03db cd0000        	call	_KPD_IsPressed
 850  03de 4a            	dec	a
 851  03df 260b          	jrne	L363
 852                     ; 338   BuzzerOnTime = buzzTime;
 853  03e1 cd0527        	call	LC012
 854                     ; 364         DISP_UpperPutStr("KEY-9", 0);
 855  03e4 4b00          	push	#0
 856  03e6 ae0263        	ldw	x,#L563
 859  03e9 cc04f9        	jp	LC011
 860  03ec               L363:
 861                     ; 367       if(KPD_IsPressed(KPD_KEY_ADD) == KEY_STATE_PRESSED)
 862  03ec a60a          	ld	a,#10
 863  03ee cd0000        	call	_KPD_IsPressed
 865  03f1 4a            	dec	a
 866  03f2 260b          	jrne	L173
 867                     ; 338   BuzzerOnTime = buzzTime;
 868  03f4 cd0527        	call	LC012
 869                     ; 370         DISP_UpperPutStr("ADD", 0);
 870  03f7 4b00          	push	#0
 871  03f9 ae025f        	ldw	x,#L373
 874  03fc cc04f9        	jp	LC011
 875  03ff               L173:
 876                     ; 373       if(KPD_IsPressed(KPD_KEY_ADD_UV) == KEY_STATE_PRESSED)
 877  03ff a60b          	ld	a,#11
 878  0401 cd0000        	call	_KPD_IsPressed
 880  0404 4a            	dec	a
 881  0405 260b          	jrne	L773
 882                     ; 338   BuzzerOnTime = buzzTime;
 883  0407 cd0527        	call	LC012
 884                     ; 376         DISP_UpperPutStr("AD-UV", 0);
 885  040a 4b00          	push	#0
 886  040c ae0259        	ldw	x,#L104
 889  040f cc04f9        	jp	LC011
 890  0412               L773:
 891                     ; 379       if(KPD_IsPressed(KPD_KEY_VALM) == KEY_STATE_PRESSED)
 892  0412 a60c          	ld	a,#12
 893  0414 cd0000        	call	_KPD_IsPressed
 895  0417 4a            	dec	a
 896  0418 260b          	jrne	L504
 897                     ; 338   BuzzerOnTime = buzzTime;
 898  041a cd0527        	call	LC012
 899                     ; 382         DISP_UpperPutStr("VALUE", 0);
 900  041d 4b00          	push	#0
 901  041f ae0253        	ldw	x,#L704
 904  0422 cc04f9        	jp	LC011
 905  0425               L504:
 906                     ; 385       if(KPD_IsPressed(KPD_KEY_UV) == KEY_STATE_PRESSED)
 907  0425 a60d          	ld	a,#13
 908  0427 cd0000        	call	_KPD_IsPressed
 910  042a 4a            	dec	a
 911  042b 260b          	jrne	L314
 912                     ; 338   BuzzerOnTime = buzzTime;
 913  042d cd0527        	call	LC012
 914                     ; 388         DISP_UpperPutStr("UV", 0);
 915  0430 4b00          	push	#0
 916  0432 ae0250        	ldw	x,#L514
 919  0435 cc04f9        	jp	LC011
 920  0438               L314:
 921                     ; 391       if(KPD_IsPressed(KPD_KEY_AUTO) == KEY_STATE_PRESSED)
 922  0438 a60e          	ld	a,#14
 923  043a cd0000        	call	_KPD_IsPressed
 925  043d 4a            	dec	a
 926  043e 260b          	jrne	L124
 927                     ; 338   BuzzerOnTime = buzzTime;
 928  0440 cd0527        	call	LC012
 929                     ; 394         DISP_UpperPutStr("AUTO", 0);
 930  0443 4b00          	push	#0
 931  0445 ae024b        	ldw	x,#L324
 934  0448 cc04f9        	jp	LC011
 935  044b               L124:
 936                     ; 397       if(KPD_IsPressed(KPD_KEY_MANUAL) == KEY_STATE_PRESSED)
 937  044b a60f          	ld	a,#15
 938  044d cd0000        	call	_KPD_IsPressed
 940  0450 4a            	dec	a
 941  0451 260b          	jrne	L724
 942                     ; 338   BuzzerOnTime = buzzTime;
 943  0453 cd0527        	call	LC012
 944                     ; 400         DISP_UpperPutStr("MANL", 0);
 945  0456 4b00          	push	#0
 946  0458 ae0246        	ldw	x,#L134
 949  045b cc04f9        	jp	LC011
 950  045e               L724:
 951                     ; 403       if(KPD_IsPressed(KPD_KEY_MODE) == KEY_STATE_PRESSED)
 952  045e a610          	ld	a,#16
 953  0460 cd0000        	call	_KPD_IsPressed
 955  0463 4a            	dec	a
 956  0464 260b          	jrne	L534
 957                     ; 338   BuzzerOnTime = buzzTime;
 958  0466 cd0527        	call	LC012
 959                     ; 406         DISP_UpperPutStr("MODE", 0);
 960  0469 4b00          	push	#0
 961  046b ae0241        	ldw	x,#L734
 964  046e cc04f9        	jp	LC011
 965  0471               L534:
 966                     ; 409       if(KPD_IsPressed(KPD_KEY_FUNC) == KEY_STATE_PRESSED)
 967  0471 a611          	ld	a,#17
 968  0473 cd0000        	call	_KPD_IsPressed
 970  0476 4a            	dec	a
 971  0477 260a          	jrne	L344
 972                     ; 338   BuzzerOnTime = buzzTime;
 973  0479 cd0527        	call	LC012
 974                     ; 412         DISP_UpperPutStr("FUNC", 0);
 975  047c 4b00          	push	#0
 976  047e ae023c        	ldw	x,#L544
 979  0481 2076          	jp	LC011
 980  0483               L344:
 981                     ; 415       if(KPD_IsPressed(KPD_KEY_UP) == KEY_STATE_PRESSED)
 982  0483 a612          	ld	a,#18
 983  0485 cd0000        	call	_KPD_IsPressed
 985  0488 4a            	dec	a
 986  0489 260a          	jrne	L154
 987                     ; 338   BuzzerOnTime = buzzTime;
 988  048b cd0527        	call	LC012
 989                     ; 418         DISP_UpperPutStr("UP", 0);
 990  048e 4b00          	push	#0
 991  0490 ae0239        	ldw	x,#L354
 994  0493 2064          	jp	LC011
 995  0495               L154:
 996                     ; 421       if(KPD_IsPressed(KPD_KEY_DOWN) == KEY_STATE_PRESSED)
 997  0495 a613          	ld	a,#19
 998  0497 cd0000        	call	_KPD_IsPressed
1000  049a 4a            	dec	a
1001  049b 260a          	jrne	L754
1002                     ; 338   BuzzerOnTime = buzzTime;
1003  049d cd0527        	call	LC012
1004                     ; 424         DISP_UpperPutStr("DOWN", 0);
1005  04a0 4b00          	push	#0
1006  04a2 ae0234        	ldw	x,#L164
1009  04a5 2052          	jp	LC011
1010  04a7               L754:
1011                     ; 427       if(KPD_IsPressed(KPD_KEY_BACK) == KEY_STATE_PRESSED)
1012  04a7 a614          	ld	a,#20
1013  04a9 cd0000        	call	_KPD_IsPressed
1015  04ac 4a            	dec	a
1016  04ad 2609          	jrne	L564
1017                     ; 338   BuzzerOnTime = buzzTime;
1018  04af ad76          	call	LC012
1019                     ; 430         DISP_UpperPutStr("BACK", 0);
1020  04b1 4b00          	push	#0
1021  04b3 ae022f        	ldw	x,#L764
1024  04b6 2041          	jp	LC011
1025  04b8               L564:
1026                     ; 433       if(KPD_IsPressed(KPD_KEY_NEXT) == KEY_STATE_PRESSED)
1027  04b8 a615          	ld	a,#21
1028  04ba cd0000        	call	_KPD_IsPressed
1030  04bd 4a            	dec	a
1031  04be 2609          	jrne	L374
1032                     ; 338   BuzzerOnTime = buzzTime;
1033  04c0 ad65          	call	LC012
1034                     ; 436         DISP_UpperPutStr("NEXT", 0);
1035  04c2 4b00          	push	#0
1036  04c4 ae022a        	ldw	x,#L574
1039  04c7 2030          	jp	LC011
1040  04c9               L374:
1041                     ; 439       if(KPD_IsPressed(KPD_KEY_ENT) == KEY_STATE_PRESSED)
1042  04c9 a616          	ld	a,#22
1043  04cb cd0000        	call	_KPD_IsPressed
1045  04ce 4a            	dec	a
1046  04cf 2609          	jrne	L105
1047                     ; 338   BuzzerOnTime = buzzTime;
1048  04d1 ad54          	call	LC012
1049                     ; 442         DISP_UpperPutStr("ENTER", 0);
1050  04d3 4b00          	push	#0
1051  04d5 ae0224        	ldw	x,#L305
1054  04d8 201f          	jp	LC011
1055  04da               L105:
1056                     ; 445       if(KPD_IsPressed(KPD_KEY_CLR) == KEY_STATE_PRESSED)
1057  04da a617          	ld	a,#23
1058  04dc cd0000        	call	_KPD_IsPressed
1060  04df 4a            	dec	a
1061  04e0 2609          	jrne	L705
1062                     ; 338   BuzzerOnTime = buzzTime;
1063  04e2 ad43          	call	LC012
1064                     ; 448         DISP_UpperPutStr("CLEAR", 0);
1065  04e4 4b00          	push	#0
1066  04e6 ae021e        	ldw	x,#L115
1069  04e9 200e          	jp	LC011
1070  04eb               L705:
1071                     ; 451       if(SW_IsPressed(SW_RESET) == SW_STATE_PRESSED)
1072  04eb 4f            	clr	a
1073  04ec cd0000        	call	_SW_IsPressed
1075  04ef 4a            	dec	a
1076  04f0 260d          	jrne	L515
1077                     ; 338   BuzzerOnTime = buzzTime;
1078  04f2 ad33          	call	LC012
1079                     ; 454         DISP_UpperPutStr("RESET", 0);
1080  04f4 4b00          	push	#0
1081  04f6 ae0218        	ldw	x,#L715
1083  04f9               LC011:
1084  04f9 cd0000        	call	_DISP_UpperPutStr
1085  04fc 84            	pop	a
1087  04fd 2023          	jra	L372
1088  04ff               L515:
1089                     ; 458         UI_MSG_T msg = {0, UIMSG_INIT};
1090  04ff c60052        	ld	a,L562_msg
1091  0502 6b01          	ld	(OFST-1,sp),a
1092  0504 c60053        	ld	a,L562_msg+1
1093  0507 6b02          	ld	(OFST+0,sp),a
1094                     ; 460         UI_SetRefreshMsg(0);
1095  0509 5f            	clrw	x
1096  050a 89            	pushw	x
1097  050b 89            	pushw	x
1098  050c cd0000        	call	_UI_SetRefreshMsg
1100  050f 5b04          	addw	sp,#4
1101                     ; 461         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WELCOME_MSG];
1102  0511 ae0532        	ldw	x,#L5_ProcHomeWelcomeMsg
1103  0514 cf0000        	ldw	L74_pfProcHome,x
1104                     ; 463         return(SwitchHomeSubProcess(param, &msg));
1105  0517 96            	ldw	x,sp
1106  0518 5c            	incw	x
1107  0519 89            	pushw	x
1108  051a 1e05          	ldw	x,(OFST+3,sp)
1109  051c cd0000        	call	L15_SwitchHomeSubProcess
1111  051f 85            	popw	x
1113  0520 2002          	jra	L433
1114                     ; 468     default:
1114                     ; 469       break;
1115  0522               L372:
1116                     ; 472   return UI_RC_CONTINUE;
1117  0522 a601          	ld	a,#1
1119  0524               L433:
1120  0524 5b04          	addw	sp,#4
1121  0526 81            	ret	
1122  0527               LC012:
1123  0527 ae00c8        	ldw	x,#200
1124  052a cf0002        	ldw	_BuzzerOnTime+2,x
1125  052d 5f            	clrw	x
1126  052e cf0000        	ldw	_BuzzerOnTime,x
1127  0531 81            	ret	
1129                     	switch	.data
1130  0007               L135_pStrWelcomeMsg:
1131  0007 0210          	dc.w	L335
1132                     	switch	.const
1133  0054               L145_msg:
1134  0054 00            	dc.b	0
1135  0055 00            	dc.b	0
1136  0056               L545_msg:
1137  0056 00            	dc.b	0
1138  0057 00            	dc.b	0
1139                     	switch	.bss
1140  0000               L525_msgStartDispNo:
1141  0000 00            	ds.b	1
1142  0001               L325_msgStartCharNo:
1143  0001 00            	ds.b	1
1144  0002               L725_msgNbDispChar:
1145  0002 00            	ds.b	1
1150                     	switch	.const
1151  0058               L404:
1152  0058 00000001      	dc.l	1
1154                     ; 485 static uint8_t ProcHomeWelcomeMsg(void *param, UI_MSG_T *pMsg)
1154                     ; 486 {
1155                     	switch	.text
1156  0532               L5_ProcHomeWelcomeMsg:
1157  0532 89            	pushw	x
1158  0533 5209          	subw	sp,#9
1159       00000009      OFST:	set	9
1161                     ; 491   uint32_t powerOnDone = FALSE;
1162  0535 5f            	clrw	x
1163  0536 1f08          	ldw	(OFST-1,sp),x
1164  0538 1f06          	ldw	(OFST-3,sp),x
1165                     ; 492   REG_GetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);
1166  053a 4b01          	push	#1
1167  053c 96            	ldw	x,sp
1168  053d 1c0007        	addw	x,#OFST-2
1169  0540 cd0000        	call	_REG_GetValue
1171  0543 84            	pop	a
1172                     ; 494   switch(pMsg->message)
1173  0544 1e0e          	ldw	x,(OFST+5,sp)
1174  0546 e601          	ld	a,(1,x)
1176                     ; 584       break;
1177  0548 2726          	jreq	L535
1178  054a 4a            	dec	a
1179  054b 275b          	jreq	L735
1180  054d 4a            	dec	a
1181  054e 2603cc0643    	jreq	L345
1182                     ; 577     default:
1182                     ; 578       if(powerOnDone == TRUE)
1183  0553 96            	ldw	x,sp
1184  0554 1c0006        	addw	x,#OFST-3
1185  0557 cd0000        	call	c_ltor
1187  055a ae0058        	ldw	x,#L404
1188  055d cd0000        	call	c_lcmp
1190  0560 2703cc066f    	jrne	L355
1191                     ; 580         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
1192  0565 ae0736        	ldw	x,#L31_ProcHomeIdle
1193  0568 cf0000        	ldw	L74_pfProcHome,x
1194                     ; 582         return(SwitchHomeSubProcess(param, pMsg));
1195  056b 1e0e          	ldw	x,(OFST+5,sp)
1198  056d cc062f        	jp	LC013
1199  0570               L535:
1200                     ; 498       uint8_t msgLen = (uint8_t)strlen(pStrWelcomeMsg);
1201  0570 ce0007        	ldw	x,L135_pStrWelcomeMsg
1202  0573 cd0000        	call	_strlen
1204  0576 9f            	ld	a,xl
1205  0577 6b05          	ld	(OFST-4,sp),a
1206                     ; 501       msgStartCharNo = 0;
1207  0579 725f0001      	clr	L325_msgStartCharNo
1208                     ; 502       msgStartDispNo = (uint8_t)(DISP_UPPER_MAX_NB - 1);
1209  057d ce0000        	ldw	x,_pDisp
1210  0580 e601          	ld	a,(1,x)
1211  0582 4a            	dec	a
1212  0583 c70000        	ld	L525_msgStartDispNo,a
1213                     ; 503       msgNbDispChar = DISP_UPPER_MAX_NB - msgStartDispNo;
1214  0586 e601          	ld	a,(1,x)
1215  0588 c00000        	sub	a,L525_msgStartDispNo
1216  058b c70002        	ld	L725_msgNbDispChar,a
1217                     ; 505       DISP_ClearAll();
1218  058e cd0000        	call	_DISP_ClearAll
1220                     ; 507       if(msgLen > 0)
1221  0591 7b05          	ld	a,(OFST-4,sp)
1222  0593 270e          	jreq	L555
1223                     ; 509         DISP_UpperPutStr((char *)&pStrWelcomeMsg[msgStartCharNo], msgStartDispNo);
1224  0595 3b0000        	push	L525_msgStartDispNo
1225  0598 cd0673        	call	LC015
1226  059b 2401          	jrnc	L053
1227  059d 5c            	incw	x
1228  059e               L053:
1229  059e 02            	rlwa	x,a
1230  059f cd0000        	call	_DISP_UpperPutStr
1232  05a2 84            	pop	a
1233  05a3               L555:
1234                     ; 512       UI_SetRefreshMsg(WELCOME_MSG_INTERVAL);
1235  05a3 ae00fa        	ldw	x,#250
1237                     ; 514     break;
1238  05a6 2060          	jp	LC014
1239  05a8               L735:
1240                     ; 518       uint8_t msgLen = (uint8_t)strlen(pStrWelcomeMsg);
1241  05a8 ce0007        	ldw	x,L135_pStrWelcomeMsg
1242  05ab cd0000        	call	_strlen
1244  05ae 9f            	ld	a,xl
1245  05af 6b05          	ld	(OFST-4,sp),a
1246                     ; 520       if(msgStartCharNo < msgLen)
1247  05b1 c60001        	ld	a,L325_msgStartCharNo
1248  05b4 1105          	cp	a,(OFST-4,sp)
1249  05b6 245a          	jruge	L755
1250                     ; 522         if(msgStartDispNo > 0)
1251  05b8 c60000        	ld	a,L525_msgStartDispNo
1252  05bb 270e          	jreq	L165
1253                     ; 524           msgStartDispNo--;
1254  05bd 725a0000      	dec	L525_msgStartDispNo
1255                     ; 525           msgNbDispChar = (uint8_t)(DISP_UPPER_MAX_NB - msgStartDispNo);
1256  05c1 ce0000        	ldw	x,_pDisp
1257  05c4 e601          	ld	a,(1,x)
1258  05c6 c00000        	sub	a,L525_msgStartDispNo
1260  05c9 2027          	jra	L263
1261  05cb               L165:
1262                     ; 529           msgStartCharNo++;
1263  05cb 725c0001      	inc	L325_msgStartCharNo
1264                     ; 530           msgNbDispChar = (uint8_t)((msgLen - msgStartCharNo) < DISP_UPPER_MAX_NB ?
1264                     ; 531                                     (msgLen - msgStartCharNo) : DISP_UPPER_MAX_NB);
1265  05cf ce0000        	ldw	x,_pDisp
1266  05d2 e601          	ld	a,(1,x)
1267  05d4 5f            	clrw	x
1268  05d5 97            	ld	xl,a
1269  05d6 1f01          	ldw	(OFST-8,sp),x
1270  05d8 5f            	clrw	x
1271  05d9 7b05          	ld	a,(OFST-4,sp)
1272  05db c00001        	sub	a,L325_msgStartCharNo
1273  05de 2401          	jrnc	L063
1274  05e0 5a            	decw	x
1275  05e1               L063:
1276  05e1 02            	rlwa	x,a
1277  05e2 1301          	cpw	x,(OFST-8,sp)
1278  05e4 2e07          	jrsge	L653
1279  05e6 7b05          	ld	a,(OFST-4,sp)
1280  05e8 c00001        	sub	a,L325_msgStartCharNo
1281  05eb 2005          	jra	L263
1282  05ed               L653:
1283  05ed ce0000        	ldw	x,_pDisp
1284  05f0 e601          	ld	a,(1,x)
1285  05f2               L263:
1286  05f2 c70002        	ld	L725_msgNbDispChar,a
1287                     ; 534         DISP_ClearAll();
1288  05f5 cd0000        	call	_DISP_ClearAll
1290                     ; 535         DISP_UpperPutStr((char *)&pStrWelcomeMsg[msgStartCharNo], msgStartDispNo);
1291  05f8 3b0000        	push	L525_msgStartDispNo
1292  05fb ad76          	call	LC015
1293  05fd 2401          	jrnc	L073
1294  05ff 5c            	incw	x
1295  0600               L073:
1296  0600 02            	rlwa	x,a
1297  0601 cd0000        	call	_DISP_UpperPutStr
1299  0604 ae00fa        	ldw	x,#250
1300  0607 84            	pop	a
1301                     ; 536         UI_SetRefreshMsg(WELCOME_MSG_INTERVAL);
1303  0608               LC014:
1304  0608 89            	pushw	x
1305  0609 5f            	clrw	x
1306  060a 89            	pushw	x
1307  060b cd0000        	call	_UI_SetRefreshMsg
1308  060e 5b04          	addw	sp,#4
1310  0610 205d          	jra	L355
1311  0612               L755:
1312                     ; 540         if(powerOnDone == FALSE)
1313  0612 96            	ldw	x,sp
1314  0613 1c0006        	addw	x,#OFST-3
1315  0616 cd0000        	call	c_lzmp
1317  0619 261e          	jrne	L765
1318                     ; 542           UI_MSG_T msg = {0, UIMSG_INIT};
1319  061b c60054        	ld	a,L145_msg
1320  061e 6b03          	ld	(OFST-6,sp),a
1321  0620 c60055        	ld	a,L145_msg+1
1322  0623 6b04          	ld	(OFST-5,sp),a
1323                     ; 543           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_START];
1324  0625 ae067e        	ldw	x,#L7_ProcHomeTestStart
1325  0628 cf0000        	ldw	L74_pfProcHome,x
1326                     ; 545           return(SwitchHomeSubProcess(param, &msg));
1327  062b 96            	ldw	x,sp
1328  062c 1c0003        	addw	x,#OFST-6
1330  062f               LC013:
1331  062f 89            	pushw	x
1332  0630 1e0c          	ldw	x,(OFST+3,sp)
1333  0632 cd0000        	call	L15_SwitchHomeSubProcess
1334  0635 85            	popw	x
1336  0636               L014:
1337  0636 5b0b          	addw	sp,#11
1338  0638 81            	ret	
1339  0639               L765:
1340                     ; 549           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
1341  0639 ae0736        	ldw	x,#L31_ProcHomeIdle
1342  063c cf0000        	ldw	L74_pfProcHome,x
1343                     ; 551           return(SwitchHomeSubProcess(param, pMsg));
1344  063f 1e0e          	ldw	x,(OFST+5,sp)
1347  0641 20ec          	jp	LC013
1348  0643               L345:
1349                     ; 557     case UIMSG_SW_RESET:
1349                     ; 558       if((uint8_t)pMsg->param == UI_SW_PRESS)
1350  0643 f6            	ld	a,(x)
1351  0644 2629          	jrne	L355
1352                     ; 560         if(powerOnDone == FALSE)
1353  0646 96            	ldw	x,sp
1354  0647 1c0006        	addw	x,#OFST-3
1355  064a cd0000        	call	c_lzmp
1357  064d 2616          	jrne	L575
1358                     ; 562           UI_MSG_T msg = {0, UIMSG_INIT};
1359  064f c60056        	ld	a,L545_msg
1360  0652 6b04          	ld	(OFST-5,sp),a
1361  0654 c60057        	ld	a,L545_msg+1
1362  0657 6b05          	ld	(OFST-4,sp),a
1363                     ; 564           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_START];
1364  0659 ae067e        	ldw	x,#L7_ProcHomeTestStart
1365  065c cf0000        	ldw	L74_pfProcHome,x
1366                     ; 566           return(SwitchHomeSubProcess(param, &msg));
1367  065f 96            	ldw	x,sp
1368  0660 1c0004        	addw	x,#OFST-5
1371  0663 20ca          	jp	LC013
1372  0665               L575:
1373                     ; 570           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
1374  0665 ae0736        	ldw	x,#L31_ProcHomeIdle
1375  0668 cf0000        	ldw	L74_pfProcHome,x
1376                     ; 572           return(SwitchHomeSubProcess(param, pMsg));
1377  066b 1e0e          	ldw	x,(OFST+5,sp)
1380  066d 20c0          	jp	LC013
1381  066f               L355:
1382                     ; 587   return UI_RC_CONTINUE;
1383  066f a601          	ld	a,#1
1385  0671 20c3          	jra	L014
1386  0673               LC015:
1387  0673 c60007        	ld	a,L135_pStrWelcomeMsg
1388  0676 97            	ld	xl,a
1389  0677 c60008        	ld	a,L135_pStrWelcomeMsg+1
1390  067a cb0001        	add	a,L325_msgStartCharNo
1391  067d 81            	ret	
1393                     	switch	.const
1394  005c               L706_msg:
1395  005c 00            	dc.b	0
1396  005d 00            	dc.b	0
1397  005e               L316_msg:
1398  005e 00            	dc.b	0
1399  005f 00            	dc.b	0
1402                     ; 598 static uint8_t ProcHomeTestStart(void *param, UI_MSG_T *pMsg)
1402                     ; 599 {
1403                     	switch	.text
1404  067e               L7_ProcHomeTestStart:
1405  067e 89            	pushw	x
1406  067f 89            	pushw	x
1407       00000002      OFST:	set	2
1409                     ; 602   switch(pMsg->message)
1410  0680 1e07          	ldw	x,(OFST+5,sp)
1411  0682 e601          	ld	a,(1,x)
1413                     ; 644     default:
1413                     ; 645       break;
1414  0684 2709          	jreq	L306
1415  0686 4a            	dec	a
1416  0687 271a          	jreq	L506
1417  0689 a002          	sub	a,#2
1418  068b 2725          	jreq	L116
1419  068d 2046          	jra	L126
1420  068f               L306:
1421                     ; 607       DISP_ClearAll();
1422  068f cd0000        	call	_DISP_ClearAll
1424                     ; 609       BSP_H_MotorEnable(TRUE);
1425  0692 721d5005      	bres	20485,#6
1426                     ; 611       UI_SetRefreshMsg(CAM_SW_TIMEOUT);
1427  0696 ae0bb8        	ldw	x,#3000
1428  0699 89            	pushw	x
1429  069a 5f            	clrw	x
1430  069b 89            	pushw	x
1431  069c cd0000        	call	_UI_SetRefreshMsg
1433  069f 5b04          	addw	sp,#4
1434                     ; 613     break;
1435  06a1 2032          	jra	L126
1436  06a3               L506:
1437                     ; 617       UI_MSG_T msg = {0, UIMSG_INIT};
1438  06a3 c6005c        	ld	a,L706_msg
1439  06a6 6b01          	ld	(OFST-1,sp),a
1440  06a8 c6005d        	ld	a,L706_msg+1
1441  06ab 6b02          	ld	(OFST+0,sp),a
1442                     ; 619       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];
1443  06ad ae130e        	ldw	x,#L53_ProcHomeError01
1444                     ; 621       BSP_H_MotorEnable(FALSE);
1445                     ; 623       return(SwitchHomeSubProcess(param, &msg));
1448  06b0 2010          	jp	LC016
1449  06b2               L116:
1450                     ; 629       if((uint8_t)pMsg->param == UI_SW_PRESS)
1451  06b2 f6            	ld	a,(x)
1452  06b3 2620          	jrne	L126
1453                     ; 631         UI_MSG_T msg = {0, UIMSG_INIT};
1454  06b5 c6005e        	ld	a,L316_msg
1455  06b8 6b01          	ld	(OFST-1,sp),a
1456  06ba c6005f        	ld	a,L316_msg+1
1457  06bd 6b02          	ld	(OFST+0,sp),a
1458                     ; 633         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_END];
1459  06bf ae06d9        	ldw	x,#L11_ProcHomeTestEnd
1460                     ; 637         BSP_H_MotorEnable(FALSE);
1461                     ; 639         return(SwitchHomeSubProcess(param, &msg));
1463  06c2               LC016:
1464  06c2 cf0000        	ldw	L74_pfProcHome,x
1465  06c5 721c5005      	bset	20485,#6
1466  06c9 96            	ldw	x,sp
1467  06ca 5c            	incw	x
1468  06cb 89            	pushw	x
1469  06cc 1e05          	ldw	x,(OFST+3,sp)
1470  06ce cd0000        	call	L15_SwitchHomeSubProcess
1471  06d1 85            	popw	x
1473  06d2               L424:
1474  06d2 5b04          	addw	sp,#4
1475  06d4 81            	ret	
1476                     ; 644     default:
1476                     ; 645       break;
1477  06d5               L126:
1478                     ; 648   return UI_RC_CONTINUE;
1479  06d5 a601          	ld	a,#1
1481  06d7 20f9          	jra	L424
1483                     	switch	.const
1484  0060               L136_msg:
1485  0060 00            	dc.b	0
1486  0061 00            	dc.b	0
1488                     ; 661 static uint8_t ProcHomeTestEnd(void *param, UI_MSG_T *pMsg)
1488                     ; 662 {
1489                     	switch	.text
1490  06d9               L11_ProcHomeTestEnd:
1491  06d9 89            	pushw	x
1492  06da 5206          	subw	sp,#6
1493       00000006      OFST:	set	6
1495                     ; 665   switch(pMsg->message)
1496  06dc 1e0b          	ldw	x,(OFST+5,sp)
1497  06de e601          	ld	a,(1,x)
1499                     ; 692     default:
1499                     ; 693       break;
1500  06e0 2705          	jreq	L526
1501  06e2 4a            	dec	a
1502  06e3 2717          	jreq	L726
1503  06e5 204a          	jra	L736
1504  06e7               L526:
1505                     ; 669       BSP_S_MotorEnable(TRUE);
1506  06e7 721f5005      	bres	20485,#7
1507                     ; 670       BSP_V_PumpEnable(TRUE);
1508  06eb 72115019      	bres	20505,#0
1509                     ; 672       UI_SetRefreshMsg(MOTOR_FREE_RUN);
1510  06ef ae05dc        	ldw	x,#1500
1511  06f2 89            	pushw	x
1512  06f3 5f            	clrw	x
1513  06f4 89            	pushw	x
1514  06f5 cd0000        	call	_UI_SetRefreshMsg
1516  06f8 5b04          	addw	sp,#4
1517                     ; 674     break;
1518  06fa 2035          	jra	L736
1519  06fc               L726:
1520                     ; 678       UI_MSG_T msg = {0, UIMSG_INIT};
1521  06fc c60060        	ld	a,L136_msg
1522  06ff 6b01          	ld	(OFST-5,sp),a
1523  0701 c60061        	ld	a,L136_msg+1
1524  0704 6b02          	ld	(OFST-4,sp),a
1525                     ; 680       uint32_t powerOnDone = TRUE;
1526  0706 ae0001        	ldw	x,#1
1527  0709 1f05          	ldw	(OFST-1,sp),x
1528  070b 5f            	clrw	x
1529  070c 1f03          	ldw	(OFST-3,sp),x
1530                     ; 681       REG_SetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);
1531  070e 4b01          	push	#1
1532  0710 96            	ldw	x,sp
1533  0711 1c0004        	addw	x,#OFST-2
1534  0714 cd0000        	call	_REG_SetValue
1536  0717 ae0736        	ldw	x,#L31_ProcHomeIdle
1537  071a cf0000        	ldw	L74_pfProcHome,x
1538  071d 721e5005      	bset	20485,#7
1539  0721 72105019      	bset	20505,#0
1540  0725 84            	pop	a
1541                     ; 683       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
1542                     ; 685       BSP_S_MotorEnable(FALSE);
1543                     ; 686       BSP_V_PumpEnable(FALSE);
1544                     ; 688       return(SwitchHomeSubProcess(param, &msg));
1545  0726 96            	ldw	x,sp
1546  0727 5c            	incw	x
1547  0728 89            	pushw	x
1548  0729 1e09          	ldw	x,(OFST+3,sp)
1549  072b cd0000        	call	L15_SwitchHomeSubProcess
1551  072e 85            	popw	x
1553  072f 2002          	jra	L634
1554                     ; 692     default:
1554                     ; 693       break;
1555  0731               L736:
1556                     ; 696   return UI_RC_CONTINUE;
1557  0731 a601          	ld	a,#1
1559  0733               L634:
1560  0733 5b08          	addw	sp,#8
1561  0735 81            	ret	
1563                     	switch	.data
1564  0009               L146_standbyTimeCount:
1565  0009 0000          	dc.w	0
1566                     	switch	.const
1567  0062               L746_msg:
1568  0062 00            	dc.b	0
1569  0063 00            	dc.b	0
1570  0064               L766_msg:
1571  0064 00            	dc.b	0
1572  0065 00            	dc.b	0
1573  0066               L107_msg:
1574  0066 00            	dc.b	0
1575  0067 00            	dc.b	0
1576  0068               L367_msg:
1577  0068 00            	dc.b	0
1578  0069 00            	dc.b	0
1579  006a               L577_msg:
1580  006a 00            	dc.b	0
1581  006b 00            	dc.b	0
1582  006c               L244:
1583  006c 000000b5      	dc.l	181
1591  0070               L606:
1592  0070 0750          	dc.w	L346
1593  0072 0754          	dc.w	L546
1594  0074 0a3e          	dc.w	L5101
1595  0076 0a5f          	dc.w	L7201
1596  0078 095b          	dc.w	L167
1597  007a 0a5f          	dc.w	L7201
1598  007c 0a5f          	dc.w	L7201
1599  007e 0a5f          	dc.w	L7201
1600  0080 09ac          	dc.w	L3001
1601  0082 09ac          	dc.w	L3001
1602  0084 09ac          	dc.w	L3001
1603  0086 09ac          	dc.w	L3001
1604  0088 09ac          	dc.w	L3001
1605  008a 09ac          	dc.w	L3001
1606  008c 09ac          	dc.w	L3001
1607  008e 09ac          	dc.w	L3001
1608  0090 09ac          	dc.w	L3001
1609  0092 09ac          	dc.w	L3001
1610  0094 07b7          	dc.w	L566
1611  0096 0809          	dc.w	L776
1612  0098 093c          	dc.w	L747
1613  009a 0912          	dc.w	L147
1614  009c 078a          	dc.w	L156
1615  009e 07a2          	dc.w	L756
1616  00a0 08a0          	dc.w	L327
1617  00a2 087c          	dc.w	L717
1618  00a4 0a2f          	dc.w	L1101
1619  00a6 0a2f          	dc.w	L1101
1620  00a8 0a5f          	dc.w	L7201
1621  00aa 0a5f          	dc.w	L7201
1622  00ac 097e          	dc.w	L377
1623                     ; 707 static uint8_t ProcHomeIdle(void *param, UI_MSG_T *pMsg)
1623                     ; 708 {
1624                     	switch	.text
1625  0736               L31_ProcHomeIdle:
1626  0736 89            	pushw	x
1627  0737 5207          	subw	sp,#7
1628       00000007      OFST:	set	7
1630                     ; 170   return CounterMode;
1631  0739 c60000        	ld	a,_CounterMode
1632  073c 6b07          	ld	(OFST+0,sp),a
1635                     ; 716   switch(pMsg->message)
1636  073e 1e0c          	ldw	x,(OFST+5,sp)
1637  0740 e601          	ld	a,(1,x)
1639                     ; 1101     default:
1639                     ; 1102       break;
1640  0742 a11f          	cp	a,#31
1641  0744 2503cc0a5f    	jruge	L7201
1642  0749 5f            	clrw	x
1643  074a 97            	ld	xl,a
1644  074b 58            	sllw	x
1645  074c de0070        	ldw	x,(L606,x)
1646  074f fc            	jp	(x)
1647  0750               L346:
1648                     ; 718     case UIMSG_INIT:
1648                     ; 719       standbyTimeCount = 0;
1649  0750 5f            	clrw	x
1650  0751 cf0009        	ldw	L146_standbyTimeCount,x
1651  0754               L546:
1652                     ; 720     case UIMSG_REFRESH:
1652                     ; 721       standbyTimeCount++;
1653  0754 ce0009        	ldw	x,L146_standbyTimeCount
1654  0757 5c            	incw	x
1655  0758 cf0009        	ldw	L146_standbyTimeCount,x
1656                     ; 722       if(standbyTimeCount > STANDBY_UPDATE_MS / DISPLAY_UPDATE_MS)
1657  075b cd0000        	call	c_uitolx
1659  075e ae006c        	ldw	x,#L244
1660  0761 cd0000        	call	c_lcmp
1662  0764 2f16          	jrslt	L1301
1663                     ; 724         UI_MSG_T msg = {0, UIMSG_INIT};
1664  0766 c60062        	ld	a,L746_msg
1665  0769 6b05          	ld	(OFST-2,sp),a
1666  076b c60063        	ld	a,L746_msg+1
1667  076e 6b06          	ld	(OFST-1,sp),a
1668                     ; 726         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WELCOME_MSG];
1669  0770 ae0532        	ldw	x,#L5_ProcHomeWelcomeMsg
1670  0773 cf0000        	ldw	L74_pfProcHome,x
1671                     ; 728         return(SwitchHomeSubProcess(param, &msg));
1672  0776 96            	ldw	x,sp
1673  0777 1c0005        	addw	x,#OFST-2
1676  077a 2073          	jp	LC017
1677  077c               L1301:
1678                     ; 733         UI_SetRefreshMsg(DISPLAY_UPDATE_MS);
1679  077c ae03e8        	ldw	x,#1000
1680  077f 89            	pushw	x
1681  0780 5f            	clrw	x
1682  0781 89            	pushw	x
1683  0782 cd0000        	call	_UI_SetRefreshMsg
1685  0785 5b04          	addw	sp,#4
1686  0787 cc0a5f        	jra	L7201
1687  078a               L156:
1688                     ; 739       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1689  078a 1e0c          	ldw	x,(OFST+5,sp)
1690  078c f6            	ld	a,(x)
1691  078d 2703cc0a5b    	jrne	L7021
1692                     ; 90   return FlagAutoCount;
1693  0792 c60000        	ld	a,_FlagAutoCount
1696                     ; 743         flagAutoCount = (uint8_t)((flagAutoCount == TRUE) ? (FALSE) : (TRUE));
1697  0795 4a            	dec	a
1698  0796 2702          	jreq	L254
1699  0798 a601          	ld	a,#1
1700  079a               L254:
1701  079a 6b06          	ld	(OFST-1,sp),a
1702                     ; 80   FlagAutoCount = flag;
1703  079c c70000        	ld	_FlagAutoCount,a
1704                     ; 746       standbyTimeCount = 0;
1705                     ; 748     break;
1706  079f cc0a5b        	jp	L7021
1707  07a2               L756:
1708                     ; 752       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1709  07a2 1e0c          	ldw	x,(OFST+5,sp)
1710  07a4 f6            	ld	a,(x)
1711  07a5 26f8          	jrne	L7021
1712                     ; 90   return FlagAutoCount;
1713  07a7 c60000        	ld	a,_FlagAutoCount
1716                     ; 756         flagAutoCount = (uint8_t)((flagAutoCount == TRUE) ? (FALSE) : (TRUE));
1717  07aa 4a            	dec	a
1718  07ab 2702          	jreq	L654
1719  07ad a601          	ld	a,#1
1720  07af               L654:
1721  07af 6b06          	ld	(OFST-1,sp),a
1722                     ; 80   FlagAutoCount = flag;
1723  07b1 c70000        	ld	_FlagAutoCount,a
1724                     ; 759       standbyTimeCount = 0;
1725                     ; 761     break;
1726  07b4 cc0a5b        	jp	L7021
1727  07b7               L566:
1728                     ; 765       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1729  07b7 1e0c          	ldw	x,(OFST+5,sp)
1730  07b9 f6            	ld	a,(x)
1731  07ba 26f8          	jrne	L7021
1732                     ; 767         if(cntMode != COUNT_MODE_V)
1733  07bc 7b07          	ld	a,(OFST+0,sp)
1734  07be a104          	cp	a,#4
1735  07c0 27f2          	jreq	L7021
1736                     ; 769           if(SW_IsPressed(SW_RESET) == SW_PRESSED)
1737  07c2 4f            	clr	a
1738  07c3 cd0000        	call	_SW_IsPressed
1740  07c6 4a            	dec	a
1741  07c7 2630          	jrne	L5401
1742                     ; 771             UI_MSG_T msg = {0, UIMSG_INIT};
1743  07c9 c60064        	ld	a,L766_msg
1744  07cc 6b01          	ld	(OFST-6,sp),a
1745  07ce c60065        	ld	a,L766_msg+1
1746                     ; 773             uint32_t accSensorCount = 0;
1747                     ; 774             REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
1749                     ; 776             pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];
1750                     ; 778             return(SwitchHomeSubProcess(param, &msg));
1751  07d1               LC018:
1752  07d1 6b02          	ld	(OFST-5,sp),a
1753  07d3 5f            	clrw	x
1754  07d4 1f05          	ldw	(OFST-2,sp),x
1755  07d6 1f03          	ldw	(OFST-4,sp),x
1756  07d8 7b07          	ld	a,(OFST+0,sp)
1757  07da 97            	ld	xl,a
1758  07db d6001e        	ld	a,(L34_REG_ID_ACC_CTR_LIST,x)
1759  07de 88            	push	a
1760  07df 96            	ldw	x,sp
1761  07e0 1c0004        	addw	x,#OFST-3
1762  07e3 cd0000        	call	_REG_SetValue
1763  07e6 ae1264        	ldw	x,#L13_ProcHomeWriteMemory
1764  07e9 cf0000        	ldw	L74_pfProcHome,x
1765  07ec 84            	pop	a
1766  07ed 96            	ldw	x,sp
1767  07ee 5c            	incw	x
1769  07ef               LC017:
1770  07ef 89            	pushw	x
1771  07f0 1e0a          	ldw	x,(OFST+3,sp)
1772  07f2 cd0000        	call	L15_SwitchHomeSubProcess
1773  07f5 85            	popw	x
1775  07f6               L216:
1776  07f6 5b09          	addw	sp,#9
1777  07f8 81            	ret	
1778  07f9               L5401:
1779                     ; 110   return FlagAddCount;
1780  07f9 c60000        	ld	a,_FlagAddCount
1783                     ; 783             flagAddCount = (uint8_t)((flagAddCount == TRUE) ? (FALSE) : (TRUE));
1784  07fc 4a            	dec	a
1785  07fd 2702          	jreq	L074
1786  07ff a601          	ld	a,#1
1787  0801               L074:
1788  0801 6b06          	ld	(OFST-1,sp),a
1789                     ; 100   FlagAddCount = flag;
1790  0803 c70000        	ld	_FlagAddCount,a
1791                     ; 180   SensorCounter = sc;
1792                     ; 789       standbyTimeCount = 0;
1793                     ; 791     break;
1794  0806 cc090c        	jp	LC028
1795  0809               L776:
1796                     ; 795       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1797  0809 1e0c          	ldw	x,(OFST+5,sp)
1798  080b f6            	ld	a,(x)
1799  080c 26a6          	jrne	L7021
1800                     ; 797         if(SW_IsPressed(SW_RESET) == SW_PRESSED)
1801  080e cd0000        	call	_SW_IsPressed
1803  0811 4a            	dec	a
1804  0812 260a          	jrne	L3501
1805                     ; 799           UI_MSG_T msg = {0, UIMSG_INIT};
1806  0814 c60066        	ld	a,L107_msg
1807  0817 6b01          	ld	(OFST-6,sp),a
1808  0819 c60067        	ld	a,L107_msg+1
1809                     ; 801           uint32_t accSensorCount = 0;
1810                     ; 802           REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
1812                     ; 804           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];
1813                     ; 806           return(SwitchHomeSubProcess(param, &msg));
1816  081c 20b3          	jp	LC018
1817  081e               L3501:
1818                     ; 810           uint32_t flagUVEnable = 0;
1819  081e 5f            	clrw	x
1820  081f 1f05          	ldw	(OFST-2,sp),x
1821  0821 1f03          	ldw	(OFST-4,sp),x
1822                     ; 811           REG_GetValue(&flagUVEnable, REG_ID_UV_EN_FLAG);
1823  0823 4b03          	push	#3
1824  0825 96            	ldw	x,sp
1825  0826 1c0004        	addw	x,#OFST-3
1826  0829 cd0000        	call	_REG_GetValue
1828  082c 84            	pop	a
1829                     ; 813           if(flagUVEnable == TRUE)
1830  082d 96            	ldw	x,sp
1831  082e cd0a6f        	call	LC032
1833  0831 2639          	jrne	L7501
1834                     ; 130   return FlagUvDetect;
1835  0833 c60000        	ld	a,_FlagUvDetect
1836  0836 6b02          	ld	(OFST-5,sp),a
1839                     ; 110   return FlagAddCount;
1840  0838 c60000        	ld	a,_FlagAddCount
1841  083b 6b07          	ld	(OFST+0,sp),a
1844                     ; 818             if((flagUVDetect == FALSE) && (flagAddCount == FALSE))
1845  083d 0d02          	tnz	(OFST-5,sp)
1846  083f 2604          	jrne	L1601
1848  0841 7b07          	ld	a,(OFST+0,sp)
1849                     ; 820               flagAddCount = TRUE;
1851  0843 2715          	jreq	LC023
1852  0845               L1601:
1853                     ; 822             else if((flagUVDetect == FALSE) && (flagAddCount == TRUE))
1854  0845 0d02          	tnz	(OFST-5,sp)
1855  0847 2608          	jrne	L5601
1857  0849 4a            	dec	a
1858  084a 2605          	jrne	L5601
1859                     ; 824               flagUVDetect = TRUE;
1860  084c 4c            	inc	a
1861  084d 6b02          	ld	(OFST-5,sp),a
1862                     ; 825               flagAddCount = FALSE;
1864  084f 2010          	jp	LC022
1865  0851               L5601:
1866                     ; 827             else if((flagUVDetect == TRUE) && (flagAddCount == FALSE))
1867  0851 7b02          	ld	a,(OFST-5,sp)
1868  0853 4a            	dec	a
1869  0854 2609          	jrne	L1701
1871  0856 0d07          	tnz	(OFST+0,sp)
1872  0858 2605          	jrne	L1701
1873                     ; 829               flagAddCount = TRUE;
1874  085a               LC023:
1875  085a 4c            	inc	a
1876  085b 6b07          	ld	(OFST+0,sp),a
1878  085d 2004          	jra	L3601
1879  085f               L1701:
1880                     ; 834               flagUVDetect = FALSE;
1881  085f 0f02          	clr	(OFST-5,sp)
1882                     ; 835               flagAddCount = FALSE;
1883  0861               LC022:
1884  0861 0f07          	clr	(OFST+0,sp)
1885  0863               L3601:
1886                     ; 120   FlagUvDetect = flag;
1887  0863 7b02          	ld	a,(OFST-5,sp)
1888  0865 c70000        	ld	_FlagUvDetect,a
1889                     ; 100   FlagAddCount = flag;
1890  0868 7b07          	ld	a,(OFST+0,sp)
1891  086a 200a          	jp	LC024
1892  086c               L7501:
1893                     ; 110   return FlagAddCount;
1894  086c c60000        	ld	a,_FlagAddCount
1897                     ; 845             flagAddCount = (uint8_t)((flagAddCount == TRUE) ? (FALSE) : (TRUE));
1898  086f 4a            	dec	a
1899  0870 2702          	jreq	L405
1900  0872 a601          	ld	a,#1
1901  0874               L405:
1902  0874 6b02          	ld	(OFST-5,sp),a
1903                     ; 100   FlagAddCount = flag;
1904  0876               LC024:
1905  0876 c70000        	ld	_FlagAddCount,a
1906                     ; 850       standbyTimeCount = 0;
1907                     ; 852     break;
1908  0879 cc0a5b        	jp	L7021
1909  087c               L717:
1910                     ; 856       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1911  087c 1e0c          	ldw	x,(OFST+5,sp)
1912  087e f6            	ld	a,(x)
1913  087f 26f8          	jrne	L7021
1914                     ; 858         if(SW_IsPressed(SW_RESET) == SW_PRESSED)
1915  0881 cd0000        	call	_SW_IsPressed
1917  0884 4a            	dec	a
1918  0885 26f2          	jrne	L7021
1919                     ; 860           if(UI_GetMenuNbTotalChild(UI_MENU_MAIN_ID) > 0)
1921                     ; 862             UI_InvokeMenu(UI_MENU_MAIN_ID);
1923                     ; 864             UI_SetRefreshMsg(0);
1925                     ; 180   SensorCounter = sc;
1926                     ; 867             return UI_RC_FINISH;
1927  0887               LC021:
1928  0887 cd0000        	call	_UI_GetMenuNbTotalChild
1929  088a 4d            	tnz	a
1930  088b 27ec          	jreq	L7021
1931  088d 4f            	clr	a
1932  088e cd0000        	call	_UI_InvokeMenu
1933  0891 5f            	clrw	x
1934  0892 89            	pushw	x
1935  0893 89            	pushw	x
1936  0894 cd0000        	call	_UI_SetRefreshMsg
1937  0897 5b04          	addw	sp,#4
1938  0899 cd0a67        	call	LC031
1939  089c 4f            	clr	a
1941  089d cc07f6        	jra	L216
1942                     ; 871       standbyTimeCount = 0;
1943                     ; 873     break;
1944  08a0               L327:
1945                     ; 877       if((uint8_t)pMsg->param == UI_KEY_PRESS)
1946  08a0 1e0c          	ldw	x,(OFST+5,sp)
1947  08a2 f6            	ld	a,(x)
1948  08a3 26d4          	jrne	L7021
1949                     ; 879         if(SW_IsPressed(SW_RESET) == SW_PRESSED)
1950  08a5 cd0000        	call	_SW_IsPressed
1952  08a8 4a            	dec	a
1953                     ; 881           if(UI_GetMenuNbTotalChild(UI_MENU_MAIN_ID) > 0)
1955                     ; 883             UI_InvokeMenu(UI_MENU_MAIN_ID);
1957                     ; 885             UI_SetRefreshMsg(0);
1959                     ; 180   SensorCounter = sc;
1960                     ; 888             return UI_RC_FINISH;
1962  08a9 27dc          	jreq	LC021
1963                     ; 893           uint32_t stampEnable = 0;
1964  08ab 5f            	clrw	x
1965  08ac 1f03          	ldw	(OFST-4,sp),x
1966  08ae 1f01          	ldw	(OFST-6,sp),x
1967                     ; 70   return FlagValueCount;
1968  08b0 c60000        	ld	a,_FlagValueCount
1969  08b3 6b05          	ld	(OFST-2,sp),a
1972                     ; 110   return FlagAddCount;
1973  08b5 c60000        	ld	a,_FlagAddCount
1974  08b8 6b06          	ld	(OFST-1,sp),a
1977                     ; 897           REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
1978  08ba 4b02          	push	#2
1979  08bc 96            	ldw	x,sp
1980  08bd 1c0002        	addw	x,#OFST-5
1981  08c0 cd0000        	call	_REG_GetValue
1983  08c3 84            	pop	a
1984                     ; 899           cntMode++;
1985  08c4 0c07          	inc	(OFST+0,sp)
1986                     ; 900           cntMode = (uint8_t)(((cntMode == COUNT_MODE_S) && (stampEnable == FALSE)) ?
1986                     ; 901                               (cntMode + 1) : (cntMode));
1987  08c6 7b07          	ld	a,(OFST+0,sp)
1988  08c8 a103          	cp	a,#3
1989  08ca 260c          	jrne	L035
1990  08cc 96            	ldw	x,sp
1991  08cd 5c            	incw	x
1992  08ce cd0000        	call	c_lzmp
1994  08d1 2605          	jrne	L035
1995  08d3 7b07          	ld	a,(OFST+0,sp)
1996  08d5 4c            	inc	a
1997  08d6 2002          	jra	L235
1998  08d8               L035:
1999  08d8 7b07          	ld	a,(OFST+0,sp)
2000  08da               L235:
2001                     ; 903           cntMode %= COUNT_MODE_MAX;
2002  08da 5f            	clrw	x
2003  08db 97            	ld	xl,a
2004  08dc a605          	ld	a,#5
2005  08de 62            	div	x,a
2006  08df 5f            	clrw	x
2007  08e0 97            	ld	xl,a
2008  08e1 01            	rrwa	x,a
2009  08e2 6b07          	ld	(OFST+0,sp),a
2010                     ; 905           cntMode = (uint8_t)(((cntMode == COUNT_MODE_V) && (flagValueEnable == FALSE)) ?
2010                     ; 906                               (cntMode + 1) : (cntMode));
2011  08e4 a104          	cp	a,#4
2012  08e6 2605          	jrne	L435
2013  08e8 0d05          	tnz	(OFST-2,sp)
2014  08ea 2601          	jrne	L435
2015  08ec 4c            	inc	a
2016  08ed               L435:
2017                     ; 908           cntMode %= COUNT_MODE_MAX;
2018  08ed 5f            	clrw	x
2019  08ee 97            	ld	xl,a
2020  08ef a605          	ld	a,#5
2021  08f1 62            	div	x,a
2022  08f2 5f            	clrw	x
2023  08f3 97            	ld	xl,a
2024  08f4 01            	rrwa	x,a
2025  08f5 6b07          	ld	(OFST+0,sp),a
2026                     ; 910           flagAddCount = (uint8_t)(((cntMode == COUNT_MODE_V) && (flagValueEnable == TRUE)) ?
2026                     ; 911                                    (FALSE) : (flagAddCount));
2027  08f7 a104          	cp	a,#4
2028  08f9 2605          	jrne	L045
2029  08fb 7b05          	ld	a,(OFST-2,sp)
2030  08fd 4a            	dec	a
2031  08fe 2702          	jreq	L245
2032  0900               L045:
2033  0900 7b06          	ld	a,(OFST-1,sp)
2034  0902               L245:
2035                     ; 100   FlagAddCount = flag;
2036                     ; 160   CounterMode = mode;
2037  0902 6b06          	ld	(OFST-1,sp),a
2038  0904 c70000        	ld	_FlagAddCount,a
2039  0907 7b07          	ld	a,(OFST+0,sp)
2040  0909 c70000        	ld	_CounterMode,a
2041                     ; 180   SensorCounter = sc;
2042  090c               LC028:
2043  090c cd0a67        	call	LC031
2044                     ; 919       standbyTimeCount = 0;
2045                     ; 921     break;
2046  090f cc0a5b        	jp	L7021
2047  0912               L147:
2048                     ; 925       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2049  0912 1e0c          	ldw	x,(OFST+5,sp)
2050  0914 f6            	ld	a,(x)
2051  0915 26f8          	jrne	L7021
2052                     ; 927         uint32_t flagUVEnable = 0;
2053  0917 5f            	clrw	x
2054  0918 1f05          	ldw	(OFST-2,sp),x
2055  091a 1f03          	ldw	(OFST-4,sp),x
2056                     ; 928         REG_GetValue(&flagUVEnable, REG_ID_UV_EN_FLAG);
2057  091c 4b03          	push	#3
2058  091e 96            	ldw	x,sp
2059  091f 1c0004        	addw	x,#OFST-3
2060  0922 cd0000        	call	_REG_GetValue
2062  0925 84            	pop	a
2063                     ; 930         if(flagUVEnable == TRUE)
2064  0926 96            	ldw	x,sp
2065  0927 cd0a6f        	call	LC032
2067  092a 26e3          	jrne	L7021
2068                     ; 130   return FlagUvDetect;
2069  092c c60000        	ld	a,_FlagUvDetect
2072                     ; 933           flagUVDetect = (uint8_t)((flagUVDetect == TRUE) ? (FALSE) : (TRUE));
2073  092f 4a            	dec	a
2074  0930 2702          	jreq	L055
2075  0932 a601          	ld	a,#1
2076  0934               L055:
2077  0934 6b02          	ld	(OFST-5,sp),a
2078                     ; 120   FlagUvDetect = flag;
2079  0936 c70000        	ld	_FlagUvDetect,a
2080                     ; 937       standbyTimeCount = 0;
2081                     ; 939     break;
2082  0939 cc0a5b        	jp	L7021
2083  093c               L747:
2084                     ; 943       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
2085  093c 1e0c          	ldw	x,(OFST+5,sp)
2086  093e f6            	ld	a,(x)
2087  093f 4a            	dec	a
2088  0940 26f7          	jrne	L7021
2089                     ; 110   return FlagAddCount;
2090  0942 c60000        	ld	a,_FlagAddCount
2091  0945 6b06          	ld	(OFST-1,sp),a
2094                     ; 947         if(cntMode == COUNT_MODE_V)
2095  0947 7b07          	ld	a,(OFST+0,sp)
2096  0949 a104          	cp	a,#4
2097  094b 2603          	jrne	L3211
2098                     ; 949           cntMode = COUNT_MODE_C;
2099  094d 4f            	clr	a
2101  094e 2002          	jra	L5211
2102  0950               L3211:
2103                     ; 953           cntMode = COUNT_MODE_V;
2104  0950 a604          	ld	a,#4
2105  0952               L5211:
2106  0952 6b07          	ld	(OFST+0,sp),a
2107                     ; 956         flagAddCount = (uint8_t)((cntMode == COUNT_MODE_V) ? FALSE : flagAddCount);
2108  0954 a104          	cp	a,#4
2109  0956 26a8          	jrne	L045
2110  0958 4f            	clr	a
2111  0959 20a7          	jra	L245
2112                     ; 100   FlagAddCount = flag;
2113                     ; 160   CounterMode = mode;
2114                     ; 180   SensorCounter = sc;
2115                     ; 962       standbyTimeCount = 0;
2116                     ; 964     break;
2117  095b               L167:
2118                     ; 90   return FlagAutoCount;
2119  095b c60000        	ld	a,_FlagAutoCount
2120  095e 6b06          	ld	(OFST-1,sp),a
2123                     ; 970       if(flagAutoCount == TRUE)
2124  0960 4a            	dec	a
2125  0961 26d6          	jrne	L7021
2126                     ; 972         if((uint8_t)pMsg->param == UI_SW_PRESS)
2127  0963 1e0c          	ldw	x,(OFST+5,sp)
2128  0965 f6            	ld	a,(x)
2129  0966 26d1          	jrne	L7021
2130                     ; 975           UI_MSG_T msg = {0, UIMSG_INIT};
2131  0968 c60068        	ld	a,L367_msg
2132  096b 6b04          	ld	(OFST-3,sp),a
2133  096d c60069        	ld	a,L367_msg+1
2134  0970 6b05          	ld	(OFST-2,sp),a
2135                     ; 338   BuzzerOnTime = buzzTime;
2136  0972 ae00c8        	ldw	x,#200
2137  0975 cf0002        	ldw	_BuzzerOnTime+2,x
2138  0978 5f            	clrw	x
2139  0979 cf0000        	ldw	_BuzzerOnTime,x
2140                     ; 979           UI_SetRefreshMsg(0);
2142                     ; 180   SensorCounter = sc;
2143                     ; 981           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_H_MOTOR];
2144                     ; 982           return(SwitchHomeSubProcess(param, &msg));
2147  097c 2017          	jp	LC019
2148                     ; 985       standbyTimeCount = 0;
2149                     ; 987     break;
2150  097e               L377:
2151                     ; 90   return FlagAutoCount;
2152  097e c60000        	ld	a,_FlagAutoCount
2153  0981 6b06          	ld	(OFST-1,sp),a
2156                     ; 993       if(flagAutoCount == FALSE)
2157  0983 26b4          	jrne	L7021
2158                     ; 995         if((uint8_t)pMsg->param == UI_KEY_PRESS)
2159  0985 1e0c          	ldw	x,(OFST+5,sp)
2160  0987 f6            	ld	a,(x)
2161  0988 26af          	jrne	L7021
2162                     ; 998           UI_MSG_T msg = {0, UIMSG_INIT};
2163  098a c6006a        	ld	a,L577_msg
2164  098d 6b04          	ld	(OFST-3,sp),a
2165  098f c6006b        	ld	a,L577_msg+1
2166  0992 6b05          	ld	(OFST-2,sp),a
2167                     ; 1000           UI_SetRefreshMsg(0);
2168  0994 5f            	clrw	x
2170                     ; 180   SensorCounter = sc;
2171                     ; 1002           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_H_MOTOR];
2172                     ; 1003           return(SwitchHomeSubProcess(param, &msg));
2173  0995               LC019:
2174  0995 89            	pushw	x
2175  0996 89            	pushw	x
2176  0997 cd0000        	call	_UI_SetRefreshMsg
2177  099a 5b04          	addw	sp,#4
2178  099c cd0a67        	call	LC031
2179  099f ae0c87        	ldw	x,#L71_ProcHomeStartHMotor
2180  09a2 cf0000        	ldw	L74_pfProcHome,x
2181  09a5 96            	ldw	x,sp
2182  09a6 1c0004        	addw	x,#OFST-3
2185  09a9 cc07ef        	jp	LC017
2186                     ; 1006       standbyTimeCount = 0;
2187                     ; 1008     break;
2188  09ac               L3001:
2189                     ; 1010     case UIMSG_KEY_DIG0:
2189                     ; 1011     case UIMSG_KEY_DIG1:
2189                     ; 1012     case UIMSG_KEY_DIG2:
2189                     ; 1013     case UIMSG_KEY_DIG3:
2189                     ; 1014     case UIMSG_KEY_DIG4:
2189                     ; 1015     case UIMSG_KEY_DIG5:
2189                     ; 1016     case UIMSG_KEY_DIG6:
2189                     ; 1017     case UIMSG_KEY_DIG7:
2189                     ; 1018     case UIMSG_KEY_DIG8:
2189                     ; 1019     case UIMSG_KEY_DIG9:
2189                     ; 1020       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2190  09ac 1e0c          	ldw	x,(OFST+5,sp)
2191  09ae f6            	ld	a,(x)
2192  09af 2703cc0a5f    	jrne	L7201
2193                     ; 1022         if((cntMode == COUNT_MODE_C) ||
2193                     ; 1023            (cntMode == COUNT_MODE_B))
2194  09b4 7b07          	ld	a,(OFST+0,sp)
2195  09b6 2704          	jreq	L3411
2197  09b8 a101          	cp	a,#1
2198  09ba 2616          	jrne	L1411
2199  09bc               L3411:
2200                     ; 1025           UI_SetRefreshMsg(0);
2202                     ; 180   SensorCounter = sc;
2203                     ; 1028           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_EDIT];
2204                     ; 1029           return(SwitchHomeSubProcess(param, pMsg));
2205  09bc 5f            	clrw	x
2206  09bd 89            	pushw	x
2207  09be 89            	pushw	x
2208  09bf cd0000        	call	_UI_SetRefreshMsg
2209  09c2 5b04          	addw	sp,#4
2210  09c4 cd0a67        	call	LC031
2211  09c7 ae0a7b        	ldw	x,#L51_ProcHomeEdit
2212  09ca cf0000        	ldw	L74_pfProcHome,x
2213  09cd 1e0c          	ldw	x,(OFST+5,sp)
2216  09cf cc07ef        	jp	LC017
2217  09d2               L1411:
2218                     ; 1031         else if(cntMode == COUNT_MODE_V)
2219  09d2 a104          	cp	a,#4
2220  09d4 2703cc0a5b    	jrne	L7021
2221                     ; 1033           uint32_t noteVCount = 0;
2222  09d9 5f            	clrw	x
2223  09da 1f05          	ldw	(OFST-2,sp),x
2224  09dc 1f03          	ldw	(OFST-4,sp),x
2225                     ; 1034           REG_GetValue(&noteVCount, REG_ID_NOTE_V_COUNT);
2226  09de 4b08          	push	#8
2227  09e0 96            	ldw	x,sp
2228  09e1 1c0004        	addw	x,#OFST-3
2229  09e4 cd0000        	call	_REG_GetValue
2231  09e7 ad7e          	call	LC031
2232  09e9 84            	pop	a
2233                     ; 180   SensorCounter = sc;
2234                     ; 1037           if(pMsg->message == UIMSG_KEY_V10)
2235  09ea 1e0c          	ldw	x,(OFST+5,sp)
2236  09ec e601          	ld	a,(1,x)
2237  09ee a109          	cp	a,#9
2238  09f0 2605          	jrne	L1511
2239                     ; 1039             noteVCount = 10;
2240  09f2 ae000a        	ldw	x,#10
2242  09f5 202b          	jp	LC025
2243  09f7               L1511:
2244                     ; 1041           else if(pMsg->message == UIMSG_KEY_V20)
2245  09f7 a10a          	cp	a,#10
2246  09f9 2605          	jrne	L5511
2247                     ; 1043             noteVCount = 20;
2248  09fb ae0014        	ldw	x,#20
2250  09fe 2022          	jp	LC025
2251  0a00               L5511:
2252                     ; 1045           else if(pMsg->message == UIMSG_KEY_V50)
2253  0a00 a10b          	cp	a,#11
2254  0a02 2605          	jrne	L1611
2255                     ; 1047             noteVCount = 50;
2256  0a04 ae0032        	ldw	x,#50
2258  0a07 2019          	jp	LC025
2259  0a09               L1611:
2260                     ; 1049           else if(pMsg->message == UIMSG_KEY_V100)
2261  0a09 a10c          	cp	a,#12
2262  0a0b 2605          	jrne	L5611
2263                     ; 1051             noteVCount = 100;
2264  0a0d ae0064        	ldw	x,#100
2266  0a10 2010          	jp	LC025
2267  0a12               L5611:
2268                     ; 1053           else if(pMsg->message == UIMSG_KEY_V500)
2269  0a12 a10d          	cp	a,#13
2270  0a14 2605          	jrne	L1711
2271                     ; 1055             noteVCount = 500;
2272  0a16 ae01f4        	ldw	x,#500
2274  0a19 2007          	jp	LC025
2275  0a1b               L1711:
2276                     ; 1057           else if(pMsg->message == UIMSG_KEY_V1000)
2277  0a1b a10e          	cp	a,#14
2278  0a1d 2608          	jrne	L3511
2279                     ; 1059             noteVCount = 1000;
2280  0a1f ae03e8        	ldw	x,#1000
2281  0a22               LC025:
2282  0a22 1f05          	ldw	(OFST-2,sp),x
2283  0a24 5f            	clrw	x
2284  0a25 1f03          	ldw	(OFST-4,sp),x
2285  0a27               L3511:
2286                     ; 1062           REG_SetValue(&noteVCount, REG_ID_NOTE_V_COUNT);
2287  0a27 4b08          	push	#8
2288  0a29 96            	ldw	x,sp
2289  0a2a 1c0004        	addw	x,#OFST-3
2291                     ; 1064         standbyTimeCount = 0;
2292  0a2d 2028          	jp	LC027
2293  0a2f               L1101:
2294                     ; 1068     case UIMSG_KEY_TENS:
2294                     ; 1069     case UIMSG_KEY_UNITS:
2294                     ; 1070       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2295  0a2f 1e0c          	ldw	x,(OFST+5,sp)
2296  0a31 f6            	ld	a,(x)
2297  0a32 262b          	jrne	L7201
2298                     ; 1072         if((cntMode == COUNT_MODE_C) ||
2298                     ; 1073            (cntMode == COUNT_MODE_B))
2299  0a34 7b07          	ld	a,(OFST+0,sp)
2300  0a36 2784          	jreq	L3411
2302  0a38 4a            	dec	a
2303  0a39 2620          	jrne	L7021
2304                     ; 1075           UI_SetRefreshMsg(0);
2306                     ; 180   SensorCounter = sc;
2307                     ; 1078           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_EDIT];
2308                     ; 1079           return(SwitchHomeSubProcess(param, pMsg));
2311  0a3b cc09bc        	jp	L3411
2312                     ; 1081         standbyTimeCount = 0;
2313  0a3e               L5101:
2314                     ; 1086     case UIMSG_SW_RESET:
2314                     ; 1087       if((uint8_t)pMsg->param == UI_SW_PRESS)
2315  0a3e 1e0c          	ldw	x,(OFST+5,sp)
2316  0a40 f6            	ld	a,(x)
2317  0a41 261c          	jrne	L7201
2318                     ; 170   return CounterMode;
2319  0a43 c60000        	ld	a,_CounterMode
2320  0a46 6b06          	ld	(OFST-1,sp),a
2323                     ; 1091         if(cntMode == COUNT_MODE_V)
2324  0a48 a104          	cp	a,#4
2325  0a4a 260f          	jrne	L7021
2326                     ; 1093           uint32_t valueCounter = 0;
2327  0a4c 5f            	clrw	x
2328  0a4d 1f04          	ldw	(OFST-3,sp),x
2329  0a4f 1f02          	ldw	(OFST-5,sp),x
2330                     ; 1094           REG_SetValue(&valueCounter, REG_ID_VALUE_COUNTER);
2331  0a51 4b04          	push	#4
2332  0a53 96            	ldw	x,sp
2333  0a54 1c0003        	addw	x,#OFST-4
2335  0a57               LC027:
2336  0a57 cd0000        	call	_REG_SetValue
2337  0a5a 84            	pop	a
2338  0a5b               L7021:
2339                     ; 1097         standbyTimeCount = 0;
2340  0a5b 5f            	clrw	x
2341  0a5c cf0009        	ldw	L146_standbyTimeCount,x
2342                     ; 1101     default:
2342                     ; 1102       break;
2343  0a5f               L7201:
2344                     ; 1105   HomeDispCounter();
2345  0a5f cd0010        	call	L35_HomeDispCounter
2347                     ; 1107   return UI_RC_CONTINUE;
2348  0a62 a601          	ld	a,#1
2350  0a64 cc07f6        	jra	L216
2351  0a67               LC031:
2352  0a67 5f            	clrw	x
2353  0a68 cf0002        	ldw	_SensorCounter+2,x
2354  0a6b cf0000        	ldw	_SensorCounter,x
2355  0a6e 81            	ret	
2356  0a6f               LC032:
2357  0a6f 1c0003        	addw	x,#OFST-4
2358  0a72 cd0000        	call	c_ltor
2360  0a75 ae0058        	ldw	x,#L404
2361  0a78 cc0000        	jp	c_lcmp
2363                     	switch	.data
2364  000b               L1121_EditVal:
2365  000b 00000000      	dc.l	0
2366                     	switch	.const
2367  00ae               L5421_msg:
2368  00ae 00            	dc.b	0
2369  00af 00            	dc.b	0
2370  00b0               L1521_msg:
2371  00b0 00            	dc.b	0
2372  00b1 00            	dc.b	0
2375  00b2               L046:
2376  00b2 0ad2          	dc.w	L3121
2377  00b4 0adc          	dc.w	L5121
2378  00b6 0ae7          	dc.w	L7121
2379  00b8 0af3          	dc.w	L1221
2380  00ba 0aff          	dc.w	L3221
2381  00bc 0b0b          	dc.w	L5221
2382  00be 0b17          	dc.w	L7221
2383  00c0 0b23          	dc.w	L1321
2384  00c2 0b2f          	dc.w	L3321
2385  00c4 0b3b          	dc.w	L5321
2386  00c6 0bc2          	dc.w	L1721
2387  00c8 0bc2          	dc.w	L1721
2388  00ca 0bc2          	dc.w	L1721
2389  00cc 0bc2          	dc.w	L1721
2390  00ce 0bc2          	dc.w	L1721
2391  00d0 0bc2          	dc.w	L1721
2392  00d2 0bc2          	dc.w	L1721
2393  00d4 0bc2          	dc.w	L1721
2394  00d6 0b46          	dc.w	L7321
2395  00d8 0b51          	dc.w	L1421
2396  00da 0bc2          	dc.w	L1721
2397  00dc 0bc2          	dc.w	L1721
2398  00de 0b83          	dc.w	L7421
2399  00e0 0b5c          	dc.w	L3421
2400  00e2               L246:
2401  00e2 00000009      	dc.l	9
2402                     ; 1120 static uint8_t ProcHomeEdit(void *param, UI_MSG_T *pMsg)
2402                     ; 1121 {
2403                     	switch	.text
2404  0a7b               L51_ProcHomeEdit:
2405  0a7b 89            	pushw	x
2406  0a7c 5214          	subw	sp,#20
2407       00000014      OFST:	set	20
2409                     ; 1128   uint8_t digitVal = KEY_INVALID;
2410  0a7e a6ff          	ld	a,#255
2411  0a80 6b14          	ld	(OFST+0,sp),a
2412                     ; 1129   uint32_t EditMinVal = 0, EditMaxVal = 0;
2413  0a82 5f            	clrw	x
2414  0a83 1f0d          	ldw	(OFST-7,sp),x
2415  0a85 1f0b          	ldw	(OFST-9,sp),x
2417  0a87 1f11          	ldw	(OFST-3,sp),x
2418  0a89 1f0f          	ldw	(OFST-5,sp),x
2419                     ; 170   return CounterMode;
2420  0a8b c60000        	ld	a,_CounterMode
2421  0a8e 6b13          	ld	(OFST-1,sp),a
2424                     ; 1133   if(cntMode == COUNT_MODE_C)
2425  0a90 260e          	jrne	L1621
2426                     ; 1135     REG_GetMinValue(&EditMinVal, REG_ID_NOTE_C_COUNT);
2427  0a92 4b05          	push	#5
2428  0a94 96            	ldw	x,sp
2429  0a95 1c000c        	addw	x,#OFST-8
2430  0a98 cd0000        	call	_REG_GetMinValue
2432  0a9b 84            	pop	a
2433                     ; 1136     REG_GetMaxValue(&EditMaxVal, REG_ID_NOTE_C_COUNT);
2434  0a9c 4b05          	push	#5
2437  0a9e 200f          	jp	LC033
2438  0aa0               L1621:
2439                     ; 1138   else if(cntMode == COUNT_MODE_B)
2440  0aa0 4a            	dec	a
2441  0aa1 2614          	jrne	L3621
2442                     ; 1140     REG_GetMinValue(&EditMinVal, REG_ID_NOTE_B_COUNT);
2443  0aa3 4b06          	push	#6
2444  0aa5 96            	ldw	x,sp
2445  0aa6 1c000c        	addw	x,#OFST-8
2446  0aa9 cd0000        	call	_REG_GetMinValue
2448  0aac 84            	pop	a
2449                     ; 1141     REG_GetMaxValue(&EditMaxVal, REG_ID_NOTE_B_COUNT);
2450  0aad 4b06          	push	#6
2452  0aaf               LC033:
2453  0aaf 96            	ldw	x,sp
2454  0ab0 1c0010        	addw	x,#OFST-4
2455  0ab3 cd0000        	call	_REG_GetMaxValue
2456  0ab6 84            	pop	a
2457  0ab7               L3621:
2458                     ; 1144   switch(pMsg->message)
2459  0ab7 1e19          	ldw	x,(OFST+5,sp)
2460  0ab9 e601          	ld	a,(1,x)
2462                     ; 1272     default:
2462                     ; 1273       break;
2463  0abb a008          	sub	a,#8
2464  0abd a118          	cp	a,#24
2465  0abf 2407          	jruge	L636
2466  0ac1 5f            	clrw	x
2467  0ac2 97            	ld	xl,a
2468  0ac3 58            	sllw	x
2469  0ac4 de00b2        	ldw	x,(L046,x)
2470  0ac7 fc            	jp	(x)
2471  0ac8               L636:
2472  0ac8 a0fa          	sub	a,#-6
2473  0aca 2603cc0b5c    	jreq	L3421
2474  0acf cc0bc2        	jra	L1721
2475  0ad2               L3121:
2476                     ; 1146     case UIMSG_KEY_DIG0:
2476                     ; 1147       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2477  0ad2 1e19          	ldw	x,(OFST+5,sp)
2478  0ad4 f6            	ld	a,(x)
2479  0ad5 26f8          	jrne	L1721
2480                     ; 1149         digitVal = 0;
2481  0ad7 6b14          	ld	(OFST+0,sp),a
2482  0ad9 cc0bc2        	jra	L1721
2483  0adc               L5121:
2484                     ; 1153     case UIMSG_KEY_DIG1:
2484                     ; 1154       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2485  0adc 1e19          	ldw	x,(OFST+5,sp)
2486  0ade f6            	ld	a,(x)
2487  0adf 26f8          	jrne	L1721
2488                     ; 1156         digitVal = 1;
2489  0ae1 4c            	inc	a
2490  0ae2 6b14          	ld	(OFST+0,sp),a
2491  0ae4 cc0bc2        	jra	L1721
2492  0ae7               L7121:
2493                     ; 1160     case UIMSG_KEY_DIG2:
2493                     ; 1161       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2494  0ae7 1e19          	ldw	x,(OFST+5,sp)
2495  0ae9 f6            	ld	a,(x)
2496  0aea 26f8          	jrne	L1721
2497                     ; 1163         digitVal = 2;
2498  0aec a602          	ld	a,#2
2499  0aee 6b14          	ld	(OFST+0,sp),a
2500  0af0 cc0bc2        	jra	L1721
2501  0af3               L1221:
2502                     ; 1167     case UIMSG_KEY_DIG3:
2502                     ; 1168       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2503  0af3 1e19          	ldw	x,(OFST+5,sp)
2504  0af5 f6            	ld	a,(x)
2505  0af6 26f8          	jrne	L1721
2506                     ; 1170         digitVal = 3;
2507  0af8 a603          	ld	a,#3
2508  0afa 6b14          	ld	(OFST+0,sp),a
2509  0afc cc0bc2        	jra	L1721
2510  0aff               L3221:
2511                     ; 1174     case UIMSG_KEY_DIG4:
2511                     ; 1175       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2512  0aff 1e19          	ldw	x,(OFST+5,sp)
2513  0b01 f6            	ld	a,(x)
2514  0b02 26f8          	jrne	L1721
2515                     ; 1177         digitVal = 4;
2516  0b04 a604          	ld	a,#4
2517  0b06 6b14          	ld	(OFST+0,sp),a
2518  0b08 cc0bc2        	jra	L1721
2519  0b0b               L5221:
2520                     ; 1181     case UIMSG_KEY_DIG5:
2520                     ; 1182       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2521  0b0b 1e19          	ldw	x,(OFST+5,sp)
2522  0b0d f6            	ld	a,(x)
2523  0b0e 26f8          	jrne	L1721
2524                     ; 1184         digitVal = 5;
2525  0b10 a605          	ld	a,#5
2526  0b12 6b14          	ld	(OFST+0,sp),a
2527  0b14 cc0bc2        	jra	L1721
2528  0b17               L7221:
2529                     ; 1188     case UIMSG_KEY_DIG6:
2529                     ; 1189       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2530  0b17 1e19          	ldw	x,(OFST+5,sp)
2531  0b19 f6            	ld	a,(x)
2532  0b1a 26f8          	jrne	L1721
2533                     ; 1191         digitVal = 6;
2534  0b1c a606          	ld	a,#6
2535  0b1e 6b14          	ld	(OFST+0,sp),a
2536  0b20 cc0bc2        	jra	L1721
2537  0b23               L1321:
2538                     ; 1195     case UIMSG_KEY_DIG7:
2538                     ; 1196       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2539  0b23 1e19          	ldw	x,(OFST+5,sp)
2540  0b25 f6            	ld	a,(x)
2541  0b26 26f8          	jrne	L1721
2542                     ; 1198         digitVal = 7;
2543  0b28 a607          	ld	a,#7
2544  0b2a 6b14          	ld	(OFST+0,sp),a
2545  0b2c cc0bc2        	jra	L1721
2546  0b2f               L3321:
2547                     ; 1202     case UIMSG_KEY_DIG8:
2547                     ; 1203       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2548  0b2f 1e19          	ldw	x,(OFST+5,sp)
2549  0b31 f6            	ld	a,(x)
2550  0b32 26f8          	jrne	L1721
2551                     ; 1205         digitVal = 8;
2552  0b34 a608          	ld	a,#8
2553  0b36 6b14          	ld	(OFST+0,sp),a
2554  0b38 cc0bc2        	jra	L1721
2555  0b3b               L5321:
2556                     ; 1209     case UIMSG_KEY_DIG9:
2556                     ; 1210       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2557  0b3b 1e19          	ldw	x,(OFST+5,sp)
2558  0b3d f6            	ld	a,(x)
2559  0b3e 26f8          	jrne	L1721
2560                     ; 1212         digitVal = 9;
2561  0b40 a609          	ld	a,#9
2562  0b42 6b14          	ld	(OFST+0,sp),a
2563  0b44 207c          	jra	L1721
2564  0b46               L7321:
2565                     ; 1216     case UIMSG_KEY_TENS:
2565                     ; 1217       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2566  0b46 1e19          	ldw	x,(OFST+5,sp)
2567  0b48 f6            	ld	a,(x)
2568  0b49 2677          	jrne	L1721
2569                     ; 1219         digitVal = KEY_TENS;
2570  0b4b a680          	ld	a,#128
2571  0b4d 6b14          	ld	(OFST+0,sp),a
2572  0b4f 2071          	jra	L1721
2573  0b51               L1421:
2574                     ; 1223     case UIMSG_KEY_UNITS:
2574                     ; 1224       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2575  0b51 1e19          	ldw	x,(OFST+5,sp)
2576  0b53 f6            	ld	a,(x)
2577  0b54 266c          	jrne	L1721
2578                     ; 1226         digitVal = KEY_UNITS;
2579  0b56 a640          	ld	a,#64
2580  0b58 6b14          	ld	(OFST+0,sp),a
2581  0b5a 2066          	jra	L1721
2582  0b5c               L3421:
2583                     ; 1230     case UIMSG_KEY_CLR:
2583                     ; 1231     case UIMSG_SW_RESET:
2583                     ; 1232       if((uint8_t)pMsg->param == UI_SW_PRESS)
2584  0b5c 1e19          	ldw	x,(OFST+5,sp)
2585  0b5e f6            	ld	a,(x)
2586  0b5f 2661          	jrne	L1721
2587                     ; 1234         if(EditVal < 10)
2588  0b61 cd0c74        	call	LC037
2589  0b64 cd0000        	call	c_lcmp
2591  0b67 240c          	jruge	L5231
2592                     ; 1236           UI_MSG_T msg = {0, UIMSG_INIT};
2593  0b69 c600ae        	ld	a,L5421_msg
2594  0b6c 6b01          	ld	(OFST-19,sp),a
2595  0b6e c600af        	ld	a,L5421_msg+1
2596  0b71 6b02          	ld	(OFST-18,sp),a
2597                     ; 1238           EditVal = 0;
2598                     ; 1240           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
2599                     ; 1241           return(SwitchHomeSubProcess(param, &msg));
2602  0b73 2034          	jp	L5331
2603  0b75               L5231:
2604                     ; 1245           EditVal /= 10;
2605  0b75 cd0c74        	call	LC037
2606  0b78 cd0000        	call	c_ludv
2608  0b7b ae000b        	ldw	x,#L1121_EditVal
2609  0b7e cd0000        	call	c_rtol
2611  0b81 203f          	jra	L1721
2612  0b83               L7421:
2613                     ; 1250     case UIMSG_KEY_ENT:
2613                     ; 1251       if((uint8_t)pMsg->param == UI_KEY_PRESS)
2614  0b83 1e19          	ldw	x,(OFST+5,sp)
2615  0b85 f6            	ld	a,(x)
2616  0b86 263a          	jrne	L1721
2617                     ; 1253         UI_MSG_T msg = {0, UIMSG_INIT};
2618  0b88 c600b0        	ld	a,L1521_msg
2619  0b8b 6b01          	ld	(OFST-19,sp),a
2620  0b8d c600b1        	ld	a,L1521_msg+1
2621  0b90 6b02          	ld	(OFST-18,sp),a
2622                     ; 170   return CounterMode;
2623  0b92 c60000        	ld	a,_CounterMode
2624  0b95 6b13          	ld	(OFST-1,sp),a
2627                     ; 1256         if(cntMode == COUNT_MODE_C)
2628  0b97 2604          	jrne	L3331
2629                     ; 1258           REG_SetValue(&EditVal, REG_ID_NOTE_C_COUNT);
2630  0b99 4b05          	push	#5
2633  0b9b 2005          	jp	LC034
2634  0b9d               L3331:
2635                     ; 1260         else if(cntMode == COUNT_MODE_B)
2636  0b9d 4a            	dec	a
2637  0b9e 2609          	jrne	L5331
2638                     ; 1262           REG_SetValue(&EditVal, REG_ID_NOTE_B_COUNT);
2639  0ba0 4b06          	push	#6
2641  0ba2               LC034:
2642  0ba2 ae000b        	ldw	x,#L1121_EditVal
2643  0ba5 cd0000        	call	_REG_SetValue
2644  0ba8 84            	pop	a
2645  0ba9               L5331:
2646                     ; 1265         EditVal = 0;
2647                     ; 1267         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
2648                     ; 1268         return(SwitchHomeSubProcess(param, &msg));
2650  0ba9 5f            	clrw	x
2651  0baa cf000d        	ldw	L1121_EditVal+2,x
2652  0bad cf000b        	ldw	L1121_EditVal,x
2653  0bb0 ae0736        	ldw	x,#L31_ProcHomeIdle
2654  0bb3 cf0000        	ldw	L74_pfProcHome,x
2655  0bb6 96            	ldw	x,sp
2656  0bb7 5c            	incw	x
2657  0bb8 89            	pushw	x
2658  0bb9 1e17          	ldw	x,(OFST+3,sp)
2659  0bbb cd0000        	call	L15_SwitchHomeSubProcess
2660  0bbe 85            	popw	x
2662  0bbf               L256:
2663  0bbf 5b16          	addw	sp,#22
2664  0bc1 81            	ret	
2665                     ; 1272     default:
2665                     ; 1273       break;
2666  0bc2               L1721:
2667                     ; 1276   if(digitVal != KEY_INVALID)
2668  0bc2 7b14          	ld	a,(OFST+0,sp)
2669  0bc4 a1ff          	cp	a,#255
2670  0bc6 2603cc0c4b    	jreq	L1431
2671                     ; 1278     if(digitVal == KEY_TENS)
2672  0bcb a180          	cp	a,#128
2673  0bcd 2619          	jrne	L3431
2674                     ; 1280       if((EditVal + 10) <= EditMaxVal)
2675  0bcf cd0c7e        	call	LC038
2676  0bd2 cd0000        	call	c_ladc
2678  0bd5 96            	ldw	x,sp
2679  0bd6 1c000f        	addw	x,#OFST-5
2680  0bd9 cd0000        	call	c_lcmp
2682  0bdc 2244          	jrugt	L1631
2683                     ; 1282         EditVal += 10;
2684  0bde ae000b        	ldw	x,#L1121_EditVal
2685  0be1 a60a          	ld	a,#10
2686  0be3 cd0000        	call	c_lgadc
2689  0be6 2063          	jra	L1431
2690                     ; 1286         EditVal = 0;
2691  0be8               L3431:
2692                     ; 1289     else if (digitVal == KEY_UNITS)
2693  0be8 a140          	cp	a,#64
2694  0bea 263f          	jrne	L3531
2695                     ; 1291       if(EditVal % 10 == 9)
2696  0bec cd0c74        	call	LC037
2697  0bef cd0000        	call	c_lumd
2699  0bf2 ae00e2        	ldw	x,#L246
2700  0bf5 cd0000        	call	c_lcmp
2702  0bf8 260a          	jrne	L5531
2703                     ; 1293         EditVal -= 9;
2704  0bfa ae000b        	ldw	x,#L1121_EditVal
2705  0bfd a609          	ld	a,#9
2706  0bff cd0000        	call	c_lgsbc
2709  0c02 2047          	jra	L1431
2710  0c04               L5531:
2711                     ; 1297         if((EditVal + 1) <= EditMaxVal)
2712  0c04 ae000b        	ldw	x,#L1121_EditVal
2713  0c07 cd0000        	call	c_ltor
2715  0c0a a601          	ld	a,#1
2716  0c0c cd0000        	call	c_ladc
2718  0c0f 96            	ldw	x,sp
2719  0c10 1c000f        	addw	x,#OFST-5
2720  0c13 cd0000        	call	c_lcmp
2722  0c16 220a          	jrugt	L1631
2723                     ; 1299           EditVal += 1;
2724  0c18 ae000b        	ldw	x,#L1121_EditVal
2725  0c1b a601          	ld	a,#1
2726  0c1d cd0000        	call	c_lgadc
2729  0c20 2029          	jra	L1431
2730  0c22               L1631:
2731                     ; 1303           EditVal = 0;
2732  0c22 5f            	clrw	x
2733  0c23 cf000d        	ldw	L1121_EditVal+2,x
2734  0c26 cf000b        	ldw	L1121_EditVal,x
2735  0c29 2020          	jra	L1431
2736  0c2b               L3531:
2737                     ; 1309       if(((EditVal * 10) + digitVal) <= EditMaxVal)
2738  0c2b ad51          	call	LC038
2739  0c2d cd0000        	call	c_smul
2741  0c30 7b14          	ld	a,(OFST+0,sp)
2742  0c32 cd0000        	call	c_ladc
2744  0c35 96            	ldw	x,sp
2745  0c36 1c000f        	addw	x,#OFST-5
2746  0c39 cd0000        	call	c_lcmp
2748  0c3c 220d          	jrugt	L1431
2749                     ; 1311         EditVal = (EditVal * 10) + digitVal;
2750  0c3e ad3e          	call	LC038
2751  0c40 cd0000        	call	c_smul
2753  0c43 7b14          	ld	a,(OFST+0,sp)
2754  0c45 cd0000        	call	c_ladc
2756  0c48 cd0000        	call	c_rtol
2758  0c4b               L1431:
2759                     ; 1316   DISP_LowerClear();
2760  0c4b cd0000        	call	_DISP_LowerClear
2762                     ; 1318   sprintf(&string[0], DISP_LOWER_STR_FORMAT, EditVal);
2763  0c4e ce000d        	ldw	x,L1121_EditVal+2
2764  0c51 89            	pushw	x
2765  0c52 ce000b        	ldw	x,L1121_EditVal
2766  0c55 89            	pushw	x
2767  0c56 ce0000        	ldw	x,_pDisp
2768  0c59 ee08          	ldw	x,(8,x)
2769  0c5b 89            	pushw	x
2770  0c5c 96            	ldw	x,sp
2771  0c5d 1c0009        	addw	x,#OFST-11
2772  0c60 cd0000        	call	_sprintf
2774  0c63 5b06          	addw	sp,#6
2775                     ; 1319   DISP_LowerPutStr(&string[0], 0);
2776  0c65 4b00          	push	#0
2777  0c67 96            	ldw	x,sp
2778  0c68 1c0004        	addw	x,#OFST-16
2779  0c6b cd0000        	call	_DISP_LowerPutStr
2781  0c6e 84            	pop	a
2782                     ; 1321   return UI_RC_CONTINUE;
2783  0c6f a601          	ld	a,#1
2785  0c71 cc0bbf        	jra	L256
2786  0c74               LC037:
2787  0c74 ae000b        	ldw	x,#L1121_EditVal
2788  0c77 cd0000        	call	c_ltor
2790  0c7a ae0032        	ldw	x,#L63
2791  0c7d 81            	ret	
2792  0c7e               LC038:
2793  0c7e ae000b        	ldw	x,#L1121_EditVal
2794  0c81 cd0000        	call	c_ltor
2796  0c84 a60a          	ld	a,#10
2797  0c86 81            	ret	
2799                     	switch	.const
2800  00e6               L1041_msg:
2801  00e6 00            	dc.b	0
2802  00e7 00            	dc.b	0
2803  00e8               L7041_msg:
2804  00e8 00            	dc.b	0
2805  00e9 00            	dc.b	0
2806  00ea               L3141_msg:
2807  00ea 00            	dc.b	0
2808  00eb 00            	dc.b	0
2812                     ; 1334 static uint8_t ProcHomeStartHMotor(void *param, UI_MSG_T *pMsg)
2812                     ; 1335 {
2813                     	switch	.text
2814  0c87               L71_ProcHomeStartHMotor:
2815  0c87 89            	pushw	x
2816  0c88 5205          	subw	sp,#5
2817       00000005      OFST:	set	5
2819                     ; 1338   switch(pMsg->message)
2820  0c8a 1e0a          	ldw	x,(OFST+5,sp)
2821  0c8c e601          	ld	a,(1,x)
2823                     ; 1416     break;
2824  0c8e 270c          	jreq	L1731
2825  0c90 4a            	dec	a
2826  0c91 2731          	jreq	L7731
2827  0c93 4a            	dec	a
2828  0c94 2778          	jreq	L1141
2829  0c96 4a            	dec	a
2830  0c97 2747          	jreq	L5041
2831  0c99 cc0d41        	jra	L1241
2832  0c9c               L1731:
2833                     ; 130   return FlagUvDetect;
2834  0c9c c60000        	ld	a,_FlagUvDetect
2835  0c9f 6b05          	ld	(OFST+0,sp),a
2838                     ; 1343       uint32_t sensorCounter = 0;
2839                     ; 180   SensorCounter = sc;
2840  0ca1 5f            	clrw	x
2841  0ca2 cf0002        	ldw	_SensorCounter+2,x
2842  0ca5 cf0000        	ldw	_SensorCounter,x
2843                     ; 1347       if(flagUVDetect == TRUE)
2844  0ca8 4a            	dec	a
2845  0ca9 2604          	jrne	L3241
2846                     ; 1349         BSP_UV_DetectEnable(TRUE);
2847  0cab 72195005      	bres	20485,#4
2848  0caf               L3241:
2849                     ; 1352       BSP_H_MotorEnable(TRUE);
2850  0caf 721d5005      	bres	20485,#6
2851                     ; 1353       BSP_V_PumpEnable(TRUE);
2852  0cb3 72115019      	bres	20505,#0
2853                     ; 1355       UI_SetRefreshMsg(CAM_SW_TIMEOUT);
2854  0cb7 ae0bb8        	ldw	x,#3000
2855  0cba 89            	pushw	x
2856  0cbb 5f            	clrw	x
2857  0cbc 89            	pushw	x
2858  0cbd cd0000        	call	_UI_SetRefreshMsg
2860  0cc0 5b04          	addw	sp,#4
2861                     ; 1357     break;
2862  0cc2 207d          	jra	L1241
2863  0cc4               L7731:
2864                     ; 130   return FlagUvDetect;
2865  0cc4 c60000        	ld	a,_FlagUvDetect
2866  0cc7 6b03          	ld	(OFST-2,sp),a
2869                     ; 1362       UI_MSG_T msg = {0, UIMSG_INIT};
2870  0cc9 c600e6        	ld	a,L1041_msg
2871  0ccc 6b04          	ld	(OFST-1,sp),a
2872  0cce c600e7        	ld	a,L1041_msg+1
2873  0cd1 6b05          	ld	(OFST+0,sp),a
2874                     ; 1364       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];
2875  0cd3 ae130e        	ldw	x,#L53_ProcHomeError01
2876  0cd6 cf0000        	ldw	L74_pfProcHome,x
2877                     ; 1366       if(flagUVDetect == TRUE)
2878  0cd9 7b03          	ld	a,(OFST-2,sp)
2879  0cdb 4a            	dec	a
2880  0cdc 2659          	jrne	L3341
2881                     ; 1368         BSP_UV_DetectEnable(FALSE);
2882                     ; 1371       BSP_H_MotorEnable(FALSE);
2883                     ; 1372       BSP_V_PumpEnable(FALSE);
2884                     ; 1374       return(SwitchHomeSubProcess(param, &msg));
2887  0cde 2053          	jp	LC041
2888  0ce0               L5041:
2889                     ; 1380       if((uint8_t)pMsg->param == UI_SW_RELEASE)
2890  0ce0 f6            	ld	a,(x)
2891  0ce1 4a            	dec	a
2892  0ce2 265d          	jrne	L1241
2893                     ; 1382         UI_MSG_T msg = {0, UIMSG_INIT};
2894  0ce4 c600e8        	ld	a,L7041_msg
2895  0ce7 6b04          	ld	(OFST-1,sp),a
2896  0ce9 c600e9        	ld	a,L7041_msg+1
2897  0cec 6b05          	ld	(OFST+0,sp),a
2898                     ; 1383         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_S_MOTOR];
2899  0cee ae0d45        	ldw	x,#L12_ProcHomeStartSMotor
2900  0cf1 cf0000        	ldw	L74_pfProcHome,x
2901                     ; 1386         BSP_H_MotorEnable(FALSE);
2902  0cf4 721c5005      	bset	20485,#6
2903                     ; 1387         UI_SetRefreshMsg(0);
2904  0cf8 5f            	clrw	x
2905  0cf9 89            	pushw	x
2906  0cfa 89            	pushw	x
2907  0cfb cd0000        	call	_UI_SetRefreshMsg
2909  0cfe 5b04          	addw	sp,#4
2910                     ; 1389         return(SwitchHomeSubProcess(param, &msg));
2912  0d00               LC039:
2913  0d00 96            	ldw	x,sp
2914  0d01 1c0004        	addw	x,#OFST-1
2915  0d04 89            	pushw	x
2916  0d05 1e08          	ldw	x,(OFST+3,sp)
2917  0d07 cd0000        	call	L15_SwitchHomeSubProcess
2918  0d0a 85            	popw	x
2920  0d0b               L276:
2921  0d0b 5b07          	addw	sp,#7
2922  0d0d 81            	ret	
2923  0d0e               L1141:
2924                     ; 1396       if((uint8_t)pMsg->param == UI_SW_PRESS)
2925  0d0e f6            	ld	a,(x)
2926  0d0f 2630          	jrne	L1241
2927                     ; 130   return FlagUvDetect;
2928  0d11 c60000        	ld	a,_FlagUvDetect
2929  0d14 6b03          	ld	(OFST-2,sp),a
2932                     ; 1399         UI_MSG_T msg = {0, UIMSG_INIT};
2933  0d16 c600ea        	ld	a,L3141_msg
2934  0d19 6b04          	ld	(OFST-1,sp),a
2935  0d1b c600eb        	ld	a,L3141_msg+1
2936  0d1e 6b05          	ld	(OFST+0,sp),a
2937                     ; 1401         UI_SetRefreshMsg(0);
2938  0d20 5f            	clrw	x
2939  0d21 89            	pushw	x
2940  0d22 89            	pushw	x
2941  0d23 cd0000        	call	_UI_SetRefreshMsg
2943  0d26 5b04          	addw	sp,#4
2944                     ; 1403         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
2945  0d28 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
2946  0d2b cf0000        	ldw	L74_pfProcHome,x
2947                     ; 1405         if(flagUVDetect == TRUE)
2948  0d2e 7b03          	ld	a,(OFST-2,sp)
2949  0d30 4a            	dec	a
2950  0d31 2604          	jrne	L3341
2951                     ; 1407           BSP_UV_DetectEnable(FALSE);
2952  0d33               LC041:
2953  0d33 72185005      	bset	20485,#4
2954  0d37               L3341:
2955                     ; 1410         BSP_H_MotorEnable(FALSE);
2956                     ; 1411         BSP_V_PumpEnable(FALSE);
2957  0d37 721c5005      	bset	20485,#6
2958  0d3b 72105019      	bset	20505,#0
2959                     ; 1413         return(SwitchHomeSubProcess(param, &msg));
2962  0d3f 20bf          	jp	LC039
2963  0d41               L1241:
2964                     ; 1419   return UI_RC_CONTINUE;
2965  0d41 a601          	ld	a,#1
2967  0d43 20c6          	jra	L276
2969                     	switch	.const
2970  00ec               L3441_msg:
2971  00ec 00            	dc.b	0
2972  00ed 00            	dc.b	0
2973  00ee               L1541_msg:
2974  00ee 00            	dc.b	0
2975  00ef 00            	dc.b	0
2976  00f0               L1641_msg:
2977  00f0 00            	dc.b	0
2978  00f1 00            	dc.b	0
2979  00f2               L3641_msg:
2980  00f2 00            	dc.b	0
2981  00f3 00            	dc.b	0
2982  00f4               L5641_msg:
2983  00f4 00            	dc.b	0
2984  00f5 00            	dc.b	0
2985  00f6               L7641_msg:
2986  00f6 00            	dc.b	0
2987  00f7 00            	dc.b	0
2988  00f8               L1741_msg:
2989  00f8 00            	dc.b	0
2990  00f9 00            	dc.b	0
2991  00fa               L3741_msg:
2992  00fa 00            	dc.b	0
2993  00fb 00            	dc.b	0
2994  00fc               L5741_msg:
2995  00fc 00            	dc.b	0
2996  00fd 00            	dc.b	0
2997  00fe               L7741_msg:
2998  00fe 00            	dc.b	0
2999  00ff 00            	dc.b	0
3000  0100               L3051_msg:
3001  0100 00            	dc.b	0
3002  0101 00            	dc.b	0
3014                     ; 1430 static uint8_t ProcHomeStartSMotor(void *param, UI_MSG_T *pMsg)
3014                     ; 1431 {
3015                     	switch	.text
3016  0d45               L12_ProcHomeStartSMotor:
3017  0d45 89            	pushw	x
3018  0d46 5214          	subw	sp,#20
3019       00000014      OFST:	set	20
3021                     ; 1435   uint32_t accSensorCount = 0;
3022  0d48 5f            	clrw	x
3023  0d49 1f0d          	ldw	(OFST-7,sp),x
3024  0d4b 1f0b          	ldw	(OFST-9,sp),x
3025                     ; 90   return FlagAutoCount;
3028                     ; 110   return FlagAddCount;
3031                     ; 130   return FlagUvDetect;
3032  0d4d c60000        	ld	a,_FlagUvDetect
3033  0d50 6b13          	ld	(OFST-1,sp),a
3036                     ; 170   return CounterMode;
3037  0d52 c60000        	ld	a,_CounterMode
3038  0d55 6b14          	ld	(OFST+0,sp),a
3041                     ; 190   return SensorCounter;
3042  0d57 ce0002        	ldw	x,_SensorCounter+2
3043  0d5a 1f11          	ldw	(OFST-3,sp),x
3044  0d5c ce0000        	ldw	x,_SensorCounter
3045  0d5f 1f0f          	ldw	(OFST-5,sp),x
3048                     ; 1442   REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
3049  0d61 5f            	clrw	x
3050  0d62 97            	ld	xl,a
3051  0d63 d6001e        	ld	a,(L34_REG_ID_ACC_CTR_LIST,x)
3052  0d66 88            	push	a
3053  0d67 96            	ldw	x,sp
3054  0d68 1c000c        	addw	x,#OFST-8
3055  0d6b cd0000        	call	_REG_GetValue
3057  0d6e 84            	pop	a
3058                     ; 1444   switch(pMsg->message)
3059  0d6f 1e19          	ldw	x,(OFST+5,sp)
3060  0d71 e601          	ld	a,(1,x)
3062                     ; 1644     break;
3063  0d73 2716          	jreq	L5341
3064  0d75 4a            	dec	a
3065  0d76 2603cc0e19    	jreq	L5541
3066  0d7b 4a            	dec	a
3067  0d7c 2603cc0f78    	jreq	L1051
3068  0d81 a03e          	sub	a,#62
3069  0d83 2735          	jreq	L7441
3070  0d85 4a            	dec	a
3071  0d86 270d          	jreq	L1441
3072  0d88 cc0f9a        	jra	L3251
3073  0d8b               L5341:
3074                     ; 140   FlagSensorEn = se;
3075  0d8b 35010000      	mov	_FlagSensorEn,#1
3076                     ; 1449       BSP_S_MotorEnable(TRUE);
3077  0d8f 721f5005      	bres	20485,#7
3078                     ; 1451       UI_SetRefreshMsg(SENSOR_TIMEOUT);
3080                     ; 1453     break;
3081  0d93 2076          	jp	L7251
3082  0d95               L1441:
3083                     ; 1457       UI_MSG_T msg = {0, UIMSG_INIT};
3084  0d95 c600ec        	ld	a,L3441_msg
3085  0d98 6b09          	ld	(OFST-11,sp),a
3086  0d9a c600ed        	ld	a,L3441_msg+1
3087  0d9d 6b0a          	ld	(OFST-10,sp),a
3088                     ; 1458       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_B_COIL];
3089  0d9f ae0fb8        	ldw	x,#L32_ProcHomeStartBCoil
3090  0da2 cf0000        	ldw	L74_pfProcHome,x
3091                     ; 1460       UI_SetRefreshMsg(0);
3092  0da5 cd0faf        	call	LC050
3093                     ; 1462       BSP_S_MotorEnable(FALSE);
3094  0da8 cd0fa2        	call	LC049
3095                     ; 1467       if(flagUVDetect == TRUE)
3096  0dab 7b13          	ld	a,(OFST-1,sp)
3097  0dad 4a            	dec	a
3098  0dae 2703cc0f1e    	jrne	LC045
3099                     ; 1469         BSP_UV_DetectEnable(FALSE);
3100  0db3 72185005      	bset	20485,#4
3101                     ; 1472       return(SwitchHomeSubProcess(param, &msg));
3104  0db7 cc0f1e        	jp	LC045
3105  0dba               L7441:
3106                     ; 1478       if(cntMode == COUNT_MODE_B)
3107  0dba 7b14          	ld	a,(OFST+0,sp)
3108  0dbc 4a            	dec	a
3109  0dbd 264c          	jrne	L7251
3110                     ; 1480         uint32_t noteSetCount = 0;
3111  0dbf 5f            	clrw	x
3112  0dc0 1f09          	ldw	(OFST-11,sp),x
3113  0dc2 1f07          	ldw	(OFST-13,sp),x
3114                     ; 1481         REG_GetValue(&noteSetCount, REG_ID_NOTE_B_COUNT);
3115  0dc4 4b06          	push	#6
3116  0dc6 96            	ldw	x,sp
3117  0dc7 1c0008        	addw	x,#OFST-12
3118  0dca cd0000        	call	_REG_GetValue
3120  0dcd 84            	pop	a
3121                     ; 1483         if(sensorCounter >= noteSetCount)
3122  0dce 96            	ldw	x,sp
3123  0dcf 1c000f        	addw	x,#OFST-5
3124  0dd2 cd0000        	call	c_ltor
3126  0dd5 96            	ldw	x,sp
3127  0dd6 1c0007        	addw	x,#OFST-13
3128  0dd9 cd0000        	call	c_lcmp
3130  0ddc 252d          	jrult	L7251
3131                     ; 1485           UI_MSG_T msg = {0, UIMSG_INIT};
3132  0dde c600ee        	ld	a,L1541_msg
3133  0de1 6b05          	ld	(OFST-15,sp),a
3134  0de3 c600ef        	ld	a,L1541_msg+1
3135  0de6 6b06          	ld	(OFST-14,sp),a
3136                     ; 1487           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_B_COIL];
3137  0de8 ae0fb8        	ldw	x,#L32_ProcHomeStartBCoil
3138  0deb cf0000        	ldw	L74_pfProcHome,x
3139                     ; 1489           UI_SetRefreshMsg(0);
3140  0dee cd0faf        	call	LC050
3141                     ; 1491           if(flagUVDetect == TRUE)
3142  0df1 7b13          	ld	a,(OFST-1,sp)
3143  0df3 4a            	dec	a
3144  0df4 2604          	jrne	L3351
3145                     ; 1493             BSP_UV_DetectEnable(FALSE);
3146  0df6 72185005      	bset	20485,#4
3147  0dfa               L3351:
3148                     ; 1496           BSP_S_MotorEnable(FALSE);
3149  0dfa cd0fa2        	call	LC049
3150                     ; 1501           return(SwitchHomeSubProcess(param, &msg));
3151  0dfd               LC043:
3152  0dfd 96            	ldw	x,sp
3153  0dfe 1c0005        	addw	x,#OFST-15
3155  0e01               LC042:
3156  0e01 89            	pushw	x
3157  0e02 1e17          	ldw	x,(OFST+3,sp)
3158  0e04 cd0000        	call	L15_SwitchHomeSubProcess
3159  0e07 85            	popw	x
3161  0e08               L467:
3162  0e08 5b16          	addw	sp,#22
3163  0e0a 81            	ret	
3164  0e0b               L7251:
3165                     ; 1505       UI_SetRefreshMsg(SENSOR_TIMEOUT);
3167  0e0b ae01f4        	ldw	x,#500
3168  0e0e 89            	pushw	x
3169  0e0f 5f            	clrw	x
3170  0e10 89            	pushw	x
3171  0e11 cd0000        	call	_UI_SetRefreshMsg
3172  0e14 5b04          	addw	sp,#4
3173                     ; 1507     break;
3174  0e16 cc0f9a        	jra	L3251
3175  0e19               L5541:
3176                     ; 1516       if(flagUVDetect == TRUE)
3177  0e19 7b13          	ld	a,(OFST-1,sp)
3178  0e1b 4a            	dec	a
3179  0e1c 2604          	jrne	L5351
3180                     ; 1518         BSP_UV_DetectEnable(FALSE);
3181  0e1e 72185005      	bset	20485,#4
3182  0e22               L5351:
3183                     ; 1521       BSP_S_MotorEnable(FALSE);
3184  0e22 cd0fa2        	call	LC049
3185                     ; 1526       if(sensorCounter == 0)
3186  0e25 96            	ldw	x,sp
3187  0e26 1c000f        	addw	x,#OFST-5
3188  0e29 cd0000        	call	c_lzmp
3190  0e2c 2610          	jrne	L7351
3191                     ; 1528         UI_MSG_T msg = {0, UIMSG_INIT};
3192  0e2e c600f0        	ld	a,L1641_msg
3193  0e31 6b09          	ld	(OFST-11,sp),a
3194  0e33 c600f1        	ld	a,L1641_msg+1
3195  0e36 6b0a          	ld	(OFST-10,sp),a
3196                     ; 1529         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_02];
3197  0e38 ae1325        	ldw	x,#L73_ProcHomeError02
3198                     ; 1531         return(SwitchHomeSubProcess(param, &msg));
3201  0e3b cc0f1b        	jp	LC046
3202  0e3e               L7351:
3203                     ; 1535         if(cntMode == COUNT_MODE_C)
3204  0e3e 7b14          	ld	a,(OFST+0,sp)
3205  0e40 2703cc0ef7    	jrne	L3451
3206                     ; 1537           uint32_t noteSetCount = 0;
3207  0e45 5f            	clrw	x
3208  0e46 1f09          	ldw	(OFST-11,sp),x
3209  0e48 1f07          	ldw	(OFST-13,sp),x
3210                     ; 1538           REG_GetValue(&noteSetCount, REG_ID_NOTE_C_COUNT);
3211  0e4a 4b05          	push	#5
3212  0e4c 96            	ldw	x,sp
3213  0e4d 1c0008        	addw	x,#OFST-12
3214  0e50 cd0000        	call	_REG_GetValue
3216  0e53 84            	pop	a
3217                     ; 1540           if(sensorCounter == noteSetCount)
3218  0e54 96            	ldw	x,sp
3219  0e55 1c000f        	addw	x,#OFST-5
3220  0e58 cd0000        	call	c_ltor
3222  0e5b 96            	ldw	x,sp
3223  0e5c 1c0007        	addw	x,#OFST-13
3224  0e5f cd0000        	call	c_lcmp
3226  0e62 2637          	jrne	L5451
3227                     ; 1542             uint32_t VerifyTrueCount = 0;
3228  0e64 5f            	clrw	x
3229  0e65 1f05          	ldw	(OFST-15,sp),x
3230  0e67 1f03          	ldw	(OFST-17,sp),x
3231                     ; 1544             UI_MSG_T msg = {0, UIMSG_INIT};
3232  0e69 c600f2        	ld	a,L3641_msg
3233  0e6c 6b01          	ld	(OFST-19,sp),a
3234  0e6e c600f3        	ld	a,L3641_msg+1
3235  0e71 6b02          	ld	(OFST-18,sp),a
3236                     ; 1545             pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3237  0e73 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3238  0e76 cf0000        	ldw	L74_pfProcHome,x
3239                     ; 1547             REG_GetValue(&VerifyTrueCount, REG_ID_C_TRUE_COUNT);
3240  0e79 4b0e          	push	#14
3241  0e7b 96            	ldw	x,sp
3242  0e7c 1c0004        	addw	x,#OFST-16
3243  0e7f cd0000        	call	_REG_GetValue
3245  0e82 84            	pop	a
3246                     ; 1548             VerifyTrueCount++;
3247  0e83 96            	ldw	x,sp
3248  0e84 1c0003        	addw	x,#OFST-17
3249  0e87 a601          	ld	a,#1
3250  0e89 cd0000        	call	c_lgadc
3252                     ; 1549             REG_SetValue(&VerifyTrueCount, REG_ID_C_TRUE_COUNT);
3253  0e8c 4b0e          	push	#14
3254  0e8e 96            	ldw	x,sp
3255  0e8f 1c0004        	addw	x,#OFST-16
3256  0e92 cd0000        	call	_REG_SetValue
3258  0e95 84            	pop	a
3259                     ; 1551             return(SwitchHomeSubProcess(param, &msg));
3260  0e96 96            	ldw	x,sp
3261  0e97 5c            	incw	x
3264  0e98 cc0e01        	jp	LC042
3265  0e9b               L5451:
3266                     ; 1555             UI_MSG_T msg = {0, UIMSG_INIT};
3267  0e9b c600f4        	ld	a,L5641_msg
3268  0e9e 6b05          	ld	(OFST-15,sp),a
3269  0ea0 c600f5        	ld	a,L5641_msg+1
3270  0ea3 6b06          	ld	(OFST-14,sp),a
3271                     ; 1556             pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];
3272  0ea5 ae1293        	ldw	x,#L33_ProcHomeBeep
3273  0ea8 cf0000        	ldw	L74_pfProcHome,x
3274                     ; 1558             if(sensorCounter < noteSetCount)
3275  0eab 96            	ldw	x,sp
3276  0eac 1c000f        	addw	x,#OFST-5
3277  0eaf cd0000        	call	c_ltor
3279  0eb2 96            	ldw	x,sp
3280  0eb3 1c0007        	addw	x,#OFST-13
3281  0eb6 cd0000        	call	c_lcmp
3283  0eb9 5f            	clrw	x
3284  0eba 2419          	jruge	L1551
3285                     ; 1560               uint32_t VerifyUnderCount = 0;
3286  0ebc 1f03          	ldw	(OFST-17,sp),x
3287  0ebe 1f01          	ldw	(OFST-19,sp),x
3288                     ; 1561               REG_GetValue(&VerifyUnderCount, REG_ID_C_UNDER_COUNT);
3289  0ec0 4b10          	push	#16
3290  0ec2 96            	ldw	x,sp
3291  0ec3 1c0002        	addw	x,#OFST-18
3292  0ec6 cd0000        	call	_REG_GetValue
3294  0ec9 84            	pop	a
3295                     ; 1562               VerifyUnderCount++;
3296  0eca 96            	ldw	x,sp
3297  0ecb 5c            	incw	x
3298  0ecc a601          	ld	a,#1
3299  0ece cd0000        	call	c_lgadc
3301                     ; 1563               REG_SetValue(&VerifyUnderCount, REG_ID_C_UNDER_COUNT);
3302  0ed1 4b10          	push	#16
3305  0ed3 2017          	jra	L3551
3306  0ed5               L1551:
3307                     ; 1567               uint32_t VerifyOverCount = 0;
3308  0ed5 1f03          	ldw	(OFST-17,sp),x
3309  0ed7 1f01          	ldw	(OFST-19,sp),x
3310                     ; 1568               REG_GetValue(&VerifyOverCount, REG_ID_C_OVER_COUNT);
3311  0ed9 4b0f          	push	#15
3312  0edb 96            	ldw	x,sp
3313  0edc 1c0002        	addw	x,#OFST-18
3314  0edf cd0000        	call	_REG_GetValue
3316  0ee2 84            	pop	a
3317                     ; 1569               VerifyOverCount++;
3318  0ee3 96            	ldw	x,sp
3319  0ee4 5c            	incw	x
3320  0ee5 a601          	ld	a,#1
3321  0ee7 cd0000        	call	c_lgadc
3323                     ; 1570               REG_SetValue(&VerifyOverCount, REG_ID_C_OVER_COUNT);
3324  0eea 4b0f          	push	#15
3326  0eec               L3551:
3327  0eec 96            	ldw	x,sp
3328  0eed 1c0002        	addw	x,#OFST-18
3329  0ef0 cd0000        	call	_REG_SetValue
3330  0ef3 84            	pop	a
3331                     ; 1573             return(SwitchHomeSubProcess(param, &msg));
3334  0ef4 cc0dfd        	jp	LC043
3335  0ef7               L3451:
3336                     ; 1576         else if(cntMode == COUNT_MODE_B)
3337  0ef7 a101          	cp	a,#1
3338  0ef9 260f          	jrne	L7551
3339                     ; 1578           UI_MSG_T msg = {0, UIMSG_INIT};
3340  0efb c600f6        	ld	a,L7641_msg
3341  0efe 6b09          	ld	(OFST-11,sp),a
3342  0f00 c600f7        	ld	a,L7641_msg+1
3343  0f03 6b0a          	ld	(OFST-10,sp),a
3344                     ; 1579           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];
3345  0f05 ae1293        	ldw	x,#L33_ProcHomeBeep
3346                     ; 1581           return(SwitchHomeSubProcess(param, &msg));
3349  0f08 2011          	jp	LC046
3350  0f0a               L7551:
3351                     ; 1583         else if(cntMode == COUNT_MODE_F)
3352  0f0a a102          	cp	a,#2
3353  0f0c 2617          	jrne	L3651
3354                     ; 1585           UI_MSG_T msg = {0, UIMSG_INIT};
3355  0f0e c600f8        	ld	a,L1741_msg
3356  0f11 6b09          	ld	(OFST-11,sp),a
3357  0f13 c600f9        	ld	a,L1741_msg+1
3358                     ; 1586           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3359  0f16               LC047:
3360  0f16 6b0a          	ld	(OFST-10,sp),a
3361  0f18 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3362  0f1b               LC046:
3363  0f1b cf0000        	ldw	L74_pfProcHome,x
3364                     ; 1588           return(SwitchHomeSubProcess(param, &msg));
3365  0f1e               LC045:
3366  0f1e 96            	ldw	x,sp
3367  0f1f 1c0009        	addw	x,#OFST-11
3370  0f22 cc0e01        	jp	LC042
3371  0f25               L3651:
3372                     ; 1590         else if(cntMode == COUNT_MODE_S)
3373  0f25 a103          	cp	a,#3
3374  0f27 2641          	jrne	L7651
3375                     ; 1592           uint32_t noteSetCount = 0;
3376  0f29 5f            	clrw	x
3377  0f2a 1f09          	ldw	(OFST-11,sp),x
3378  0f2c 1f07          	ldw	(OFST-13,sp),x
3379                     ; 1593           REG_GetValue(&noteSetCount, REG_ID_NOTE_S_COUNT);
3380  0f2e 4b07          	push	#7
3381  0f30 96            	ldw	x,sp
3382  0f31 1c0008        	addw	x,#OFST-12
3383  0f34 cd0000        	call	_REG_GetValue
3385  0f37 84            	pop	a
3386                     ; 1595           if(sensorCounter == noteSetCount)
3387  0f38 96            	ldw	x,sp
3388  0f39 1c000f        	addw	x,#OFST-5
3389  0f3c cd0000        	call	c_ltor
3391  0f3f 96            	ldw	x,sp
3392  0f40 1c0007        	addw	x,#OFST-13
3393  0f43 cd0000        	call	c_lcmp
3395  0f46 2613          	jrne	L1751
3396                     ; 1597             UI_MSG_T msg = {0, UIMSG_INIT};
3397  0f48 c600fa        	ld	a,L3741_msg
3398  0f4b 6b05          	ld	(OFST-15,sp),a
3399  0f4d c600fb        	ld	a,L3741_msg+1
3400  0f50 6b06          	ld	(OFST-14,sp),a
3401                     ; 1598             pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_START_S_COIL];
3402  0f52 ae102e        	ldw	x,#L72_ProcHomeStartSCoil
3403  0f55               LC044:
3404  0f55 cf0000        	ldw	L74_pfProcHome,x
3405                     ; 1600             return(SwitchHomeSubProcess(param, &msg));
3408  0f58 cc0dfd        	jp	LC043
3409  0f5b               L1751:
3410                     ; 1604             UI_MSG_T msg = {0, UIMSG_INIT};
3411  0f5b c600fc        	ld	a,L5741_msg
3412  0f5e 6b05          	ld	(OFST-15,sp),a
3413  0f60 c600fd        	ld	a,L5741_msg+1
3414  0f63 6b06          	ld	(OFST-14,sp),a
3415                     ; 1605             pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];
3416  0f65 ae1293        	ldw	x,#L33_ProcHomeBeep
3417                     ; 1607             return(SwitchHomeSubProcess(param, &msg));
3420  0f68 20eb          	jp	LC044
3421  0f6a               L7651:
3422                     ; 1610         else if(cntMode == COUNT_MODE_V)
3423  0f6a a104          	cp	a,#4
3424  0f6c 262c          	jrne	L3251
3425                     ; 1612           UI_MSG_T msg = {0, UIMSG_INIT};
3426  0f6e c600fe        	ld	a,L7741_msg
3427  0f71 6b09          	ld	(OFST-11,sp),a
3428  0f73 c600ff        	ld	a,L7741_msg+1
3429                     ; 1613           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3430                     ; 1615           return(SwitchHomeSubProcess(param, &msg));
3433  0f76 209e          	jp	LC047
3434  0f78               L1051:
3435                     ; 1623       if((uint8_t)pMsg->param == UI_SW_PRESS)
3436  0f78 f6            	ld	a,(x)
3437  0f79 261f          	jrne	L3251
3438                     ; 1625         UI_MSG_T msg = {0, UIMSG_INIT};
3439  0f7b c60100        	ld	a,L3051_msg
3440  0f7e 6b09          	ld	(OFST-11,sp),a
3441  0f80 c60101        	ld	a,L3051_msg+1
3442  0f83 6b0a          	ld	(OFST-10,sp),a
3443                     ; 1627         UI_SetRefreshMsg(0);
3444  0f85 ad28          	call	LC050
3445                     ; 1629         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3446  0f87 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3447  0f8a cf0000        	ldw	L74_pfProcHome,x
3448                     ; 1631         if(flagUVDetect == TRUE)
3449  0f8d 7b13          	ld	a,(OFST-1,sp)
3450  0f8f 4a            	dec	a
3451  0f90 2604          	jrne	L3061
3452                     ; 1633           BSP_UV_DetectEnable(FALSE);
3453  0f92 72185005      	bset	20485,#4
3454  0f96               L3061:
3455                     ; 1636         BSP_S_MotorEnable(FALSE);
3456  0f96 ad0a          	call	LC049
3457                     ; 1641         return(SwitchHomeSubProcess(param, &msg));
3460  0f98 2084          	jp	LC045
3461  0f9a               L3251:
3462                     ; 1647   HomeDispCounter();
3463  0f9a cd0010        	call	L35_HomeDispCounter
3465                     ; 1649   return UI_RC_CONTINUE;
3466  0f9d a601          	ld	a,#1
3468  0f9f cc0e08        	jra	L467
3469  0fa2               LC049:
3470  0fa2 721e5005      	bset	20485,#7
3471                     ; 1637         BSP_V_PumpEnable(FALSE);
3472  0fa6 72105019      	bset	20505,#0
3473                     ; 140   FlagSensorEn = se;
3474  0faa 725f0000      	clr	_FlagSensorEn
3475  0fae 81            	ret	
3476  0faf               LC050:
3477  0faf 5f            	clrw	x
3478  0fb0 89            	pushw	x
3479  0fb1 89            	pushw	x
3480  0fb2 cd0000        	call	_UI_SetRefreshMsg
3482  0fb5 5b04          	addw	sp,#4
3483  0fb7 81            	ret	
3485                     	switch	.const
3486  0102               L1161_msg:
3487  0102 00            	dc.b	0
3488  0103 00            	dc.b	0
3489  0104               L7161_msg:
3490  0104 00            	dc.b	0
3491  0105 00            	dc.b	0
3494                     ; 1660 static uint8_t ProcHomeStartBCoil(void *param, UI_MSG_T *pMsg)
3494                     ; 1661 {
3495                     	switch	.text
3496  0fb8               L32_ProcHomeStartBCoil:
3497  0fb8 89            	pushw	x
3498  0fb9 5203          	subw	sp,#3
3499       00000003      OFST:	set	3
3501                     ; 1664   switch(pMsg->message)
3502  0fbb 1e08          	ldw	x,(OFST+5,sp)
3503  0fbd e601          	ld	a,(1,x)
3505                     ; 1705     break;
3506  0fbf 2708          	jreq	L5061
3507  0fc1 4a            	dec	a
3508  0fc2 2716          	jreq	L7061
3509  0fc4 4a            	dec	a
3510  0fc5 2733          	jreq	L5161
3511  0fc7 205e          	jra	L3261
3512  0fc9               L5061:
3513                     ; 1668       BSP_B_CoilEnable(TRUE);
3514  0fc9 72175014      	bres	20500,#3
3515                     ; 1670       UI_SetRefreshMsg(BATCH_COIL_TIME);
3516  0fcd ae01f4        	ldw	x,#500
3517  0fd0 89            	pushw	x
3518  0fd1 5f            	clrw	x
3519  0fd2 89            	pushw	x
3520  0fd3 cd0000        	call	_UI_SetRefreshMsg
3522  0fd6 5b04          	addw	sp,#4
3523                     ; 1672     break;
3524  0fd8 204d          	jra	L3261
3525  0fda               L7061:
3526                     ; 130   return FlagUvDetect;
3527  0fda c60000        	ld	a,_FlagUvDetect
3528  0fdd 6b03          	ld	(OFST+0,sp),a
3531                     ; 1678       BSP_B_CoilEnable(FALSE);
3532  0fdf 72165014      	bset	20500,#3
3533                     ; 1680       if(flagUVDetect == TRUE)
3534  0fe3 4a            	dec	a
3535  0fe4 2641          	jrne	L3261
3536                     ; 1682         UI_MSG_T msg = {0, UIMSG_INIT};
3537  0fe6 c60102        	ld	a,L1161_msg
3538  0fe9 6b01          	ld	(OFST-2,sp),a
3539  0feb c60103        	ld	a,L1161_msg+1
3540  0fee 6b02          	ld	(OFST-1,sp),a
3541                     ; 1683         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_BEEP];
3542  0ff0 ae1293        	ldw	x,#L33_ProcHomeBeep
3543  0ff3 cf0000        	ldw	L74_pfProcHome,x
3544                     ; 1685         return (SwitchHomeSubProcess(param, &msg));
3545  0ff6 96            	ldw	x,sp
3546  0ff7 5c            	incw	x
3549  0ff8 2023          	jp	LC051
3550  0ffa               L5161:
3551                     ; 1692       if((uint8_t)pMsg->param == UI_SW_PRESS)
3552  0ffa f6            	ld	a,(x)
3553  0ffb 262a          	jrne	L3261
3554                     ; 1694         UI_MSG_T msg = {0, UIMSG_INIT};
3555  0ffd c60104        	ld	a,L7161_msg
3556  1000 6b02          	ld	(OFST-1,sp),a
3557  1002 c60105        	ld	a,L7161_msg+1
3558  1005 6b03          	ld	(OFST+0,sp),a
3559                     ; 1696         BSP_B_CoilEnable(FALSE);
3560  1007 72165014      	bset	20500,#3
3561                     ; 1698         UI_SetRefreshMsg(0);
3562  100b 5f            	clrw	x
3563  100c 89            	pushw	x
3564  100d 89            	pushw	x
3565  100e cd0000        	call	_UI_SetRefreshMsg
3567  1011 5b04          	addw	sp,#4
3568                     ; 1700         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3569  1013 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3570  1016 cf0000        	ldw	L74_pfProcHome,x
3571                     ; 1702         return (SwitchHomeSubProcess(param, &msg));
3572  1019 96            	ldw	x,sp
3573  101a 1c0002        	addw	x,#OFST-1
3575  101d               LC051:
3576  101d 89            	pushw	x
3577  101e 1e06          	ldw	x,(OFST+3,sp)
3578  1020 cd0000        	call	L15_SwitchHomeSubProcess
3579  1023 85            	popw	x
3581  1024               L2001:
3582  1024 5b05          	addw	sp,#5
3583  1026 81            	ret	
3584  1027               L3261:
3585                     ; 1709   HomeDispCounter();
3586  1027 cd0010        	call	L35_HomeDispCounter
3588                     ; 1711   return UI_RC_CONTINUE;
3589  102a a601          	ld	a,#1
3591  102c 20f6          	jra	L2001
3593                     	switch	.const
3594  0106               L5361_msg:
3595  0106 00            	dc.b	0
3596  0107 00            	dc.b	0
3597  0108               L1461_msg:
3598  0108 00            	dc.b	0
3599  0109 00            	dc.b	0
3602                     ; 1722 static uint8_t ProcHomeStartSCoil(void *param, UI_MSG_T *pMsg)
3602                     ; 1723 {
3603                     	switch	.text
3604  102e               L72_ProcHomeStartSCoil:
3605  102e 89            	pushw	x
3606  102f 5206          	subw	sp,#6
3607       00000006      OFST:	set	6
3609                     ; 1726   uint32_t stampEnable = FALSE;
3610  1031 5f            	clrw	x
3611  1032 1f05          	ldw	(OFST-1,sp),x
3612  1034 1f03          	ldw	(OFST-3,sp),x
3613                     ; 1727   REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
3614  1036 4b02          	push	#2
3615  1038 96            	ldw	x,sp
3616  1039 1c0004        	addw	x,#OFST-2
3617  103c cd0000        	call	_REG_GetValue
3619  103f 84            	pop	a
3620                     ; 1729   switch(pMsg->message)
3621  1040 1e0b          	ldw	x,(OFST+5,sp)
3622  1042 e601          	ld	a,(1,x)
3624                     ; 1774     break;
3625  1044 2708          	jreq	L1361
3626  1046 4a            	dec	a
3627  1047 271b          	jreq	L3361
3628  1049 4a            	dec	a
3629  104a 272f          	jreq	L7361
3630  104c 205d          	jra	L5461
3631  104e               L1361:
3632                     ; 1733       if(stampEnable == TRUE)
3633  104e 96            	ldw	x,sp
3634  104f ad61          	call	LC054
3636  1051 2604          	jrne	L7461
3637                     ; 1735         BSP_S_CoilEnable(TRUE);
3638  1053 72195014      	bres	20500,#4
3639  1057               L7461:
3640                     ; 1738       UI_SetRefreshMsg(STAMP_COIL_TIME);
3641  1057 ae01f4        	ldw	x,#500
3642  105a 89            	pushw	x
3643  105b 5f            	clrw	x
3644  105c 89            	pushw	x
3645  105d cd0000        	call	_UI_SetRefreshMsg
3647  1060 5b04          	addw	sp,#4
3648                     ; 1740     break;
3649  1062 2047          	jra	L5461
3650  1064               L3361:
3651                     ; 1744       UI_MSG_T msg = {0, UIMSG_INIT};
3652  1064 c60106        	ld	a,L5361_msg
3653  1067 6b01          	ld	(OFST-5,sp),a
3654  1069 c60107        	ld	a,L5361_msg+1
3655  106c 6b02          	ld	(OFST-4,sp),a
3656                     ; 1745       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3657  106e ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3658  1071 cf0000        	ldw	L74_pfProcHome,x
3659                     ; 1747       if(stampEnable == TRUE)
3660  1074 96            	ldw	x,sp
3661  1075 ad3b          	call	LC054
3663  1077 2626          	jrne	L5561
3664                     ; 1749         BSP_S_CoilEnable(FALSE);
3665                     ; 1752       return (SwitchHomeSubProcess(param, &msg));
3668  1079 2020          	jp	LC053
3669  107b               L7361:
3670                     ; 1758       if((uint8_t)pMsg->param == UI_SW_PRESS)
3671  107b f6            	ld	a,(x)
3672  107c 262d          	jrne	L5461
3673                     ; 1760         UI_MSG_T msg = {0, UIMSG_INIT};
3674  107e c60108        	ld	a,L1461_msg
3675  1081 6b01          	ld	(OFST-5,sp),a
3676  1083 c60109        	ld	a,L1461_msg+1
3677  1086 6b02          	ld	(OFST-4,sp),a
3678                     ; 1762         UI_SetRefreshMsg(0);
3679  1088 5f            	clrw	x
3680  1089 89            	pushw	x
3681  108a 89            	pushw	x
3682  108b cd0000        	call	_UI_SetRefreshMsg
3684  108e 5b04          	addw	sp,#4
3685                     ; 1764         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
3686  1090 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
3687  1093 cf0000        	ldw	L74_pfProcHome,x
3688                     ; 1766         if(stampEnable == TRUE)
3689  1096 96            	ldw	x,sp
3690  1097 ad19          	call	LC054
3692  1099 2604          	jrne	L5561
3693                     ; 1768           BSP_S_CoilEnable(FALSE);
3694  109b               LC053:
3695  109b 72185014      	bset	20500,#4
3696  109f               L5561:
3697                     ; 1771         return (SwitchHomeSubProcess(param, &msg));
3699  109f 96            	ldw	x,sp
3700  10a0 5c            	incw	x
3701  10a1 89            	pushw	x
3702  10a2 1e09          	ldw	x,(OFST+3,sp)
3703  10a4 cd0000        	call	L15_SwitchHomeSubProcess
3704  10a7 85            	popw	x
3706  10a8               L2201:
3707  10a8 5b08          	addw	sp,#8
3708  10aa 81            	ret	
3709  10ab               L5461:
3710                     ; 1778   HomeDispCounter();
3711  10ab cd0010        	call	L35_HomeDispCounter
3713                     ; 1780   return UI_RC_CONTINUE;
3714  10ae a601          	ld	a,#1
3716  10b0 20f6          	jra	L2201
3717  10b2               LC054:
3718  10b2 1c0003        	addw	x,#OFST-3
3719  10b5 cd0000        	call	c_ltor
3721  10b8 ae0058        	ldw	x,#L404
3722  10bb cc0000        	jp	c_lcmp
3724                     	switch	.const
3725  010a               L5661_msg:
3726  010a 00            	dc.b	0
3727  010b 00            	dc.b	0
3728  010c               L1761_msg:
3729  010c 00            	dc.b	0
3730  010d 00            	dc.b	0
3734                     ; 1791 static uint8_t ProcHomeStopHMotor(void *param, UI_MSG_T *pMsg)
3734                     ; 1792 {
3735                     	switch	.text
3736  10be               L52_ProcHomeStopHMotor:
3737  10be 89            	pushw	x
3738  10bf 5214          	subw	sp,#20
3739       00000014      OFST:	set	20
3741                     ; 1795   switch(pMsg->message)
3742  10c1 1e19          	ldw	x,(OFST+5,sp)
3743  10c3 e601          	ld	a,(1,x)
3745                     ; 1907     default:
3745                     ; 1908     break;
3746  10c5 270a          	jreq	L7561
3747  10c7 4a            	dec	a
3748  10c8 2719          	jreq	L3661
3749  10ca a002          	sub	a,#2
3750  10cc 2730          	jreq	L7661
3751  10ce cc125d        	jra	L5071
3752  10d1               L7561:
3753                     ; 1799       UI_SetRefreshMsg(CAM_SW_TIMEOUT);
3754  10d1 ae0bb8        	ldw	x,#3000
3755  10d4 89            	pushw	x
3756  10d5 5f            	clrw	x
3757  10d6 89            	pushw	x
3758  10d7 cd0000        	call	_UI_SetRefreshMsg
3760  10da 5b04          	addw	sp,#4
3761                     ; 1800       BSP_H_MotorEnable(TRUE);
3762  10dc 721d5005      	bres	20485,#6
3763                     ; 1802     break;
3764  10e0 cc125d        	jra	L5071
3765                     ; 1804     case UIMSG_SW_RESET:
3765                     ; 1805     break;
3766  10e3               L3661:
3767                     ; 1809       UI_MSG_T msg = {0, UIMSG_INIT};
3768  10e3 c6010a        	ld	a,L5661_msg
3769  10e6 6b13          	ld	(OFST-1,sp),a
3770  10e8 c6010b        	ld	a,L5661_msg+1
3771  10eb 6b14          	ld	(OFST+0,sp),a
3772                     ; 1810       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_ERROR_01];
3773  10ed ae130e        	ldw	x,#L53_ProcHomeError01
3774  10f0 cf0000        	ldw	L74_pfProcHome,x
3775                     ; 1812       BSP_H_MotorEnable(FALSE);
3776  10f3 721c5005      	bset	20485,#6
3777                     ; 1814       return(SwitchHomeSubProcess(param, &msg));
3778  10f7 96            	ldw	x,sp
3779  10f8 1c0013        	addw	x,#OFST-1
3782  10fb cc1253        	jp	LC057
3783  10fe               L7661:
3784                     ; 1820       if((uint8_t)pMsg->param == UI_SW_PRESS)
3785  10fe f6            	ld	a,(x)
3786  10ff 26df          	jrne	L5071
3787                     ; 1822         UI_MSG_T msg = {0, UIMSG_INIT};
3788  1101 c6010c        	ld	a,L1761_msg
3789  1104 6b09          	ld	(OFST-11,sp),a
3790  1106 c6010d        	ld	a,L1761_msg+1
3791  1109 6b0a          	ld	(OFST-10,sp),a
3792                     ; 1823         uint32_t accSensorCount = 0;
3793  110b 5f            	clrw	x
3794  110c 1f0e          	ldw	(OFST-6,sp),x
3795  110e 1f0c          	ldw	(OFST-8,sp),x
3796                     ; 190   return SensorCounter;
3797  1110 ce0002        	ldw	x,_SensorCounter+2
3798  1113 1f13          	ldw	(OFST-1,sp),x
3799  1115 ce0000        	ldw	x,_SensorCounter
3800  1118 1f11          	ldw	(OFST-3,sp),x
3803                     ; 110   return FlagAddCount;
3804  111a c60000        	ld	a,_FlagAddCount
3805  111d 6b0b          	ld	(OFST-9,sp),a
3808                     ; 170   return CounterMode;
3809  111f c60000        	ld	a,_CounterMode
3810  1122 6b10          	ld	(OFST-4,sp),a
3813                     ; 1829         BSP_H_MotorEnable(FALSE);
3814  1124 721c5005      	bset	20485,#6
3815                     ; 1830         UI_SetRefreshMsg(0);
3816  1128 5f            	clrw	x
3817  1129 89            	pushw	x
3818  112a 89            	pushw	x
3819  112b cd0000        	call	_UI_SetRefreshMsg
3821  112e 5b04          	addw	sp,#4
3822                     ; 1832         REG_GetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
3823  1130 7b10          	ld	a,(OFST-4,sp)
3824  1132 5f            	clrw	x
3825  1133 97            	ld	xl,a
3826  1134 d6001e        	ld	a,(L34_REG_ID_ACC_CTR_LIST,x)
3827  1137 88            	push	a
3828  1138 96            	ldw	x,sp
3829  1139 1c000d        	addw	x,#OFST-7
3830  113c cd0000        	call	_REG_GetValue
3832  113f 84            	pop	a
3833                     ; 1834         if(flagAddCount == TRUE)
3834  1140 7b0b          	ld	a,(OFST-9,sp)
3835  1142 4a            	dec	a
3836  1143 2703cc11ff    	jrne	L1171
3837                     ; 1836           if(cntMode == COUNT_MODE_C)
3838  1148 7b10          	ld	a,(OFST-4,sp)
3839  114a 2624          	jrne	L3171
3840                     ; 1838             uint32_t noteSetCount = 0;
3841  114c 5f            	clrw	x
3842  114d 1f07          	ldw	(OFST-13,sp),x
3843  114f 1f05          	ldw	(OFST-15,sp),x
3844                     ; 1839             REG_GetValue(&noteSetCount, REG_ID_NOTE_C_COUNT);
3845  1151 4b05          	push	#5
3846  1153 96            	ldw	x,sp
3847  1154 1c0006        	addw	x,#OFST-14
3848  1157 cd0000        	call	_REG_GetValue
3850  115a 84            	pop	a
3851                     ; 1841             if(sensorCounter == noteSetCount)
3852  115b 96            	ldw	x,sp
3853  115c 1c0011        	addw	x,#OFST-3
3854  115f cd0000        	call	c_ltor
3856  1162 96            	ldw	x,sp
3857  1163 1c0005        	addw	x,#OFST-15
3858  1166 cd0000        	call	c_lcmp
3860  1169 2703cc11ef    	jrne	L7171
3861                     ; 1843               accSensorCount += sensorCounter;
3864  116e 2029          	jp	LC056
3865  1170               L3171:
3866                     ; 1846           else if(cntMode == COUNT_MODE_B)
3867  1170 a101          	cp	a,#1
3868  1172 2621          	jrne	L1271
3869                     ; 1848             uint32_t noteSetCount = 0;
3870  1174 5f            	clrw	x
3871  1175 1f07          	ldw	(OFST-13,sp),x
3872  1177 1f05          	ldw	(OFST-15,sp),x
3873                     ; 1849             REG_GetValue(&noteSetCount, REG_ID_NOTE_B_COUNT);
3874  1179 4b06          	push	#6
3875  117b 96            	ldw	x,sp
3876  117c 1c0006        	addw	x,#OFST-14
3877  117f cd0000        	call	_REG_GetValue
3879  1182 84            	pop	a
3880                     ; 1851             if(sensorCounter == noteSetCount)
3881  1183 96            	ldw	x,sp
3882  1184 1c0011        	addw	x,#OFST-3
3883  1187 cd0000        	call	c_ltor
3885  118a 96            	ldw	x,sp
3886  118b 1c0005        	addw	x,#OFST-15
3887  118e cd0000        	call	c_lcmp
3889  1191 265c          	jrne	L7171
3890                     ; 1853               accSensorCount += sensorCounter;
3893  1193 2004          	jp	LC056
3894  1195               L1271:
3895                     ; 1856           else if(cntMode == COUNT_MODE_F)
3896  1195 a102          	cp	a,#2
3897  1197 2609          	jrne	L7271
3898                     ; 1858             accSensorCount += sensorCounter;
3899  1199               LC056:
3900  1199 96            	ldw	x,sp
3901  119a 1c0011        	addw	x,#OFST-3
3902  119d cd0000        	call	c_ltor
3906  11a0 2046          	jp	LC055
3907  11a2               L7271:
3908                     ; 1860           else if(cntMode == COUNT_MODE_S)
3909  11a2 a103          	cp	a,#3
3910  11a4 2621          	jrne	L3371
3911                     ; 1862             uint32_t noteSetCount = 0;
3912  11a6 5f            	clrw	x
3913  11a7 1f07          	ldw	(OFST-13,sp),x
3914  11a9 1f05          	ldw	(OFST-15,sp),x
3915                     ; 1863             REG_GetValue(&noteSetCount, REG_ID_NOTE_S_COUNT);
3916  11ab 4b07          	push	#7
3917  11ad 96            	ldw	x,sp
3918  11ae 1c0006        	addw	x,#OFST-14
3919  11b1 cd0000        	call	_REG_GetValue
3921  11b4 84            	pop	a
3922                     ; 1865             if(sensorCounter == noteSetCount)
3923  11b5 96            	ldw	x,sp
3924  11b6 1c0011        	addw	x,#OFST-3
3925  11b9 cd0000        	call	c_ltor
3927  11bc 96            	ldw	x,sp
3928  11bd 1c0005        	addw	x,#OFST-15
3929  11c0 cd0000        	call	c_lcmp
3931  11c3 262a          	jrne	L7171
3932                     ; 1867               accSensorCount += sensorCounter;
3935  11c5 20d2          	jp	LC056
3936  11c7               L3371:
3937                     ; 1871           else if(cntMode == COUNT_MODE_V)
3938  11c7 a104          	cp	a,#4
3939  11c9 2624          	jrne	L7171
3940                     ; 1873             uint32_t noteSetCount = 0;
3941  11cb 5f            	clrw	x
3942  11cc 1f07          	ldw	(OFST-13,sp),x
3943  11ce 1f05          	ldw	(OFST-15,sp),x
3944                     ; 1874             REG_GetValue(&noteSetCount, REG_ID_NOTE_V_COUNT);
3945  11d0 4b08          	push	#8
3946  11d2 96            	ldw	x,sp
3947  11d3 1c0006        	addw	x,#OFST-14
3948  11d6 cd0000        	call	_REG_GetValue
3950  11d9 84            	pop	a
3951                     ; 1876             accSensorCount += (sensorCounter * noteSetCount);
3952  11da 96            	ldw	x,sp
3953  11db 1c0011        	addw	x,#OFST-3
3954  11de cd0000        	call	c_ltor
3956  11e1 96            	ldw	x,sp
3957  11e2 1c0005        	addw	x,#OFST-15
3958  11e5 cd0000        	call	c_lmul
3960  11e8               LC055:
3961  11e8 96            	ldw	x,sp
3962  11e9 1c000c        	addw	x,#OFST-8
3963  11ec cd0000        	call	c_lgadd
3965  11ef               L7171:
3966                     ; 1879           REG_SetValue(&accSensorCount, REG_ID_ACC_CTR_LIST[cntMode]);
3967  11ef 7b10          	ld	a,(OFST-4,sp)
3968  11f1 5f            	clrw	x
3969  11f2 97            	ld	xl,a
3970  11f3 d6001e        	ld	a,(L34_REG_ID_ACC_CTR_LIST,x)
3971  11f6 88            	push	a
3972  11f7 96            	ldw	x,sp
3973  11f8 1c000d        	addw	x,#OFST-7
3974  11fb cd0000        	call	_REG_SetValue
3976  11fe 84            	pop	a
3977  11ff               L1171:
3978                     ; 1882         if(cntMode == COUNT_MODE_V)
3979  11ff 7b10          	ld	a,(OFST-4,sp)
3980  1201 a104          	cp	a,#4
3981  1203 263a          	jrne	L3471
3982                     ; 1884           uint32_t valueCounter = 0, noteSetCount = 0;
3983  1205 5f            	clrw	x
3984  1206 1f07          	ldw	(OFST-13,sp),x
3985  1208 1f05          	ldw	(OFST-15,sp),x
3987  120a 1f03          	ldw	(OFST-17,sp),x
3988  120c 1f01          	ldw	(OFST-19,sp),x
3989                     ; 1886           REG_GetValue(&valueCounter, REG_ID_VALUE_COUNTER);
3990  120e 4b04          	push	#4
3991  1210 96            	ldw	x,sp
3992  1211 1c0006        	addw	x,#OFST-14
3993  1214 cd0000        	call	_REG_GetValue
3995  1217 84            	pop	a
3996                     ; 1887           REG_GetValue(&noteSetCount, REG_ID_NOTE_V_COUNT);
3997  1218 4b08          	push	#8
3998  121a 96            	ldw	x,sp
3999  121b 1c0002        	addw	x,#OFST-18
4000  121e cd0000        	call	_REG_GetValue
4002  1221 84            	pop	a
4003                     ; 1889           valueCounter += (sensorCounter * noteSetCount);
4004  1222 96            	ldw	x,sp
4005  1223 1c0011        	addw	x,#OFST-3
4006  1226 cd0000        	call	c_ltor
4008  1229 96            	ldw	x,sp
4009  122a 5c            	incw	x
4010  122b cd0000        	call	c_lmul
4012  122e 96            	ldw	x,sp
4013  122f 1c0005        	addw	x,#OFST-15
4014  1232 cd0000        	call	c_lgadd
4016                     ; 1890           REG_SetValue(&valueCounter, REG_ID_VALUE_COUNTER);
4017  1235 4b04          	push	#4
4018  1237 96            	ldw	x,sp
4019  1238 1c0006        	addw	x,#OFST-14
4020  123b cd0000        	call	_REG_SetValue
4022  123e 84            	pop	a
4023  123f               L3471:
4024                     ; 1893         if(flagAddCount == TRUE)
4025  123f 7b0b          	ld	a,(OFST-9,sp)
4026  1241 4a            	dec	a
4027  1242 2605          	jrne	L5471
4028                     ; 1895           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_WRITE_MEMORY];
4029  1244 ae1264        	ldw	x,#L13_ProcHomeWriteMemory
4031  1247 2003          	jra	L7471
4032  1249               L5471:
4033                     ; 1899           pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
4034  1249 ae0736        	ldw	x,#L31_ProcHomeIdle
4035  124c               L7471:
4036  124c cf0000        	ldw	L74_pfProcHome,x
4037                     ; 1902         return (SwitchHomeSubProcess(param, &msg));
4038  124f 96            	ldw	x,sp
4039  1250 1c0009        	addw	x,#OFST-11
4041  1253               LC057:
4042  1253 89            	pushw	x
4043  1254 1e17          	ldw	x,(OFST+3,sp)
4044  1256 cd0000        	call	L15_SwitchHomeSubProcess
4045  1259 85            	popw	x
4047  125a               L2601:
4048  125a 5b16          	addw	sp,#22
4049  125c 81            	ret	
4050                     ; 1907     default:
4050                     ; 1908     break;
4051  125d               L5071:
4052                     ; 1911   HomeDispCounter();
4053  125d cd0010        	call	L35_HomeDispCounter
4055                     ; 1913   return UI_RC_CONTINUE;
4056  1260 a601          	ld	a,#1
4058  1262 20f6          	jra	L2601
4060                     	switch	.const
4061  010e               L3571_msg:
4062  010e 00            	dc.b	0
4063  010f 00            	dc.b	0
4065                     ; 1924 static uint8_t ProcHomeWriteMemory(void *param, UI_MSG_T *pMsg)
4065                     ; 1925 {
4066                     	switch	.text
4067  1264               L13_ProcHomeWriteMemory:
4068  1264 89            	pushw	x
4069  1265 89            	pushw	x
4070       00000002      OFST:	set	2
4072                     ; 1928   switch(pMsg->message)
4073  1266 1e07          	ldw	x,(OFST+5,sp)
4074  1268 e601          	ld	a,(1,x)
4075  126a 2622          	jrne	L1671
4077                     ; 1934       RET_WriteRetEnbale(TRUE);
4078  126c 4c            	inc	a
4079  126d cd0000        	call	_RET_WriteRetEnbale
4081                     ; 1943       UI_MSG_T msg = {0, UIMSG_INIT};
4082  1270 c6010e        	ld	a,L3571_msg
4083  1273 6b01          	ld	(OFST-1,sp),a
4084  1275 c6010f        	ld	a,L3571_msg+1
4085  1278 6b02          	ld	(OFST+0,sp),a
4086                     ; 1947       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
4087  127a ae0736        	ldw	x,#L31_ProcHomeIdle
4088  127d cf0000        	ldw	L74_pfProcHome,x
4089                     ; 1948       HomeDispCounter();
4090  1280 cd0010        	call	L35_HomeDispCounter
4092                     ; 1950       return (SwitchHomeSubProcess(param, &msg));
4093  1283 96            	ldw	x,sp
4094  1284 5c            	incw	x
4095  1285 89            	pushw	x
4096  1286 1e05          	ldw	x,(OFST+3,sp)
4097  1288 cd0000        	call	L15_SwitchHomeSubProcess
4099  128b 85            	popw	x
4101  128c 2002          	jra	L4701
4102                     ; 1954     default:
4102                     ; 1955       break;
4103  128e               L1671:
4104                     ; 1958   return UI_RC_CONTINUE;
4105  128e a601          	ld	a,#1
4107  1290               L4701:
4108  1290 5b04          	addw	sp,#4
4109  1292 81            	ret	
4111                     	switch	.data
4112  000f               L3671_BeepOn:
4113  000f 00            	dc.b	0
4114                     	switch	.const
4115  0110               L5771_msg:
4116  0110 00            	dc.b	0
4117  0111 00            	dc.b	0
4119                     ; 1969 static uint8_t ProcHomeBeep(void *param, UI_MSG_T *pMsg)
4119                     ; 1970 {
4120                     	switch	.text
4121  1293               L33_ProcHomeBeep:
4122  1293 89            	pushw	x
4123  1294 89            	pushw	x
4124       00000002      OFST:	set	2
4126                     ; 1976   switch(pMsg->message)
4127  1295 1e07          	ldw	x,(OFST+5,sp)
4128  1297 e601          	ld	a,(1,x)
4130                     ; 2017     default:
4130                     ; 2018       break;
4131  1299 2708          	jreq	L5671
4132  129b 4a            	dec	a
4133  129c 2705          	jreq	L5671
4134  129e 4a            	dec	a
4135  129f 2738          	jreq	L3771
4136  12a1 2066          	jra	L5002
4137  12a3               L5671:
4138                     ; 1981       if(BeepOn == TRUE)
4139  12a3 c6000f        	ld	a,L3671_BeepOn
4140  12a6 4a            	dec	a
4141  12a7 2612          	jrne	L7002
4142                     ; 1983         BeepOn = FALSE;
4143  12a9 c7000f        	ld	L3671_BeepOn,a
4144                     ; 1984         HomeDispCounter();
4145  12ac cd0010        	call	L35_HomeDispCounter
4147                     ; 348   BuzzerOnTime = 0;
4148  12af 5f            	clrw	x
4149  12b0 cf0002        	ldw	_BuzzerOnTime+2,x
4150  12b3 cf0000        	ldw	_BuzzerOnTime,x
4151                     ; 1987         UI_SetRefreshMsg(BEEP_OFF_TIME);
4152  12b6 ae02bc        	ldw	x,#700
4155  12b9 2014          	jp	LC058
4156  12bb               L7002:
4157                     ; 1991         BeepOn = TRUE;
4158  12bb 3501000f      	mov	L3671_BeepOn,#1
4159                     ; 1992         DISP_UpperClear();
4160  12bf cd0000        	call	_DISP_UpperClear
4162                     ; 338   BuzzerOnTime = buzzTime;
4163  12c2 ae012c        	ldw	x,#300
4164  12c5 cf0002        	ldw	_BuzzerOnTime+2,x
4165  12c8 5f            	clrw	x
4166  12c9 cf0000        	ldw	_BuzzerOnTime,x
4167                     ; 1995         UI_SetRefreshMsg(BEEP_ON_TIME);
4168  12cc ae012c        	ldw	x,#300
4170  12cf               LC058:
4171  12cf 89            	pushw	x
4172  12d0 5f            	clrw	x
4173  12d1 89            	pushw	x
4174  12d2 cd0000        	call	_UI_SetRefreshMsg
4175  12d5 5b04          	addw	sp,#4
4176  12d7 2030          	jra	L5002
4177  12d9               L3771:
4178                     ; 2002       if((uint8_t)pMsg->param == UI_SW_PRESS)
4179  12d9 f6            	ld	a,(x)
4180  12da 262d          	jrne	L5002
4181                     ; 2004         UI_MSG_T msg = {0, UIMSG_INIT};
4182  12dc c60110        	ld	a,L5771_msg
4183  12df 6b01          	ld	(OFST-1,sp),a
4184  12e1 c60111        	ld	a,L5771_msg+1
4185  12e4 6b02          	ld	(OFST+0,sp),a
4186                     ; 2006 				BeepOn = FALSE;
4187  12e6 725f000f      	clr	L3671_BeepOn
4188                     ; 348   BuzzerOnTime = 0;
4189  12ea 5f            	clrw	x
4190  12eb cf0002        	ldw	_BuzzerOnTime+2,x
4191  12ee cf0000        	ldw	_BuzzerOnTime,x
4192                     ; 2009         UI_SetRefreshMsg(0);
4193  12f1 89            	pushw	x
4194  12f2 89            	pushw	x
4195  12f3 cd0000        	call	_UI_SetRefreshMsg
4197  12f6 5b04          	addw	sp,#4
4198                     ; 2010         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
4199  12f8 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
4200  12fb cf0000        	ldw	L74_pfProcHome,x
4201                     ; 2012         return (SwitchHomeSubProcess(param, &msg));
4202  12fe 96            	ldw	x,sp
4203  12ff 5c            	incw	x
4204  1300 89            	pushw	x
4205  1301 1e05          	ldw	x,(OFST+3,sp)
4206  1303 cd0000        	call	L15_SwitchHomeSubProcess
4208  1306 85            	popw	x
4210  1307 2002          	jra	L4111
4211                     ; 2017     default:
4211                     ; 2018       break;
4212  1309               L5002:
4213                     ; 2021   return UI_RC_CONTINUE;
4214  1309 a601          	ld	a,#1
4216  130b               L4111:
4217  130b 5b04          	addw	sp,#4
4218  130d 81            	ret	
4220                     ; 2033 static uint8_t ProcHomeError01(void *param, UI_MSG_T *pMsg)
4220                     ; 2034 {
4221  130e               L53_ProcHomeError01:
4222  130e 89            	pushw	x
4223       00000000      OFST:	set	0
4225                     ; 2035   switch(pMsg->message)
4226  130f 1e05          	ldw	x,(OFST+5,sp)
4227  1311 e601          	ld	a,(1,x)
4228  1313 260c          	jrne	L3202
4230                     ; 2039       DISP_ClearAll();
4231  1315 cd0000        	call	_DISP_ClearAll
4233                     ; 2041       DISP_UpperPutStr("ERR-1", 0);
4234  1318 4b00          	push	#0
4235  131a ae020a        	ldw	x,#L5202
4236  131d cd0000        	call	_DISP_UpperPutStr
4238  1320 84            	pop	a
4239                     ; 2043     break;
4240                     ; 2045     default:
4240                     ; 2046       break;
4241  1321               L3202:
4242                     ; 2049   return UI_RC_CONTINUE;
4243  1321 a601          	ld	a,#1
4245  1323 85            	popw	x
4246  1324 81            	ret	
4248                     	switch	.data
4249  0010               L7202_BeepOn:
4250  0010 00            	dc.b	0
4251                     	switch	.const
4252  0112               L1402_msg:
4253  0112 00            	dc.b	0
4254  0113 00            	dc.b	0
4256                     ; 2058 static uint8_t ProcHomeError02(void *param, UI_MSG_T *pMsg)
4256                     ; 2059 {
4257                     	switch	.text
4258  1325               L73_ProcHomeError02:
4259  1325 89            	pushw	x
4260  1326 89            	pushw	x
4261       00000002      OFST:	set	2
4263                     ; 2065   switch(pMsg->message)
4264  1327 1e07          	ldw	x,(OFST+5,sp)
4265  1329 e601          	ld	a,(1,x)
4267                     ; 2103     default:
4267                     ; 2104       break;
4268  132b 2708          	jreq	L1302
4269  132d 4a            	dec	a
4270  132e 2705          	jreq	L1302
4271  1330 4a            	dec	a
4272  1331 272a          	jreq	L7302
4273  1333 204f          	jra	L1502
4274  1335               L1302:
4275                     ; 2070       if(BeepOn == TRUE)
4276  1335 c60010        	ld	a,L7202_BeepOn
4277  1338 4a            	dec	a
4278  1339 260f          	jrne	L3502
4279                     ; 2072         BeepOn = FALSE;
4280  133b c70010        	ld	L7202_BeepOn,a
4281                     ; 348   BuzzerOnTime = 0;
4282  133e 5f            	clrw	x
4283  133f cf0002        	ldw	_BuzzerOnTime+2,x
4284  1342 cf0000        	ldw	_BuzzerOnTime,x
4285                     ; 2075         UI_SetRefreshMsg(BEEP_OFF_TIME);
4286  1345 ae02bc        	ldw	x,#700
4289  1348 2009          	jp	LC059
4290  134a               L3502:
4291                     ; 2079         BeepOn = TRUE;
4292  134a 35010010      	mov	L7202_BeepOn,#1
4293                     ; 338   BuzzerOnTime = buzzTime;
4294  134e ad45          	call	LC060
4295                     ; 2082         UI_SetRefreshMsg(BEEP_ON_TIME);
4296  1350 ae012c        	ldw	x,#300
4298  1353               LC059:
4299  1353 89            	pushw	x
4300  1354 5f            	clrw	x
4301  1355 89            	pushw	x
4302  1356 cd0000        	call	_UI_SetRefreshMsg
4303  1359 5b04          	addw	sp,#4
4304  135b 2027          	jra	L1502
4305  135d               L7302:
4306                     ; 2089       if((uint8_t)pMsg->param == UI_SW_PRESS)
4307  135d f6            	ld	a,(x)
4308  135e 2624          	jrne	L1502
4309                     ; 2091         UI_MSG_T msg = {0, UIMSG_INIT};
4310  1360 c60112        	ld	a,L1402_msg
4311  1363 6b01          	ld	(OFST-1,sp),a
4312  1365 c60113        	ld	a,L1402_msg+1
4313  1368 6b02          	ld	(OFST+0,sp),a
4314                     ; 338   BuzzerOnTime = buzzTime;
4315  136a ad29          	call	LC060
4316                     ; 2095         UI_SetRefreshMsg(0);
4317  136c 89            	pushw	x
4318  136d 89            	pushw	x
4319  136e cd0000        	call	_UI_SetRefreshMsg
4321  1371 5b04          	addw	sp,#4
4322                     ; 2096         pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_STOP_H_MOTOR];
4323  1373 ae10be        	ldw	x,#L52_ProcHomeStopHMotor
4324  1376 cf0000        	ldw	L74_pfProcHome,x
4325                     ; 2098         return (SwitchHomeSubProcess(param, &msg));
4326  1379 96            	ldw	x,sp
4327  137a 5c            	incw	x
4328  137b 89            	pushw	x
4329  137c 1e05          	ldw	x,(OFST+3,sp)
4330  137e cd0000        	call	L15_SwitchHomeSubProcess
4332  1381 85            	popw	x
4334  1382 200e          	jra	L2411
4335                     ; 2103     default:
4335                     ; 2104       break;
4336  1384               L1502:
4337                     ; 2107   DISP_ClearAll();
4338  1384 cd0000        	call	_DISP_ClearAll
4340                     ; 2109   DISP_UpperPutStr("ERR-2", 0);
4341  1387 4b00          	push	#0
4342  1389 ae0204        	ldw	x,#L1602
4343  138c cd0000        	call	_DISP_UpperPutStr
4345  138f 84            	pop	a
4346                     ; 2111   return UI_RC_CONTINUE;
4347  1390 a601          	ld	a,#1
4349  1392               L2411:
4350  1392 5b04          	addw	sp,#4
4351  1394 81            	ret	
4352  1395               LC060:
4353  1395 ae012c        	ldw	x,#300
4354  1398 cf0002        	ldw	_BuzzerOnTime+2,x
4355  139b 5f            	clrw	x
4356  139c cf0000        	ldw	_BuzzerOnTime,x
4357  139f 81            	ret	
4361                     ; 2124 uint8_t UI_ProcessHome(void *param, UI_MSG_T *pMsg)
4361                     ; 2125 {
4362  13a0               _UI_ProcessHome:
4363  13a0 89            	pushw	x
4364  13a1 5204          	subw	sp,#4
4365       00000004      OFST:	set	4
4367                     ; 2126   uint32_t powerOnDone = 0;
4368  13a3 5f            	clrw	x
4369  13a4 1f03          	ldw	(OFST-1,sp),x
4370  13a6 1f01          	ldw	(OFST-3,sp),x
4371                     ; 2128   REG_GetValue(&powerOnDone, REG_ID_POWER_ON_FLAG);
4372  13a8 4b01          	push	#1
4373  13aa 96            	ldw	x,sp
4374  13ab 1c0002        	addw	x,#OFST-2
4375  13ae cd0000        	call	_REG_GetValue
4377  13b1 84            	pop	a
4378                     ; 2130   if(pMsg->message == UIMSG_INIT)
4379  13b2 1e09          	ldw	x,(OFST+5,sp)
4380  13b4 e601          	ld	a,(1,x)
4381  13b6 2614          	jrne	L3602
4382                     ; 2132     if(powerOnDone == FALSE)
4383  13b8 96            	ldw	x,sp
4384  13b9 5c            	incw	x
4385  13ba cd0000        	call	c_lzmp
4387  13bd 2605          	jrne	L5602
4388                     ; 2134       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_TEST_KPD];
4389  13bf ae0305        	ldw	x,#L3_ProcHomeTestKeypad
4391  13c2 2003          	jp	LC061
4392  13c4               L5602:
4393                     ; 2138       pfProcHome = PF_PROC_HOME_LIST[PROC_HOME_IDLE];
4394  13c4 ae0736        	ldw	x,#L31_ProcHomeIdle
4395  13c7               LC061:
4396  13c7 cf0000        	ldw	L74_pfProcHome,x
4397  13ca 1e09          	ldw	x,(OFST+5,sp)
4398  13cc               L3602:
4399                     ; 2142   return (pfProcHome(param, pMsg));
4400  13cc 89            	pushw	x
4401  13cd 1e07          	ldw	x,(OFST+3,sp)
4402  13cf 72cd0000      	call	[L74_pfProcHome.w]
4404  13d3 85            	popw	x
4406  13d4 5b06          	addw	sp,#6
4407  13d6 81            	ret	
4409                     	switch	.const
4410  0114               L1112_PF_PROC_AUTO_LIST:
4412  0114 150a          	dc.w	L1702_ProcAutoStartHMotor
4414  0116 159e          	dc.w	L3702_ProcAutoStartSMotor
4416  0118 1663          	dc.w	L5702_ProcAutoStartBCoil
4418  011a 16aa          	dc.w	L7702_ProcAutoStopHMotor
4420  011c 1716          	dc.w	L1012_ProcAutoStartSCoil
4422  011e 179e          	dc.w	L3012_ProcAutoAddDelay
4424  0120 184b          	dc.w	L5012_ProcAutoBeep
4426  0122 1909          	dc.w	L7012_ProcAutoError01
4427                     	switch	.data
4428  0011               L3112_pfProcAuto:
4429  0011 0000          	dc.w	0
4430  0013               L5112_AutoAccumulateCount:
4431  0013 00000000      	dc.l	0
4432  0017               L7112_AutoTestCompleteCount:
4433  0017 00000000      	dc.l	0
4434                     ; 68 static uint8_t SwitchAutoSubProcess(void *param, UI_MSG_T *pMsg)
4434                     ; 69 {
4435                     	switch	.text
4436  13d7               L1212_SwitchAutoSubProcess:
4437  13d7 89            	pushw	x
4438       00000000      OFST:	set	0
4440                     ; 70   UI_ClearAllMessage();
4441  13d8 cd0000        	call	_UI_ClearAllMessage
4443                     ; 72   return (pfProcAuto(param, pMsg));	
4444  13db 1e05          	ldw	x,(OFST+5,sp)
4445  13dd 89            	pushw	x
4446  13de 1e03          	ldw	x,(OFST+3,sp)
4447  13e0 72cd0011      	call	[L3112_pfProcAuto.w]
4450  13e4 5b04          	addw	sp,#4
4451  13e6 81            	ret	
4453                     	switch	.data
4454  001b               L5212_BlinkOn:
4455  001b 01            	dc.b	1
4456                     ; 80 static void AutoDispCounter(uint8_t state)
4456                     ; 81 {
4457                     	switch	.text
4458  13e7               L3212_AutoDispCounter:
4459  13e7 88            	push	a
4460  13e8 5208          	subw	sp,#8
4461       00000008      OFST:	set	8
4463                     ; 85   DISP_ClearAll();
4464  13ea cd0000        	call	_DISP_ClearAll
4466                     ; 87   switch(state)
4467  13ed 7b09          	ld	a,(OFST+1,sp)
4469                     ; 169     break;
4470  13ef 271b          	jreq	L7212
4471  13f1 4a            	dec	a
4472  13f2 2718          	jreq	L7212
4473  13f4 4a            	dec	a
4474  13f5 2715          	jreq	L7212
4475  13f7 4a            	dec	a
4476  13f8 2712          	jreq	L7212
4477  13fa 4a            	dec	a
4478  13fb 270f          	jreq	L7212
4479  13fd 4a            	dec	a
4480  13fe 277c          	jreq	L3312
4481  1400 4a            	dec	a
4482  1401 2775          	jreq	L1312
4483  1403 4a            	dec	a
4484  1404 2603cc14f2    	jreq	L5312
4485  1409 cc14fb        	jra	L1412
4486  140c               L7212:
4487                     ; 95       if(AutoTestCompleteCount > 0)
4488  140c ae0017        	ldw	x,#L7112_AutoTestCompleteCount
4489  140f cd0000        	call	c_lzmp
4491  1412 2721          	jreq	L3412
4492                     ; 97         sprintf(&string[0], DISP_LOWER_STR_FORMAT, AutoTestCompleteCount);
4493  1414 ce0019        	ldw	x,L7112_AutoTestCompleteCount+2
4494  1417 89            	pushw	x
4495  1418 ce0017        	ldw	x,L7112_AutoTestCompleteCount
4496  141b 89            	pushw	x
4497  141c ce0000        	ldw	x,_pDisp
4498  141f ee08          	ldw	x,(8,x)
4499  1421 89            	pushw	x
4500  1422 96            	ldw	x,sp
4501  1423 1c0007        	addw	x,#OFST-1
4502  1426 cd0000        	call	_sprintf
4504  1429 5b06          	addw	sp,#6
4505                     ; 98         DISP_LowerPutStr(&string[0], 0);
4506  142b 4b00          	push	#0
4507  142d 96            	ldw	x,sp
4508  142e 1c0002        	addw	x,#OFST-6
4509  1431 cd0000        	call	_DISP_LowerPutStr
4511  1434 84            	pop	a
4512  1435               L3412:
4513                     ; 101       if(AutoAccumulateCount > 0)
4514  1435 ae0013        	ldw	x,#L5112_AutoAccumulateCount
4515  1438 cd0000        	call	c_lzmp
4517  143b 2730          	jreq	L5412
4518                     ; 103         sprintf(&string[0], DISP_UPPER_STR_FORMAT, AutoAccumulateCount);
4519  143d ce0015        	ldw	x,L5112_AutoAccumulateCount+2
4520  1440 89            	pushw	x
4521  1441 ce0013        	ldw	x,L5112_AutoAccumulateCount
4522  1444 89            	pushw	x
4523  1445 ce0000        	ldw	x,_pDisp
4524  1448 ee06          	ldw	x,(6,x)
4525  144a 89            	pushw	x
4526  144b 96            	ldw	x,sp
4527  144c 1c0007        	addw	x,#OFST-1
4528  144f cd0000        	call	_sprintf
4530  1452 5b06          	addw	sp,#6
4531                     ; 105         if(AutoAccumulateCount < AUTO_ACCUMULATE_SET)
4532  1454 cd14fe        	call	LC066
4534  1457 240c          	jruge	L7412
4535                     ; 107           DISP_UpperPutStr(&string[0], 0);
4536  1459 4b00          	push	#0
4537  145b 96            	ldw	x,sp
4538  145c 1c0002        	addw	x,#OFST-6
4539  145f cd0000        	call	_DISP_UpperPutStr
4541  1462 84            	pop	a
4542                     ; 108           DISP_UpperPutStr("A", 0);
4545  1463 2008          	jp	L5412
4546  1465               L7412:
4547                     ; 112           DISP_UpperPutStr(&string[0], 0);
4548  1465 4b00          	push	#0
4549  1467 96            	ldw	x,sp
4550  1468 1c0002        	addw	x,#OFST-6
4552  146b 2005          	jra	L5512
4553  146d               L5412:
4554                     ; 117         DISP_UpperPutStr("A", 0);
4555  146d 4b00          	push	#0
4556  146f ae0202        	ldw	x,#L1512
4558  1472               L5512:
4559  1472 cd0000        	call	_DISP_UpperPutStr
4560  1475 84            	pop	a
4561                     ; 120       BlinkOn = TRUE;
4562                     ; 122     break;
4563  1476 2074          	jp	L1612
4564  1478               L1312:
4565                     ; 124     case PROC_AUTO_BEEP:
4565                     ; 125       BlinkOn = TRUE;
4566  1478 3501001b      	mov	L5212_BlinkOn,#1
4567  147c               L3312:
4568                     ; 129       if(AutoTestCompleteCount > 0)
4569  147c ae0017        	ldw	x,#L7112_AutoTestCompleteCount
4570  147f cd0000        	call	c_lzmp
4572  1482 2721          	jreq	L7512
4573                     ; 131         sprintf(&string[0], DISP_LOWER_STR_FORMAT, AutoTestCompleteCount);
4574  1484 ce0019        	ldw	x,L7112_AutoTestCompleteCount+2
4575  1487 89            	pushw	x
4576  1488 ce0017        	ldw	x,L7112_AutoTestCompleteCount
4577  148b 89            	pushw	x
4578  148c ce0000        	ldw	x,_pDisp
4579  148f ee08          	ldw	x,(8,x)
4580  1491 89            	pushw	x
4581  1492 96            	ldw	x,sp
4582  1493 1c0007        	addw	x,#OFST-1
4583  1496 cd0000        	call	_sprintf
4585  1499 5b06          	addw	sp,#6
4586                     ; 132         DISP_LowerPutStr((char *)&string[0], 0);
4587  149b 4b00          	push	#0
4588  149d 96            	ldw	x,sp
4589  149e 1c0002        	addw	x,#OFST-6
4590  14a1 cd0000        	call	_DISP_LowerPutStr
4592  14a4 84            	pop	a
4593  14a5               L7512:
4594                     ; 135       if(BlinkOn == TRUE)
4595  14a5 c6001b        	ld	a,L5212_BlinkOn
4596  14a8 4a            	dec	a
4597  14a9 2641          	jrne	L1612
4598                     ; 137         BlinkOn = FALSE;
4599  14ab c7001b        	ld	L5212_BlinkOn,a
4600                     ; 139         if(AutoAccumulateCount > 0)
4601  14ae ae0013        	ldw	x,#L5112_AutoAccumulateCount
4602  14b1 cd0000        	call	c_lzmp
4604  14b4 272f          	jreq	L3612
4605                     ; 141           sprintf((char *)&string[0], DISP_UPPER_STR_FORMAT, AutoAccumulateCount);
4606  14b6 ce0015        	ldw	x,L5112_AutoAccumulateCount+2
4607  14b9 89            	pushw	x
4608  14ba ce0013        	ldw	x,L5112_AutoAccumulateCount
4609  14bd 89            	pushw	x
4610  14be ce0000        	ldw	x,_pDisp
4611  14c1 ee06          	ldw	x,(6,x)
4612  14c3 89            	pushw	x
4613  14c4 96            	ldw	x,sp
4614  14c5 1c0007        	addw	x,#OFST-1
4615  14c8 cd0000        	call	_sprintf
4617  14cb 5b06          	addw	sp,#6
4618                     ; 143           if(AutoAccumulateCount < AUTO_ACCUMULATE_SET)
4619  14cd ad2f          	call	LC066
4621  14cf 240c          	jruge	L5612
4622                     ; 145             DISP_UpperPutStr((char *)&string[0], 0);
4623  14d1 4b00          	push	#0
4624  14d3 96            	ldw	x,sp
4625  14d4 1c0002        	addw	x,#OFST-6
4626  14d7 cd0000        	call	_DISP_UpperPutStr
4628  14da 84            	pop	a
4629                     ; 146             DISP_UpperPutStr("A", 0);
4632  14db 2008          	jp	L3612
4633  14dd               L5612:
4634                     ; 150             DISP_UpperPutStr((char *)&string[0], 0);
4635  14dd 4b00          	push	#0
4636  14df 96            	ldw	x,sp
4637  14e0 1c0002        	addw	x,#OFST-6
4639  14e3 2012          	jp	LC063
4640  14e5               L3612:
4641                     ; 155           DISP_UpperPutStr("A", 0);
4642  14e5 4b00          	push	#0
4643  14e7 ae0202        	ldw	x,#L1512
4645  14ea 200b          	jp	LC063
4646  14ec               L1612:
4647                     ; 160         BlinkOn = TRUE;
4648  14ec 3501001b      	mov	L5212_BlinkOn,#1
4649  14f0 2009          	jra	L1412
4650  14f2               L5312:
4651                     ; 167       DISP_UpperPutStr("ERR-1", 0);
4652  14f2 4b00          	push	#0
4653  14f4 ae020a        	ldw	x,#L5202
4655  14f7               LC063:
4656  14f7 cd0000        	call	_DISP_UpperPutStr
4657  14fa 84            	pop	a
4658                     ; 169     break;
4659  14fb               L1412:
4660                     ; 172 }
4661  14fb 5b09          	addw	sp,#9
4662  14fd 81            	ret	
4663  14fe               LC066:
4664  14fe ae0013        	ldw	x,#L5112_AutoAccumulateCount
4665  1501 cd0000        	call	c_ltor
4667  1504 ae004a        	ldw	x,#L211
4668  1507 cc0000        	jp	c_lcmp
4670                     	switch	.const
4671  0124               L3022_msg:
4672  0124 00            	dc.b	0
4673  0125 00            	dc.b	0
4674  0126               L7022_msg:
4675  0126 00            	dc.b	0
4676  0127 00            	dc.b	0
4677  0128               L3122_msg:
4678  0128 00            	dc.b	0
4679  0129 00            	dc.b	0
4683                     ; 180 static uint8_t ProcAutoStartHMotor(void *param, UI_MSG_T *pMsg)
4683                     ; 181 {
4684                     	switch	.text
4685  150a               L1702_ProcAutoStartHMotor:
4686  150a 89            	pushw	x
4687  150b 89            	pushw	x
4688       00000002      OFST:	set	2
4690                     ; 184   switch(pMsg->message)
4691  150c 1e07          	ldw	x,(OFST+5,sp)
4692  150e e601          	ld	a,(1,x)
4694                     ; 242     break;
4695  1510 270b          	jreq	L5712
4696  1512 4a            	dec	a
4697  1513 2724          	jreq	L1022
4698  1515 4a            	dec	a
4699  1516 275e          	jreq	L1122
4700  1518 4a            	dec	a
4701  1519 272f          	jreq	L5022
4702  151b 206d          	jra	L7122
4703  151d               L5712:
4704                     ; 180   SensorCounter = sc;
4705  151d 5f            	clrw	x
4706  151e cf0002        	ldw	_SensorCounter+2,x
4707  1521 cf0000        	ldw	_SensorCounter,x
4708                     ; 190       BSP_H_MotorEnable(TRUE);
4709  1524 721d5005      	bres	20485,#6
4710                     ; 191       BSP_V_PumpEnable(TRUE);
4711  1528 72115019      	bres	20505,#0
4712                     ; 193       UI_SetRefreshMsg(CAM_SW_TIMEOUT);
4713  152c ae0bb8        	ldw	x,#3000
4714  152f 89            	pushw	x
4715  1530 5f            	clrw	x
4716  1531 89            	pushw	x
4717  1532 cd0000        	call	_UI_SetRefreshMsg
4719  1535 5b04          	addw	sp,#4
4720                     ; 195     break;
4721  1537 2051          	jra	L7122
4722  1539               L1022:
4723                     ; 200       UI_MSG_T msg = {0, UIMSG_INIT};
4724  1539 c60124        	ld	a,L3022_msg
4725  153c 6b01          	ld	(OFST-1,sp),a
4726  153e c60125        	ld	a,L3022_msg+1
4727  1541 6b02          	ld	(OFST+0,sp),a
4728                     ; 202       pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_ERROR_01];
4729  1543 ae1909        	ldw	x,#L7012_ProcAutoError01
4730  1546 ad4a          	call	LC069
4731                     ; 207       return(SwitchAutoSubProcess(param, &msg));
4734  1548 2020          	jp	LC067
4735  154a               L5022:
4736                     ; 213       if((uint8_t)pMsg->param == UI_SW_RELEASE)
4737  154a f6            	ld	a,(x)
4738  154b 4a            	dec	a
4739  154c 263c          	jrne	L7122
4740                     ; 215         UI_MSG_T msg = {0, UIMSG_INIT};
4741  154e c60126        	ld	a,L7022_msg
4742  1551 6b01          	ld	(OFST-1,sp),a
4743  1553 c60127        	ld	a,L7022_msg+1
4744  1556 6b02          	ld	(OFST+0,sp),a
4745                     ; 216         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_S_MOTOR];
4746  1558 ae159e        	ldw	x,#L3702_ProcAutoStartSMotor
4747  155b cf0011        	ldw	L3112_pfProcAuto,x
4748                     ; 219         BSP_H_MotorEnable(FALSE);
4749  155e 721c5005      	bset	20485,#6
4750                     ; 220         UI_SetRefreshMsg(0);
4752  1562               LC068:
4753  1562 5f            	clrw	x
4754  1563 89            	pushw	x
4755  1564 89            	pushw	x
4756  1565 cd0000        	call	_UI_SetRefreshMsg
4757  1568 5b04          	addw	sp,#4
4758                     ; 222         return(SwitchAutoSubProcess(param, &msg));
4760  156a               LC067:
4761  156a 96            	ldw	x,sp
4762  156b 5c            	incw	x
4763  156c 89            	pushw	x
4764  156d 1e05          	ldw	x,(OFST+3,sp)
4765  156f cd13d7        	call	L1212_SwitchAutoSubProcess
4766  1572 85            	popw	x
4768  1573               L2421:
4769  1573 5b04          	addw	sp,#4
4770  1575 81            	ret	
4771  1576               L1122:
4772                     ; 229       if((uint8_t)pMsg->param == UI_SW_PRESS)
4773  1576 f6            	ld	a,(x)
4774  1577 2611          	jrne	L7122
4775                     ; 231         UI_MSG_T msg = {0, UIMSG_INIT};
4776  1579 c60128        	ld	a,L3122_msg
4777  157c 6b01          	ld	(OFST-1,sp),a
4778  157e c60129        	ld	a,L3122_msg+1
4779  1581 6b02          	ld	(OFST+0,sp),a
4780                     ; 232         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_STOP_H_MOTOR];
4781  1583 ae16aa        	ldw	x,#L7702_ProcAutoStopHMotor
4782  1586 ad0a          	call	LC069
4783                     ; 237         UI_SetRefreshMsg(0);
4785                     ; 239         return(SwitchAutoSubProcess(param, &msg));
4788  1588 20d8          	jp	LC068
4789  158a               L7122:
4790                     ; 245   AutoDispCounter(PROC_AUTO_START_H_MOTOR);
4791  158a 4f            	clr	a
4792  158b cd13e7        	call	L3212_AutoDispCounter
4794                     ; 246   return UI_RC_CONTINUE;
4795  158e a601          	ld	a,#1
4797  1590 20e1          	jra	L2421
4798  1592               LC069:
4799  1592 cf0011        	ldw	L3112_pfProcAuto,x
4800                     ; 234         BSP_H_MotorEnable(FALSE);
4801  1595 721c5005      	bset	20485,#6
4802                     ; 235         BSP_V_PumpEnable(FALSE);
4803  1599 72105019      	bset	20505,#0
4804  159d 81            	ret	
4806                     	switch	.const
4807  012a               L5322_msg:
4808  012a 00            	dc.b	0
4809  012b 00            	dc.b	0
4810  012c               L3422_msg:
4811  012c 00            	dc.b	0
4812  012d 00            	dc.b	0
4813  012e               L1522_msg:
4814  012e 00            	dc.b	0
4815  012f 00            	dc.b	0
4819                     ; 258 static uint8_t ProcAutoStartSMotor(void *param, UI_MSG_T *pMsg)
4819                     ; 259 {
4820                     	switch	.text
4821  159e               L3702_ProcAutoStartSMotor:
4822  159e 89            	pushw	x
4823  159f 5206          	subw	sp,#6
4824       00000006      OFST:	set	6
4826                     ; 262   uint32_t sensorCounter = 0;
4827                     ; 190   return SensorCounter;
4828  15a1 ce0002        	ldw	x,_SensorCounter+2
4829  15a4 1f05          	ldw	(OFST-1,sp),x
4830  15a6 ce0000        	ldw	x,_SensorCounter
4831  15a9 1f03          	ldw	(OFST-3,sp),x
4834                     ; 265   switch(pMsg->message)
4835  15ab 1e0b          	ldw	x,(OFST+5,sp)
4836  15ad e601          	ld	a,(1,x)
4838                     ; 330     break;
4839  15af 270d          	jreq	L7222
4840  15b1 4a            	dec	a
4841  15b2 275b          	jreq	L1422
4842  15b4 4a            	dec	a
4843  15b5 2777          	jreq	L7422
4844  15b7 a03e          	sub	a,#62
4845  15b9 271c          	jreq	L3322
4846  15bb cc164e        	jra	L7522
4847  15be               L7222:
4848                     ; 140   FlagSensorEn = se;
4849  15be 35010000      	mov	_FlagSensorEn,#1
4850                     ; 271       BSP_S_MotorEnable(TRUE);
4851  15c2 721f5005      	bres	20485,#7
4852                     ; 272       BSP_V_PumpEnable(TRUE);
4853  15c6 72115019      	bres	20505,#0
4854                     ; 274       UI_SetRefreshMsg(FREE_RUN_TIMEOUT);
4855  15ca ae1388        	ldw	x,#5000
4856  15cd 89            	pushw	x
4857  15ce 5f            	clrw	x
4858  15cf 89            	pushw	x
4859  15d0 cd0000        	call	_UI_SetRefreshMsg
4861  15d3 5b04          	addw	sp,#4
4862                     ; 276     break;
4863  15d5 2077          	jra	L7522
4864  15d7               L3322:
4865                     ; 280       AutoAccumulateCount++;
4866  15d7 ae0013        	ldw	x,#L5112_AutoAccumulateCount
4867  15da 4c            	inc	a
4868  15db cd0000        	call	c_lgadc
4870                     ; 282       if(sensorCounter >= 100)
4871  15de 96            	ldw	x,sp
4872  15df 1c0003        	addw	x,#OFST-3
4873  15e2 cd0000        	call	c_ltor
4875  15e5 ae003e        	ldw	x,#L25
4876  15e8 cd0000        	call	c_lcmp
4878  15eb 2561          	jrult	L7522
4879                     ; 284         UI_MSG_T msg = {0, UIMSG_INIT};
4880  15ed c6012a        	ld	a,L5322_msg
4881  15f0 6b01          	ld	(OFST-5,sp),a
4882  15f2 c6012b        	ld	a,L5322_msg+1
4883  15f5 6b02          	ld	(OFST-4,sp),a
4884                     ; 285         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_B_COIL];
4885  15f7 ae1663        	ldw	x,#L5702_ProcAutoStartBCoil
4886  15fa cf0011        	ldw	L3112_pfProcAuto,x
4887                     ; 287         UI_SetRefreshMsg(0);
4888  15fd 5f            	clrw	x
4889  15fe 89            	pushw	x
4890  15ff 89            	pushw	x
4891  1600 cd0000        	call	_UI_SetRefreshMsg
4893  1603 5b04          	addw	sp,#4
4894                     ; 289         BSP_S_MotorEnable(FALSE);
4895  1605 721e5005      	bset	20485,#7
4896                     ; 290         BSP_V_PumpEnable(FALSE);
4897  1609 72105019      	bset	20505,#0
4898                     ; 140   FlagSensorEn = se;
4899                     ; 294         return(SwitchAutoSubProcess(param, &msg));
4902  160d 200f          	jp	LC071
4903  160f               L1422:
4904                     ; 301       UI_MSG_T msg = {0, UIMSG_INIT};
4905  160f c6012c        	ld	a,L3422_msg
4906  1612 6b01          	ld	(OFST-5,sp),a
4907  1614 c6012d        	ld	a,L3422_msg+1
4908  1617 6b02          	ld	(OFST-4,sp),a
4909                     ; 302       pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_B_COIL];
4910  1619 ae1663        	ldw	x,#L5702_ProcAutoStartBCoil
4911  161c ad39          	call	LC072
4912                     ; 140   FlagSensorEn = se;
4913  161e               LC071:
4914  161e 725f0000      	clr	_FlagSensorEn
4915                     ; 309       return(SwitchAutoSubProcess(param, &msg));
4917  1622               LC070:
4918  1622 96            	ldw	x,sp
4919  1623 5c            	incw	x
4920  1624 89            	pushw	x
4921  1625 1e09          	ldw	x,(OFST+3,sp)
4922  1627 cd13d7        	call	L1212_SwitchAutoSubProcess
4923  162a 85            	popw	x
4925  162b               L4621:
4926  162b 5b08          	addw	sp,#8
4927  162d 81            	ret	
4928  162e               L7422:
4929                     ; 315       if((uint8_t)pMsg->param == UI_SW_PRESS)
4930  162e f6            	ld	a,(x)
4931  162f 261d          	jrne	L7522
4932                     ; 317         UI_MSG_T msg = {0, UIMSG_INIT};
4933  1631 c6012e        	ld	a,L1522_msg
4934  1634 6b01          	ld	(OFST-5,sp),a
4935  1636 c6012f        	ld	a,L1522_msg+1
4936  1639 6b02          	ld	(OFST-4,sp),a
4937                     ; 318         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_STOP_H_MOTOR];
4938  163b ae16aa        	ldw	x,#L7702_ProcAutoStopHMotor
4939  163e ad17          	call	LC072
4940                     ; 140   FlagSensorEn = se;
4941  1640 725f0000      	clr	_FlagSensorEn
4942                     ; 325         UI_SetRefreshMsg(0);
4943  1644 5f            	clrw	x
4944  1645 89            	pushw	x
4945  1646 89            	pushw	x
4946  1647 cd0000        	call	_UI_SetRefreshMsg
4948  164a 5b04          	addw	sp,#4
4949                     ; 327         return(SwitchAutoSubProcess(param, &msg));
4952  164c 20d4          	jp	LC070
4953  164e               L7522:
4954                     ; 333   AutoDispCounter(PROC_AUTO_START_S_MOTOR);
4955  164e a601          	ld	a,#1
4956  1650 cd13e7        	call	L3212_AutoDispCounter
4958                     ; 334   return UI_RC_CONTINUE;
4959  1653 a601          	ld	a,#1
4961  1655 20d4          	jra	L4621
4962  1657               LC072:
4963  1657 cf0011        	ldw	L3112_pfProcAuto,x
4964                     ; 320         BSP_V_PumpEnable(FALSE);
4965  165a 72105019      	bset	20505,#0
4966                     ; 321         BSP_S_MotorEnable(FALSE);
4967  165e 721e5005      	bset	20485,#7
4968  1662 81            	ret	
4970                     	switch	.const
4971  0130               L1722_msg:
4972  0130 00            	dc.b	0
4973  0131 00            	dc.b	0
4975                     ; 345 static uint8_t ProcAutoStartBCoil(void *param, UI_MSG_T *pMsg)
4975                     ; 346 {
4976                     	switch	.text
4977  1663               L5702_ProcAutoStartBCoil:
4978  1663 89            	pushw	x
4979  1664 89            	pushw	x
4980       00000002      OFST:	set	2
4982                     ; 349   switch(pMsg->message)
4983  1665 1e07          	ldw	x,(OFST+5,sp)
4984  1667 e601          	ld	a,(1,x)
4986                     ; 367       return (SwitchAutoSubProcess(param, &msg));
4987  1669 2705          	jreq	L5622
4988  166b 4a            	dec	a
4989  166c 2713          	jreq	L7622
4990  166e 2030          	jra	L5722
4991  1670               L5622:
4992                     ; 353       BSP_B_CoilEnable(TRUE);
4993  1670 72175014      	bres	20500,#3
4994                     ; 355       UI_SetRefreshMsg(BATCH_COIL_TIME);
4995  1674 ae01f4        	ldw	x,#500
4996  1677 89            	pushw	x
4997  1678 5f            	clrw	x
4998  1679 89            	pushw	x
4999  167a cd0000        	call	_UI_SetRefreshMsg
5001  167d 5b04          	addw	sp,#4
5002                     ; 357     break;
5003  167f 201f          	jra	L5722
5004  1681               L7622:
5005                     ; 361       UI_MSG_T msg = {0, UIMSG_INIT};
5006  1681 c60130        	ld	a,L1722_msg
5007  1684 6b01          	ld	(OFST-1,sp),a
5008  1686 c60131        	ld	a,L1722_msg+1
5009  1689 6b02          	ld	(OFST+0,sp),a
5010                     ; 363       pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_STOP_H_MOTOR];
5011  168b ae16aa        	ldw	x,#L7702_ProcAutoStopHMotor
5012  168e cf0011        	ldw	L3112_pfProcAuto,x
5013                     ; 365       BSP_B_CoilEnable(FALSE);
5014  1691 72165014      	bset	20500,#3
5015                     ; 367       return (SwitchAutoSubProcess(param, &msg));
5016  1695 96            	ldw	x,sp
5017  1696 5c            	incw	x
5018  1697 89            	pushw	x
5019  1698 1e05          	ldw	x,(OFST+3,sp)
5020  169a cd13d7        	call	L1212_SwitchAutoSubProcess
5022  169d 85            	popw	x
5024  169e 2007          	jra	L6721
5025  16a0               L5722:
5026                     ; 373   AutoDispCounter(PROC_AUTO_START_B_COIL);
5027  16a0 a602          	ld	a,#2
5028  16a2 cd13e7        	call	L3212_AutoDispCounter
5030                     ; 374   return UI_RC_CONTINUE;
5031  16a5 a601          	ld	a,#1
5033  16a7               L6721:
5034  16a7 5b04          	addw	sp,#4
5035  16a9 81            	ret	
5037                     	switch	.const
5038  0132               L3032_msg:
5039  0132 00            	dc.b	0
5040  0133 00            	dc.b	0
5041  0134               L7032_msg:
5042  0134 00            	dc.b	0
5043  0135 00            	dc.b	0
5046                     ; 386 static uint8_t ProcAutoStopHMotor(void *param, UI_MSG_T *pMsg)
5046                     ; 387 {
5047                     	switch	.text
5048  16aa               L7702_ProcAutoStopHMotor:
5049  16aa 89            	pushw	x
5050  16ab 89            	pushw	x
5051       00000002      OFST:	set	2
5053                     ; 392   switch(pMsg->message)
5054  16ac 1e07          	ldw	x,(OFST+5,sp)
5055  16ae e601          	ld	a,(1,x)
5057                     ; 433     break;
5058  16b0 2709          	jreq	L7722
5059  16b2 4a            	dec	a
5060  16b3 2717          	jreq	L1032
5061  16b5 a002          	sub	a,#2
5062  16b7 2729          	jreq	L5032
5063  16b9 2052          	jra	L3132
5064  16bb               L7722:
5065                     ; 396       BSP_H_MotorEnable(TRUE);
5066  16bb 721d5005      	bres	20485,#6
5067                     ; 399       UI_SetRefreshMsg(CAM_SW_TIMEOUT);
5068  16bf ae0bb8        	ldw	x,#3000
5069  16c2 89            	pushw	x
5070  16c3 5f            	clrw	x
5071  16c4 89            	pushw	x
5072  16c5 cd0000        	call	_UI_SetRefreshMsg
5074  16c8 5b04          	addw	sp,#4
5075                     ; 401     break;
5076  16ca 2041          	jra	L3132
5077  16cc               L1032:
5078                     ; 405       UI_MSG_T msg = {0, UIMSG_INIT};
5079  16cc c60132        	ld	a,L3032_msg
5080  16cf 6b01          	ld	(OFST-1,sp),a
5081  16d1 c60133        	ld	a,L3032_msg+1
5082  16d4 6b02          	ld	(OFST+0,sp),a
5083                     ; 407       pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_ERROR_01];
5084  16d6 ae1909        	ldw	x,#L7012_ProcAutoError01
5085  16d9 cf0011        	ldw	L3112_pfProcAuto,x
5086                     ; 409       BSP_H_MotorEnable(FALSE);
5087  16dc 721c5005      	bset	20485,#6
5088                     ; 411       return(SwitchAutoSubProcess(param, &msg));
5091  16e0 201f          	jp	LC073
5092  16e2               L5032:
5093                     ; 417       if((uint8_t)pMsg->param == UI_SW_PRESS)
5094  16e2 f6            	ld	a,(x)
5095  16e3 2628          	jrne	L3132
5096                     ; 419         UI_MSG_T msg = {0, UIMSG_INIT};
5097  16e5 c60134        	ld	a,L7032_msg
5098  16e8 6b01          	ld	(OFST-1,sp),a
5099  16ea c60135        	ld	a,L7032_msg+1
5100  16ed 6b02          	ld	(OFST+0,sp),a
5101                     ; 424         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_S_COIL];
5102  16ef ae1716        	ldw	x,#L1012_ProcAutoStartSCoil
5103  16f2 cf0011        	ldw	L3112_pfProcAuto,x
5104                     ; 427         BSP_H_MotorEnable(FALSE);
5105  16f5 721c5005      	bset	20485,#6
5106                     ; 428         UI_SetRefreshMsg(0);
5107  16f9 5f            	clrw	x
5108  16fa 89            	pushw	x
5109  16fb 89            	pushw	x
5110  16fc cd0000        	call	_UI_SetRefreshMsg
5112  16ff 5b04          	addw	sp,#4
5113                     ; 430         return (SwitchAutoSubProcess(param, &msg));
5115  1701               LC073:
5116  1701 96            	ldw	x,sp
5117  1702 5c            	incw	x
5118  1703 89            	pushw	x
5119  1704 1e05          	ldw	x,(OFST+3,sp)
5120  1706 cd13d7        	call	L1212_SwitchAutoSubProcess
5121  1709 85            	popw	x
5123  170a               L4131:
5124  170a 5b04          	addw	sp,#4
5125  170c 81            	ret	
5126  170d               L3132:
5127                     ; 437   AutoDispCounter(PROC_AUTO_STOP_H_MOTOR);
5128  170d a603          	ld	a,#3
5129  170f cd13e7        	call	L3212_AutoDispCounter
5131                     ; 438   return UI_RC_CONTINUE;
5132  1712 a601          	ld	a,#1
5134  1714 20f4          	jra	L4131
5136                     	switch	.const
5137  0136               L3232_msg:
5138  0136 00            	dc.b	0
5139  0137 00            	dc.b	0
5142                     ; 450 static uint8_t ProcAutoStartSCoil(void *param, UI_MSG_T *pMsg)
5142                     ; 451 {
5143                     	switch	.text
5144  1716               L1012_ProcAutoStartSCoil:
5145  1716 89            	pushw	x
5146  1717 5206          	subw	sp,#6
5147       00000006      OFST:	set	6
5149                     ; 454   uint32_t stampEnable = FALSE;
5150  1719 5f            	clrw	x
5151  171a 1f05          	ldw	(OFST-1,sp),x
5152  171c 1f03          	ldw	(OFST-3,sp),x
5153                     ; 455   REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
5154  171e 4b02          	push	#2
5155  1720 96            	ldw	x,sp
5156  1721 1c0004        	addw	x,#OFST-2
5157  1724 cd0000        	call	_REG_GetValue
5159  1727 84            	pop	a
5160                     ; 457   switch(pMsg->message)
5161  1728 1e0b          	ldw	x,(OFST+5,sp)
5162  172a e601          	ld	a,(1,x)
5164                     ; 490       return (SwitchAutoSubProcess(param, &msg));
5165  172c 2705          	jreq	L7132
5166  172e 4a            	dec	a
5167  172f 2718          	jreq	L1232
5168  1731 2055          	jra	L7232
5169  1733               L7132:
5170                     ; 461       if(stampEnable == TRUE)
5171  1733 96            	ldw	x,sp
5172  1734 ad5c          	call	LC074
5174  1736 2604          	jrne	L1332
5175                     ; 463         BSP_S_CoilEnable(TRUE);
5176  1738 72195014      	bres	20500,#4
5177  173c               L1332:
5178                     ; 466       UI_SetRefreshMsg(STAMP_COIL_TIME);
5179  173c ae01f4        	ldw	x,#500
5180  173f 89            	pushw	x
5181  1740 5f            	clrw	x
5182  1741 89            	pushw	x
5183  1742 cd0000        	call	_UI_SetRefreshMsg
5185  1745 5b04          	addw	sp,#4
5186                     ; 468     break;
5187  1747 203f          	jra	L7232
5188  1749               L1232:
5189                     ; 473       UI_MSG_T msg = {0, UIMSG_INIT};
5190  1749 c60136        	ld	a,L3232_msg
5191  174c 6b01          	ld	(OFST-5,sp),a
5192  174e c60137        	ld	a,L3232_msg+1
5193  1751 6b02          	ld	(OFST-4,sp),a
5194                     ; 475       if(AutoAccumulateCount >= AUTO_ACCUMULATE_SET)
5195  1753 ae0013        	ldw	x,#L5112_AutoAccumulateCount
5196  1756 cd0000        	call	c_ltor
5198  1759 ae004a        	ldw	x,#L211
5199  175c cd0000        	call	c_lcmp
5201  175f 250d          	jrult	L3332
5202                     ; 477         AutoTestCompleteCount++;
5203  1761 ae0017        	ldw	x,#L7112_AutoTestCompleteCount
5204  1764 a601          	ld	a,#1
5205  1766 cd0000        	call	c_lgadc
5207                     ; 478         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_BEEP];
5208  1769 ae184b        	ldw	x,#L5012_ProcAutoBeep
5210  176c 2003          	jra	L5332
5211  176e               L3332:
5212                     ; 482         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_ADD_DELAY];
5213  176e ae179e        	ldw	x,#L3012_ProcAutoAddDelay
5214  1771               L5332:
5215  1771 cf0011        	ldw	L3112_pfProcAuto,x
5216                     ; 485       if(stampEnable == TRUE)
5217  1774 96            	ldw	x,sp
5218  1775 ad1b          	call	LC074
5220  1777 2604          	jrne	L7332
5221                     ; 487         BSP_S_CoilEnable(FALSE);
5222  1779 72185014      	bset	20500,#4
5223  177d               L7332:
5224                     ; 490       return (SwitchAutoSubProcess(param, &msg));
5225  177d 96            	ldw	x,sp
5226  177e 5c            	incw	x
5227  177f 89            	pushw	x
5228  1780 1e09          	ldw	x,(OFST+3,sp)
5229  1782 cd13d7        	call	L1212_SwitchAutoSubProcess
5231  1785 85            	popw	x
5233  1786 2007          	jra	L0331
5234  1788               L7232:
5235                     ; 495   AutoDispCounter(PROC_AUTO_START_S_COIL);
5236  1788 a604          	ld	a,#4
5237  178a cd13e7        	call	L3212_AutoDispCounter
5239                     ; 496   return UI_RC_CONTINUE;
5240  178d a601          	ld	a,#1
5242  178f               L0331:
5243  178f 5b08          	addw	sp,#8
5244  1791 81            	ret	
5245  1792               LC074:
5246  1792 1c0003        	addw	x,#OFST-3
5247  1795 cd0000        	call	c_ltor
5249  1798 ae0058        	ldw	x,#L404
5250  179b cc0000        	jp	c_lcmp
5252                     	switch	.data
5253  001c               L1432_largeDelayCnt:
5254  001c 00000000      	dc.l	0
5255                     	switch	.const
5256  0138               L7432_msg:
5257  0138 00            	dc.b	0
5258  0139 00            	dc.b	0
5261                     ; 507 static uint8_t ProcAutoAddDelay(void *param, UI_MSG_T *pMsg)
5261                     ; 508 {
5262                     	switch	.text
5263  179e               L3012_ProcAutoAddDelay:
5264  179e 89            	pushw	x
5265  179f 5204          	subw	sp,#4
5266       00000004      OFST:	set	4
5268                     ; 513   switch(pMsg->message)
5269  17a1 1e09          	ldw	x,(OFST+5,sp)
5270  17a3 e601          	ld	a,(1,x)
5272                     ; 569     break;
5273  17a5 2709          	jreq	L3432
5274  17a7 4a            	dec	a
5275  17a8 2717          	jreq	L5432
5276  17aa 4a            	dec	a
5277  17ab 2760          	jreq	L1532
5278  17ad cc1836        	jra	L7532
5279  17b0               L3432:
5280                     ; 520       UI_SetRefreshMsg(NORMAL_DELAY_TIME);
5281  17b0 cd183f        	call	LC076
5282                     ; 522       largeDelayCnt = LARGE_DELAY_TIME;
5283  17b3 ae93e0        	ldw	x,#37856
5284  17b6 cf001e        	ldw	L1432_largeDelayCnt+2,x
5285  17b9 ae0004        	ldw	x,#4
5286  17bc cf001c        	ldw	L1432_largeDelayCnt,x
5287                     ; 524     break;
5288  17bf 2075          	jra	L7532
5289  17c1               L5432:
5290                     ; 528       UI_MSG_T msg = {0, UIMSG_INIT};
5291  17c1 c60138        	ld	a,L7432_msg
5292  17c4 6b03          	ld	(OFST-1,sp),a
5293  17c6 c60139        	ld	a,L7432_msg+1
5294  17c9 6b04          	ld	(OFST+0,sp),a
5295                     ; 530       if(AutoAccumulateCount >= AUTO_ACCUMULATE_SET)
5296  17cb ae0013        	ldw	x,#L5112_AutoAccumulateCount
5297  17ce cd0000        	call	c_ltor
5299  17d1 ae004a        	ldw	x,#L211
5300  17d4 cd0000        	call	c_lcmp
5302  17d7 2520          	jrult	L1632
5303                     ; 532         largeDelayCnt -= NORMAL_DELAY_TIME;
5304  17d9 ae03e8        	ldw	x,#1000
5305  17dc bf02          	ldw	c_lreg+2,x
5306  17de 5f            	clrw	x
5307  17df bf00          	ldw	c_lreg,x
5308  17e1 ae001c        	ldw	x,#L1432_largeDelayCnt
5309  17e4 cd0000        	call	c_lgsub
5311                     ; 534         if(largeDelayCnt <= 0)
5312  17e7 cd0000        	call	c_lzmp
5314  17ea 2c09          	jrsgt	L3632
5315                     ; 536           AutoAccumulateCount = 0;
5316  17ec 5f            	clrw	x
5317  17ed cf0015        	ldw	L5112_AutoAccumulateCount+2,x
5318  17f0 cf0013        	ldw	L5112_AutoAccumulateCount,x
5319                     ; 537           pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_H_MOTOR];
5320                     ; 538           return (SwitchAutoSubProcess(param, &msg));
5323  17f3 2004          	jp	L1632
5324  17f5               L3632:
5325                     ; 542           UI_SetRefreshMsg(NORMAL_DELAY_TIME);
5326  17f5 ad48          	call	LC076
5327  17f7 203d          	jra	L7532
5328  17f9               L1632:
5329                     ; 547         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_H_MOTOR];
5330                     ; 548         return (SwitchAutoSubProcess(param, &msg));
5332  17f9 ae150a        	ldw	x,#L1702_ProcAutoStartHMotor
5333  17fc cf0011        	ldw	L3112_pfProcAuto,x
5334  17ff 96            	ldw	x,sp
5335  1800 1c0003        	addw	x,#OFST-1
5336  1803 89            	pushw	x
5337  1804 1e07          	ldw	x,(OFST+3,sp)
5338  1806 cd13d7        	call	L1212_SwitchAutoSubProcess
5339  1809 85            	popw	x
5341  180a               L0531:
5342  180a 5b06          	addw	sp,#6
5343  180c 81            	ret	
5344  180d               L1532:
5345                     ; 555       if((uint8_t)pMsg->param == UI_SW_PRESS)
5346  180d f6            	ld	a,(x)
5347  180e 2626          	jrne	L7532
5348                     ; 557         uint32_t sensorCounter = 0;
5349  1810 5f            	clrw	x
5350  1811 1f03          	ldw	(OFST-1,sp),x
5351  1813 1f01          	ldw	(OFST-3,sp),x
5352                     ; 559         UI_SetRefreshMsg(0);
5353  1815 89            	pushw	x
5354  1816 89            	pushw	x
5355  1817 cd0000        	call	_UI_SetRefreshMsg
5357  181a 5b04          	addw	sp,#4
5358                     ; 561         AutoAccumulateCount = 0;
5359  181c 5f            	clrw	x
5360  181d cf0015        	ldw	L5112_AutoAccumulateCount+2,x
5361  1820 cf0013        	ldw	L5112_AutoAccumulateCount,x
5362                     ; 562         AutoTestCompleteCount = 0;
5363  1823 cf0019        	ldw	L7112_AutoTestCompleteCount+2,x
5364  1826 cf0017        	ldw	L7112_AutoTestCompleteCount,x
5365                     ; 180   SensorCounter = sc;
5366  1829 1e03          	ldw	x,(OFST-1,sp)
5367  182b cf0002        	ldw	_SensorCounter+2,x
5368  182e 1e01          	ldw	x,(OFST-3,sp)
5369  1830 cf0000        	ldw	_SensorCounter,x
5370                     ; 566         return UI_RC_FINISH;
5371  1833 4f            	clr	a
5373  1834 20d4          	jra	L0531
5374  1836               L7532:
5375                     ; 572   AutoDispCounter(PROC_AUTO_ADD_DELAY);
5376  1836 a605          	ld	a,#5
5377  1838 cd13e7        	call	L3212_AutoDispCounter
5379                     ; 573   return UI_RC_CONTINUE;
5380  183b a601          	ld	a,#1
5382  183d 20cb          	jra	L0531
5383  183f               LC076:
5384  183f ae03e8        	ldw	x,#1000
5385  1842 89            	pushw	x
5386  1843 5f            	clrw	x
5387  1844 89            	pushw	x
5388  1845 cd0000        	call	_UI_SetRefreshMsg
5390  1848 5b04          	addw	sp,#4
5391  184a 81            	ret	
5393                     	switch	.data
5394  0020               L3732_BeepOn:
5395  0020 00            	dc.b	0
5396  0021               L5732_StartBeepTime:
5397  0021 00000000      	dc.l	0
5398                     	switch	.const
5399  013a               L5042_msg:
5400  013a 00            	dc.b	0
5401  013b 00            	dc.b	0
5402  013c               L1242_msg:
5403  013c 00            	dc.b	0
5404  013d 00            	dc.b	0
5407                     ; 585 static uint8_t ProcAutoBeep(void *param, UI_MSG_T *pMsg)
5407                     ; 586 {
5408                     	switch	.text
5409  184b               L5012_ProcAutoBeep:
5410  184b 89            	pushw	x
5411  184c 5206          	subw	sp,#6
5412       00000006      OFST:	set	6
5414                     ; 594   switch(pMsg->message)
5415  184e 1e0b          	ldw	x,(OFST+5,sp)
5416  1850 e601          	ld	a,(1,x)
5418                     ; 652     default:
5418                     ; 653       break;
5419  1852 2709          	jreq	L7732
5420  1854 4a            	dec	a
5421  1855 2712          	jreq	L3042
5422  1857 4a            	dec	a
5423  1858 2770          	jreq	L7142
5424  185a cc18e7        	jra	L1342
5425  185d               L7732:
5426                     ; 328   return SystemTimer;
5427  185d ce0002        	ldw	x,_SystemTimer+2
5428  1860 cf0023        	ldw	L5732_StartBeepTime+2,x
5429  1863 ce0000        	ldw	x,_SystemTimer
5430  1866 cf0021        	ldw	L5732_StartBeepTime,x
5433  1869               L3042:
5435  1869 ce0002        	ldw	x,_SystemTimer+2
5436  186c 1f05          	ldw	(OFST-1,sp),x
5437  186e ce0000        	ldw	x,_SystemTimer
5438  1871 1f03          	ldw	(OFST-3,sp),x
5441                     ; 603       if(abs((int32_t)(sysTime - StartBeepTime)) >= TOTAL_BEEP_TIME)
5442  1873 96            	ldw	x,sp
5443  1874 1c0003        	addw	x,#OFST-3
5444  1877 cd0000        	call	c_ltor
5446  187a ae0021        	ldw	x,#L5732_StartBeepTime
5447  187d cd0000        	call	c_lsub
5449  1880 be02          	ldw	x,c_lreg+2
5450  1882 cd0000        	call	_abs
5452  1885 a30bb8        	cpw	x,#3000
5453  1888 2f10          	jrslt	L3342
5454                     ; 605         UI_MSG_T msg = {0, UIMSG_INIT};
5455  188a c6013a        	ld	a,L5042_msg
5456  188d 6b01          	ld	(OFST-5,sp),a
5457  188f c6013b        	ld	a,L5042_msg+1
5458  1892 6b02          	ld	(OFST-4,sp),a
5459                     ; 606         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_ADD_DELAY];
5460  1894 ad5a          	call	LC079
5461                     ; 613         return (SwitchAutoSubProcess(param, &msg));
5462  1896 96            	ldw	x,sp
5463  1897 5c            	incw	x
5466  1898 2043          	jp	LC077
5467  189a               L3342:
5468                     ; 617         if(BeepOn == TRUE)
5469  189a c60020        	ld	a,L3732_BeepOn
5470  189d 4a            	dec	a
5471  189e 260f          	jrne	L7342
5472                     ; 619           BeepOn = FALSE;
5473  18a0 c70020        	ld	L3732_BeepOn,a
5474                     ; 348   BuzzerOnTime = 0;
5475  18a3 5f            	clrw	x
5476  18a4 cf0002        	ldw	_BuzzerOnTime+2,x
5477  18a7 cf0000        	ldw	_BuzzerOnTime,x
5478                     ; 622           UI_SetRefreshMsg(BEEP_OFF_TIME);
5479  18aa ae02bc        	ldw	x,#700
5482  18ad 2011          	jp	LC078
5483  18af               L7342:
5484                     ; 626           BeepOn = TRUE;
5485  18af 35010020      	mov	L3732_BeepOn,#1
5486                     ; 338   BuzzerOnTime = buzzTime;
5487  18b3 ae012c        	ldw	x,#300
5488  18b6 cf0002        	ldw	_BuzzerOnTime+2,x
5489  18b9 5f            	clrw	x
5490  18ba cf0000        	ldw	_BuzzerOnTime,x
5491                     ; 629           UI_SetRefreshMsg(BEEP_ON_TIME);
5492  18bd ae012c        	ldw	x,#300
5494  18c0               LC078:
5495  18c0 89            	pushw	x
5496  18c1 5f            	clrw	x
5497  18c2 89            	pushw	x
5498  18c3 cd0000        	call	_UI_SetRefreshMsg
5499  18c6 5b04          	addw	sp,#4
5500  18c8 201d          	jra	L1342
5501  18ca               L7142:
5502                     ; 637       if((uint8_t)pMsg->param == UI_SW_PRESS)
5503  18ca f6            	ld	a,(x)
5504  18cb 261a          	jrne	L1342
5505                     ; 639         UI_MSG_T msg = {0, UIMSG_INIT};
5506  18cd c6013c        	ld	a,L1242_msg
5507  18d0 6b05          	ld	(OFST-1,sp),a
5508  18d2 c6013d        	ld	a,L1242_msg+1
5509  18d5 6b06          	ld	(OFST+0,sp),a
5510                     ; 640         pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_ADD_DELAY];
5511  18d7 ad17          	call	LC079
5512                     ; 647         return (SwitchAutoSubProcess(param, &msg));
5513  18d9 96            	ldw	x,sp
5514  18da 1c0005        	addw	x,#OFST-1
5516  18dd               LC077:
5517  18dd 89            	pushw	x
5518  18de 1e09          	ldw	x,(OFST+3,sp)
5519  18e0 cd13d7        	call	L1212_SwitchAutoSubProcess
5520  18e3 85            	popw	x
5522  18e4               L4731:
5523  18e4 5b08          	addw	sp,#8
5524  18e6 81            	ret	
5525                     ; 652     default:
5525                     ; 653       break;
5526  18e7               L1342:
5527                     ; 656   AutoDispCounter(PROC_AUTO_BEEP);
5528  18e7 a606          	ld	a,#6
5529  18e9 cd13e7        	call	L3212_AutoDispCounter
5531                     ; 657   return UI_RC_CONTINUE;
5532  18ec a601          	ld	a,#1
5534  18ee 20f4          	jra	L4731
5535  18f0               LC079:
5536  18f0 ae179e        	ldw	x,#L3012_ProcAutoAddDelay
5537  18f3 cf0011        	ldw	L3112_pfProcAuto,x
5538                     ; 608         BeepOn = FALSE;
5539  18f6 725f0020      	clr	L3732_BeepOn
5540                     ; 348   BuzzerOnTime = 0;
5541  18fa 5f            	clrw	x
5542  18fb cf0002        	ldw	_BuzzerOnTime+2,x
5543  18fe cf0000        	ldw	_BuzzerOnTime,x
5544                     ; 611         UI_SetRefreshMsg(0);
5545  1901 89            	pushw	x
5546  1902 89            	pushw	x
5547  1903 cd0000        	call	_UI_SetRefreshMsg
5549  1906 5b04          	addw	sp,#4
5550  1908 81            	ret	
5552                     ; 671 static uint8_t ProcAutoError01(void *param, UI_MSG_T *pMsg)
5552                     ; 672 {
5553  1909               L7012_ProcAutoError01:
5555                     ; 673   AutoDispCounter(PROC_AUTO_ERROR_01);
5556  1909 a607          	ld	a,#7
5557  190b cd13e7        	call	L3212_AutoDispCounter
5559                     ; 675   return UI_RC_CONTINUE;
5560  190e a601          	ld	a,#1
5562  1910 81            	ret	
5565                     ; 685 uint8_t UI_ProcessAuto(void *param, UI_MSG_T *pMsg)
5565                     ; 686 {
5566  1911               _UI_ProcessAuto:
5567  1911 89            	pushw	x
5568       00000000      OFST:	set	0
5570                     ; 687   if(pMsg->message == UIMSG_INIT)
5571  1912 1e05          	ldw	x,(OFST+5,sp)
5572  1914 e601          	ld	a,(1,x)
5573  1916 2608          	jrne	L5442
5574                     ; 689     pfProcAuto = PF_PROC_AUTO_LIST[PROC_AUTO_START_H_MOTOR];
5575  1918 ae150a        	ldw	x,#L1702_ProcAutoStartHMotor
5576  191b cf0011        	ldw	L3112_pfProcAuto,x
5577  191e 1e05          	ldw	x,(OFST+5,sp)
5578  1920               L5442:
5579                     ; 692   return (pfProcAuto(param, pMsg));
5580  1920 89            	pushw	x
5581  1921 1e03          	ldw	x,(OFST+3,sp)
5582  1923 72cd0011      	call	[L3112_pfProcAuto.w]
5585  1927 5b04          	addw	sp,#4
5586  1929 81            	ret	
5588                     	switch	.data
5589  0025               L7442_SET_MODE_STR:
5590  0025 01fb          	dc.w	L1542
5591  0027 01f4          	dc.w	L3542
5592  0029               L5542_flagAutoCount:
5593  0029 00            	dc.b	0
5594                     ; 21 uint8_t UI_ProcessSetM(void * pParam, UI_MSG_T * pMsg)
5594                     ; 22 {
5595                     	switch	.text
5596  192a               _UI_ProcessSetM:
5597  192a 89            	pushw	x
5598       00000000      OFST:	set	0
5600                     ; 25   switch(pMsg->message)
5601  192b 1e05          	ldw	x,(OFST+5,sp)
5602  192d e601          	ld	a,(1,x)
5604                     ; 64       break;
5605  192f 2716          	jreq	L7542
5606  1931 a002          	sub	a,#2
5607  1933 2739          	jreq	L7642
5608  1935 a018          	sub	a,#24
5609  1937 2718          	jreq	L3642
5610  1939 4a            	dec	a
5611  193a 2715          	jreq	L3642
5612  193c 4a            	dec	a
5613  193d 271f          	jreq	L5642
5614  193f 4a            	dec	a
5615  1940 271c          	jreq	L5642
5616  1942 4a            	dec	a
5617  1943 272f          	jreq	L1742
5618  1945 2036          	jra	L7742
5619  1947               L7542:
5620                     ; 90   return FlagAutoCount;
5621  1947 5500000029    	mov	L5542_flagAutoCount,_FlagAutoCount
5624                     ; 31       DISP_ClearAll();
5625  194c cd0000        	call	_DISP_ClearAll
5627                     ; 33     break;
5628  194f 202c          	jra	L7742
5629  1951               L3642:
5630                     ; 35     case UIMSG_KEY_UP:
5630                     ; 36     case UIMSG_KEY_DOWN:
5630                     ; 37       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
5631  1951 f6            	ld	a,(x)
5632  1952 4a            	dec	a
5633  1953 2628          	jrne	L7742
5634                     ; 39         flagAutoCount = (uint8_t)(flagAutoCount == FALSE ? TRUE : FALSE);
5635  1955 725d0029      	tnz	L5542_flagAutoCount
5636  1959 260d          	jrne	L6141
5637  195b               LC082:
5638  195b 4c            	inc	a
5639  195c 200b          	jra	L0241
5640  195e               L5642:
5641                     ; 43     case UIMSG_KEY_BACK:
5641                     ; 44     case UIMSG_KEY_NEXT:
5641                     ; 45       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
5642  195e f6            	ld	a,(x)
5643  195f 4a            	dec	a
5644  1960 261b          	jrne	L7742
5645                     ; 47         flagAutoCount = (uint8_t)(flagAutoCount == FALSE ? TRUE : FALSE);
5646  1962 725d0029      	tnz	L5542_flagAutoCount
5647  1966 27f3          	jreq	LC082
5648  1968               L6141:
5649  1968 4f            	clr	a
5650  1969               L0241:
5651  1969 c70029        	ld	L5542_flagAutoCount,a
5652  196c 200f          	jra	L7742
5653  196e               L7642:
5654                     ; 51     case UIMSG_SW_RESET:
5654                     ; 52       if((uint8_t)pMsg->param == UI_SW_RELEASE)
5655  196e f6            	ld	a,(x)
5656  196f 4a            	dec	a
5657  1970 260b          	jrne	L7742
5658                     ; 54         return UI_RC_FINISH;
5660  1972 201d          	jra	L6241
5661  1974               L1742:
5662                     ; 58     case UIMSG_KEY_ENT:
5662                     ; 59       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
5663  1974 f6            	ld	a,(x)
5664  1975 4a            	dec	a
5665  1976 2605          	jrne	L7742
5666                     ; 80   FlagAutoCount = flag;
5667  1978 5500290000    	mov	_FlagAutoCount,L5542_flagAutoCount
5668  197d               L7742:
5669                     ; 67   DISP_UpperClear();
5670  197d cd0000        	call	_DISP_UpperClear
5672                     ; 68   DISP_UpperPutStr((char *)SET_MODE_STR[flagAutoCount], 0);
5673  1980 4b00          	push	#0
5674  1982 c60029        	ld	a,L5542_flagAutoCount
5675  1985 5f            	clrw	x
5676  1986 97            	ld	xl,a
5677  1987 58            	sllw	x
5678  1988 de0025        	ldw	x,(L7442_SET_MODE_STR,x)
5679  198b cd0000        	call	_DISP_UpperPutStr
5681  198e 84            	pop	a
5682                     ; 70   return UI_RC_CONTINUE;
5683  198f a601          	ld	a,#1
5685  1991               L6241:
5686  1991 85            	popw	x
5687  1992 81            	ret	
5689                     	switch	.const
5690  013e               L1152_REG_ID_C_COUNT_TYPE:
5691  013e 0e            	dc.b	14
5692  013f 0f            	dc.b	15
5693  0140 10            	dc.b	16
5694                     	switch	.data
5695  002a               L3152_pCntLogtrings:
5696  002a 01ee          	dc.w	L5152
5697  002c 01e8          	dc.w	L7152
5698  002e 01e2          	dc.w	L1252
5699  0030               L3252_cntLogType:
5700  0030 00            	dc.b	0
5701                     ; 32 uint8_t UI_ProcessCntlg(void *pParam, UI_MSG_T *pMsg)
5701                     ; 33 {
5702                     	switch	.text
5703  1993               _UI_ProcessCntlg:
5704  1993 89            	pushw	x
5705  1994 520c          	subw	sp,#12
5706       0000000c      OFST:	set	12
5708                     ; 42   uint32_t cntLog = 0;
5709  1996 5f            	clrw	x
5710  1997 1f0b          	ldw	(OFST-1,sp),x
5711  1999 1f09          	ldw	(OFST-3,sp),x
5712                     ; 44   switch(pMsg->message)
5713  199b 1e11          	ldw	x,(OFST+5,sp)
5714  199d e601          	ld	a,(1,x)
5716                     ; 90     default:
5716                     ; 91       break;
5717  199f 2717          	jreq	L5252
5718  19a1 a002          	sub	a,#2
5719  19a3 2742          	jreq	L3352
5720  19a5 a018          	sub	a,#24
5721  19a7 2714          	jreq	L7252
5722  19a9 4a            	dec	a
5723  19aa 2727          	jreq	L1352
5724  19ac 4a            	dec	a
5725  19ad 270e          	jreq	L7252
5726  19af 4a            	dec	a
5727  19b0 2721          	jreq	L1352
5728  19b2 a002          	sub	a,#2
5729  19b4 2731          	jreq	L3352
5730  19b6 2032          	jra	L1452
5731  19b8               L5252:
5732                     ; 48       cntLogType = MODE_C_TRUE_COUNT;
5733  19b8 c70030        	ld	L3252_cntLogType,a
5734                     ; 50     break;
5735  19bb 202d          	jra	L1452
5736  19bd               L7252:
5737                     ; 52     case UIMSG_KEY_BACK:
5737                     ; 53     case UIMSG_KEY_UP:
5737                     ; 54       if((uint8_t)pMsg->param == UI_KEY_PRESS)
5738  19bd f6            	ld	a,(x)
5739  19be 262a          	jrne	L1452
5740                     ; 56         if(cntLogType == MODE_C_UNDER_COUNT)
5741  19c0 c60030        	ld	a,L3252_cntLogType
5742  19c3 a102          	cp	a,#2
5743  19c5 2606          	jrne	L5452
5744                     ; 58           cntLogType = MODE_C_TRUE_COUNT;
5745  19c7 725f0030      	clr	L3252_cntLogType
5747  19cb 201d          	jra	L1452
5748  19cd               L5452:
5749                     ; 62           cntLogType++;
5750  19cd 725c0030      	inc	L3252_cntLogType
5751  19d1 2017          	jra	L1452
5752  19d3               L1352:
5753                     ; 67     case UIMSG_KEY_NEXT:
5753                     ; 68     case UIMSG_KEY_DOWN:
5753                     ; 69       if((uint8_t)pMsg->param == UI_KEY_PRESS)
5754  19d3 f6            	ld	a,(x)
5755  19d4 2614          	jrne	L1452
5756                     ; 71         if(cntLogType == MODE_C_TRUE_COUNT)
5757  19d6 c60030        	ld	a,L3252_cntLogType
5758  19d9 2606          	jrne	L3552
5759                     ; 73           cntLogType = MODE_C_UNDER_COUNT;
5760  19db 35020030      	mov	L3252_cntLogType,#2
5762  19df 2009          	jra	L1452
5763  19e1               L3552:
5764                     ; 77           cntLogType--;
5765  19e1 725a0030      	dec	L3252_cntLogType
5766  19e5 2003          	jra	L1452
5767  19e7               L3352:
5768                     ; 82     case UIMSG_KEY_CLR:
5768                     ; 83     case UIMSG_SW_RESET:
5768                     ; 84       if((uint8_t)pMsg->param == UI_SW_PRESS)
5769  19e7 f6            	ld	a,(x)
5770                     ; 86         return UI_RC_FINISH;
5772  19e8 2744          	jreq	L4441
5773                     ; 90     default:
5773                     ; 91       break;
5774  19ea               L1452:
5775                     ; 94   REG_GetValue(&cntLog, REG_ID_C_COUNT_TYPE[cntLogType]);
5776  19ea c60030        	ld	a,L3252_cntLogType
5777  19ed 5f            	clrw	x
5778  19ee 97            	ld	xl,a
5779  19ef d6013e        	ld	a,(L1152_REG_ID_C_COUNT_TYPE,x)
5780  19f2 88            	push	a
5781  19f3 96            	ldw	x,sp
5782  19f4 1c000a        	addw	x,#OFST-2
5783  19f7 cd0000        	call	_REG_GetValue
5785  19fa 84            	pop	a
5786                     ; 96   DISP_ClearAll();
5787  19fb cd0000        	call	_DISP_ClearAll
5789                     ; 98   sprintf((char *)&string[0], DISP_LOWER_STR_FORMAT, cntLog);
5790  19fe 1e0b          	ldw	x,(OFST-1,sp)
5791  1a00 89            	pushw	x
5792  1a01 1e0b          	ldw	x,(OFST-1,sp)
5793  1a03 89            	pushw	x
5794  1a04 ce0000        	ldw	x,_pDisp
5795  1a07 ee08          	ldw	x,(8,x)
5796  1a09 89            	pushw	x
5797  1a0a 96            	ldw	x,sp
5798  1a0b 1c0007        	addw	x,#OFST-5
5799  1a0e cd0000        	call	_sprintf
5801  1a11 5b06          	addw	sp,#6
5802                     ; 99   DISP_LowerPutStr((char *)&string[0], 0);
5803  1a13 4b00          	push	#0
5804  1a15 96            	ldw	x,sp
5805  1a16 1c0002        	addw	x,#OFST-10
5806  1a19 cd0000        	call	_DISP_LowerPutStr
5808  1a1c 84            	pop	a
5809                     ; 101   DISP_UpperPutStr((char *)pCntLogtrings[cntLogType], 0);
5810  1a1d 4b00          	push	#0
5811  1a1f c60030        	ld	a,L3252_cntLogType
5812  1a22 5f            	clrw	x
5813  1a23 97            	ld	xl,a
5814  1a24 58            	sllw	x
5815  1a25 de002a        	ldw	x,(L3152_pCntLogtrings,x)
5816  1a28 cd0000        	call	_DISP_UpperPutStr
5818  1a2b 84            	pop	a
5819                     ; 103   return UI_RC_CONTINUE;
5820  1a2c a601          	ld	a,#1
5822  1a2e               L4441:
5823  1a2e 5b0e          	addw	sp,#14
5824  1a30 81            	ret	
5826                     	switch	.const
5827  0141               L5652_PF_PROC_STPEN_LIST:
5829  0141 1a31          	dc.w	L1652_ProcStpenEdit
5831  0143 1aed          	dc.w	L3652_ProcStpenWrite
5832                     	switch	.data
5833  0031               L7652_pfProcStpen:
5834  0031 0000          	dc.w	0
5835  0033               L1752_LOWER_STR:
5836  0033 01de          	dc.w	L3752
5837  0035 01db          	dc.w	L5752
5838  0037               L7752_UPPER_STR:
5839  0037 01d5          	dc.w	L1062
5840  0039 01cf          	dc.w	L3062
5841  003b               L5062_stampEnable:
5842  003b 00000000      	dc.l	0
5843                     	switch	.const
5844  0145               L1262_msg:
5845  0145 00            	dc.b	0
5846  0146 00            	dc.b	0
5848                     ; 45 static uint8_t ProcStpenEdit(void *pParam, UI_MSG_T *pMsg)
5848                     ; 46 {
5849                     	switch	.text
5850  1a31               L1652_ProcStpenEdit:
5851  1a31 89            	pushw	x
5852  1a32 5203          	subw	sp,#3
5853       00000003      OFST:	set	3
5855                     ; 52   switch(pMsg->message)
5856  1a34 1e08          	ldw	x,(OFST+5,sp)
5857  1a36 e601          	ld	a,(1,x)
5859                     ; 108       break;
5860  1a38 271a          	jreq	L7062
5861  1a3a a002          	sub	a,#2
5862  1a3c 2759          	jreq	L5162
5863  1a3e a018          	sub	a,#24
5864  1a40 272d          	jreq	L1162
5865  1a42 4a            	dec	a
5866  1a43 272a          	jreq	L1162
5867  1a45 4a            	dec	a
5868  1a46 2737          	jreq	L3162
5869  1a48 4a            	dec	a
5870  1a49 2734          	jreq	L3162
5871  1a4b 4a            	dec	a
5872  1a4c 274e          	jreq	L7162
5873  1a4e 4a            	dec	a
5874  1a4f 2746          	jreq	L5162
5875  1a51 cc1ad9        	jra	L1362
5876  1a54               L7062:
5877                     ; 56       REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
5878  1a54 4b02          	push	#2
5879  1a56 ae003b        	ldw	x,#L5062_stampEnable
5880  1a59 cd0000        	call	_REG_GetValue
5882  1a5c 84            	pop	a
5883                     ; 58       DISP_ClearAll();
5884  1a5d cd0000        	call	_DISP_ClearAll
5886                     ; 59       DISP_LowerPutStr((char *)LOWER_STR[stampEnable], 0);
5887  1a60 4b00          	push	#0
5888  1a62 ce003d        	ldw	x,L5062_stampEnable+2
5889  1a65 58            	sllw	x
5890  1a66 de0033        	ldw	x,(L1752_LOWER_STR,x)
5891  1a69 cd0000        	call	_DISP_LowerPutStr
5893  1a6c 84            	pop	a
5894                     ; 61     break;
5895  1a6d 206a          	jra	L1362
5896  1a6f               L1162:
5897                     ; 63     case UIMSG_KEY_UP:
5897                     ; 64     case UIMSG_KEY_DOWN:
5897                     ; 65       if((uint8_t)pMsg->param == UI_KEY_PRESS)
5898  1a6f f6            	ld	a,(x)
5899  1a70 2667          	jrne	L1362
5900                     ; 67         stampEnable = stampEnable == FALSE ? TRUE : FALSE;
5901  1a72 ae003b        	ldw	x,#L5062_stampEnable
5902  1a75 cd0000        	call	c_lzmp
5904  1a78 2611          	jrne	L2641
5905  1a7a               LC085:
5906  1a7a ae0001        	ldw	x,#1
5907  1a7d 200d          	jra	L4641
5910  1a7f               L3162:
5911                     ; 71     case UIMSG_KEY_BACK:
5911                     ; 72     case UIMSG_KEY_NEXT:
5911                     ; 73       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
5912  1a7f f6            	ld	a,(x)
5913  1a80 4a            	dec	a
5914  1a81 2656          	jrne	L1362
5915                     ; 75         stampEnable = stampEnable == FALSE ? TRUE : FALSE;
5916  1a83 ae003b        	ldw	x,#L5062_stampEnable
5917  1a86 cd0000        	call	c_lzmp
5919  1a89 27ef          	jreq	LC085
5920  1a8b               L2641:
5921  1a8b 5f            	clrw	x
5922  1a8c               L4641:
5924  1a8c cd0000        	call	c_itolx
5925  1a8f ae003b        	ldw	x,#L5062_stampEnable
5926  1a92 cd0000        	call	c_rtol
5928  1a95 2042          	jra	L1362
5929  1a97               L5162:
5930                     ; 79     case UIMSG_KEY_CLR:
5930                     ; 80     case UIMSG_SW_RESET:
5930                     ; 81       if((uint8_t)pMsg->param == UI_SW_PRESS)
5931  1a97 f6            	ld	a,(x)
5932  1a98 263f          	jrne	L1362
5933                     ; 83         return UI_RC_FINISH;
5935  1a9a 203a          	jra	L6741
5936  1a9c               L7162:
5937                     ; 87     case UIMSG_KEY_ENT:
5937                     ; 88       if((uint8_t)pMsg->param == UI_KEY_PRESS)
5938  1a9c f6            	ld	a,(x)
5939  1a9d 263a          	jrne	L1362
5940                     ; 90         UI_MSG_T msg = {0, UIMSG_INIT};
5941  1a9f c60145        	ld	a,L1262_msg
5942  1aa2 6b02          	ld	(OFST-1,sp),a
5943  1aa4 c60146        	ld	a,L1262_msg+1
5944  1aa7 6b03          	ld	(OFST+0,sp),a
5945                     ; 91         pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_WRITE];
5946  1aa9 ae1aed        	ldw	x,#L3652_ProcStpenWrite
5947  1aac cf0031        	ldw	L7652_pfProcStpen,x
5948                     ; 93         if(stampEnable == FALSE)
5949  1aaf ae003b        	ldw	x,#L5062_stampEnable
5950  1ab2 cd0000        	call	c_lzmp
5952  1ab5 260d          	jrne	L3462
5953                     ; 170   return CounterMode;
5954  1ab7 c60000        	ld	a,_CounterMode
5955  1aba 6b01          	ld	(OFST-2,sp),a
5958                     ; 97           if(cntMode == COUNT_MODE_S)
5959  1abc a103          	cp	a,#3
5960  1abe 2604          	jrne	L3462
5961                     ; 99             cntMode = COUNT_MODE_C;
5962                     ; 160   CounterMode = mode;
5963  1ac0 725f0000      	clr	_CounterMode
5964  1ac4               L3462:
5965                     ; 104         REG_SetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
5966  1ac4 4b02          	push	#2
5967  1ac6 cd0000        	call	_REG_SetValue
5969  1ac9 84            	pop	a
5970                     ; 106         return (pfProcStpen(pParam, &msg));
5971  1aca 96            	ldw	x,sp
5972  1acb 1c0002        	addw	x,#OFST-1
5973  1ace 89            	pushw	x
5974  1acf 1e06          	ldw	x,(OFST+3,sp)
5975  1ad1 72cd0031      	call	[L7652_pfProcStpen.w]
5977  1ad5 85            	popw	x
5979  1ad6               L6741:
5980  1ad6 5b05          	addw	sp,#5
5981  1ad8 81            	ret	
5982  1ad9               L1362:
5983                     ; 111   DISP_UpperClear();
5984  1ad9 cd0000        	call	_DISP_UpperClear
5986                     ; 112   DISP_UpperPutStr((char *)UPPER_STR[stampEnable], 0);
5987  1adc 4b00          	push	#0
5988  1ade ce003d        	ldw	x,L5062_stampEnable+2
5989  1ae1 58            	sllw	x
5990  1ae2 de0037        	ldw	x,(L7752_UPPER_STR,x)
5991  1ae5 cd0000        	call	_DISP_UpperPutStr
5993  1ae8 84            	pop	a
5994                     ; 114   return UI_RC_CONTINUE;
5995  1ae9 a601          	ld	a,#1
5997  1aeb 20e9          	jra	L6741
5999                     	switch	.const
6000  0147               L3562_msg:
6001  0147 00            	dc.b	0
6002  0148 00            	dc.b	0
6004                     ; 124 static uint8_t ProcStpenWrite(void *param, UI_MSG_T *pMsg)
6004                     ; 125 {
6005                     	switch	.text
6006  1aed               L3652_ProcStpenWrite:
6007  1aed 89            	pushw	x
6008  1aee 89            	pushw	x
6009       00000002      OFST:	set	2
6011                     ; 128   switch(pMsg->message)
6012  1aef 1e07          	ldw	x,(OFST+5,sp)
6013  1af1 e601          	ld	a,(1,x)
6015                     ; 152     default:
6015                     ; 153       break;
6016  1af3 2705          	jreq	L7462
6017  1af5 4a            	dec	a
6018  1af6 2717          	jreq	L1562
6019  1af8 2034          	jra	L1662
6020  1afa               L7462:
6021                     ; 132       DISP_ClearAll();
6022  1afa cd0000        	call	_DISP_ClearAll
6024                     ; 134       RET_WriteRetEnbale(TRUE);
6025  1afd a601          	ld	a,#1
6026  1aff cd0000        	call	_RET_WriteRetEnbale
6028                     ; 136       UI_SetRefreshMsg(MEMORY_WRITE_TIME);
6029  1b02 ae02bc        	ldw	x,#700
6030  1b05 89            	pushw	x
6031  1b06 5f            	clrw	x
6032  1b07 89            	pushw	x
6033  1b08 cd0000        	call	_UI_SetRefreshMsg
6035  1b0b 5b04          	addw	sp,#4
6036                     ; 138     break;
6037  1b0d 201f          	jra	L1662
6038  1b0f               L1562:
6039                     ; 142       UI_MSG_T msg = {0, UIMSG_INIT};
6040  1b0f c60147        	ld	a,L3562_msg
6041  1b12 6b01          	ld	(OFST-1,sp),a
6042  1b14 c60148        	ld	a,L3562_msg+1
6043  1b17 6b02          	ld	(OFST+0,sp),a
6044                     ; 144       RET_WriteRetEnbale(FALSE);
6045  1b19 4f            	clr	a
6046  1b1a cd0000        	call	_RET_WriteRetEnbale
6048                     ; 146       pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_EDIT];
6049  1b1d ae1a31        	ldw	x,#L1652_ProcStpenEdit
6050  1b20 cf0031        	ldw	L7652_pfProcStpen,x
6051                     ; 148       return (pfProcStpen(param, &msg));
6052  1b23 96            	ldw	x,sp
6053  1b24 5c            	incw	x
6054  1b25 89            	pushw	x
6055  1b26 1e05          	ldw	x,(OFST+3,sp)
6056  1b28 cd1a31        	call	L1652_ProcStpenEdit
6058  1b2b 85            	popw	x
6060  1b2c 2002          	jra	L4151
6061                     ; 152     default:
6061                     ; 153       break;
6062  1b2e               L1662:
6063                     ; 156   return UI_RC_CONTINUE;
6064  1b2e a601          	ld	a,#1
6066  1b30               L4151:
6067  1b30 5b04          	addw	sp,#4
6068  1b32 81            	ret	
6071                     ; 168 uint8_t UI_ProcessStpen(void *param, UI_MSG_T *pMsg)
6071                     ; 169 {
6072  1b33               _UI_ProcessStpen:
6073  1b33 89            	pushw	x
6074       00000000      OFST:	set	0
6076                     ; 170   if(pMsg->message == UIMSG_INIT)
6077  1b34 1e05          	ldw	x,(OFST+5,sp)
6078  1b36 e601          	ld	a,(1,x)
6079  1b38 2608          	jrne	L3662
6080                     ; 172     pfProcStpen = PF_PROC_STPEN_LIST[PROC_STPEN_EDIT];
6081  1b3a ae1a31        	ldw	x,#L1652_ProcStpenEdit
6082  1b3d cf0031        	ldw	L7652_pfProcStpen,x
6083  1b40 1e05          	ldw	x,(OFST+5,sp)
6084  1b42               L3662:
6085                     ; 175   return (pfProcStpen(param, pMsg));
6086  1b42 89            	pushw	x
6087  1b43 1e03          	ldw	x,(OFST+3,sp)
6088  1b45 72cd0031      	call	[L7652_pfProcStpen.w]
6091  1b49 5b04          	addw	sp,#4
6092  1b4b 81            	ret	
6094                     	switch	.const
6095  0149               L1762_PF_PROC_UVSET_LIST:
6097  0149 1b4c          	dc.w	L5662_ProcUvsetEdit
6099  014b 1da1          	dc.w	L7662_ProcUvsetWrite
6100                     	switch	.data
6101  003f               L3762_pfProcUvset:
6102  003f 0000          	dc.w	0
6103  0041               L5762_EditVal:
6104  0041 00000000      	dc.l	0
6105  0045               L7762_EditEnable:
6106  0045 00            	dc.b	0
6107                     	switch	.const
6108  014d               L7372_msg:
6109  014d 00            	dc.b	0
6110  014e 00            	dc.b	0
6112  014f               L6351:
6113  014f 1b98          	dc.w	L3072
6114  0151 1ba6          	dc.w	L5072
6115  0153 1bb5          	dc.w	L7072
6116  0155 1bc5          	dc.w	L1172
6117  0157 1bd5          	dc.w	L3172
6118  0159 1be5          	dc.w	L5172
6119  015b 1bf5          	dc.w	L7172
6120  015d 1c05          	dc.w	L1272
6121  015f 1c15          	dc.w	L3272
6122  0161 1c25          	dc.w	L5272
6123  0163 1cb4          	dc.w	L3472
6124  0165 1cb4          	dc.w	L3472
6125  0167 1cb4          	dc.w	L3472
6126  0169 1cb4          	dc.w	L3472
6127  016b 1cb4          	dc.w	L3472
6128  016d 1cb4          	dc.w	L3472
6129  016f 1cb4          	dc.w	L3472
6130  0171 1cb4          	dc.w	L3472
6131  0173 1c35          	dc.w	L7272
6132  0175 1c44          	dc.w	L1372
6133  0177 1cb4          	dc.w	L3472
6134  0179 1cb4          	dc.w	L3472
6135  017b 1c80          	dc.w	L5372
6136  017d 1c53          	dc.w	L3372
6137                     ; 44 uint8_t ProcUvsetEdit(void *pParam, UI_MSG_T *pMsg)
6137                     ; 45 {
6138                     	switch	.text
6139  1b4c               L5662_ProcUvsetEdit:
6140  1b4c 89            	pushw	x
6141  1b4d 5215          	subw	sp,#21
6142       00000015      OFST:	set	21
6144                     ; 53   uint8_t digitVal = KEY_INVALID;
6145  1b4f a6ff          	ld	a,#255
6146  1b51 6b15          	ld	(OFST+0,sp),a
6147                     ; 55   uint32_t EditMinVal = 0, EditMaxVal = 0;
6148  1b53 5f            	clrw	x
6149  1b54 1f07          	ldw	(OFST-14,sp),x
6150  1b56 1f05          	ldw	(OFST-16,sp),x
6152  1b58 1f13          	ldw	(OFST-2,sp),x
6153  1b5a 1f11          	ldw	(OFST-4,sp),x
6154                     ; 56   REG_GetMinValue(&EditMinVal, REG_ID_UV_LVL);
6155  1b5c 4b11          	push	#17
6156  1b5e 96            	ldw	x,sp
6157  1b5f 1c0006        	addw	x,#OFST-15
6158  1b62 cd0000        	call	_REG_GetMinValue
6160  1b65 84            	pop	a
6161                     ; 57   REG_GetMaxValue(&EditMaxVal, REG_ID_UV_LVL);
6162  1b66 4b11          	push	#17
6163  1b68 96            	ldw	x,sp
6164  1b69 1c0012        	addw	x,#OFST-3
6165  1b6c cd0000        	call	_REG_GetMaxValue
6167  1b6f 84            	pop	a
6168                     ; 59   switch(pMsg->message)
6169  1b70 1e1a          	ldw	x,(OFST+5,sp)
6170  1b72 e601          	ld	a,(1,x)
6172                     ; 200       break;
6173  1b74 a008          	sub	a,#8
6174  1b76 a118          	cp	a,#24
6175  1b78 2407          	jruge	L4351
6176  1b7a 5f            	clrw	x
6177  1b7b 97            	ld	xl,a
6178  1b7c 58            	sllw	x
6179  1b7d de014f        	ldw	x,(L6351,x)
6180  1b80 fc            	jp	(x)
6181  1b81               L4351:
6182  1b81 a0f8          	sub	a,#-8
6183  1b83 270a          	jreq	L1072
6184  1b85 a002          	sub	a,#2
6185  1b87 2603cc1c53    	jreq	L3372
6186  1b8c cc1cb4        	jra	L3472
6187  1b8f               L1072:
6188                     ; 63       EditEnable = FALSE;
6189  1b8f c70045        	ld	L7762_EditEnable,a
6190                     ; 64       EditVal = 0;
6191  1b92 cd1d86        	call	LC087
6192                     ; 66     break;
6193  1b95 cc1cb4        	jra	L3472
6194  1b98               L3072:
6195                     ; 68     case UIMSG_KEY_DIG0:
6195                     ; 69       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6196  1b98 1e1a          	ldw	x,(OFST+5,sp)
6197  1b9a f6            	ld	a,(x)
6198  1b9b 26f8          	jrne	L3472
6199                     ; 71         digitVal = 0;
6200  1b9d 6b15          	ld	(OFST+0,sp),a
6201                     ; 72         EditEnable = TRUE;
6202  1b9f 35010045      	mov	L7762_EditEnable,#1
6203  1ba3 cc1cb4        	jra	L3472
6204  1ba6               L5072:
6205                     ; 76     case UIMSG_KEY_DIG1:
6205                     ; 77       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6206  1ba6 1e1a          	ldw	x,(OFST+5,sp)
6207  1ba8 f6            	ld	a,(x)
6208  1ba9 26f8          	jrne	L3472
6209                     ; 79         digitVal = 1;
6210  1bab 4c            	inc	a
6211  1bac 6b15          	ld	(OFST+0,sp),a
6212                     ; 80         EditEnable = TRUE;
6213  1bae 35010045      	mov	L7762_EditEnable,#1
6214  1bb2 cc1cb4        	jra	L3472
6215  1bb5               L7072:
6216                     ; 84     case UIMSG_KEY_DIG2:
6216                     ; 85       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6217  1bb5 1e1a          	ldw	x,(OFST+5,sp)
6218  1bb7 f6            	ld	a,(x)
6219  1bb8 26f8          	jrne	L3472
6220                     ; 87         digitVal = 2;
6221  1bba a602          	ld	a,#2
6222  1bbc 6b15          	ld	(OFST+0,sp),a
6223                     ; 88         EditEnable = TRUE;
6224  1bbe 35010045      	mov	L7762_EditEnable,#1
6225  1bc2 cc1cb4        	jra	L3472
6226  1bc5               L1172:
6227                     ; 92     case UIMSG_KEY_DIG3:
6227                     ; 93       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6228  1bc5 1e1a          	ldw	x,(OFST+5,sp)
6229  1bc7 f6            	ld	a,(x)
6230  1bc8 26f8          	jrne	L3472
6231                     ; 95         digitVal = 3;
6232  1bca a603          	ld	a,#3
6233  1bcc 6b15          	ld	(OFST+0,sp),a
6234                     ; 96         EditEnable = TRUE;
6235  1bce 35010045      	mov	L7762_EditEnable,#1
6236  1bd2 cc1cb4        	jra	L3472
6237  1bd5               L3172:
6238                     ; 100     case UIMSG_KEY_DIG4:
6238                     ; 101       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6239  1bd5 1e1a          	ldw	x,(OFST+5,sp)
6240  1bd7 f6            	ld	a,(x)
6241  1bd8 26f8          	jrne	L3472
6242                     ; 103         digitVal = 4;
6243  1bda a604          	ld	a,#4
6244  1bdc 6b15          	ld	(OFST+0,sp),a
6245                     ; 104         EditEnable = TRUE;
6246  1bde 35010045      	mov	L7762_EditEnable,#1
6247  1be2 cc1cb4        	jra	L3472
6248  1be5               L5172:
6249                     ; 108     case UIMSG_KEY_DIG5:
6249                     ; 109       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6250  1be5 1e1a          	ldw	x,(OFST+5,sp)
6251  1be7 f6            	ld	a,(x)
6252  1be8 26f8          	jrne	L3472
6253                     ; 111         digitVal = 5;
6254  1bea a605          	ld	a,#5
6255  1bec 6b15          	ld	(OFST+0,sp),a
6256                     ; 112         EditEnable = TRUE;
6257  1bee 35010045      	mov	L7762_EditEnable,#1
6258  1bf2 cc1cb4        	jra	L3472
6259  1bf5               L7172:
6260                     ; 116     case UIMSG_KEY_DIG6:
6260                     ; 117       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6261  1bf5 1e1a          	ldw	x,(OFST+5,sp)
6262  1bf7 f6            	ld	a,(x)
6263  1bf8 26f8          	jrne	L3472
6264                     ; 119         digitVal = 6;
6265  1bfa a606          	ld	a,#6
6266  1bfc 6b15          	ld	(OFST+0,sp),a
6267                     ; 120         EditEnable = TRUE;
6268  1bfe 35010045      	mov	L7762_EditEnable,#1
6269  1c02 cc1cb4        	jra	L3472
6270  1c05               L1272:
6271                     ; 124     case UIMSG_KEY_DIG7:
6271                     ; 125       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6272  1c05 1e1a          	ldw	x,(OFST+5,sp)
6273  1c07 f6            	ld	a,(x)
6274  1c08 26f8          	jrne	L3472
6275                     ; 127         digitVal = 7;
6276  1c0a a607          	ld	a,#7
6277  1c0c 6b15          	ld	(OFST+0,sp),a
6278                     ; 128         EditEnable = TRUE;
6279  1c0e 35010045      	mov	L7762_EditEnable,#1
6280  1c12 cc1cb4        	jra	L3472
6281  1c15               L3272:
6282                     ; 132     case UIMSG_KEY_DIG8:
6282                     ; 133       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6283  1c15 1e1a          	ldw	x,(OFST+5,sp)
6284  1c17 f6            	ld	a,(x)
6285  1c18 26f8          	jrne	L3472
6286                     ; 135         digitVal = 8;
6287  1c1a a608          	ld	a,#8
6288  1c1c 6b15          	ld	(OFST+0,sp),a
6289                     ; 136         EditEnable = TRUE;
6290  1c1e 35010045      	mov	L7762_EditEnable,#1
6291  1c22 cc1cb4        	jra	L3472
6292  1c25               L5272:
6293                     ; 140     case UIMSG_KEY_DIG9:
6293                     ; 141       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6294  1c25 1e1a          	ldw	x,(OFST+5,sp)
6295  1c27 f6            	ld	a,(x)
6296  1c28 26f8          	jrne	L3472
6297                     ; 143         digitVal = 9;
6298  1c2a a609          	ld	a,#9
6299  1c2c 6b15          	ld	(OFST+0,sp),a
6300                     ; 144         EditEnable = TRUE;
6301  1c2e 35010045      	mov	L7762_EditEnable,#1
6302  1c32 cc1cb4        	jra	L3472
6303  1c35               L7272:
6304                     ; 148     case UIMSG_KEY_TENS:
6304                     ; 149       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6305  1c35 1e1a          	ldw	x,(OFST+5,sp)
6306  1c37 f6            	ld	a,(x)
6307  1c38 267a          	jrne	L3472
6308                     ; 151         digitVal = KEY_TENS;
6309  1c3a a680          	ld	a,#128
6310  1c3c 6b15          	ld	(OFST+0,sp),a
6311                     ; 152         EditEnable = TRUE;
6312  1c3e 35010045      	mov	L7762_EditEnable,#1
6313  1c42 2070          	jra	L3472
6314  1c44               L1372:
6315                     ; 156     case UIMSG_KEY_UNITS:
6315                     ; 157       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6316  1c44 1e1a          	ldw	x,(OFST+5,sp)
6317  1c46 f6            	ld	a,(x)
6318  1c47 266b          	jrne	L3472
6319                     ; 159         digitVal = KEY_UNITS;
6320  1c49 a640          	ld	a,#64
6321  1c4b 6b15          	ld	(OFST+0,sp),a
6322                     ; 160         EditEnable = TRUE;
6323  1c4d 35010045      	mov	L7762_EditEnable,#1
6324  1c51 2061          	jra	L3472
6325  1c53               L3372:
6326                     ; 164     case UIMSG_KEY_CLR:
6326                     ; 165     case UIMSG_SW_RESET:
6326                     ; 166       if((uint8_t)pMsg->param == UI_SW_PRESS)
6327  1c53 1e1a          	ldw	x,(OFST+5,sp)
6328  1c55 f6            	ld	a,(x)
6329  1c56 265c          	jrne	L3472
6330                     ; 168         if(EditEnable == TRUE)
6331  1c58 c60045        	ld	a,L7762_EditEnable
6332  1c5b 4a            	dec	a
6333  1c5c 261f          	jrne	L7772
6334                     ; 170           if(EditVal < 10)
6335  1c5e cd1d8e        	call	LC088
6336  1c61 cd0000        	call	c_lcmp
6338  1c64 2409          	jruge	L1003
6339                     ; 172             EditVal = 0;
6340  1c66 cd1d86        	call	LC087
6341                     ; 173             EditEnable = FALSE;
6342  1c69 725f0045      	clr	L7762_EditEnable
6344  1c6d 2045          	jra	L3472
6345  1c6f               L1003:
6346                     ; 177             EditVal /= 10;
6347  1c6f cd1d8e        	call	LC088
6348  1c72 cd0000        	call	c_ludv
6350  1c75 ae0041        	ldw	x,#L5762_EditVal
6351  1c78 cd0000        	call	c_rtol
6353  1c7b 2037          	jra	L3472
6354  1c7d               L7772:
6355                     ; 182           return UI_RC_FINISH;
6356  1c7d 4f            	clr	a
6358  1c7e 2031          	jra	L4551
6359  1c80               L5372:
6360                     ; 187     case UIMSG_KEY_ENT:
6360                     ; 188       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6361  1c80 1e1a          	ldw	x,(OFST+5,sp)
6362  1c82 f6            	ld	a,(x)
6363  1c83 262f          	jrne	L3472
6364                     ; 190         UI_MSG_T msg = {0, UIMSG_INIT};
6365  1c85 c6014d        	ld	a,L7372_msg
6366  1c88 6b03          	ld	(OFST-18,sp),a
6367  1c8a c6014e        	ld	a,L7372_msg+1
6368  1c8d 6b04          	ld	(OFST-17,sp),a
6369                     ; 191         pfProcUvset = PF_PROC_UVSET_LIST[PROC_UVSET_WRITE];
6370  1c8f ae1da1        	ldw	x,#L7662_ProcUvsetWrite
6371  1c92 cf003f        	ldw	L3762_pfProcUvset,x
6372                     ; 193         REG_SetValue(&EditVal, REG_ID_UV_LVL);
6373  1c95 4b11          	push	#17
6374  1c97 ae0041        	ldw	x,#L5762_EditVal
6375  1c9a cd0000        	call	_REG_SetValue
6377  1c9d cd1d86        	call	LC087
6378  1ca0 725f0045      	clr	L7762_EditEnable
6379  1ca4 84            	pop	a
6380                     ; 195         EditVal = 0;
6381                     ; 196         EditEnable = FALSE;
6382                     ; 198         return (pfProcUvset(pParam, &msg));
6383  1ca5 96            	ldw	x,sp
6384  1ca6 1c0003        	addw	x,#OFST-18
6385  1ca9 89            	pushw	x
6386  1caa 1e18          	ldw	x,(OFST+3,sp)
6387  1cac 72cd003f      	call	[L3762_pfProcUvset.w]
6389  1cb0 85            	popw	x
6391  1cb1               L4551:
6392  1cb1 5b17          	addw	sp,#23
6393  1cb3 81            	ret	
6394  1cb4               L3472:
6395                     ; 203   if(EditEnable == TRUE)
6396  1cb4 c60045        	ld	a,L7762_EditEnable
6397  1cb7 4a            	dec	a
6398  1cb8 2703cc1d47    	jrne	L1103
6399                     ; 205     if(digitVal != KEY_INVALID)
6400  1cbd 7b15          	ld	a,(OFST+0,sp)
6401  1cbf a1ff          	cp	a,#255
6402  1cc1 277b          	jreq	L3103
6403                     ; 207       if(digitVal == KEY_TENS)
6404  1cc3 a180          	cp	a,#128
6405  1cc5 2619          	jrne	L5103
6406                     ; 209         if((EditVal + 10) <= EditMaxVal)
6407  1cc7 cd1d98        	call	LC089
6408  1cca cd0000        	call	c_ladc
6410  1ccd 96            	ldw	x,sp
6411  1cce 1c0011        	addw	x,#OFST-4
6412  1cd1 cd0000        	call	c_lcmp
6414  1cd4 2244          	jrugt	L3303
6415                     ; 211           EditVal += 10;
6416  1cd6 ae0041        	ldw	x,#L5762_EditVal
6417  1cd9 a60a          	ld	a,#10
6418  1cdb cd0000        	call	c_lgadc
6421  1cde 205e          	jra	L3103
6422                     ; 215           EditVal = 0;
6423  1ce0               L5103:
6424                     ; 218       else if (digitVal == KEY_UNITS)
6425  1ce0 a140          	cp	a,#64
6426  1ce2 263a          	jrne	L5203
6427                     ; 220         if(EditVal % 10 == 9)
6428  1ce4 cd1d8e        	call	LC088
6429  1ce7 cd0000        	call	c_lumd
6431  1cea ae00e2        	ldw	x,#L246
6432  1ced cd0000        	call	c_lcmp
6434  1cf0 260a          	jrne	L7203
6435                     ; 222           EditVal -= 9;
6436  1cf2 ae0041        	ldw	x,#L5762_EditVal
6437  1cf5 a609          	ld	a,#9
6438  1cf7 cd0000        	call	c_lgsbc
6441  1cfa 2042          	jra	L3103
6442  1cfc               L7203:
6443                     ; 226           if((EditVal + 1) <= EditMaxVal)
6444  1cfc ae0041        	ldw	x,#L5762_EditVal
6445  1cff cd0000        	call	c_ltor
6447  1d02 a601          	ld	a,#1
6448  1d04 cd0000        	call	c_ladc
6450  1d07 96            	ldw	x,sp
6451  1d08 1c0011        	addw	x,#OFST-4
6452  1d0b cd0000        	call	c_lcmp
6454  1d0e 220a          	jrugt	L3303
6455                     ; 228             EditVal += 1;
6456  1d10 ae0041        	ldw	x,#L5762_EditVal
6457  1d13 a601          	ld	a,#1
6458  1d15 cd0000        	call	c_lgadc
6461  1d18 2024          	jra	L3103
6462  1d1a               L3303:
6463                     ; 232             EditVal = 0;
6464  1d1a ad6a          	call	LC087
6465  1d1c 2020          	jra	L3103
6466  1d1e               L5203:
6467                     ; 238         if(((EditVal * 10) + digitVal) <= EditMaxVal)
6468  1d1e ad78          	call	LC089
6469  1d20 cd0000        	call	c_smul
6471  1d23 7b15          	ld	a,(OFST+0,sp)
6472  1d25 cd0000        	call	c_ladc
6474  1d28 96            	ldw	x,sp
6475  1d29 1c0011        	addw	x,#OFST-4
6476  1d2c cd0000        	call	c_lcmp
6478  1d2f 220d          	jrugt	L3103
6479                     ; 240           EditVal = (EditVal * 10) + digitVal;
6480  1d31 ad65          	call	LC089
6481  1d33 cd0000        	call	c_smul
6483  1d36 7b15          	ld	a,(OFST+0,sp)
6484  1d38 cd0000        	call	c_ladc
6486  1d3b cd0000        	call	c_rtol
6488  1d3e               L3103:
6489                     ; 245     sprintf((char *)&string[0], DISP_LOWER_STR_FORMAT, EditVal);
6490  1d3e ce0043        	ldw	x,L5762_EditVal+2
6491  1d41 89            	pushw	x
6492  1d42 ce0041        	ldw	x,L5762_EditVal
6495  1d45 2014          	jra	L3403
6496  1d47               L1103:
6497                     ; 249     uint32_t uvLevel = 0;
6498  1d47 5f            	clrw	x
6499  1d48 1f03          	ldw	(OFST-18,sp),x
6500  1d4a 1f01          	ldw	(OFST-20,sp),x
6501                     ; 251     REG_GetValue(&uvLevel, REG_ID_UV_LVL);
6502  1d4c 4b11          	push	#17
6503  1d4e 96            	ldw	x,sp
6504  1d4f 1c0002        	addw	x,#OFST-19
6505  1d52 cd0000        	call	_REG_GetValue
6507  1d55 84            	pop	a
6508                     ; 252     sprintf((char *)&string[0], DISP_LOWER_STR_FORMAT, uvLevel);
6509  1d56 1e03          	ldw	x,(OFST-18,sp)
6510  1d58 89            	pushw	x
6511  1d59 1e03          	ldw	x,(OFST-18,sp)
6513  1d5b               L3403:
6514  1d5b 89            	pushw	x
6515  1d5c ce0000        	ldw	x,_pDisp
6516  1d5f ee08          	ldw	x,(8,x)
6517  1d61 89            	pushw	x
6518  1d62 96            	ldw	x,sp
6519  1d63 1c000f        	addw	x,#OFST-6
6520  1d66 cd0000        	call	_sprintf
6521  1d69 5b06          	addw	sp,#6
6522                     ; 255   DISP_ClearAll();
6523  1d6b cd0000        	call	_DISP_ClearAll
6525                     ; 257   DISP_UpperPutStr("UVSET", 0);
6526  1d6e 4b00          	push	#0
6527  1d70 ae01c9        	ldw	x,#L5403
6528  1d73 cd0000        	call	_DISP_UpperPutStr
6530  1d76 84            	pop	a
6531                     ; 258   DISP_LowerPutStr((char *)&string[0], 0);
6532  1d77 4b00          	push	#0
6533  1d79 96            	ldw	x,sp
6534  1d7a 1c000a        	addw	x,#OFST-11
6535  1d7d cd0000        	call	_DISP_LowerPutStr
6537  1d80 84            	pop	a
6538                     ; 260   return UI_RC_CONTINUE;
6539  1d81 a601          	ld	a,#1
6541  1d83 cc1cb1        	jra	L4551
6542  1d86               LC087:
6543  1d86 5f            	clrw	x
6544  1d87 cf0043        	ldw	L5762_EditVal+2,x
6545  1d8a cf0041        	ldw	L5762_EditVal,x
6546  1d8d 81            	ret	
6547  1d8e               LC088:
6548  1d8e ae0041        	ldw	x,#L5762_EditVal
6549  1d91 cd0000        	call	c_ltor
6551  1d94 ae0032        	ldw	x,#L63
6552  1d97 81            	ret	
6553  1d98               LC089:
6554  1d98 ae0041        	ldw	x,#L5762_EditVal
6555  1d9b cd0000        	call	c_ltor
6557  1d9e a60a          	ld	a,#10
6558  1da0 81            	ret	
6560                     	switch	.const
6561  017f               L3503_msg:
6562  017f 00            	dc.b	0
6563  0180 00            	dc.b	0
6565                     ; 273 static uint8_t ProcUvsetWrite(void *param, UI_MSG_T *pMsg)
6565                     ; 274 {
6566                     	switch	.text
6567  1da1               L7662_ProcUvsetWrite:
6568  1da1 89            	pushw	x
6569  1da2 89            	pushw	x
6570       00000002      OFST:	set	2
6572                     ; 277   switch(pMsg->message)
6573  1da3 1e07          	ldw	x,(OFST+5,sp)
6574  1da5 e601          	ld	a,(1,x)
6576                     ; 301     default:
6576                     ; 302       break;
6577  1da7 2705          	jreq	L7403
6578  1da9 4a            	dec	a
6579  1daa 2717          	jreq	L1503
6580  1dac 2034          	jra	L1603
6581  1dae               L7403:
6582                     ; 281       DISP_ClearAll();
6583  1dae cd0000        	call	_DISP_ClearAll
6585                     ; 283       RET_WriteRetEnbale(TRUE);
6586  1db1 a601          	ld	a,#1
6587  1db3 cd0000        	call	_RET_WriteRetEnbale
6589                     ; 285       UI_SetRefreshMsg(MEMORY_WRITE_TIME);
6590  1db6 ae02bc        	ldw	x,#700
6591  1db9 89            	pushw	x
6592  1dba 5f            	clrw	x
6593  1dbb 89            	pushw	x
6594  1dbc cd0000        	call	_UI_SetRefreshMsg
6596  1dbf 5b04          	addw	sp,#4
6597                     ; 287     break;
6598  1dc1 201f          	jra	L1603
6599  1dc3               L1503:
6600                     ; 291       UI_MSG_T msg = {0, UIMSG_INIT};
6601  1dc3 c6017f        	ld	a,L3503_msg
6602  1dc6 6b01          	ld	(OFST-1,sp),a
6603  1dc8 c60180        	ld	a,L3503_msg+1
6604  1dcb 6b02          	ld	(OFST+0,sp),a
6605                     ; 293       RET_WriteRetEnbale(FALSE);
6606  1dcd 4f            	clr	a
6607  1dce cd0000        	call	_RET_WriteRetEnbale
6609                     ; 295       pfProcUvset = PF_PROC_UVSET_LIST[PROC_UVSET_EDIT];
6610  1dd1 ae1b4c        	ldw	x,#L5662_ProcUvsetEdit
6611  1dd4 cf003f        	ldw	L3762_pfProcUvset,x
6612                     ; 297       return (pfProcUvset(param, &msg));
6613  1dd7 96            	ldw	x,sp
6614  1dd8 5c            	incw	x
6615  1dd9 89            	pushw	x
6616  1dda 1e05          	ldw	x,(OFST+3,sp)
6617  1ddc cd1b4c        	call	L5662_ProcUvsetEdit
6619  1ddf 85            	popw	x
6621  1de0 2002          	jra	L2751
6622                     ; 301     default:
6622                     ; 302       break;
6623  1de2               L1603:
6624                     ; 305   return UI_RC_CONTINUE;
6625  1de2 a601          	ld	a,#1
6627  1de4               L2751:
6628  1de4 5b04          	addw	sp,#4
6629  1de6 81            	ret	
6632                     ; 317 uint8_t UI_ProcessUvset(void *param, UI_MSG_T *pMsg)
6632                     ; 318 {
6633  1de7               _UI_ProcessUvset:
6634  1de7 89            	pushw	x
6635       00000000      OFST:	set	0
6637                     ; 319   if(pMsg->message == UIMSG_INIT)
6638  1de8 1e05          	ldw	x,(OFST+5,sp)
6639  1dea e601          	ld	a,(1,x)
6640  1dec 2608          	jrne	L3603
6641                     ; 321     pfProcUvset = PF_PROC_UVSET_LIST[PROC_UVSET_EDIT];
6642  1dee ae1b4c        	ldw	x,#L5662_ProcUvsetEdit
6643  1df1 cf003f        	ldw	L3762_pfProcUvset,x
6644  1df4 1e05          	ldw	x,(OFST+5,sp)
6645  1df6               L3603:
6646                     ; 324   return (pfProcUvset(param, pMsg));
6647  1df6 89            	pushw	x
6648  1df7 1e03          	ldw	x,(OFST+3,sp)
6649  1df9 72cd003f      	call	[L3762_pfProcUvset.w]
6652  1dfd 5b04          	addw	sp,#4
6653  1dff 81            	ret	
6655                     	switch	.const
6656  0181               L1703_PF_PROC_UVENB_LIST:
6658  0181 1e00          	dc.w	L5603_ProcUvenbEdit
6660  0183 1eb2          	dc.w	L7603_ProcUvenbWrite
6661                     	switch	.data
6662  0046               L3703_pfProcUvenb:
6663  0046 0000          	dc.w	0
6664  0048               L5703_LOWER_STR:
6665  0048 01de          	dc.w	L3752
6666  004a 01db          	dc.w	L5752
6667  004c               L7703_UPPER_STR:
6668  004c 01d5          	dc.w	L1062
6669  004e 01cf          	dc.w	L3062
6670  0050               L1013_uvEnable:
6671  0050 00000000      	dc.l	0
6672                     	switch	.const
6673  0185               L5113_msg:
6674  0185 00            	dc.b	0
6675  0186 00            	dc.b	0
6677                     ; 45 static uint8_t ProcUvenbEdit(void *pParam, UI_MSG_T *pMsg)
6677                     ; 46 {
6678                     	switch	.text
6679  1e00               L5603_ProcUvenbEdit:
6680  1e00 89            	pushw	x
6681  1e01 5203          	subw	sp,#3
6682       00000003      OFST:	set	3
6684                     ; 52   switch(pMsg->message)
6685  1e03 1e08          	ldw	x,(OFST+5,sp)
6686  1e05 e601          	ld	a,(1,x)
6688                     ; 104       break;
6689  1e07 2719          	jreq	L3013
6690  1e09 a002          	sub	a,#2
6691  1e0b 2758          	jreq	L1113
6692  1e0d a018          	sub	a,#24
6693  1e0f 272c          	jreq	L5013
6694  1e11 4a            	dec	a
6695  1e12 2729          	jreq	L5013
6696  1e14 4a            	dec	a
6697  1e15 2736          	jreq	L7013
6698  1e17 4a            	dec	a
6699  1e18 2733          	jreq	L7013
6700  1e1a 4a            	dec	a
6701  1e1b 274d          	jreq	L3113
6702  1e1d 4a            	dec	a
6703  1e1e 2745          	jreq	L1113
6704  1e20 207c          	jra	L3213
6705  1e22               L3013:
6706                     ; 56       REG_GetValue(&uvEnable, REG_ID_UV_EN_FLAG);
6707  1e22 4b03          	push	#3
6708  1e24 ae0050        	ldw	x,#L1013_uvEnable
6709  1e27 cd0000        	call	_REG_GetValue
6711  1e2a 84            	pop	a
6712                     ; 58       DISP_ClearAll();
6713  1e2b cd0000        	call	_DISP_ClearAll
6715                     ; 60       DISP_LowerPutStr((char *)LOWER_STR[uvEnable], 0);
6716  1e2e 4b00          	push	#0
6717  1e30 ce0052        	ldw	x,L1013_uvEnable+2
6718  1e33 58            	sllw	x
6719  1e34 de0048        	ldw	x,(L5703_LOWER_STR,x)
6720  1e37 cd0000        	call	_DISP_LowerPutStr
6722  1e3a 84            	pop	a
6723                     ; 62     break;
6724  1e3b 2061          	jra	L3213
6725  1e3d               L5013:
6726                     ; 64     case UIMSG_KEY_UP:
6726                     ; 65     case UIMSG_KEY_DOWN:
6726                     ; 66       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6727  1e3d f6            	ld	a,(x)
6728  1e3e 265e          	jrne	L3213
6729                     ; 68         uvEnable = uvEnable == FALSE ? TRUE : FALSE;
6730  1e40 ae0050        	ldw	x,#L1013_uvEnable
6731  1e43 cd0000        	call	c_lzmp
6733  1e46 2611          	jrne	L4161
6734  1e48               LC092:
6735  1e48 ae0001        	ldw	x,#1
6736  1e4b 200d          	jra	L6161
6739  1e4d               L7013:
6740                     ; 72     case UIMSG_KEY_BACK:
6740                     ; 73     case UIMSG_KEY_NEXT:
6740                     ; 74       if((uint8_t)pMsg->param == UI_KEY_RELEASE)
6741  1e4d f6            	ld	a,(x)
6742  1e4e 4a            	dec	a
6743  1e4f 264d          	jrne	L3213
6744                     ; 76         uvEnable = uvEnable == FALSE ? TRUE : FALSE;
6745  1e51 ae0050        	ldw	x,#L1013_uvEnable
6746  1e54 cd0000        	call	c_lzmp
6748  1e57 27ef          	jreq	LC092
6749  1e59               L4161:
6750  1e59 5f            	clrw	x
6751  1e5a               L6161:
6753  1e5a cd0000        	call	c_itolx
6754  1e5d ae0050        	ldw	x,#L1013_uvEnable
6755  1e60 cd0000        	call	c_rtol
6757  1e63 2039          	jra	L3213
6758  1e65               L1113:
6759                     ; 80     case UIMSG_KEY_CLR:
6759                     ; 81     case UIMSG_SW_RESET:
6759                     ; 82       if((uint8_t)pMsg->param == UI_SW_PRESS)
6760  1e65 f6            	ld	a,(x)
6761  1e66 2636          	jrne	L3213
6762                     ; 84         return UI_RC_FINISH;
6764  1e68 2031          	jra	L0361
6765  1e6a               L3113:
6766                     ; 88     case UIMSG_KEY_ENT:
6766                     ; 89       if((uint8_t)pMsg->param == UI_KEY_PRESS)
6767  1e6a f6            	ld	a,(x)
6768  1e6b 2631          	jrne	L3213
6769                     ; 91         UI_MSG_T msg = {0, UIMSG_INIT};
6770  1e6d c60185        	ld	a,L5113_msg
6771  1e70 6b02          	ld	(OFST-1,sp),a
6772  1e72 c60186        	ld	a,L5113_msg+1
6773  1e75 6b03          	ld	(OFST+0,sp),a
6774                     ; 92         pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_WRITE];
6775  1e77 ae1eb2        	ldw	x,#L7603_ProcUvenbWrite
6776  1e7a cf0046        	ldw	L3703_pfProcUvenb,x
6777                     ; 94         if(uvEnable == FALSE)
6778  1e7d ae0050        	ldw	x,#L1013_uvEnable
6779  1e80 cd0000        	call	c_lzmp
6781  1e83 2604          	jrne	L5313
6782                     ; 96           uint8_t flagUVDetect = FALSE;
6783                     ; 120   FlagUvDetect = flag;
6784  1e85 725f0000      	clr	_FlagUvDetect
6785  1e89               L5313:
6786                     ; 100         REG_SetValue(&uvEnable, REG_ID_UV_EN_FLAG);
6787  1e89 4b03          	push	#3
6788  1e8b cd0000        	call	_REG_SetValue
6790  1e8e 84            	pop	a
6791                     ; 102         return (pfProcUvenb(pParam, &msg));
6792  1e8f 96            	ldw	x,sp
6793  1e90 1c0002        	addw	x,#OFST-1
6794  1e93 89            	pushw	x
6795  1e94 1e06          	ldw	x,(OFST+3,sp)
6796  1e96 72cd0046      	call	[L3703_pfProcUvenb.w]
6798  1e9a 85            	popw	x
6800  1e9b               L0361:
6801  1e9b 5b05          	addw	sp,#5
6802  1e9d 81            	ret	
6803  1e9e               L3213:
6804                     ; 107   DISP_UpperClear();
6805  1e9e cd0000        	call	_DISP_UpperClear
6807                     ; 108   DISP_UpperPutStr((char *)UPPER_STR[uvEnable], 0);
6808  1ea1 4b00          	push	#0
6809  1ea3 ce0052        	ldw	x,L1013_uvEnable+2
6810  1ea6 58            	sllw	x
6811  1ea7 de004c        	ldw	x,(L7703_UPPER_STR,x)
6812  1eaa cd0000        	call	_DISP_UpperPutStr
6814  1ead 84            	pop	a
6815                     ; 110   return UI_RC_CONTINUE;
6816  1eae a601          	ld	a,#1
6818  1eb0 20e9          	jra	L0361
6820                     	switch	.const
6821  0187               L3413_msg:
6822  0187 00            	dc.b	0
6823  0188 00            	dc.b	0
6825                     ; 120 static uint8_t ProcUvenbWrite(void *param, UI_MSG_T *pMsg)
6825                     ; 121 {
6826                     	switch	.text
6827  1eb2               L7603_ProcUvenbWrite:
6828  1eb2 89            	pushw	x
6829  1eb3 89            	pushw	x
6830       00000002      OFST:	set	2
6832                     ; 124   switch(pMsg->message)
6833  1eb4 1e07          	ldw	x,(OFST+5,sp)
6834  1eb6 e601          	ld	a,(1,x)
6836                     ; 148     default:
6836                     ; 149       break;
6837  1eb8 2705          	jreq	L7313
6838  1eba 4a            	dec	a
6839  1ebb 2717          	jreq	L1413
6840  1ebd 2034          	jra	L1513
6841  1ebf               L7313:
6842                     ; 128       DISP_ClearAll();
6843  1ebf cd0000        	call	_DISP_ClearAll
6845                     ; 130       RET_WriteRetEnbale(TRUE);
6846  1ec2 a601          	ld	a,#1
6847  1ec4 cd0000        	call	_RET_WriteRetEnbale
6849                     ; 132       UI_SetRefreshMsg(MEMORY_WRITE_TIME);
6850  1ec7 ae02bc        	ldw	x,#700
6851  1eca 89            	pushw	x
6852  1ecb 5f            	clrw	x
6853  1ecc 89            	pushw	x
6854  1ecd cd0000        	call	_UI_SetRefreshMsg
6856  1ed0 5b04          	addw	sp,#4
6857                     ; 134     break;
6858  1ed2 201f          	jra	L1513
6859  1ed4               L1413:
6860                     ; 138       UI_MSG_T msg = {0, UIMSG_INIT};
6861  1ed4 c60187        	ld	a,L3413_msg
6862  1ed7 6b01          	ld	(OFST-1,sp),a
6863  1ed9 c60188        	ld	a,L3413_msg+1
6864  1edc 6b02          	ld	(OFST+0,sp),a
6865                     ; 140       RET_WriteRetEnbale(FALSE);
6866  1ede 4f            	clr	a
6867  1edf cd0000        	call	_RET_WriteRetEnbale
6869                     ; 142       pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_EDIT];
6870  1ee2 ae1e00        	ldw	x,#L5603_ProcUvenbEdit
6871  1ee5 cf0046        	ldw	L3703_pfProcUvenb,x
6872                     ; 144       return (pfProcUvenb(param, &msg));
6873  1ee8 96            	ldw	x,sp
6874  1ee9 5c            	incw	x
6875  1eea 89            	pushw	x
6876  1eeb 1e05          	ldw	x,(OFST+3,sp)
6877  1eed cd1e00        	call	L5603_ProcUvenbEdit
6879  1ef0 85            	popw	x
6881  1ef1 2002          	jra	L6461
6882                     ; 148     default:
6882                     ; 149       break;
6883  1ef3               L1513:
6884                     ; 152   return UI_RC_CONTINUE;
6885  1ef3 a601          	ld	a,#1
6887  1ef5               L6461:
6888  1ef5 5b04          	addw	sp,#4
6889  1ef7 81            	ret	
6892                     ; 164 uint8_t UI_ProcessUvenb(void *param, UI_MSG_T *pMsg)
6892                     ; 165 {
6893  1ef8               _UI_ProcessUvenb:
6894  1ef8 89            	pushw	x
6895       00000000      OFST:	set	0
6897                     ; 166   if(pMsg->message == UIMSG_INIT)
6898  1ef9 1e05          	ldw	x,(OFST+5,sp)
6899  1efb e601          	ld	a,(1,x)
6900  1efd 2608          	jrne	L3513
6901                     ; 168     pfProcUvenb = PF_PROC_UVENB_LIST[PROC_UVENB_EDIT];
6902  1eff ae1e00        	ldw	x,#L5603_ProcUvenbEdit
6903  1f02 cf0046        	ldw	L3703_pfProcUvenb,x
6904  1f05 1e05          	ldw	x,(OFST+5,sp)
6905  1f07               L3513:
6906                     ; 171   return (pfProcUvenb(param, pMsg));
6907  1f07 89            	pushw	x
6908  1f08 1e03          	ldw	x,(OFST+3,sp)
6909  1f0a 72cd0046      	call	[L3703_pfProcUvenb.w]
6912  1f0e 5b04          	addw	sp,#4
6913  1f10 81            	ret	
6915                     	switch	.data
6916  0054               L5513_testReset:
6917  0054 01            	dc.b	1
6918                     ; 21 uint8_t UI_ProcessKeyboard(void *pParam, UI_MSG_T *pMsg)
6918                     ; 22 {
6919                     	switch	.text
6920  1f11               _UI_ProcessKeyboard:
6921  1f11 89            	pushw	x
6922       00000000      OFST:	set	0
6924                     ; 25   if(pMsg->message == UIMSG_INIT)
6925  1f12 1e05          	ldw	x,(OFST+5,sp)
6926  1f14 e601          	ld	a,(1,x)
6927  1f16 260a          	jrne	L7513
6928                     ; 27     testReset = TRUE;
6929  1f18 35010054      	mov	L5513_testReset,#1
6930                     ; 28     DISP_LowerClear();
6931  1f1c cd0000        	call	_DISP_LowerClear
6934  1f1f cc21b3        	jra	L1613
6935  1f22               L7513:
6936                     ; 32   if(pMsg->message == UIMSG_KEY_DIG0)
6937  1f22 a108          	cp	a,#8
6938  1f24 2612          	jrne	L3613
6939                     ; 34     if((uint8_t)pMsg->param == UI_KEY_PRESS)
6940  1f26 f6            	ld	a,(x)
6941  1f27 26f6          	jrne	L1613
6942                     ; 36       testReset = TRUE;
6943  1f29 35010054      	mov	L5513_testReset,#1
6944                     ; 37       DISP_UpperClear();
6945  1f2d cd0000        	call	_DISP_UpperClear
6947                     ; 38       DISP_UpperPutStr("KEY-0", 0);
6948  1f30 4b00          	push	#0
6949  1f32 ae0299        	ldw	x,#L772
6951  1f35 cc21a6        	jp	LC093
6952  1f38               L3613:
6953                     ; 42   if(pMsg->message == UIMSG_KEY_DIG1)
6954  1f38 a109          	cp	a,#9
6955  1f3a 2612          	jrne	L1713
6956                     ; 44     if((uint8_t)pMsg->param == UI_KEY_PRESS)
6957  1f3c f6            	ld	a,(x)
6958  1f3d 26e0          	jrne	L1613
6959                     ; 46       testReset = TRUE;
6960  1f3f 35010054      	mov	L5513_testReset,#1
6961                     ; 47       DISP_UpperClear();
6962  1f43 cd0000        	call	_DISP_UpperClear
6964                     ; 48       DISP_UpperPutStr("KEY-1", 0);
6965  1f46 4b00          	push	#0
6966  1f48 ae0293        	ldw	x,#L503
6968  1f4b cc21a6        	jp	LC093
6969  1f4e               L1713:
6970                     ; 52   if(pMsg->message == UIMSG_KEY_DIG2)
6971  1f4e a10a          	cp	a,#10
6972  1f50 2612          	jrne	L7713
6973                     ; 54     if((uint8_t)pMsg->param == UI_KEY_PRESS)
6974  1f52 f6            	ld	a,(x)
6975  1f53 26ca          	jrne	L1613
6976                     ; 56       testReset = TRUE;
6977  1f55 35010054      	mov	L5513_testReset,#1
6978                     ; 57       DISP_UpperClear();
6979  1f59 cd0000        	call	_DISP_UpperClear
6981                     ; 58       DISP_UpperPutStr("KEY-2", 0);
6982  1f5c 4b00          	push	#0
6983  1f5e ae028d        	ldw	x,#L313
6985  1f61 cc21a6        	jp	LC093
6986  1f64               L7713:
6987                     ; 62   if(pMsg->message == UIMSG_KEY_DIG3)
6988  1f64 a10b          	cp	a,#11
6989  1f66 2612          	jrne	L5023
6990                     ; 64     if((uint8_t)pMsg->param == UI_KEY_PRESS)
6991  1f68 f6            	ld	a,(x)
6992  1f69 26b4          	jrne	L1613
6993                     ; 66       testReset = TRUE;
6994  1f6b 35010054      	mov	L5513_testReset,#1
6995                     ; 67       DISP_UpperClear();
6996  1f6f cd0000        	call	_DISP_UpperClear
6998                     ; 68       DISP_UpperPutStr("KEY-3", 0);
6999  1f72 4b00          	push	#0
7000  1f74 ae0287        	ldw	x,#L123
7002  1f77 cc21a6        	jp	LC093
7003  1f7a               L5023:
7004                     ; 72   if(pMsg->message == UIMSG_KEY_DIG4)
7005  1f7a a10c          	cp	a,#12
7006  1f7c 2612          	jrne	L3123
7007                     ; 74     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7008  1f7e f6            	ld	a,(x)
7009  1f7f 269e          	jrne	L1613
7010                     ; 76       testReset = TRUE;
7011  1f81 35010054      	mov	L5513_testReset,#1
7012                     ; 77       DISP_UpperClear();
7013  1f85 cd0000        	call	_DISP_UpperClear
7015                     ; 78       DISP_UpperPutStr("KEY-4", 0);
7016  1f88 4b00          	push	#0
7017  1f8a ae0281        	ldw	x,#L723
7019  1f8d cc21a6        	jp	LC093
7020  1f90               L3123:
7021                     ; 82   if(pMsg->message == UIMSG_KEY_DIG5)
7022  1f90 a10d          	cp	a,#13
7023  1f92 2612          	jrne	L1223
7024                     ; 84     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7025  1f94 f6            	ld	a,(x)
7026  1f95 2688          	jrne	L1613
7027                     ; 86       testReset = TRUE;
7028  1f97 35010054      	mov	L5513_testReset,#1
7029                     ; 87       DISP_UpperClear();
7030  1f9b cd0000        	call	_DISP_UpperClear
7032                     ; 88       DISP_UpperPutStr("KEY-5", 0);
7033  1f9e 4b00          	push	#0
7034  1fa0 ae027b        	ldw	x,#L533
7036  1fa3 cc21a6        	jp	LC093
7037  1fa6               L1223:
7038                     ; 92   if(pMsg->message == UIMSG_KEY_DIG6)
7039  1fa6 a10e          	cp	a,#14
7040  1fa8 2615          	jrne	L7223
7041                     ; 94     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7042  1faa f6            	ld	a,(x)
7043  1fab 2703cc21b3    	jrne	L1613
7044                     ; 96       testReset = TRUE;
7045  1fb0 35010054      	mov	L5513_testReset,#1
7046                     ; 97       DISP_UpperClear();
7047  1fb4 cd0000        	call	_DISP_UpperClear
7049                     ; 98       DISP_UpperPutStr("KEY-6", 0);
7050  1fb7 4b00          	push	#0
7051  1fb9 ae0275        	ldw	x,#L343
7053  1fbc cc21a6        	jp	LC093
7054  1fbf               L7223:
7055                     ; 102   if(pMsg->message == UIMSG_KEY_DIG7)
7056  1fbf a10f          	cp	a,#15
7057  1fc1 2612          	jrne	L5323
7058                     ; 104     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7059  1fc3 f6            	ld	a,(x)
7060  1fc4 26e7          	jrne	L1613
7061                     ; 106       testReset = TRUE;
7062  1fc6 35010054      	mov	L5513_testReset,#1
7063                     ; 107       DISP_UpperClear();
7064  1fca cd0000        	call	_DISP_UpperClear
7066                     ; 108       DISP_UpperPutStr("KEY-7", 0);
7067  1fcd 4b00          	push	#0
7068  1fcf ae026f        	ldw	x,#L153
7070  1fd2 cc21a6        	jp	LC093
7071  1fd5               L5323:
7072                     ; 112   if(pMsg->message == UIMSG_KEY_DIG8)
7073  1fd5 a110          	cp	a,#16
7074  1fd7 2612          	jrne	L3423
7075                     ; 114     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7076  1fd9 f6            	ld	a,(x)
7077  1fda 26d1          	jrne	L1613
7078                     ; 116       testReset = TRUE;
7079  1fdc 35010054      	mov	L5513_testReset,#1
7080                     ; 117       DISP_UpperClear();
7081  1fe0 cd0000        	call	_DISP_UpperClear
7083                     ; 118       DISP_UpperPutStr("KEY-8", 0);
7084  1fe3 4b00          	push	#0
7085  1fe5 ae0269        	ldw	x,#L753
7087  1fe8 cc21a6        	jp	LC093
7088  1feb               L3423:
7089                     ; 122   if(pMsg->message == UIMSG_KEY_DIG9)
7090  1feb a111          	cp	a,#17
7091  1fed 2612          	jrne	L1523
7092                     ; 124     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7093  1fef f6            	ld	a,(x)
7094  1ff0 26bb          	jrne	L1613
7095                     ; 126       testReset = TRUE;
7096  1ff2 35010054      	mov	L5513_testReset,#1
7097                     ; 127       DISP_UpperClear();
7098  1ff6 cd0000        	call	_DISP_UpperClear
7100                     ; 128       DISP_UpperPutStr("KEY-9", 0);
7101  1ff9 4b00          	push	#0
7102  1ffb ae0263        	ldw	x,#L563
7104  1ffe cc21a6        	jp	LC093
7105  2001               L1523:
7106                     ; 132   if(pMsg->message == UIMSG_KEY_ADD)
7107  2001 a112          	cp	a,#18
7108  2003 2612          	jrne	L7523
7109                     ; 134     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7110  2005 f6            	ld	a,(x)
7111  2006 26a5          	jrne	L1613
7112                     ; 136       testReset = TRUE;
7113  2008 35010054      	mov	L5513_testReset,#1
7114                     ; 137       DISP_UpperClear();
7115  200c cd0000        	call	_DISP_UpperClear
7117                     ; 138       DISP_UpperPutStr("ADD", 0);
7118  200f 4b00          	push	#0
7119  2011 ae025f        	ldw	x,#L373
7121  2014 cc21a6        	jp	LC093
7122  2017               L7523:
7123                     ; 142   if(pMsg->message == UIMSG_KEY_ADD_UV)
7124  2017 a113          	cp	a,#19
7125  2019 2612          	jrne	L5623
7126                     ; 144     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7127  201b f6            	ld	a,(x)
7128  201c 268f          	jrne	L1613
7129                     ; 146       testReset = TRUE;
7130  201e 35010054      	mov	L5513_testReset,#1
7131                     ; 147       DISP_UpperClear();
7132  2022 cd0000        	call	_DISP_UpperClear
7134                     ; 148       DISP_UpperPutStr("AD-UV", 0);
7135  2025 4b00          	push	#0
7136  2027 ae0259        	ldw	x,#L104
7138  202a cc21a6        	jp	LC093
7139  202d               L5623:
7140                     ; 152   if(pMsg->message == UIMSG_KEY_VALM)
7141  202d a114          	cp	a,#20
7142  202f 2615          	jrne	L3723
7143                     ; 154     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7144  2031 f6            	ld	a,(x)
7145  2032 2703cc21b3    	jrne	L1613
7146                     ; 156       testReset = TRUE;
7147  2037 35010054      	mov	L5513_testReset,#1
7148                     ; 157       DISP_UpperClear();
7149  203b cd0000        	call	_DISP_UpperClear
7151                     ; 158       DISP_UpperPutStr("VALUE", 0);
7152  203e 4b00          	push	#0
7153  2040 ae0253        	ldw	x,#L704
7155  2043 cc21a6        	jp	LC093
7156  2046               L3723:
7157                     ; 162   if(pMsg->message == UIMSG_KEY_UV)
7158  2046 a115          	cp	a,#21
7159  2048 2612          	jrne	L1033
7160                     ; 164     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7161  204a f6            	ld	a,(x)
7162  204b 26e7          	jrne	L1613
7163                     ; 166       testReset = TRUE;
7164  204d 35010054      	mov	L5513_testReset,#1
7165                     ; 167       DISP_UpperClear();
7166  2051 cd0000        	call	_DISP_UpperClear
7168                     ; 168       DISP_UpperPutStr("UV", 0);
7169  2054 4b00          	push	#0
7170  2056 ae0250        	ldw	x,#L514
7172  2059 cc21a6        	jp	LC093
7173  205c               L1033:
7174                     ; 172   if(pMsg->message == UIMSG_KEY_AUTO)
7175  205c a116          	cp	a,#22
7176  205e 2612          	jrne	L7033
7177                     ; 174     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7178  2060 f6            	ld	a,(x)
7179  2061 26d1          	jrne	L1613
7180                     ; 176       testReset = TRUE;
7181  2063 35010054      	mov	L5513_testReset,#1
7182                     ; 177       DISP_UpperClear();
7183  2067 cd0000        	call	_DISP_UpperClear
7185                     ; 178       DISP_UpperPutStr("AUTO", 0);
7186  206a 4b00          	push	#0
7187  206c ae024b        	ldw	x,#L324
7189  206f cc21a6        	jp	LC093
7190  2072               L7033:
7191                     ; 182   if(pMsg->message == UIMSG_KEY_MANUAL)
7192  2072 a117          	cp	a,#23
7193  2074 2612          	jrne	L5133
7194                     ; 184     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7195  2076 f6            	ld	a,(x)
7196  2077 26bb          	jrne	L1613
7197                     ; 186       testReset = TRUE;
7198  2079 35010054      	mov	L5513_testReset,#1
7199                     ; 187       DISP_UpperClear();
7200  207d cd0000        	call	_DISP_UpperClear
7202                     ; 188       DISP_UpperPutStr("MANUAL", 0);
7203  2080 4b00          	push	#0
7204  2082 ae01c2        	ldw	x,#L1233
7206  2085 cc21a6        	jp	LC093
7207  2088               L5133:
7208                     ; 192   if(pMsg->message == UIMSG_KEY_MODE)
7209  2088 a118          	cp	a,#24
7210  208a 2612          	jrne	L5233
7211                     ; 194     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7212  208c f6            	ld	a,(x)
7213  208d 26a5          	jrne	L1613
7214                     ; 196       testReset = TRUE;
7215  208f 35010054      	mov	L5513_testReset,#1
7216                     ; 197       DISP_UpperClear();
7217  2093 cd0000        	call	_DISP_UpperClear
7219                     ; 198       DISP_UpperPutStr("MODE", 0);
7220  2096 4b00          	push	#0
7221  2098 ae0241        	ldw	x,#L734
7223  209b cc21a6        	jp	LC093
7224  209e               L5233:
7225                     ; 202   if(pMsg->message == UIMSG_KEY_FUNC)
7226  209e a119          	cp	a,#25
7227  20a0 2612          	jrne	L3333
7228                     ; 204     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7229  20a2 f6            	ld	a,(x)
7230  20a3 268f          	jrne	L1613
7231                     ; 206       testReset = TRUE;
7232  20a5 35010054      	mov	L5513_testReset,#1
7233                     ; 207       DISP_UpperClear();
7234  20a9 cd0000        	call	_DISP_UpperClear
7236                     ; 208       DISP_UpperPutStr("FUNC", 0);
7237  20ac 4b00          	push	#0
7238  20ae ae023c        	ldw	x,#L544
7240  20b1 cc21a6        	jp	LC093
7241  20b4               L3333:
7242                     ; 212   if(pMsg->message == UIMSG_KEY_TENS)
7243  20b4 a11a          	cp	a,#26
7244  20b6 2615          	jrne	L1433
7245                     ; 214     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7246  20b8 f6            	ld	a,(x)
7247  20b9 2703cc21b3    	jrne	L1613
7248                     ; 216       testReset = TRUE;
7249  20be 35010054      	mov	L5513_testReset,#1
7250                     ; 217       DISP_UpperClear();
7251  20c2 cd0000        	call	_DISP_UpperClear
7253                     ; 218       DISP_UpperPutStr("TENS", 0);
7254  20c5 4b00          	push	#0
7255  20c7 ae01bd        	ldw	x,#L5433
7257  20ca cc21a6        	jp	LC093
7258  20cd               L1433:
7259                     ; 222   if(pMsg->message == UIMSG_KEY_UNITS)
7260  20cd a11b          	cp	a,#27
7261  20cf 2612          	jrne	L1533
7262                     ; 224     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7263  20d1 f6            	ld	a,(x)
7264  20d2 26e7          	jrne	L1613
7265                     ; 226       testReset = TRUE;
7266  20d4 35010054      	mov	L5513_testReset,#1
7267                     ; 227       DISP_UpperClear();
7268  20d8 cd0000        	call	_DISP_UpperClear
7270                     ; 228       DISP_UpperPutStr("UNITS", 0);
7271  20db 4b00          	push	#0
7272  20dd ae01b7        	ldw	x,#L5533
7274  20e0 cc21a6        	jp	LC093
7275  20e3               L1533:
7276                     ; 232   if(pMsg->message == UIMSG_KEY_UP)
7277  20e3 a11a          	cp	a,#26
7278  20e5 2612          	jrne	L1633
7279                     ; 234     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7280  20e7 f6            	ld	a,(x)
7281  20e8 26d1          	jrne	L1613
7282                     ; 236       testReset = TRUE;
7283  20ea 35010054      	mov	L5513_testReset,#1
7284                     ; 237       DISP_UpperClear();
7285  20ee cd0000        	call	_DISP_UpperClear
7287                     ; 238       DISP_UpperPutStr("UP", 0);
7288  20f1 4b00          	push	#0
7289  20f3 ae0239        	ldw	x,#L354
7291  20f6 cc21a6        	jp	LC093
7292  20f9               L1633:
7293                     ; 242   if(pMsg->message == UIMSG_KEY_DOWN)
7294  20f9 a11b          	cp	a,#27
7295  20fb 2612          	jrne	L7633
7296                     ; 244     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7297  20fd f6            	ld	a,(x)
7298  20fe 26bb          	jrne	L1613
7299                     ; 246       testReset = TRUE;
7300  2100 35010054      	mov	L5513_testReset,#1
7301                     ; 247       DISP_UpperClear();
7302  2104 cd0000        	call	_DISP_UpperClear
7304                     ; 248       DISP_UpperPutStr("DOWN", 0);
7305  2107 4b00          	push	#0
7306  2109 ae0234        	ldw	x,#L164
7308  210c cc21a6        	jp	LC093
7309  210f               L7633:
7310                     ; 252   if(pMsg->message == UIMSG_KEY_BACK)
7311  210f a11c          	cp	a,#28
7312  2111 2612          	jrne	L5733
7313                     ; 254     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7314  2113 f6            	ld	a,(x)
7315  2114 26a5          	jrne	L1613
7316                     ; 256       testReset = TRUE;
7317  2116 35010054      	mov	L5513_testReset,#1
7318                     ; 257       DISP_UpperClear();
7319  211a cd0000        	call	_DISP_UpperClear
7321                     ; 258       DISP_UpperPutStr("BACK", 0);
7322  211d 4b00          	push	#0
7323  211f ae022f        	ldw	x,#L764
7325  2122 cc21a6        	jp	LC093
7326  2125               L5733:
7327                     ; 262   if(pMsg->message == UIMSG_KEY_NEXT)
7328  2125 a11d          	cp	a,#29
7329  2127 2611          	jrne	L3043
7330                     ; 264     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7331  2129 f6            	ld	a,(x)
7332  212a 268f          	jrne	L1613
7333                     ; 266       testReset = TRUE;
7334  212c 35010054      	mov	L5513_testReset,#1
7335                     ; 267       DISP_UpperClear();
7336  2130 cd0000        	call	_DISP_UpperClear
7338                     ; 268       DISP_UpperPutStr("NEXT", 0);
7339  2133 4b00          	push	#0
7340  2135 ae022a        	ldw	x,#L574
7342  2138 206c          	jp	LC093
7343  213a               L3043:
7344                     ; 272   if(pMsg->message == UIMSG_KEY_ENT)
7345  213a a11e          	cp	a,#30
7346  213c 2611          	jrne	L1143
7347                     ; 274     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7348  213e f6            	ld	a,(x)
7349  213f 2672          	jrne	L1613
7350                     ; 276       testReset = TRUE;
7351  2141 35010054      	mov	L5513_testReset,#1
7352                     ; 277       DISP_UpperClear();
7353  2145 cd0000        	call	_DISP_UpperClear
7355                     ; 278       DISP_UpperPutStr("ENTER", 0);
7356  2148 4b00          	push	#0
7357  214a ae0224        	ldw	x,#L305
7359  214d 2057          	jp	LC093
7360  214f               L1143:
7361                     ; 282   if(pMsg->message == UIMSG_KEY_CLR)
7362  214f a11f          	cp	a,#31
7363  2151 2611          	jrne	L7143
7364                     ; 284     if((uint8_t)pMsg->param == UI_KEY_PRESS)
7365  2153 f6            	ld	a,(x)
7366  2154 265d          	jrne	L1613
7367                     ; 286       testReset = TRUE;
7368  2156 35010054      	mov	L5513_testReset,#1
7369                     ; 287       DISP_UpperClear();
7370  215a cd0000        	call	_DISP_UpperClear
7372                     ; 288       DISP_UpperPutStr("CLEAR", 0);
7373  215d 4b00          	push	#0
7374  215f ae021e        	ldw	x,#L115
7376  2162 2042          	jp	LC093
7377  2164               L7143:
7378                     ; 292   if(pMsg->message == UIMSG_SW_AUTO)
7379  2164 a104          	cp	a,#4
7380  2166 2611          	jrne	L5243
7381                     ; 294     if((uint8_t)pMsg->param == UI_SW_PRESS)
7382  2168 f6            	ld	a,(x)
7383  2169 2648          	jrne	L1613
7384                     ; 296       testReset = TRUE;
7385  216b 35010054      	mov	L5513_testReset,#1
7386                     ; 297       DISP_UpperClear();
7387  216f cd0000        	call	_DISP_UpperClear
7389                     ; 298       DISP_UpperPutStr("SW-I", 0);
7390  2172 4b00          	push	#0
7391  2174 ae01b2        	ldw	x,#L1343
7393  2177 202d          	jp	LC093
7394  2179               L5243:
7395                     ; 302   if(pMsg->message == UIMSG_SW_CAM)
7396  2179 a103          	cp	a,#3
7397  217b 2611          	jrne	L5343
7398                     ; 304     if((uint8_t)pMsg->param == UI_SW_PRESS)
7399  217d f6            	ld	a,(x)
7400  217e 2633          	jrne	L1613
7401                     ; 306       testReset = TRUE;
7402  2180 35010054      	mov	L5513_testReset,#1
7403                     ; 307       DISP_UpperClear();
7404  2184 cd0000        	call	_DISP_UpperClear
7406                     ; 308       DISP_UpperPutStr("SW-H", 0);
7407  2187 4b00          	push	#0
7408  2189 ae01ad        	ldw	x,#L1443
7410  218c 2018          	jp	LC093
7411  218e               L5343:
7412                     ; 312   if(pMsg->message == UIMSG_SW_RESET)
7413  218e a102          	cp	a,#2
7414  2190 2621          	jrne	L1613
7415                     ; 314     if((uint8_t)pMsg->param == UI_SW_PRESS)
7416  2192 f6            	ld	a,(x)
7417  2193 261e          	jrne	L1613
7418                     ; 316       if(testReset == TRUE)
7419  2195 c60054        	ld	a,L5513_testReset
7420  2198 4a            	dec	a
7421  2199 2611          	jrne	L1543
7422                     ; 318         testReset = FALSE;
7423  219b c70054        	ld	L5513_testReset,a
7424                     ; 320         DISP_UpperClear();
7425  219e cd0000        	call	_DISP_UpperClear
7427                     ; 321         DISP_UpperPutStr("RESET", 0);
7428  21a1 4b00          	push	#0
7429  21a3 ae0218        	ldw	x,#L715
7431  21a6               LC093:
7432  21a6 cd0000        	call	_DISP_UpperPutStr
7433  21a9 84            	pop	a
7435  21aa 2007          	jra	L1613
7436  21ac               L1543:
7437                     ; 325         testReset = TRUE;
7438  21ac 35010054      	mov	L5513_testReset,#1
7439                     ; 327         return UI_RC_FINISH;
7440  21b0 4f            	clr	a
7442  21b1 2002          	jra	L4402
7443  21b3               L1613:
7444                     ; 332   return UI_RC_CONTINUE;
7445  21b3 a601          	ld	a,#1
7447  21b5               L4402:
7448  21b5 85            	popw	x
7449  21b6 81            	ret	
7451                     	switch	.data
7452  0055               L5543_testCount:
7453  0055 00            	dc.b	0
7454  0056               L7543_processState:
7455  0056 00            	dc.b	0
7456  0057               L1643_flashON:
7457  0057 01            	dc.b	1
7458                     ; 21 uint8_t UI_ProcessSegment(void *pParam, UI_MSG_T *pMsg)
7458                     ; 22 {
7459                     	switch	.text
7460  21b7               _UI_ProcessSegment:
7461  21b7 89            	pushw	x
7462  21b8 5208          	subw	sp,#8
7463       00000008      OFST:	set	8
7465                     ; 36   switch(pMsg->message)
7466  21ba 1e0d          	ldw	x,(OFST+5,sp)
7467  21bc e601          	ld	a,(1,x)
7469                     ; 127     default:
7469                     ; 128       break;
7470  21be 270c          	jreq	L3643
7471  21c0 4a            	dec	a
7472  21c1 2720          	jreq	L5643
7473  21c3 4a            	dec	a
7474  21c4 2603cc22b1    	jreq	L3743
7475  21c9 cc22c0        	jra	L1053
7476  21cc               L3643:
7477                     ; 40       testCount = 0;
7478  21cc c70055        	ld	L5543_testCount,a
7479                     ; 41       UI_SetRefreshMsg(REFRESH_TIME_MS);
7480  21cf cd22c4        	call	LC096
7481                     ; 43       processState = FLASH_DISP_TEST;
7482  21d2 725f0056      	clr	L7543_processState
7483                     ; 44       flashON = TRUE;
7484  21d6 35010057      	mov	L1643_flashON,#1
7485                     ; 47       TURR_Clear();
7486  21da cd0000        	call	_TURR_Clear
7488                     ; 48       DISP_ClearAll();
7489  21dd cd0000        	call	_DISP_ClearAll
7491                     ; 50     break;
7492  21e0 cc22c0        	jra	L1053
7493  21e3               L5643:
7494                     ; 54       switch(processState)
7495  21e3 c60056        	ld	a,L7543_processState
7497                     ; 114         break;
7498  21e6 2706          	jreq	L7643
7499  21e8 4a            	dec	a
7500  21e9 2737          	jreq	L1743
7501  21eb cc22c0        	jra	L1053
7502  21ee               L7643:
7503                     ; 58           if(flashON == TRUE)
7504  21ee c60057        	ld	a,L1643_flashON
7505  21f1 4a            	dec	a
7506  21f2 2608          	jrne	L7053
7507                     ; 60             flashON = FALSE;
7508  21f4 c70057        	ld	L1643_flashON,a
7509                     ; 61             DISP_SetAll();
7510  21f7 cd0000        	call	_DISP_SetAll
7513  21fa 200b          	jra	L1153
7514  21fc               L7053:
7515                     ; 65             testCount++;
7516  21fc 725c0055      	inc	L5543_testCount
7517                     ; 67             flashON = TRUE;
7518  2200 35010057      	mov	L1643_flashON,#1
7519                     ; 68             DISP_ClearAll();
7520  2204 cd0000        	call	_DISP_ClearAll
7522  2207               L1153:
7523                     ; 71           if(testCount >= FLASH_DISP_TEST_CNT)
7524  2207 c60055        	ld	a,L5543_testCount
7525  220a a105          	cp	a,#5
7526  220c 2403cc22ad    	jrult	L5153
7527                     ; 73             TURR_Clear();
7528  2211 cd0000        	call	_TURR_Clear
7530                     ; 74             DISP_ClearAll();
7531  2214 cd0000        	call	_DISP_ClearAll
7533                     ; 76             testCount = 0;
7534  2217 725f0055      	clr	L5543_testCount
7535                     ; 77             processState =  SEG_DISP_TEST;
7536  221b 35010056      	mov	L7543_processState,#1
7537                     ; 80           UI_SetRefreshMsg(REFRESH_TIME_MS);
7539                     ; 82         break;
7540  221f cc22ad        	jp	L5153
7541  2222               L1743:
7542                     ; 86           DISP_ClearAll();
7543  2222 cd0000        	call	_DISP_ClearAll
7545                     ; 88           memset(&string[0], (char)('0' + testCount), DISP_LOWER_MAX_NB);
7546  2225 ce0000        	ldw	x,_pDisp
7547  2228 e603          	ld	a,(3,x)
7548  222a 5f            	clrw	x
7549  222b 97            	ld	xl,a
7550  222c 89            	pushw	x
7551  222d c60055        	ld	a,L5543_testCount
7552  2230 ab30          	add	a,#48
7553  2232 88            	push	a
7554  2233 96            	ldw	x,sp
7555  2234 1c0004        	addw	x,#OFST-4
7556  2237 cd0000        	call	_memset
7558  223a 5b03          	addw	sp,#3
7559                     ; 89           DISP_LowerPutStr(&string[0], 0);
7560  223c 4b00          	push	#0
7561  223e 96            	ldw	x,sp
7562  223f 1c0002        	addw	x,#OFST-6
7563  2242 cd0000        	call	_DISP_LowerPutStr
7565  2245 ce0000        	ldw	x,_pDisp
7566  2248 84            	pop	a
7567                     ; 91           memset(&string[0], (char)('0' + testCount), DISP_UPPER_MAX_NB);
7568  2249 e601          	ld	a,(1,x)
7569  224b 5f            	clrw	x
7570  224c 97            	ld	xl,a
7571  224d 89            	pushw	x
7572  224e c60055        	ld	a,L5543_testCount
7573  2251 ab30          	add	a,#48
7574  2253 88            	push	a
7575  2254 96            	ldw	x,sp
7576  2255 1c0004        	addw	x,#OFST-4
7577  2258 cd0000        	call	_memset
7579  225b 5b03          	addw	sp,#3
7580                     ; 92           DISP_UpperPutStr(&string[0], 0);
7581  225d 4b00          	push	#0
7582  225f 96            	ldw	x,sp
7583  2260 1c0002        	addw	x,#OFST-6
7584  2263 cd0000        	call	_DISP_UpperPutStr
7586  2266 ae0004        	ldw	x,#4
7587  2269 84            	pop	a
7588                     ; 94           memset(&string[0], (char)('0' + testCount), DISP_TURRET_MAX_NB);
7589  226a 89            	pushw	x
7590  226b c60055        	ld	a,L5543_testCount
7591  226e ab30          	add	a,#48
7592  2270 88            	push	a
7593  2271 96            	ldw	x,sp
7594  2272 1c0004        	addw	x,#OFST-4
7595  2275 cd0000        	call	_memset
7597  2278 5b03          	addw	sp,#3
7598                     ; 95           DISP_TurrPutStr(&string[0], 0);
7599  227a 4b00          	push	#0
7600  227c 96            	ldw	x,sp
7601  227d 1c0002        	addw	x,#OFST-6
7602  2280 cd0000        	call	_DISP_TurrPutStr
7604  2283 84            	pop	a
7605                     ; 97           TURR_Clear();
7606  2284 cd0000        	call	_TURR_Clear
7608                     ; 98           TURR_PutVal(testCount * 1111);
7609  2287 c60055        	ld	a,L5543_testCount
7610  228a 5f            	clrw	x
7611  228b 97            	ld	xl,a
7612  228c 90ae0457      	ldw	y,#1111
7613  2290 cd0000        	call	c_imul
7615  2293 cd0000        	call	_TURR_PutVal
7617                     ; 100           testCount++;
7618  2296 725c0055      	inc	L5543_testCount
7619                     ; 102           if(testCount > SEG_DISP_TEST_CNT)
7620  229a c60055        	ld	a,L5543_testCount
7621  229d a10b          	cp	a,#11
7622  229f 250c          	jrult	L5153
7623                     ; 104             DISP_ClearAll();
7624  22a1 cd0000        	call	_DISP_ClearAll
7626                     ; 105             TURR_Clear();
7627  22a4 cd0000        	call	_TURR_Clear
7629                     ; 107             testCount = 0;
7630  22a7 725f0055      	clr	L5543_testCount
7631                     ; 108             UI_SetRefreshMsg(0);
7633                     ; 109             return UI_RC_FINISH;
7635  22ab 2007          	jp	LC094
7636  22ad               L5153:
7637                     ; 112           UI_SetRefreshMsg(REFRESH_TIME_MS);
7639  22ad ad15          	call	LC096
7640                     ; 114         break;
7641  22af 200f          	jra	L1053
7642                     ; 117     break;
7643  22b1               L3743:
7644                     ; 119     case UIMSG_SW_RESET:
7644                     ; 120       if((uint8_t)pMsg->param == UI_SW_PRESS)
7645  22b1 f6            	ld	a,(x)
7646  22b2 260c          	jrne	L1053
7647                     ; 122         UI_SetRefreshMsg(0);
7649                     ; 123         return UI_RC_FINISH;
7650  22b4               LC094:
7651  22b4 5f            	clrw	x
7652  22b5 89            	pushw	x
7653  22b6 89            	pushw	x
7654  22b7 cd0000        	call	_UI_SetRefreshMsg
7655  22ba 5b04          	addw	sp,#4
7656  22bc 4f            	clr	a
7658  22bd               L4212:
7659  22bd 5b0a          	addw	sp,#10
7660  22bf 81            	ret	
7661                     ; 127     default:
7661                     ; 128       break;
7662  22c0               L1053:
7663                     ; 131   return UI_RC_CONTINUE;
7664  22c0 a601          	ld	a,#1
7666  22c2 20f9          	jra	L4212
7667  22c4               LC096:
7668  22c4 ae03e8        	ldw	x,#1000
7669  22c7 89            	pushw	x
7670  22c8 5f            	clrw	x
7671  22c9 89            	pushw	x
7672  22ca cd0000        	call	_UI_SetRefreshMsg
7674  22cd 5b04          	addw	sp,#4
7675  22cf 81            	ret	
7677                     ; 21 uint8_t UI_ProcessPump(void *pParam, UI_MSG_T *pMsg)
7677                     ; 22 {
7678  22d0               _UI_ProcessPump:
7679  22d0 89            	pushw	x
7680  22d1 520c          	subw	sp,#12
7681       0000000c      OFST:	set	12
7683                     ; 24   uint32_t sensorCounter = 0;
7684                     ; 26   switch(pMsg->message)
7685  22d3 1e11          	ldw	x,(OFST+5,sp)
7686  22d5 e601          	ld	a,(1,x)
7688                     ; 47       break;
7689  22d7 2706          	jreq	L1253
7690  22d9 a002          	sub	a,#2
7691  22db 2713          	jreq	L7253
7692  22dd 2024          	jra	L1453
7693  22df               L1253:
7694                     ; 180   SensorCounter = sc;
7695  22df 5f            	clrw	x
7696  22e0 cf0002        	ldw	_SensorCounter+2,x
7697  22e3 cf0000        	ldw	_SensorCounter,x
7698                     ; 140   FlagSensorEn = se;
7699  22e6 35010000      	mov	_FlagSensorEn,#1
7700                     ; 33       BSP_V_PumpEnable(TRUE);
7701  22ea 72115019      	bres	20505,#0
7702                     ; 35     break;
7703  22ee 2013          	jra	L1453
7704  22f0               L7253:
7705                     ; 37     case UIMSG_SW_RESET:
7705                     ; 38       if((uint8_t)pMsg->param == UI_SW_PRESS)
7706  22f0 7d            	tnz	(x)
7707  22f1 2610          	jrne	L1453
7708                     ; 140   FlagSensorEn = se;
7709  22f3 c70000        	ld	_FlagSensorEn,a
7710                     ; 180   SensorCounter = sc;
7711  22f6 5f            	clrw	x
7712  22f7 cf0002        	ldw	_SensorCounter+2,x
7713  22fa cf0000        	ldw	_SensorCounter,x
7714                     ; 43         BSP_V_PumpEnable(FALSE);
7715  22fd 72105019      	bset	20505,#0
7716                     ; 45         return UI_RC_FINISH;
7718  2301 202e          	jra	L6312
7719  2303               L1453:
7720                     ; 190   return SensorCounter;
7721  2303 ce0002        	ldw	x,_SensorCounter+2
7722  2306 1f0b          	ldw	(OFST-1,sp),x
7723  2308 ce0000        	ldw	x,_SensorCounter
7724  230b 1f09          	ldw	(OFST-3,sp),x
7727                     ; 52   sprintf((char *)&string[0], DISP_LOWER_STR_FORMAT, sensorCounter);
7728  230d 1e0b          	ldw	x,(OFST-1,sp)
7729  230f 89            	pushw	x
7730  2310 1e0b          	ldw	x,(OFST-1,sp)
7731  2312 89            	pushw	x
7732  2313 ce0000        	ldw	x,_pDisp
7733  2316 ee08          	ldw	x,(8,x)
7734  2318 89            	pushw	x
7735  2319 96            	ldw	x,sp
7736  231a 1c0007        	addw	x,#OFST-5
7737  231d cd0000        	call	_sprintf
7739  2320 5b06          	addw	sp,#6
7740                     ; 53   DISP_LowerClear();
7741  2322 cd0000        	call	_DISP_LowerClear
7743                     ; 54   DISP_LowerPutStr((char *)&string[0], 0);
7744  2325 4b00          	push	#0
7745  2327 96            	ldw	x,sp
7746  2328 1c0002        	addw	x,#OFST-10
7747  232b cd0000        	call	_DISP_LowerPutStr
7749  232e 84            	pop	a
7750                     ; 56   return UI_RC_CONTINUE;
7751  232f a601          	ld	a,#1
7753  2331               L6312:
7754  2331 5b0e          	addw	sp,#14
7755  2333 81            	ret	
7757                     ; 21 uint8_t UI_ProcessHopper(void *pParam, UI_MSG_T *pMsg)
7757                     ; 22 {
7758  2334               _UI_ProcessHopper:
7759       fffffffe      OFST: set -2
7761                     ; 23   switch(pMsg->message)
7762  2334 1e03          	ldw	x,(OFST+5,sp)
7763  2336 e601          	ld	a,(1,x)
7765                     ; 37       break;
7766  2338 2706          	jreq	L5453
7767  233a a002          	sub	a,#2
7768  233c 2708          	jreq	L7453
7769  233e 200e          	jra	L3553
7770  2340               L5453:
7771                     ; 27       BSP_H_MotorEnable(TRUE);
7772  2340 721d5005      	bres	20485,#6
7773                     ; 29     break;
7774  2344 2008          	jra	L3553
7775  2346               L7453:
7776                     ; 31     case UIMSG_SW_RESET:
7776                     ; 32       if((uint8_t)pMsg->param == UI_SW_PRESS)
7777  2346 7d            	tnz	(x)
7778  2347 2605          	jrne	L3553
7779                     ; 34         BSP_H_MotorEnable(FALSE);
7780  2349 721c5005      	bset	20485,#6
7781                     ; 35         return UI_RC_FINISH;
7783  234d 81            	ret	
7784  234e               L3553:
7785                     ; 40   return UI_RC_CONTINUE;
7786  234e a601          	ld	a,#1
7788  2350 81            	ret	
7790                     ; 21 uint8_t UI_ProcessSpindle(void *pParam, UI_MSG_T *pMsg)
7790                     ; 22 {
7791  2351               _UI_ProcessSpindle:
7792       fffffffe      OFST: set -2
7794                     ; 23   switch(pMsg->message)
7795  2351 1e03          	ldw	x,(OFST+5,sp)
7796  2353 e601          	ld	a,(1,x)
7798                     ; 37       break;
7799  2355 2706          	jreq	L7553
7800  2357 a002          	sub	a,#2
7801  2359 2708          	jreq	L1653
7802  235b 200e          	jra	L5653
7803  235d               L7553:
7804                     ; 27       BSP_S_MotorEnable(TRUE);
7805  235d 721f5005      	bres	20485,#7
7806                     ; 29     break;
7807  2361 2008          	jra	L5653
7808  2363               L1653:
7809                     ; 31     case UIMSG_SW_RESET:
7809                     ; 32       if((uint8_t)pMsg->param == UI_SW_PRESS)
7810  2363 7d            	tnz	(x)
7811  2364 2605          	jrne	L5653
7812                     ; 34         BSP_S_MotorEnable(FALSE);
7813  2366 721e5005      	bset	20485,#7
7814                     ; 35         return UI_RC_FINISH;
7816  236a 81            	ret	
7817  236b               L5653:
7818                     ; 40   return UI_RC_CONTINUE;
7819  236b a601          	ld	a,#1
7821  236d 81            	ret	
7823                     ; 21 uint8_t UI_ProcessBCoil(void *pParam, UI_MSG_T *pMsg)
7823                     ; 22 {
7824  236e               _UI_ProcessBCoil:
7825  236e 89            	pushw	x
7826       00000000      OFST:	set	0
7828                     ; 25   switch(pMsg->message)
7829  236f 1e05          	ldw	x,(OFST+5,sp)
7830  2371 e601          	ld	a,(1,x)
7832                     ; 47       break;
7833  2373 2708          	jreq	L1753
7834  2375 4a            	dec	a
7835  2376 2719          	jreq	LC097
7836  2378 4a            	dec	a
7837  2379 2713          	jreq	L5753
7838  237b 201a          	jra	L1063
7839  237d               L1753:
7840                     ; 29       BSP_B_CoilEnable(TRUE);
7841  237d 72175014      	bres	20500,#3
7842                     ; 30       UI_SetRefreshMsg(BATCH_COIL_TIME);
7843  2381 ae01f4        	ldw	x,#500
7844  2384 89            	pushw	x
7845  2385 5f            	clrw	x
7846  2386 89            	pushw	x
7847  2387 cd0000        	call	_UI_SetRefreshMsg
7849  238a 5b04          	addw	sp,#4
7850                     ; 32     break;
7851  238c 2009          	jra	L1063
7852                     ; 36       BSP_B_CoilEnable(FALSE);
7853                     ; 37       return UI_RC_FINISH;
7855  238e               L5753:
7856                     ; 41     case UIMSG_SW_RESET:
7856                     ; 42       if((uint8_t)pMsg->param == UI_SW_PRESS)
7857  238e 7d            	tnz	(x)
7858  238f 2606          	jrne	L1063
7859                     ; 44         BSP_B_CoilEnable(FALSE);
7860  2391               LC097:
7861  2391 72165014      	bset	20500,#3
7862                     ; 45         return UI_RC_FINISH;
7864  2395               L4512:
7865  2395 85            	popw	x
7866  2396 81            	ret	
7867  2397               L1063:
7868                     ; 50   return UI_RC_CONTINUE;
7869  2397 a601          	ld	a,#1
7871  2399 20fa          	jra	L4512
7873                     ; 21 uint8_t UI_ProcessSCoil(void *pParam, UI_MSG_T *pMsg)
7873                     ; 22 {
7874  239b               _UI_ProcessSCoil:
7875  239b 89            	pushw	x
7876  239c 5204          	subw	sp,#4
7877       00000004      OFST:	set	4
7879                     ; 25   uint32_t stampEnable = FALSE;
7880  239e 5f            	clrw	x
7881  239f 1f03          	ldw	(OFST-1,sp),x
7882  23a1 1f01          	ldw	(OFST-3,sp),x
7883                     ; 26   REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
7884  23a3 4b02          	push	#2
7885  23a5 96            	ldw	x,sp
7886  23a6 1c0002        	addw	x,#OFST-2
7887  23a9 cd0000        	call	_REG_GetValue
7889  23ac 84            	pop	a
7890                     ; 28   switch(pMsg->message)
7891  23ad 1e09          	ldw	x,(OFST+5,sp)
7892  23af e601          	ld	a,(1,x)
7894                     ; 62       break;
7895  23b1 2708          	jreq	L5063
7896  23b3 4a            	dec	a
7897  23b4 271b          	jreq	L7063
7898  23b6 4a            	dec	a
7899  23b7 271f          	jreq	L1163
7900  23b9 202d          	jra	L5163
7901  23bb               L5063:
7902                     ; 32       if(stampEnable == TRUE)
7903  23bb 96            	ldw	x,sp
7904  23bc ad2e          	call	LC100
7906  23be 2604          	jrne	L7163
7907                     ; 34         BSP_S_CoilEnable(TRUE);
7908  23c0 72195014      	bres	20500,#4
7909  23c4               L7163:
7910                     ; 37       UI_SetRefreshMsg(STAMP_COIL_TIME);
7911  23c4 ae01f4        	ldw	x,#500
7912  23c7 89            	pushw	x
7913  23c8 5f            	clrw	x
7914  23c9 89            	pushw	x
7915  23ca cd0000        	call	_UI_SetRefreshMsg
7917  23cd 5b04          	addw	sp,#4
7918                     ; 39     break;
7919  23cf 2017          	jra	L5163
7920  23d1               L7063:
7921                     ; 43       if(stampEnable == TRUE)
7922  23d1 96            	ldw	x,sp
7923  23d2 ad18          	call	LC100
7925  23d4 260e          	jrne	L5263
7926                     ; 45         BSP_S_CoilEnable(FALSE);
7927                     ; 48       return UI_RC_FINISH;
7929  23d6 2008          	jp	LC099
7930  23d8               L1163:
7931                     ; 52     case UIMSG_SW_RESET:
7931                     ; 53       if((uint8_t)pMsg->param == UI_SW_PRESS)
7932  23d8 f6            	ld	a,(x)
7933  23d9 260d          	jrne	L5163
7934                     ; 55         if(stampEnable == TRUE)
7935  23db 96            	ldw	x,sp
7936  23dc ad0e          	call	LC100
7938  23de 2604          	jrne	L5263
7939                     ; 57           BSP_S_CoilEnable(FALSE);
7940  23e0               LC099:
7941  23e0 72185014      	bset	20500,#4
7942  23e4               L5263:
7943                     ; 60         return UI_RC_FINISH;
7944  23e4 4f            	clr	a
7946  23e5               L4612:
7947  23e5 5b06          	addw	sp,#6
7948  23e7 81            	ret	
7949  23e8               L5163:
7950                     ; 65   return UI_RC_CONTINUE;
7951  23e8 a601          	ld	a,#1
7953  23ea 20f9          	jra	L4612
7954  23ec               LC100:
7955  23ec 5c            	incw	x
7956  23ed cd0000        	call	c_ltor
7958  23f0 ae0058        	ldw	x,#L404
7959  23f3 cc0000        	jp	c_lcmp
7961                     	switch	.data
7962  0058               L7263_startHopper:
7963  0058 00            	dc.b	0
7964                     ; 21 uint8_t UI_ProcessHSwitch(void *pParam, UI_MSG_T *pMsg)
7964                     ; 22 {
7965                     	switch	.text
7966  23f6               _UI_ProcessHSwitch:
7967  23f6 89            	pushw	x
7968  23f7 88            	push	a
7969       00000001      OFST:	set	1
7971                     ; 26   uint8_t hSwitchStatus = (uint8_t)BSP_ReadCamSwitch();
7972  23f8 720d501503    	btjf	20501,#6,L0712
7973  23fd 4f            	clr	a
7974  23fe 2002          	jra	L2712
7975  2400               L0712:
7976  2400 a601          	ld	a,#1
7977  2402               L2712:
7978  2402 6b01          	ld	(OFST+0,sp),a
7979                     ; 28   switch(pMsg->message)
7980  2404 1e06          	ldw	x,(OFST+5,sp)
7981  2406 e601          	ld	a,(1,x)
7983                     ; 57       break;
7984  2408 2709          	jreq	L1363
7985  240a a002          	sub	a,#2
7986  240c 2728          	jreq	L7363
7987  240e 4a            	dec	a
7988  240f 270c          	jreq	L3363
7989  2411 2029          	jra	L3463
7990  2413               L1363:
7991                     ; 32       startHopper = TRUE;
7992  2413 35010058      	mov	L7263_startHopper,#1
7993                     ; 33       BSP_H_MotorEnable(TRUE);
7994  2417 721d5005      	bres	20485,#6
7995                     ; 35     break;
7996  241b 201f          	jra	L3463
7997  241d               L3363:
7998                     ; 39       if((uint8_t)pMsg->param == UI_SW_PRESS)
7999  241d 7d            	tnz	(x)
8000  241e 261c          	jrne	L3463
8001                     ; 338   BuzzerOnTime = buzzTime;
8002  2420 ae00c8        	ldw	x,#200
8003  2423 cf0002        	ldw	_BuzzerOnTime+2,x
8004  2426 5f            	clrw	x
8005  2427 cf0000        	ldw	_BuzzerOnTime,x
8006                     ; 43         if(startHopper == FALSE)
8007  242a 725d0058      	tnz	L7263_startHopper
8008  242e 260c          	jrne	L3463
8009                     ; 45           BSP_H_MotorEnable(FALSE);
8010  2430 721c5005      	bset	20485,#6
8011                     ; 46           return UI_RC_FINISH;
8013  2434 202a          	jra	L2022
8014  2436               L7363:
8015                     ; 52     case UIMSG_SW_RESET:
8015                     ; 53       if((uint8_t)pMsg->param == UI_SW_PRESS)
8016  2436 7d            	tnz	(x)
8017  2437 2603          	jrne	L3463
8018                     ; 55         startHopper = FALSE;
8019  2439 c70058        	ld	L7263_startHopper,a
8020  243c               L3463:
8021                     ; 60   DISP_LowerClear();
8022  243c cd0000        	call	_DISP_LowerClear
8024                     ; 62   if(hSwitchStatus == TRUE)
8025  243f 7b01          	ld	a,(OFST+0,sp)
8026  2441 4a            	dec	a
8027  2442 260c          	jrne	L3563
8028                     ; 64     DISP_LowerPutStr("H", DISP_LOWER_MAX_NB - 1);
8029  2444 ce0000        	ldw	x,_pDisp
8030  2447 e603          	ld	a,(3,x)
8031  2449 4a            	dec	a
8032  244a 88            	push	a
8033  244b ae01ab        	ldw	x,#L5563
8036  244e 200a          	jra	L7563
8037  2450               L3563:
8038                     ; 68     DISP_LowerPutStr("L", DISP_LOWER_MAX_NB - 1);
8039  2450 ce0000        	ldw	x,_pDisp
8040  2453 e603          	ld	a,(3,x)
8041  2455 4a            	dec	a
8042  2456 88            	push	a
8043  2457 ae01a9        	ldw	x,#L1663
8045  245a               L7563:
8046  245a cd0000        	call	_DISP_LowerPutStr
8047  245d 84            	pop	a
8048                     ; 71   return UI_RC_CONTINUE;
8049  245e a601          	ld	a,#1
8051  2460               L2022:
8052  2460 5b03          	addw	sp,#3
8053  2462 81            	ret	
8055                     ; 21 uint8_t UI_ProcessISwitch(void *pParam, UI_MSG_T *pMsg)
8055                     ; 22 {
8056  2463               _UI_ProcessISwitch:
8057  2463 89            	pushw	x
8058  2464 88            	push	a
8059       00000001      OFST:	set	1
8061                     ; 25   uint8_t iSwitchStatus = (uint8_t)BSP_ReadAutoSwitch();
8062  2465 720f501503    	btjf	20501,#7,L6022
8063  246a 4f            	clr	a
8064  246b 2002          	jra	L0122
8065  246d               L6022:
8066  246d a601          	ld	a,#1
8067  246f               L0122:
8068  246f 6b01          	ld	(OFST+0,sp),a
8069                     ; 27   switch(pMsg->message)
8070  2471 1e06          	ldw	x,(OFST+5,sp)
8071  2473 e601          	ld	a,(1,x)
8073                     ; 42       break;
8074  2475 a002          	sub	a,#2
8075  2477 2713          	jreq	L7663
8076  2479 a002          	sub	a,#2
8077  247b 2612          	jrne	L3763
8078                     ; 29     case UIMSG_SW_AUTO:
8078                     ; 30       if((uint8_t)pMsg->param == UI_SW_PRESS)
8079  247d f6            	ld	a,(x)
8080  247e 260f          	jrne	L3763
8081                     ; 338   BuzzerOnTime = buzzTime;
8082  2480 ae00c8        	ldw	x,#200
8083  2483 cf0002        	ldw	_BuzzerOnTime+2,x
8084  2486 5f            	clrw	x
8085  2487 cf0000        	ldw	_BuzzerOnTime,x
8086  248a 2003          	jra	L3763
8087  248c               L7663:
8088                     ; 37     case UIMSG_SW_RESET:
8088                     ; 38       if((uint8_t)pMsg->param == UI_SW_PRESS)
8089  248c 7d            	tnz	(x)
8090                     ; 40         return UI_RC_FINISH;
8092  248d 2724          	jreq	L0222
8093  248f               L3763:
8094                     ; 45   DISP_LowerClear();
8095  248f cd0000        	call	_DISP_LowerClear
8097                     ; 47   if(iSwitchStatus == TRUE)
8098  2492 7b01          	ld	a,(OFST+0,sp)
8099  2494 4a            	dec	a
8100  2495 260c          	jrne	L1073
8101                     ; 49     DISP_LowerPutStr("H", DISP_LOWER_MAX_NB - 1);
8102  2497 ce0000        	ldw	x,_pDisp
8103  249a e603          	ld	a,(3,x)
8104  249c 4a            	dec	a
8105  249d 88            	push	a
8106  249e ae01ab        	ldw	x,#L5563
8109  24a1 200a          	jra	L3073
8110  24a3               L1073:
8111                     ; 53     DISP_LowerPutStr("L", DISP_LOWER_MAX_NB - 1);
8112  24a3 ce0000        	ldw	x,_pDisp
8113  24a6 e603          	ld	a,(3,x)
8114  24a8 4a            	dec	a
8115  24a9 88            	push	a
8116  24aa ae01a9        	ldw	x,#L1663
8118  24ad               L3073:
8119  24ad cd0000        	call	_DISP_LowerPutStr
8120  24b0 84            	pop	a
8121                     ; 56   return UI_RC_CONTINUE;
8122  24b1 a601          	ld	a,#1
8124  24b3               L0222:
8125  24b3 5b03          	addw	sp,#3
8126  24b5 81            	ret	
8128                     	switch	.const
8129  0189               _UI_PROCESS_INFO_LIST:
8131  0189 13a0          	dc.w	_UI_ProcessHome
8133  018b 1911          	dc.w	_UI_ProcessAuto
8135  018d 192a          	dc.w	_UI_ProcessSetM
8137  018f 1993          	dc.w	_UI_ProcessCntlg
8139  0191 1b33          	dc.w	_UI_ProcessStpen
8141  0193 1de7          	dc.w	_UI_ProcessUvset
8143  0195 1ef8          	dc.w	_UI_ProcessUvenb
8145  0197 1f11          	dc.w	_UI_ProcessKeyboard
8147  0199 21b7          	dc.w	_UI_ProcessSegment
8149  019b 22d0          	dc.w	_UI_ProcessPump
8151  019d 2334          	dc.w	_UI_ProcessHopper
8153  019f 2351          	dc.w	_UI_ProcessSpindle
8155  01a1 236e          	dc.w	_UI_ProcessBCoil
8157  01a3 239b          	dc.w	_UI_ProcessSCoil
8159  01a5 23f6          	dc.w	_UI_ProcessHSwitch
8161  01a7 2463          	dc.w	_UI_ProcessISwitch
8163                     ; 208 UI_PROC_PF UI_GetProcessInfo(uint16_t processId)
8163                     ; 209 {
8164                     	switch	.text
8165  24b6               _UI_GetProcessInfo:
8167                     ; 210   if(processId < UI_PROC_MAX_ITEM)
8168  24b6 a30010        	cpw	x,#16
8169  24b9 2405          	jruge	L5073
8170                     ; 212     return (UI_PROCESS_INFO_LIST[processId]);
8171  24bb 58            	sllw	x
8172  24bc de0189        	ldw	x,(_UI_PROCESS_INFO_LIST,x)
8174  24bf 81            	ret	
8175  24c0               L5073:
8176                     ; 216     return (0);
8177  24c0 5f            	clrw	x
8179  24c1 81            	ret	
8181                     	xdef	_UI_PROCESS_INFO_LIST
8182                     	xdef	_UI_ProcessISwitch
8183                     	xdef	_UI_ProcessHSwitch
8184                     	xdef	_UI_ProcessSCoil
8185                     	xdef	_UI_ProcessBCoil
8186                     	xdef	_UI_ProcessSpindle
8187                     	xdef	_UI_ProcessHopper
8188                     	xdef	_UI_ProcessPump
8189                     	xdef	_UI_ProcessSegment
8190                     	xdef	_UI_ProcessKeyboard
8191                     	xdef	_UI_ProcessUvenb
8192                     	xdef	_UI_ProcessUvset
8193                     	xdef	_UI_ProcessStpen
8194                     	xdef	_UI_ProcessCntlg
8195                     	xdef	_UI_ProcessSetM
8196                     	xdef	_UI_ProcessAuto
8197                     	xdef	_UI_ProcessHome
8198                     	xdef	_UI_GetProcessInfo
8199                     	xref	_UI_GetMenuNbTotalChild
8200                     	xref	_UI_SetRefreshMsg
8201                     	xref	_UI_InvokeMenu
8202                     	xref	_UI_ClearAllMessage
8203                     	xref	_TURR_PutVal
8204                     	xref	_TURR_Clear
8205                     	xref	_TurretExecute
8206                     	xref	_SW_IsPressed
8207                     	xref	_KPD_IsPressed
8208                     	xref	_DISP_ClearAll
8209                     	xref	_DISP_SetAll
8210                     	xref	_DISP_Led
8211                     	xref	_DISP_TurrPutStr
8212                     	xref	_DISP_UpperPutStr
8213                     	xref	_DISP_UpperClear
8214                     	xref	_DISP_LowerPutStr
8215                     	xref	_DISP_LowerClear
8216                     	xref	_pDisp
8217                     	xref	_REG_GetMaxValue
8218                     	xref	_REG_GetMinValue
8219                     	xref	_REG_GetValue
8220                     	xref	_REG_SetValue
8221                     	xref	_RET_WriteRetEnbale
8222                     	xref	_SensorCounter
8223                     	xref	_CounterMode
8224                     	xref	_FlagSensorEn
8225                     	xref	_FlagUvDetect
8226                     	xref	_FlagAddCount
8227                     	xref	_FlagAutoCount
8228                     	xref	_FlagValueCount
8229                     	xref	_SystemTimer
8230                     	xref	_AdcValue
8231                     	xref	_BuzzerOnTime
8232                     	xref	_memset
8233                     	xref	_strlen
8234                     	xref	_abs
8235                     	xref	_sprintf
8236                     	switch	.const
8237  01a9               L1663:
8238  01a9 4c00          	dc.b	"L",0
8239  01ab               L5563:
8240  01ab 4800          	dc.b	"H",0
8241  01ad               L1443:
8242  01ad 53572d4800    	dc.b	"SW-H",0
8243  01b2               L1343:
8244  01b2 53572d4900    	dc.b	"SW-I",0
8245  01b7               L5533:
8246  01b7 554e49545300  	dc.b	"UNITS",0
8247  01bd               L5433:
8248  01bd 54454e5300    	dc.b	"TENS",0
8249  01c2               L1233:
8250  01c2 4d414e55414c  	dc.b	"MANUAL",0
8251  01c9               L5403:
8252  01c9 555653455400  	dc.b	"UVSET",0
8253  01cf               L3062:
8254  01cf 454e424c4500  	dc.b	"ENBLE",0
8255  01d5               L1062:
8256  01d5 444953424c00  	dc.b	"DISBL",0
8257  01db               L5752:
8258  01db 454e00        	dc.b	"EN",0
8259  01de               L3752:
8260  01de 44495300      	dc.b	"DIS",0
8261  01e2               L1252:
8262  01e2 552d434e5400  	dc.b	"U-CNT",0
8263  01e8               L7152:
8264  01e8 4f2d434e5400  	dc.b	"O-CNT",0
8265  01ee               L5152:
8266  01ee 434f554e5400  	dc.b	"COUNT",0
8267  01f4               L3542:
8268  01f4 4d2d4155544f  	dc.b	"M-AUTO",0
8269  01fb               L1542:
8270  01fb 4d2d4d414e4c  	dc.b	"M-MANL",0
8271  0202               L1512:
8272  0202 4100          	dc.b	"A",0
8273  0204               L1602:
8274  0204 4552522d3200  	dc.b	"ERR-2",0
8275  020a               L5202:
8276  020a 4552522d3100  	dc.b	"ERR-1",0
8277  0210               L335:
8278  0210 57454c434f4d  	dc.b	"WELCOME",0
8279  0218               L715:
8280  0218 524553455400  	dc.b	"RESET",0
8281  021e               L115:
8282  021e 434c45415200  	dc.b	"CLEAR",0
8283  0224               L305:
8284  0224 454e54455200  	dc.b	"ENTER",0
8285  022a               L574:
8286  022a 4e45585400    	dc.b	"NEXT",0
8287  022f               L764:
8288  022f 4241434b00    	dc.b	"BACK",0
8289  0234               L164:
8290  0234 444f574e00    	dc.b	"DOWN",0
8291  0239               L354:
8292  0239 555000        	dc.b	"UP",0
8293  023c               L544:
8294  023c 46554e4300    	dc.b	"FUNC",0
8295  0241               L734:
8296  0241 4d4f444500    	dc.b	"MODE",0
8297  0246               L134:
8298  0246 4d414e4c00    	dc.b	"MANL",0
8299  024b               L324:
8300  024b 4155544f00    	dc.b	"AUTO",0
8301  0250               L514:
8302  0250 555600        	dc.b	"UV",0
8303  0253               L704:
8304  0253 56414c554500  	dc.b	"VALUE",0
8305  0259               L104:
8306  0259 41442d555600  	dc.b	"AD-UV",0
8307  025f               L373:
8308  025f 41444400      	dc.b	"ADD",0
8309  0263               L563:
8310  0263 4b45592d3900  	dc.b	"KEY-9",0
8311  0269               L753:
8312  0269 4b45592d3800  	dc.b	"KEY-8",0
8313  026f               L153:
8314  026f 4b45592d3700  	dc.b	"KEY-7",0
8315  0275               L343:
8316  0275 4b45592d3600  	dc.b	"KEY-6",0
8317  027b               L533:
8318  027b 4b45592d3500  	dc.b	"KEY-5",0
8319  0281               L723:
8320  0281 4b45592d3400  	dc.b	"KEY-4",0
8321  0287               L123:
8322  0287 4b45592d3300  	dc.b	"KEY-3",0
8323  028d               L313:
8324  028d 4b45592d3200  	dc.b	"KEY-2",0
8325  0293               L503:
8326  0293 4b45592d3100  	dc.b	"KEY-1",0
8327  0299               L772:
8328  0299 4b45592d3000  	dc.b	"KEY-0",0
8329  029f               L351:
8330  029f 256c75256300  	dc.b	"%lu%c",0
8331                     	xref.b	c_lreg
8332                     	xref.b	c_x
8333                     	xref	c_imul
8334                     	xref	c_itolx
8335                     	xref	c_lgsub
8336                     	xref	c_lmul
8337                     	xref	c_lgadd
8338                     	xref	c_smul
8339                     	xref	c_lgsbc
8340                     	xref	c_lgadc
8341                     	xref	c_ladc
8342                     	xref	c_uitolx
8343                     	xref	c_lumd
8344                     	xref	c_lsub
8345                     	xref	c_ludv
8346                     	xref	c_rtol
8347                     	xref	c_lzmp
8348                     	xref	c_lcmp
8349                     	xref	c_ltor
8350                     	xref	c_xymvx
8351                     	end
