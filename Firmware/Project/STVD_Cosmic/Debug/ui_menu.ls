   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               _MENU_MAIN_CHILD_INFO:
  22  0000 00b8          	dc.w	L3
  23  0002 01            	dc.b	1
  24  0003 01            	dc.b	1
  25  0004 00b2          	dc.w	L5
  26  0006 01            	dc.b	1
  27  0007 00            	dc.b	0
  28  0008 00aa          	dc.w	L7
  29  000a 02            	dc.b	2
  30  000b 01            	dc.b	1
  31  000c 00a4          	dc.w	L11
  32  000e 03            	dc.b	3
  33  000f 01            	dc.b	1
  34  0010 009e          	dc.w	L31
  35  0012 04            	dc.b	4
  36  0013 01            	dc.b	1
  37  0014 0098          	dc.w	L51
  38  0016 05            	dc.b	5
  39  0017 01            	dc.b	1
  40  0018 0095          	dc.w	L71
  41  001a 06            	dc.b	6
  42  001b 01            	dc.b	1
  43  001c               _MENU_MANL_CHILD_INFO:
  44  001c 008f          	dc.w	L12
  45  001e 02            	dc.b	2
  46  001f 00            	dc.b	0
  47  0020 008a          	dc.w	L32
  48  0022 03            	dc.b	3
  49  0023 00            	dc.b	0
  50  0024 0084          	dc.w	L52
  51  0026 07            	dc.b	7
  52  0027 01            	dc.b	1
  53  0028 007e          	dc.w	L72
  54  002a 04            	dc.b	4
  55  002b 00            	dc.b	0
  56  002c 007a          	dc.w	L13
  57  002e 08            	dc.b	8
  58  002f 01            	dc.b	1
  59  0030               _MENU_MOTOR_CHILD_INFO:
  60  0030 0075          	dc.w	L33
  61  0032 09            	dc.b	9
  62  0033 01            	dc.b	1
  63  0034 006f          	dc.w	L53
  64  0036 0a            	dc.b	10
  65  0037 01            	dc.b	1
  66  0038 0069          	dc.w	L73
  67  003a 0b            	dc.b	11
  68  003b 01            	dc.b	1
  69  003c               _MENU_COIL_CHILD_INFO:
  70  003c 0063          	dc.w	L14
  71  003e 0c            	dc.b	12
  72  003f 01            	dc.b	1
  73  0040 005d          	dc.w	L34
  74  0042 0d            	dc.b	13
  75  0043 01            	dc.b	1
  76  0044               _MENU_SWTCH_CHILD_INFO:
  77  0044 0057          	dc.w	L54
  78  0046 0e            	dc.b	14
  79  0047 01            	dc.b	1
  80  0048 0051          	dc.w	L74
  81  004a 0f            	dc.b	15
  82  004b 01            	dc.b	1
  83                     	switch	.data
  84  0000               _UI_MENU_CHILD_INFO_LIST:
  85  0000 0000          	dc.w	_MENU_MAIN_CHILD_INFO
  86  0002 001c          	dc.w	_MENU_MANL_CHILD_INFO
  87  0004 0030          	dc.w	_MENU_MOTOR_CHILD_INFO
  88  0006 003c          	dc.w	_MENU_COIL_CHILD_INFO
  89  0008 0044          	dc.w	_MENU_SWTCH_CHILD_INFO
  90                     	switch	.const
  91  004c               _UI_MENU_NB_CHILD_LIST:
  92  004c 07            	dc.b	7
  93  004d 05            	dc.b	5
  94  004e 03            	dc.b	3
  95  004f 02            	dc.b	2
  96  0050 02            	dc.b	2
  97                     	switch	.data
  98  000a               L36_MENU_CHILD_STATUS_LIST:
  99  000a 000c          	dc.w	L15_MenuMainChildStatus
 100  000c 0007          	dc.w	L35_MenuManlChildStatus
 101  000e 0004          	dc.w	L55_MenuMotorChildStatus
 102  0010 0002          	dc.w	L75_MenuCoilChildStatus
 103  0012 0000          	dc.w	L16_MenuSwtchChildStatus
 104                     ; 388 void UI_SetMenuEnableFlag(uint8_t menuId, uint8_t childNo, uint8_t en)
 104                     ; 389 {
 105                     	scross	off
 106                     	switch	.text
 107  0000               _UI_SetMenuEnableFlag:
 108  0000 89            	pushw	x
 109  0001 89            	pushw	x
 110       00000002      OFST:	set	2
 112                     ; 390   if(menuId < UI_MENU_MAX_ITEM)
 113  0002 9e            	ld	a,xh
 114  0003 a105          	cp	a,#5
 115  0005 2422          	jruge	L56
 116                     ; 392     uint8_t *pMenuChildStatus = (uint8_t *)MENU_CHILD_STATUS_LIST[menuId];
 117  0007 9e            	ld	a,xh
 118  0008 5f            	clrw	x
 119  0009 97            	ld	xl,a
 120  000a 58            	sllw	x
 121  000b de000a        	ldw	x,(L36_MENU_CHILD_STATUS_LIST,x)
 122  000e 1f01          	ldw	(OFST-1,sp),x
 123                     ; 394     if(childNo < UI_MENU_NB_CHILD_LIST[menuId])
 124  0010 5f            	clrw	x
 125  0011 7b03          	ld	a,(OFST+1,sp)
 126  0013 97            	ld	xl,a
 127  0014 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 128  0017 1104          	cp	a,(OFST+2,sp)
 129  0019 230e          	jrule	L56
 130                     ; 396       pMenuChildStatus[childNo] = en;
 131  001b 7b01          	ld	a,(OFST-1,sp)
 132  001d 97            	ld	xl,a
 133  001e 7b02          	ld	a,(OFST+0,sp)
 134  0020 1b04          	add	a,(OFST+2,sp)
 135  0022 2401          	jrnc	L4
 136  0024 5c            	incw	x
 137  0025               L4:
 138  0025 02            	rlwa	x,a
 139  0026 7b07          	ld	a,(OFST+5,sp)
 140  0028 f7            	ld	(x),a
 141  0029               L56:
 142                     ; 399 }
 143  0029 5b04          	addw	sp,#4
 144  002b 81            	ret	
 146                     ; 407 uint8_t UI_GetMenuEnableFlag(uint8_t menuId, uint8_t childNo)
 146                     ; 408 {
 147  002c               _UI_GetMenuEnableFlag:
 148  002c 89            	pushw	x
 149  002d 89            	pushw	x
 150       00000002      OFST:	set	2
 152                     ; 409   if(menuId < UI_MENU_MAX_ITEM)
 153  002e 9e            	ld	a,xh
 154  002f a105          	cp	a,#5
 155  0031 2422          	jruge	L17
 156                     ; 411     uint8_t *pMenuChildStatus = (uint8_t *)MENU_CHILD_STATUS_LIST[menuId];
 157  0033 9e            	ld	a,xh
 158  0034 5f            	clrw	x
 159  0035 97            	ld	xl,a
 160  0036 58            	sllw	x
 161  0037 de000a        	ldw	x,(L36_MENU_CHILD_STATUS_LIST,x)
 162  003a 1f01          	ldw	(OFST-1,sp),x
 163                     ; 413     if(childNo < UI_MENU_NB_CHILD_LIST[menuId])
 164  003c 5f            	clrw	x
 165  003d 7b03          	ld	a,(OFST+1,sp)
 166  003f 97            	ld	xl,a
 167  0040 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 168  0043 1104          	cp	a,(OFST+2,sp)
 169  0045 230e          	jrule	L17
 170                     ; 415       return pMenuChildStatus[childNo];
 171  0047 7b01          	ld	a,(OFST-1,sp)
 172  0049 97            	ld	xl,a
 173  004a 7b02          	ld	a,(OFST+0,sp)
 174  004c 1b04          	add	a,(OFST+2,sp)
 175  004e 2401          	jrnc	L01
 176  0050 5c            	incw	x
 177  0051               L01:
 178  0051 02            	rlwa	x,a
 179  0052 f6            	ld	a,(x)
 181  0053 2001          	jra	L21
 182  0055               L17:
 183                     ; 419   return UI_DISABLED;
 184  0055 4f            	clr	a
 186  0056               L21:
 187  0056 5b04          	addw	sp,#4
 188  0058 81            	ret	
 190                     ; 427 uint8_t UI_GetMenuNbEnabledChild(uint8_t menuId)
 190                     ; 428 {
 191  0059               _UI_GetMenuNbEnabledChild:
 192  0059 88            	push	a
 193  005a 5205          	subw	sp,#5
 194       00000005      OFST:	set	5
 196                     ; 429   uint8_t  *pMenuChildStatus = (uint8_t *)MENU_CHILD_STATUS_LIST[menuId];
 197  005c 5f            	clrw	x
 198  005d 97            	ld	xl,a
 199  005e 58            	sllw	x
 200  005f de000a        	ldw	x,(L36_MENU_CHILD_STATUS_LIST,x)
 201  0062 1f01          	ldw	(OFST-4,sp),x
 202                     ; 432   totalChildCnt = UI_MENU_NB_CHILD_LIST[menuId];
 203  0064 5f            	clrw	x
 204  0065 7b06          	ld	a,(OFST+1,sp)
 205  0067 97            	ld	xl,a
 206  0068 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 207  006b 6b03          	ld	(OFST-2,sp),a
 208                     ; 433   enabledChildCnt = 0;
 209  006d 0f04          	clr	(OFST-1,sp)
 210                     ; 435   for(cnt = 0; cnt < totalChildCnt; cnt++)
 211  006f 0f05          	clr	(OFST+0,sp)
 213  0071 2013          	jra	L101
 214  0073               L57:
 215                     ; 437     if(pMenuChildStatus[cnt] == UI_ENABLED)
 216  0073 7b01          	ld	a,(OFST-4,sp)
 217  0075 97            	ld	xl,a
 218  0076 7b02          	ld	a,(OFST-3,sp)
 219  0078 1b05          	add	a,(OFST+0,sp)
 220  007a 2401          	jrnc	L61
 221  007c 5c            	incw	x
 222  007d               L61:
 223  007d 02            	rlwa	x,a
 224  007e f6            	ld	a,(x)
 225  007f 4a            	dec	a
 226  0080 2602          	jrne	L501
 227                     ; 439       enabledChildCnt++;
 228  0082 0c04          	inc	(OFST-1,sp)
 229  0084               L501:
 230                     ; 435   for(cnt = 0; cnt < totalChildCnt; cnt++)
 231  0084 0c05          	inc	(OFST+0,sp)
 232  0086               L101:
 234  0086 7b05          	ld	a,(OFST+0,sp)
 235  0088 1103          	cp	a,(OFST-2,sp)
 236  008a 25e7          	jrult	L57
 237                     ; 443   return enabledChildCnt;
 238  008c 7b04          	ld	a,(OFST-1,sp)
 240  008e 5b06          	addw	sp,#6
 241  0090 81            	ret	
 243                     ; 451 uint8_t UI_GetMenuNbTotalChild(uint8_t menuId)
 243                     ; 452 {
 244  0091               _UI_GetMenuNbTotalChild:
 246                     ; 453   return UI_MENU_NB_CHILD_LIST[menuId];
 247  0091 5f            	clrw	x
 248  0092 97            	ld	xl,a
 249  0093 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 251  0096 81            	ret	
 253                     ; 462 UI_MENU_INFO_T *UI_GetMenuChildInfo(uint8_t menuId, uint8_t childNo)
 253                     ; 463 {
 254  0097               _UI_GetMenuChildInfo:
 255  0097 89            	pushw	x
 256  0098 5207          	subw	sp,#7
 257       00000007      OFST:	set	7
 259                     ; 464   UI_MENU_INFO_T *pChild = 0;
 260  009a 5f            	clrw	x
 261  009b 1f04          	ldw	(OFST-3,sp),x
 262                     ; 465   uint8_t *pMenuChildStatus = (uint8_t *)MENU_CHILD_STATUS_LIST[menuId];
 263  009d 7b08          	ld	a,(OFST+1,sp)
 264  009f 97            	ld	xl,a
 265  00a0 58            	sllw	x
 266  00a1 de000a        	ldw	x,(L36_MENU_CHILD_STATUS_LIST,x)
 267  00a4 1f01          	ldw	(OFST-6,sp),x
 268                     ; 468   totalChildCnt = UI_MENU_NB_CHILD_LIST[menuId];
 269  00a6 5f            	clrw	x
 270  00a7 97            	ld	xl,a
 271  00a8 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 272  00ab 6b03          	ld	(OFST-4,sp),a
 273                     ; 469   enabledChildCnt = 0;
 274  00ad 0f06          	clr	(OFST-1,sp)
 275                     ; 471   for(cnt = 0; cnt < totalChildCnt; cnt++)
 276  00af 0f07          	clr	(OFST+0,sp)
 278  00b1 202f          	jra	L311
 279  00b3               L701:
 280                     ; 473     if(pMenuChildStatus[cnt] == UI_ENABLED)
 281  00b3 7b01          	ld	a,(OFST-6,sp)
 282  00b5 97            	ld	xl,a
 283  00b6 7b02          	ld	a,(OFST-5,sp)
 284  00b8 1b07          	add	a,(OFST+0,sp)
 285  00ba 2401          	jrnc	L42
 286  00bc 5c            	incw	x
 287  00bd               L42:
 288  00bd 02            	rlwa	x,a
 289  00be f6            	ld	a,(x)
 290  00bf 4a            	dec	a
 291  00c0 261e          	jrne	L711
 292                     ; 475       if(enabledChildCnt == childNo)
 293  00c2 7b06          	ld	a,(OFST-1,sp)
 294  00c4 1109          	cp	a,(OFST+2,sp)
 295  00c6 2616          	jrne	L121
 296                     ; 477         pChild = (UI_MENU_INFO_T *)UI_MENU_CHILD_INFO_LIST[menuId];
 297  00c8 7b08          	ld	a,(OFST+1,sp)
 298  00ca 5f            	clrw	x
 299  00cb 97            	ld	xl,a
 300  00cc 58            	sllw	x
 301  00cd de0000        	ldw	x,(_UI_MENU_CHILD_INFO_LIST,x)
 302  00d0 1f04          	ldw	(OFST-3,sp),x
 303                     ; 478         break;
 304  00d2 7b07          	ld	a,(OFST+0,sp)
 305  00d4               L511:
 306                     ; 485   return &pChild[cnt];
 307  00d4 97            	ld	xl,a
 308  00d5 a604          	ld	a,#4
 309  00d7 42            	mul	x,a
 310  00d8 72fb04        	addw	x,(OFST-3,sp)
 312  00db 5b09          	addw	sp,#9
 313  00dd 81            	ret	
 314  00de               L121:
 315                     ; 481       enabledChildCnt++;
 316  00de 0c06          	inc	(OFST-1,sp)
 317  00e0               L711:
 318                     ; 471   for(cnt = 0; cnt < totalChildCnt; cnt++)
 319  00e0 0c07          	inc	(OFST+0,sp)
 320  00e2               L311:
 322  00e2 7b07          	ld	a,(OFST+0,sp)
 323  00e4 1103          	cp	a,(OFST-4,sp)
 324  00e6 25cb          	jrult	L701
 325  00e8 20ea          	jra	L511
 327                     ; 493 void UI_UpdateMenu(void)
 327                     ; 494 {
 328  00ea               _UI_UpdateMenu:
 329  00ea 5206          	subw	sp,#6
 330       00000006      OFST:	set	6
 332                     ; 497   UI_GetContext(&context);
 333  00ec 96            	ldw	x,sp
 334  00ed 1c0003        	addw	x,#OFST-3
 335  00f0 cd0000        	call	_UI_GetContext
 337                     ; 499   if(context.type == UI_TYPE_MENU)
 338  00f3 7b06          	ld	a,(OFST+0,sp)
 339  00f5 2616          	jrne	L321
 340                     ; 501     UI_MENU_INFO_T *pChild =
 340                     ; 502       (UI_MENU_INFO_T *)UI_GetMenuChildInfo(context.menu, context.child);
 341  00f7 7b05          	ld	a,(OFST-1,sp)
 342  00f9 97            	ld	xl,a
 343  00fa 7b03          	ld	a,(OFST-3,sp)
 344  00fc 95            	ld	xh,a
 345  00fd ad98          	call	_UI_GetMenuChildInfo
 347  00ff 1f01          	ldw	(OFST-5,sp),x
 348                     ; 505     DISP_ClearAll();
 349  0101 cd0000        	call	_DISP_ClearAll
 351                     ; 506     DISP_UpperPutStr((char *)pChild->pString, 0);
 352  0104 4b00          	push	#0
 353  0106 1e02          	ldw	x,(OFST-4,sp)
 354  0108 fe            	ldw	x,(x)
 355  0109 cd0000        	call	_DISP_UpperPutStr
 357  010c 84            	pop	a
 358  010d               L321:
 359                     ; 508 }
 360  010d 5b06          	addw	sp,#6
 361  010f 81            	ret	
 363                     ; 515 void UI_MenuInit(void)
 363                     ; 516 {
 364  0110               _UI_MenuInit:
 365  0110 5204          	subw	sp,#4
 366       00000004      OFST:	set	4
 368                     ; 519   for(menuCnt = 0; menuCnt < UI_MENU_MAX_ITEM; menuCnt++)
 369  0112 4f            	clr	a
 370  0113 6b03          	ld	(OFST-1,sp),a
 371  0115               L521:
 372                     ; 521     uint8_t *pMenuChildStatus = (uint8_t *)MENU_CHILD_STATUS_LIST[menuCnt];
 373  0115 5f            	clrw	x
 374  0116 97            	ld	xl,a
 375  0117 58            	sllw	x
 376  0118 de000a        	ldw	x,(L36_MENU_CHILD_STATUS_LIST,x)
 377  011b 1f01          	ldw	(OFST-3,sp),x
 378                     ; 523     for(childCnt = 0; childCnt < UI_MENU_NB_CHILD_LIST[menuCnt]; childCnt++)
 379  011d 0f04          	clr	(OFST+0,sp)
 381  011f 2010          	jra	L731
 382  0121               L331:
 383                     ; 525       pMenuChildStatus[childCnt] = UI_ENABLED;
 384  0121 7b01          	ld	a,(OFST-3,sp)
 385  0123 97            	ld	xl,a
 386  0124 7b02          	ld	a,(OFST-2,sp)
 387  0126 1b04          	add	a,(OFST+0,sp)
 388  0128 2401          	jrnc	L24
 389  012a 5c            	incw	x
 390  012b               L24:
 391  012b 02            	rlwa	x,a
 392  012c a601          	ld	a,#1
 393  012e f7            	ld	(x),a
 394                     ; 523     for(childCnt = 0; childCnt < UI_MENU_NB_CHILD_LIST[menuCnt]; childCnt++)
 395  012f 0c04          	inc	(OFST+0,sp)
 396  0131               L731:
 398  0131 7b03          	ld	a,(OFST-1,sp)
 399  0133 5f            	clrw	x
 400  0134 97            	ld	xl,a
 401  0135 d6004c        	ld	a,(_UI_MENU_NB_CHILD_LIST,x)
 402  0138 1104          	cp	a,(OFST+0,sp)
 403  013a 22e5          	jrugt	L331
 404                     ; 519   for(menuCnt = 0; menuCnt < UI_MENU_MAX_ITEM; menuCnt++)
 405  013c 0c03          	inc	(OFST-1,sp)
 407  013e 7b03          	ld	a,(OFST-1,sp)
 408  0140 a105          	cp	a,#5
 409  0142 25d1          	jrult	L521
 410                     ; 528 }
 411  0144 5b04          	addw	sp,#4
 412  0146 81            	ret	
 414                     	switch	.bss
 415  0000               L16_MenuSwtchChildStatus:
 416  0000 0000          	ds.b	2
 417  0002               L75_MenuCoilChildStatus:
 418  0002 0000          	ds.b	2
 419  0004               L55_MenuMotorChildStatus:
 420  0004 000000        	ds.b	3
 421  0007               L35_MenuManlChildStatus:
 422  0007 0000000000    	ds.b	5
 423  000c               L15_MenuMainChildStatus:
 424  000c 000000000000  	ds.b	7
 425                     	xdef	_UI_MENU_NB_CHILD_LIST
 426                     	xdef	_UI_MENU_CHILD_INFO_LIST
 427                     	xdef	_MENU_SWTCH_CHILD_INFO
 428                     	xdef	_MENU_COIL_CHILD_INFO
 429                     	xdef	_MENU_MOTOR_CHILD_INFO
 430                     	xdef	_MENU_MANL_CHILD_INFO
 431                     	xdef	_MENU_MAIN_CHILD_INFO
 432                     	xdef	_UI_MenuInit
 433                     	xdef	_UI_UpdateMenu
 434                     	xdef	_UI_GetMenuChildInfo
 435                     	xdef	_UI_GetMenuNbTotalChild
 436                     	xdef	_UI_GetMenuNbEnabledChild
 437                     	xdef	_UI_GetMenuEnableFlag
 438                     	xdef	_UI_SetMenuEnableFlag
 439                     	xref	_UI_GetContext
 440                     	xref	_TurretExecute
 441                     	xref	_DISP_ClearAll
 442                     	xref	_DISP_UpperPutStr
 443                     	xref	_SensorCounter
 444                     	xref	_CounterMode
 445                     	xref	_FlagSensorEn
 446                     	xref	_FlagUvDetect
 447                     	xref	_FlagAddCount
 448                     	xref	_FlagAutoCount
 449                     	xref	_FlagValueCount
 450                     	xref	_SystemTimer
 451                     	xref	_AdcValue
 452                     	xref	_BuzzerOnTime
 453                     	switch	.const
 454  0051               L74:
 455  0051 492d53575400  	dc.b	"I-SWT",0
 456  0057               L54:
 457  0057 482d53575400  	dc.b	"H-SWT",0
 458  005d               L34:
 459  005d 53434f494c00  	dc.b	"SCOIL",0
 460  0063               L14:
 461  0063 42434f494c00  	dc.b	"BCOIL",0
 462  0069               L73:
 463  0069 53504e444c00  	dc.b	"SPNDL",0
 464  006f               L53:
 465  006f 484f50505200  	dc.b	"HOPPR",0
 466  0075               L33:
 467  0075 50554d5000    	dc.b	"PUMP",0
 468  007a               L13:
 469  007a 53454700      	dc.b	"SEG",0
 470  007e               L72:
 471  007e 535754434800  	dc.b	"SWTCH",0
 472  0084               L52:
 473  0084 4b2d42524400  	dc.b	"K-BRD",0
 474  008a               L32:
 475  008a 434f494c00    	dc.b	"COIL",0
 476  008f               L12:
 477  008f 4d4f544f5200  	dc.b	"MOTOR",0
 478  0095               L71:
 479  0095 555600        	dc.b	"UV",0
 480  0098               L51:
 481  0098 555653455400  	dc.b	"UVSET",0
 482  009e               L31:
 483  009e 5354414d5000  	dc.b	"STAMP",0
 484  00a4               L11:
 485  00a4 434e544c4700  	dc.b	"CNTLG",0
 486  00aa               L7:
 487  00aa 5345544d4f44  	dc.b	"SETMODE",0
 488  00b2               L5:
 489  00b2 4d414e554c00  	dc.b	"MANUL",0
 490  00b8               L3:
 491  00b8 4155544f00    	dc.b	"AUTO",0
 492                     	end
