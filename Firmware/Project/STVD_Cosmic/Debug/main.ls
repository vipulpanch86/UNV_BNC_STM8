   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L3_DISP_KPD_TYPE_MAP:
  22  0000 00            	dc.b	0
  23  0001 00            	dc.b	0
  24  0002 01            	dc.b	1
  25  0003 01            	dc.b	1
  26  0004 01            	dc.b	1
  27  0005 01            	dc.b	1
  28  0006 000000000000  	ds.b	42
  29                     	switch	.data
  30  0000               _FlagValueCount:
  31  0000 00            	dc.b	0
  32  0001               _FlagAutoCount:
  33  0001 01            	dc.b	1
  34  0002               _FlagAddCount:
  35  0002 00            	dc.b	0
  36  0003               _FlagUvDetect:
  37  0003 00            	dc.b	0
  38  0004               _FlagSensorEn:
  39  0004 00            	dc.b	0
  40  0005               _CounterMode:
  41  0005 00            	dc.b	0
  42  0006               _SensorCounter:
  43  0006 00000000      	dc.l	0
  44  000a               L5_SensorExecState:
  45  000a 00            	dc.b	0
  46  000b               L7_UvDetected:
  47  000b 00            	dc.b	0
  48  000c               L11_BkupSensorCounter:
  49  000c 00000000      	dc.l	0
  50  0010               L31_WaitLastNoteCount:
  51  0010 00            	dc.b	0
  52                     	switch	.const
  53  0030               L51_msg:
  54  0030 00            	dc.b	0
  55  0031 40            	dc.b	64
  56  0032               L71_msg:
  57  0032 00            	dc.b	0
  58  0033 41            	dc.b	65
  60                     ; 184 void DisplayKeypadInit(void) 
  60                     ; 185 {
  61                     	scross	off
  62                     	switch	.text
  63  0000               _DisplayKeypadInit:
  64  0000 88            	push	a
  65       00000001      OFST:	set	1
  67                     ; 187   uint8_t rotDipSwitchPos = ROT_DIP_SW;
  68  0001 0f01          	clr	(OFST+0,sp)
  69                     ; 192   printf("\n\rDip = %u", (uint32_t)rotDipSwitchPos);
  70  0003 5f            	clrw	x
  71  0004 89            	pushw	x
  72  0005 89            	pushw	x
  73  0006 ae0040        	ldw	x,#L12
  74  0009 cd0000        	call	_printf
  76  000c 5b04          	addw	sp,#4
  77                     ; 193   rotDipSwitchPos = (rotDipSwitchPos >= DISP_KPD_TYPE_MAX) ? 
  77                     ; 194 	                (DISP_KPD_TYPE_MAX - 1) : (rotDipSwitchPos);
  78  000e 7b01          	ld	a,(OFST+0,sp)
  79  0010 a102          	cp	a,#2
  80  0012 2502          	jrult	L6
  81  0014 a601          	ld	a,#1
  82  0016               L6:
  83  0016 6b01          	ld	(OFST+0,sp),a
  84                     ; 196   FlagValueCount = DISP_KPD_TYPE_MAP[rotDipSwitchPos].valueEnable;
  85  0018 97            	ld	xl,a
  86  0019 a603          	ld	a,#3
  87  001b 42            	mul	x,a
  88  001c d60002        	ld	a,(L3_DISP_KPD_TYPE_MAP+2,x)
  89  001f c70000        	ld	_FlagValueCount,a
  90                     ; 197   DISP_Init(DISP_KPD_TYPE_MAP[rotDipSwitchPos].dispIndex);
  91  0022 d60000        	ld	a,(L3_DISP_KPD_TYPE_MAP,x)
  92  0025 cd0000        	call	_DISP_Init
  94                     ; 198   KPD_Init(DISP_KPD_TYPE_MAP[rotDipSwitchPos].kpdIndex, 20, UI_KeyCallBack);
  95  0028 ae0000        	ldw	x,#_UI_KeyCallBack
  96  002b 89            	pushw	x
  97  002c 7b03          	ld	a,(OFST+2,sp)
  98  002e 97            	ld	xl,a
  99  002f a603          	ld	a,#3
 100  0031 42            	mul	x,a
 101  0032 d60001        	ld	a,(L3_DISP_KPD_TYPE_MAP+1,x)
 102  0035 ae0014        	ldw	x,#20
 103  0038 95            	ld	xh,a
 104  0039 cd0000        	call	_KPD_Init
 106                     ; 199 }
 107  003c 5b03          	addw	sp,#3
 108  003e 81            	ret	
 110                     ; 206 int32_t absolute(int32_t value) 
 110                     ; 207 {
 111  003f               _absolute:
 112       00000000      OFST:	set	0
 114                     ; 208   if (value < 0) 
 115  003f 0d03          	tnz	(OFST+3,sp)
 116  0041 96            	ldw	x,sp
 117  0042 2a09          	jrpl	L32
 118                     ; 210     return -value;
 119  0044 1c0003        	addw	x,#OFST+3
 120  0047 cd0000        	call	c_ltor
 124  004a cc0000        	jp	c_lneg
 125  004d               L32:
 126                     ; 214     return value;  
 127  004d 1c0003        	addw	x,#OFST+3
 130  0050 cc0000        	jp	c_ltor
 132                     	switch	.data
 133  0011               L72_BkupDispExecTime:
 134  0011 00000000      	dc.l	0
 135  0015               L13_BkupKpdScanTime:
 136  0015 00000000      	dc.l	0
 137  0019               L33_BkupBuzzExecTime:
 138  0019 00000000      	dc.l	0
 139  001d               L53_BkupRetExecTime:
 140  001d 00000000      	dc.l	0
 141  0021               L73_BkupSnrExecTime:
 142  0021 00000000      	dc.l	0
 143  0025               L14_BkupUiExecTime:
 144  0025 00000000      	dc.l	0
 145                     	switch	.const
 146  0034               L54_msg:
 147  0034 00            	dc.b	0
 148  0035 40            	dc.b	64
 149  0036               L74_msg:
 150  0036 00            	dc.b	0
 151  0037 41            	dc.b	65
 152                     	xref	_BspSensorCounter
 154  0038               L24:
 155  0038 00000064      	dc.l	100
 156  003c               L411:
 157  003c 0000000a      	dc.l	10
 158                     ; 223 void main(void)
 158                     ; 224 {
 159                     	switch	.text
 160  0053               _main:
 161  0053 5219          	subw	sp,#25
 162       00000019      OFST:	set	25
 164                     ; 225   uint32_t swVersion = 0;
 165  0055 5f            	clrw	x
 166  0056 1f18          	ldw	(OFST-1,sp),x
 167  0058 1f16          	ldw	(OFST-3,sp),x
 168                     ; 228   BSP_Init();
 169  005a cd0000        	call	_BSP_Init
 171                     ; 231   EE_Init();  
 172  005d cd0000        	call	_EE_Init
 174                     ; 234   DisplayKeypadInit();
 175  0060 ad9e          	call	_DisplayKeypadInit
 177                     ; 235   TURR_Clear();
 178  0062 cd0000        	call	_TURR_Clear
 180                     ; 239   SW_Init(50, UI_SwCallBack);
 181  0065 ae0000        	ldw	x,#_UI_SwCallBack
 182  0068 89            	pushw	x
 183  0069 a632          	ld	a,#50
 184  006b cd0000        	call	_SW_Init
 186  006e 85            	popw	x
 187                     ; 241   RET_Init();
 188  006f cd0000        	call	_RET_Init
 190                     ; 242   REG_Init(FALSE);
 191  0072 4f            	clr	a
 192  0073 cd0000        	call	_REG_Init
 194                     ; 243   REG_GetValue(&swVersion, REG_ID_SW_VERSION);
 195  0076 4b00          	push	#0
 196  0078 96            	ldw	x,sp
 197  0079 1c0017        	addw	x,#OFST-2
 198  007c cd0000        	call	_REG_GetValue
 200  007f 84            	pop	a
 201                     ; 245   if(swVersion != BSP_SW_VERSION)
 202  0080 96            	ldw	x,sp
 203  0081 1c0016        	addw	x,#OFST-3
 204  0084 cd0000        	call	c_ltor
 206  0087 ae0038        	ldw	x,#L24
 207  008a cd0000        	call	c_lcmp
 209  008d 2708          	jreq	L75
 210                     ; 247     REG_Init(TRUE);
 211  008f a601          	ld	a,#1
 212  0091 cd0000        	call	_REG_Init
 214                     ; 248     RET_UpdateFlash();
 215  0094 cd0000        	call	_RET_UpdateFlash
 217  0097               L75:
 218                     ; 251   UI_Init();
 219  0097 cd0000        	call	_UI_Init
 221  009a               L16:
 222                     ; 328   return SystemTimer;
 223  009a ce0002        	ldw	x,_SystemTimer+2
 224  009d 1f14          	ldw	(OFST-5,sp),x
 225  009f ce0000        	ldw	x,_SystemTimer
 226  00a2 1f12          	ldw	(OFST-7,sp),x
 229                     ; 265     if((sysTime - BkupDispExecTime) >= DISP_EXEC_MS)
 230  00a4 96            	ldw	x,sp
 231  00a5 1c0012        	addw	x,#OFST-7
 232  00a8 cd0000        	call	c_ltor
 234  00ab ae0011        	ldw	x,#L72_BkupDispExecTime
 235  00ae cd0000        	call	c_lsub
 237  00b1 cd0000        	call	c_lrzmp
 239  00b4 270d          	jreq	L56
 240                     ; 267       BkupDispExecTime = sysTime;
 241  00b6 1e14          	ldw	x,(OFST-5,sp)
 242  00b8 cf0013        	ldw	L72_BkupDispExecTime+2,x
 243  00bb 1e12          	ldw	x,(OFST-7,sp)
 244  00bd cf0011        	ldw	L72_BkupDispExecTime,x
 245                     ; 268       DISP_Exec();
 246  00c0 cd0000        	call	_DISP_Exec
 248  00c3               L56:
 249                     ; 271     if((sysTime - BkupKpdScanTime) >= KPD_SCAN_MS)
 250  00c3 96            	ldw	x,sp
 251  00c4 1c0012        	addw	x,#OFST-7
 252  00c7 cd0000        	call	c_ltor
 254  00ca ae0015        	ldw	x,#L13_BkupKpdScanTime
 255  00cd cd0000        	call	c_lsub
 257  00d0 cd0000        	call	c_lrzmp
 259  00d3 2710          	jreq	L76
 260                     ; 273       BkupKpdScanTime = sysTime;
 261  00d5 1e14          	ldw	x,(OFST-5,sp)
 262  00d7 cf0017        	ldw	L13_BkupKpdScanTime+2,x
 263  00da 1e12          	ldw	x,(OFST-7,sp)
 264  00dc cf0015        	ldw	L13_BkupKpdScanTime,x
 265                     ; 274       KPD_Scan();
 266  00df cd0000        	call	_KPD_Scan
 268                     ; 275       SW_Scan();
 269  00e2 cd0000        	call	_SW_Scan
 271  00e5               L76:
 272                     ; 29   return TurretExecute;
 273  00e5 c60000        	ld	a,_TurretExecute
 274  00e8 6b11          	ld	(OFST-8,sp),a
 277  00ea 2703          	jreq	L17
 278                     ; 280       TURR_Exec();
 279  00ec cd0000        	call	_TURR_Exec
 281  00ef               L17:
 282                     ; 283     if((sysTime - BkupBuzzExecTime) >= BUZZ_EXEC_MS)
 283  00ef 96            	ldw	x,sp
 284  00f0 1c0012        	addw	x,#OFST-7
 285  00f3 cd0000        	call	c_ltor
 287  00f6 ae0019        	ldw	x,#L33_BkupBuzzExecTime
 288  00f9 cd0000        	call	c_lsub
 290  00fc ae0038        	ldw	x,#L24
 291  00ff cd0000        	call	c_lcmp
 293  0102 250d          	jrult	L37
 294                     ; 285       BkupBuzzExecTime = sysTime;
 295  0104 1e14          	ldw	x,(OFST-5,sp)
 296  0106 cf001b        	ldw	L33_BkupBuzzExecTime+2,x
 297  0109 1e12          	ldw	x,(OFST-7,sp)
 298  010b cf0019        	ldw	L33_BkupBuzzExecTime,x
 299                     ; 286       BSP_BuzzerExec();
 300  010e cd0000        	call	_BSP_BuzzerExec
 302  0111               L37:
 303                     ; 289     if(ADC2_GetFlagStatus())
 304  0111 cd0000        	call	_ADC2_GetFlagStatus
 306  0114 4d            	tnz	a
 307  0115 2703          	jreq	L57
 308                     ; 291       BSP_AdcExec();
 309  0117 cd0000        	call	_BSP_AdcExec
 311  011a               L57:
 312                     ; 294     if((sysTime - BkupRetExecTime) >= RET_EXEC_MS)
 313  011a 96            	ldw	x,sp
 314  011b 1c0012        	addw	x,#OFST-7
 315  011e cd0000        	call	c_ltor
 317  0121 ae001d        	ldw	x,#L53_BkupRetExecTime
 318  0124 cd0000        	call	c_lsub
 320  0127 cd0000        	call	c_lrzmp
 322  012a 270d          	jreq	L77
 323                     ; 296       BkupRetExecTime = sysTime;
 324  012c 1e14          	ldw	x,(OFST-5,sp)
 325  012e cf001f        	ldw	L53_BkupRetExecTime+2,x
 326  0131 1e12          	ldw	x,(OFST-7,sp)
 327  0133 cf001d        	ldw	L53_BkupRetExecTime,x
 328                     ; 297       RET_Exec();
 329  0136 cd0000        	call	_RET_Exec
 331  0139               L77:
 332                     ; 300     if((sysTime - BkupSnrExecTime) >= SNR_EXEC_MS)
 333  0139 96            	ldw	x,sp
 334  013a 1c0012        	addw	x,#OFST-7
 335  013d cd0000        	call	c_ltor
 337  0140 ae0021        	ldw	x,#L73_BkupSnrExecTime
 338  0143 cd0000        	call	c_lsub
 340  0146 cd0000        	call	c_lrzmp
 342  0149 2603cc028a    	jreq	L101
 343                     ; 302       BkupSnrExecTime = sysTime;
 344  014e 1e14          	ldw	x,(OFST-5,sp)
 345  0150 cf0023        	ldw	L73_BkupSnrExecTime+2,x
 346  0153 1e12          	ldw	x,(OFST-7,sp)
 347  0155 cf0021        	ldw	L73_BkupSnrExecTime,x
 348                     ; 107   if(SensorExecState == SENSOR_EXEC_WAIT_COUNTING_EN)
 349  0158 c6000a        	ld	a,L5_SensorExecState
 350  015b 2647          	jrne	L301
 351                     ; 110     SensorExecState = (uint8_t)((FlagSensorEn == TRUE)?
 351                     ; 111                         (SENSOR_EXEC_EXECUTE_COUNTING):
 351                     ; 112                         (SensorExecState));
 352  015d c60004        	ld	a,_FlagSensorEn
 353  0160 4a            	dec	a
 354  0161 2603          	jrne	L27
 355  0163 4c            	inc	a
 356  0164 2003          	jra	L47
 357  0166               L27:
 358  0166 c6000a        	ld	a,L5_SensorExecState
 359  0169               L47:
 360  0169 c7000a        	ld	L5_SensorExecState,a
 361                     ; 113     if(FlagSensorEn == TRUE)
 362  016c c60004        	ld	a,_FlagSensorEn
 363  016f 4a            	dec	a
 364  0170 26d9          	jrne	L101
 365                     ; 115       uint32_t stampEnable = 0;
 366  0172 5f            	clrw	x
 367  0173 1f0f          	ldw	(OFST-10,sp),x
 368  0175 1f0d          	ldw	(OFST-12,sp),x
 369                     ; 116       REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
 370  0177 4b02          	push	#2
 371  0179 96            	ldw	x,sp
 372  017a 1c000e        	addw	x,#OFST-11
 373  017d cd0000        	call	_REG_GetValue
 375  0180 3501000a      	mov	L5_SensorExecState,#1
 376  0184 35320010      	mov	L31_WaitLastNoteCount,#50
 377  0188 5f            	clrw	x
 378  0189 cf0002        	ldw	_BspSensorCounter+2,x
 379  018c cf0000        	ldw	_BspSensorCounter,x
 380  018f 725f000b      	clr	L7_UvDetected
 381  0193 84            	pop	a
 382                     ; 118       SensorExecState = SENSOR_EXEC_EXECUTE_COUNTING;
 383                     ; 119       WaitLastNoteCount = WAIT_FOR_SENSOR_DISABLE_MS;
 384                     ; 120       BspSensorCounter = 0;
 385                     ; 121       UvDetected = FALSE;
 386                     ; 123       if(stampEnable == FALSE)
 387  0194 96            	ldw	x,sp
 388  0195 1c000d        	addw	x,#OFST-12
 389  0198 cd0000        	call	c_lzmp
 391  019b 26ae          	jrne	L101
 392                     ; 125         BSP_S_FanEnable(TRUE);
 393  019d 72195014      	bres	20500,#4
 394  01a1 cc028a        	jra	L101
 395  01a4               L301:
 396                     ; 131     uint32_t bspSensorCounter = (BspSensorCounter >> 1) + (BspSensorCounter & 0x1);
 397  01a4 ae0000        	ldw	x,#_BspSensorCounter
 398  01a7 cd0000        	call	c_ltor
 400  01aa b603          	ld	a,c_lreg+3
 401  01ac a401          	and	a,#1
 402  01ae b703          	ld	c_lreg+3,a
 403  01b0 3f02          	clr	c_lreg+2
 404  01b2 3f01          	clr	c_lreg+1
 405  01b4 3f00          	clr	c_lreg
 406  01b6 96            	ldw	x,sp
 407  01b7 5c            	incw	x
 408  01b8 cd0000        	call	c_rtol
 410  01bb ae0000        	ldw	x,#_BspSensorCounter
 411  01be cd0000        	call	c_ltor
 413  01c1 3400          	srl	c_lreg
 414  01c3 3601          	rrc	c_lreg+1
 415  01c5 3602          	rrc	c_lreg+2
 416  01c7 96            	ldw	x,sp
 417  01c8 3603          	rrc	c_lreg+3
 418  01ca 5c            	incw	x
 419  01cb cd0000        	call	c_ladd
 421  01ce 96            	ldw	x,sp
 422  01cf 1c000d        	addw	x,#OFST-12
 423  01d2 cd0000        	call	c_rtol
 425                     ; 133     WaitLastNoteCount = (uint8_t)((WaitLastNoteCount > 0) ? (WaitLastNoteCount - 1) : 0);
 426  01d5 c60010        	ld	a,L31_WaitLastNoteCount
 427  01d8 2701          	jreq	L001
 428  01da 4a            	dec	a
 429  01db               L001:
 430  01db c70010        	ld	L31_WaitLastNoteCount,a
 431                     ; 134     if(bspSensorCounter != BkupSensorCounter)
 432  01de 96            	ldw	x,sp
 433  01df cd02bb        	call	LC001
 434  01e2 cd0000        	call	c_lcmp
 436  01e5 272c          	jreq	L311
 437                     ; 136       UI_MSG_T msg = {0, UIMSG_COUNTER};
 438  01e7 c60034        	ld	a,L54_msg
 439  01ea 6b0b          	ld	(OFST-14,sp),a
 440  01ec c60035        	ld	a,L54_msg+1
 441  01ef 6b0c          	ld	(OFST-13,sp),a
 442                     ; 138       SensorCounter += (bspSensorCounter - BkupSensorCounter);
 443  01f1 96            	ldw	x,sp
 444  01f2 cd02bb        	call	LC001
 445  01f5 cd0000        	call	c_lsub
 447  01f8 ae0006        	ldw	x,#_SensorCounter
 448  01fb cd0000        	call	c_lgadd
 450                     ; 139       BkupSensorCounter = bspSensorCounter;
 451  01fe 1e0f          	ldw	x,(OFST-10,sp)
 452  0200 cf000e        	ldw	L11_BkupSensorCounter+2,x
 453  0203 1e0d          	ldw	x,(OFST-12,sp)
 454  0205 cf000c        	ldw	L11_BkupSensorCounter,x
 455                     ; 141       WaitLastNoteCount = WAIT_FOR_SENSOR_DISABLE_MS;
 456  0208 35320010      	mov	L31_WaitLastNoteCount,#50
 457                     ; 142       UI_PostMessage(&msg);
 458  020c 96            	ldw	x,sp
 459  020d 1c000b        	addw	x,#OFST-14
 460  0210 cd0000        	call	_UI_PostMessage
 462  0213               L311:
 463                     ; 145     if((FlagUvDetect == TRUE) && (UvDetected == FALSE))
 464  0213 c60003        	ld	a,_FlagUvDetect
 465  0216 4a            	dec	a
 466  0217 263c          	jrne	L511
 468  0219 c6000b        	ld	a,L7_UvDetected
 469  021c 2637          	jrne	L511
 470                     ; 358   return AdcValue;
 471  021e ce0000        	ldw	x,_AdcValue
 472  0221 1f07          	ldw	(OFST-18,sp),x
 475                     ; 148       uint32_t uvThresValue = 0;
 476  0223 5f            	clrw	x
 477  0224 1f0b          	ldw	(OFST-14,sp),x
 478  0226 1f09          	ldw	(OFST-16,sp),x
 479                     ; 149       REG_GetValue(&uvThresValue, REG_ID_UV_LVL);
 480  0228 4b11          	push	#17
 481  022a 96            	ldw	x,sp
 482  022b 1c000a        	addw	x,#OFST-15
 483  022e cd0000        	call	_REG_GetValue
 485  0231 84            	pop	a
 486                     ; 151       if(adcValue > uvThresValue)
 487  0232 1e07          	ldw	x,(OFST-18,sp)
 488  0234 cd0000        	call	c_uitolx
 490  0237 96            	ldw	x,sp
 491  0238 1c0009        	addw	x,#OFST-16
 492  023b cd0000        	call	c_lcmp
 494  023e 2315          	jrule	L511
 495                     ; 153         UI_MSG_T msg = {0, UIMSG_UVDETECT};
 496  0240 c60036        	ld	a,L74_msg
 497  0243 6b05          	ld	(OFST-20,sp),a
 498  0245 c60037        	ld	a,L74_msg+1
 499  0248 6b06          	ld	(OFST-19,sp),a
 500                     ; 155         UvDetected = TRUE;
 501  024a 3501000b      	mov	L7_UvDetected,#1
 502                     ; 158         UI_PostMessage(&msg);
 503  024e 96            	ldw	x,sp
 504  024f 1c0005        	addw	x,#OFST-20
 505  0252 cd0000        	call	_UI_PostMessage
 507  0255               L511:
 508                     ; 162     if((FlagSensorEn == FALSE) && (WaitLastNoteCount == 0))
 509  0255 c60004        	ld	a,_FlagSensorEn
 510  0258 2630          	jrne	L101
 512  025a c60010        	ld	a,L31_WaitLastNoteCount
 513  025d 262b          	jrne	L101
 514                     ; 164       uint32_t stampEnable = 0;
 515  025f 5f            	clrw	x
 516  0260 1f0b          	ldw	(OFST-14,sp),x
 517  0262 1f09          	ldw	(OFST-16,sp),x
 518                     ; 165       REG_GetValue(&stampEnable, REG_ID_STAMP_EN_FLAG);
 519  0264 4b02          	push	#2
 520  0266 96            	ldw	x,sp
 521  0267 1c000a        	addw	x,#OFST-15
 522  026a cd0000        	call	_REG_GetValue
 524  026d 725f000a      	clr	L5_SensorExecState
 525  0271 5f            	clrw	x
 526  0272 cf000e        	ldw	L11_BkupSensorCounter+2,x
 527  0275 cf000c        	ldw	L11_BkupSensorCounter,x
 528  0278 725f000b      	clr	L7_UvDetected
 529  027c 84            	pop	a
 530                     ; 167       SensorExecState = SENSOR_EXEC_WAIT_COUNTING_EN;
 531                     ; 168       BkupSensorCounter = 0;
 532                     ; 169       UvDetected = FALSE;
 533                     ; 171       if(stampEnable == FALSE)
 534  027d 96            	ldw	x,sp
 535  027e 1c0009        	addw	x,#OFST-16
 536  0281 cd0000        	call	c_lzmp
 538  0284 2604          	jrne	L101
 539                     ; 173         BSP_S_FanEnable(FALSE);
 540  0286 72185014      	bset	20500,#4
 541  028a               L101:
 542                     ; 306     if((sysTime - BkupUiExecTime) >= UI_EXEC_MS)
 543  028a 96            	ldw	x,sp
 544  028b 1c0012        	addw	x,#OFST-7
 545  028e cd0000        	call	c_ltor
 547  0291 ae0025        	ldw	x,#L14_BkupUiExecTime
 548  0294 cd0000        	call	c_lsub
 550  0297 ae003c        	ldw	x,#L411
 551  029a cd0000        	call	c_lcmp
 553  029d 250d          	jrult	L521
 554                     ; 308       BkupUiExecTime = sysTime;
 555  029f 1e14          	ldw	x,(OFST-5,sp)
 556  02a1 cf0027        	ldw	L14_BkupUiExecTime+2,x
 557  02a4 1e12          	ldw	x,(OFST-7,sp)
 558  02a6 cf0025        	ldw	L14_BkupUiExecTime,x
 559                     ; 309       UI_Exec();
 560  02a9 cd0000        	call	_UI_Exec
 562  02ac               L521:
 563                     ; 312     if(UI_GetNbOfMsgUnProcessed())
 564  02ac cd0000        	call	_UI_GetNbOfMsgUnProcessed
 566  02af 4d            	tnz	a
 567  02b0 2603cc009a    	jreq	L16
 568                     ; 314       UI_ProcessMsg();
 569  02b5 cd0000        	call	_UI_ProcessMsg
 571  02b8 cc009a        	jra	L16
 572  02bb               LC001:
 573  02bb 1c000d        	addw	x,#OFST-12
 574  02be cd0000        	call	c_ltor
 576  02c1 ae000c        	ldw	x,#L11_BkupSensorCounter
 577  02c4 81            	ret	
 579                     	xref	_disp_test
 580                     ; 324 int main1(void)
 580                     ; 325 {
 581  02c5               _main1:
 583                     ; 327   disp_test();
 585                     ; 328 }
 586  02c5 cc0000        	jp	_disp_test
 588                     ; 334 PUTCHAR_PROTOTYPE
 588                     ; 335 {
 589  02c8               _putchar:
 590  02c8 88            	push	a
 591       00000000      OFST:	set	0
 593                     ; 337   UART1_SendData8(c);
 594  02c9 cd0000        	call	_UART1_SendData8
 597  02cc               L331:
 598                     ; 339   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 599  02cc ae0080        	ldw	x,#128
 600  02cf cd0000        	call	_UART1_GetFlagStatus
 602  02d2 4d            	tnz	a
 603  02d3 27f7          	jreq	L331
 604                     ; 341   return (c);
 605  02d5 7b01          	ld	a,(OFST+1,sp)
 607  02d7 5b01          	addw	sp,#1
 608  02d9 81            	ret	
 610                     ; 349 GETCHAR_PROTOTYPE
 610                     ; 350 {
 611  02da               _getchar:
 612  02da 88            	push	a
 613       00000001      OFST:	set	1
 615                     ; 352   char c = 0;
 617  02db               L141:
 618                     ; 357   while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 619  02db ae0020        	ldw	x,#32
 620  02de cd0000        	call	_UART1_GetFlagStatus
 622  02e1 4d            	tnz	a
 623  02e2 27f7          	jreq	L141
 624                     ; 358     c = UART1_ReceiveData8();
 625  02e4 cd0000        	call	_UART1_ReceiveData8
 627                     ; 359   return (c);
 629  02e7 5b01          	addw	sp,#1
 630  02e9 81            	ret	
 632                     ; 371 void assert_failed(uint8_t* file, uint32_t line)
 632                     ; 372 { 
 633  02ea               _assert_failed:
 635  02ea               L541:
 636  02ea 20fe          	jra	L541
 638                     	xdef	_main1
 639                     	xdef	_main
 640                     	xdef	_DisplayKeypadInit
 641                     	xref	_UI_SwCallBack
 642                     	xref	_UI_KeyCallBack
 643                     	xref	_UI_ProcessMsg
 644                     	xref	_UI_Exec
 645                     	xref	_UI_GetNbOfMsgUnProcessed
 646                     	xref	_UI_PostMessage
 647                     	xref	_UI_Init
 648                     	xref	_EE_Init
 649                     	xref	_TURR_Exec
 650                     	xref	_TURR_Clear
 651                     	xref	_TurretExecute
 652                     	xref	_SW_Scan
 653                     	xref	_SW_Init
 654                     	xref	_KPD_Scan
 655                     	xref	_KPD_Init
 656                     	xref	_DISP_Exec
 657                     	xref	_DISP_Init
 658                     	xref	_REG_GetValue
 659                     	xref	_REG_Init
 660                     	xref	_RET_Exec
 661                     	xref	_RET_UpdateFlash
 662                     	xref	_RET_Init
 663                     	xdef	_absolute
 664                     	xdef	_SensorCounter
 665                     	xdef	_CounterMode
 666                     	xdef	_FlagSensorEn
 667                     	xdef	_FlagUvDetect
 668                     	xdef	_FlagAddCount
 669                     	xdef	_FlagAutoCount
 670                     	xdef	_FlagValueCount
 671                     	xref	_BSP_AdcExec
 672                     	xref	_BSP_BuzzerExec
 673                     	xref	_BSP_Init
 674                     	xref	_SystemTimer
 675                     	xref	_AdcValue
 676                     	xref	_BuzzerOnTime
 677                     	xdef	_assert_failed
 678                     	xref	_UART1_GetFlagStatus
 679                     	xref	_UART1_SendData8
 680                     	xref	_UART1_ReceiveData8
 681                     	xref	_ADC2_GetFlagStatus
 682                     	xdef	_putchar
 683                     	xref	_printf
 684                     	xdef	_getchar
 685                     	switch	.const
 686  0040               L12:
 687  0040 0a0d44697020  	dc.b	10,13,68,105,112,32
 688  0046 3d20257500    	dc.b	"= %u",0
 689                     	xref.b	c_lreg
 690                     	xref	c_uitolx
 691                     	xref	c_lgadd
 692                     	xref	c_ladd
 693                     	xref	c_rtol
 694                     	xref	c_lzmp
 695                     	xref	c_lrzmp
 696                     	xref	c_lsub
 697                     	xref	c_lcmp
 698                     	xref	c_lneg
 699                     	xref	c_ltor
 700                     	end
