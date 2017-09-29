   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_SW_GPIO_PORT:
  22  0000 500a          	dc.w	20490
  23  0002 5014          	dc.w	20500
  24  0004 5014          	dc.w	20500
  25                     .const:	section	.text
  26  0000               L5_SW_GPIO_PIN:
  27  0000 0008          	dc.w	8
  28  0002 0040          	dc.w	64
  29  0004 0080          	dc.w	128
  30                     	switch	.data
  31  0006               L11_DebounceTime:
  32  0006 00            	dc.b	0
  33                     ; 124 void SW_Init(uint8_t debounce, void (* cb)(uint8_t, uint8_t))
  33                     ; 125 {
  34                     	scross	off
  35                     	switch	.text
  36  0000               _SW_Init:
  37  0000 88            	push	a
  38  0001 88            	push	a
  39       00000001      OFST:	set	1
  41                     ; 58   GPIO_Init(SW_RST_GPIO_PORT, SW_RST_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  42  0002 4b40          	push	#64
  43  0004 4b08          	push	#8
  44  0006 ae500a        	ldw	x,#20490
  45  0009 cd0000        	call	_GPIO_Init
  47  000c 85            	popw	x
  48                     ; 62 	GPIO_Init(SW_CAM_GPIO_PORT, SW_CAM_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  49  000d 4b40          	push	#64
  50  000f 4b40          	push	#64
  51  0011 ae5014        	ldw	x,#20500
  52  0014 cd0000        	call	_GPIO_Init
  54  0017 85            	popw	x
  55                     ; 66   GPIO_Init(SW_AUTO_GPIO_PORT, SW_AUTO_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
  56  0018 4b40          	push	#64
  57  001a 4b80          	push	#128
  58  001c ae5014        	ldw	x,#20500
  59  001f cd0000        	call	_GPIO_Init
  61  0022 85            	popw	x
  62                     ; 130   DebounceTime = (debounce < 1) ? (1) : (debounce);
  63  0023 7b02          	ld	a,(OFST+1,sp)
  64  0025 2601          	jrne	L21
  65  0027 4c            	inc	a
  66  0028               L21:
  67  0028 c70006        	ld	L11_DebounceTime,a
  68                     ; 131   SwitchCB = cb;
  69  002b 1e05          	ldw	x,(OFST+4,sp)
  70  002d cf0000        	ldw	L31_SwitchCB,x
  71                     ; 133   for(swNo = 0; swNo < SW_MAX; swNo++)
  72  0030 4f            	clr	a
  73  0031 6b01          	ld	(OFST+0,sp),a
  74  0033               L32:
  75                     ; 135     SwInfo[swNo].state = SW_STATE_IDLE;
  76  0033 97            	ld	xl,a
  77  0034 a607          	ld	a,#7
  78  0036 42            	mul	x,a
  79                     ; 136     SwInfo[swNo].press = OPEN;
  80  0037 724f0003      	clr	(L7_SwInfo+1,x)
  81  003b 724f0002      	clr	(L7_SwInfo,x)
  82                     ; 137     SwInfo[swNo].debounce = FALSE;
  83  003f 724f0004      	clr	(L7_SwInfo+2,x)
  84                     ; 138     SwInfo[swNo].backuptime = 0;
  85  0043 4f            	clr	a
  86  0044 d70008        	ld	(L7_SwInfo+6,x),a
  87  0047 d70007        	ld	(L7_SwInfo+5,x),a
  88  004a d70006        	ld	(L7_SwInfo+4,x),a
  89  004d d70005        	ld	(L7_SwInfo+3,x),a
  90                     ; 133   for(swNo = 0; swNo < SW_MAX; swNo++)
  91  0050 0c01          	inc	(OFST+0,sp)
  93  0052 7b01          	ld	a,(OFST+0,sp)
  94  0054 a103          	cp	a,#3
  95  0056 25db          	jrult	L32
  96                     ; 140 }
  97  0058 85            	popw	x
  98  0059 81            	ret	
 100                     ; 149 void SW_Scan(void)
 100                     ; 150 {
 101  005a               _SW_Scan:
 102  005a 5209          	subw	sp,#9
 103       00000009      OFST:	set	9
 105                     ; 151   uint8_t swNo = 0;
 106                     ; 328   return SystemTimer;
 107  005c ce0002        	ldw	x,_SystemTimer+2
 108  005f 1f07          	ldw	(OFST-2,sp),x
 109  0061 ce0000        	ldw	x,_SystemTimer
 110  0064 1f05          	ldw	(OFST-4,sp),x
 113                     ; 155   for(swNo = 0; swNo < SW_MAX; swNo++)
 114  0066 4f            	clr	a
 115  0067 6b09          	ld	(OFST+0,sp),a
 116  0069               L53:
 117                     ; 157     uint8_t swPressState = ((SW_GPIO_PORT[swNo]->IDR & SW_GPIO_PIN[swNo]) == 0) ?  CLOSED : OPEN;
 118  0069 5f            	clrw	x
 119  006a 97            	ld	xl,a
 120  006b 58            	sllw	x
 121  006c de0000        	ldw	x,(L3_SW_GPIO_PORT,x)
 122  006f e601          	ld	a,(1,x)
 123  0071 5f            	clrw	x
 124  0072 97            	ld	xl,a
 125  0073 1f01          	ldw	(OFST-8,sp),x
 126  0075 5f            	clrw	x
 127  0076 7b09          	ld	a,(OFST+0,sp)
 128  0078 97            	ld	xl,a
 129  0079 58            	sllw	x
 130  007a de0000        	ldw	x,(L5_SW_GPIO_PIN,x)
 131  007d 01            	rrwa	x,a
 132  007e 1402          	and	a,(OFST-7,sp)
 133  0080 01            	rrwa	x,a
 134  0081 1401          	and	a,(OFST-8,sp)
 135  0083 01            	rrwa	x,a
 136  0084 5d            	tnzw	x
 137  0085 2604          	jrne	L02
 138  0087 a601          	ld	a,#1
 139  0089 2001          	jra	L22
 140  008b               L02:
 141  008b 4f            	clr	a
 142  008c               L22:
 143  008c 6b04          	ld	(OFST-5,sp),a
 144                     ; 160     if(swPressState != SwInfo[swNo].press)
 145  008e 7b09          	ld	a,(OFST+0,sp)
 146  0090 cd014d        	call	LC003
 147  0093 d60003        	ld	a,(L7_SwInfo+1,x)
 148  0096 1104          	cp	a,(OFST-5,sp)
 149  0098 2763          	jreq	L34
 150                     ; 163       if(SwInfo[swNo].debounce == TRUE)
 151  009a d60004        	ld	a,(L7_SwInfo+2,x)
 152  009d 4a            	dec	a
 153  009e 2642          	jrne	L54
 154                     ; 166         if(abs((int32_t)(bspSysTime - SwInfo[swNo].backuptime)) >= DebounceTime)
 155  00a0 96            	ldw	x,sp
 156  00a1 1c0005        	addw	x,#OFST-4
 157  00a4 cd0000        	call	c_ltor
 159  00a7 7b09          	ld	a,(OFST+0,sp)
 160  00a9 cd014d        	call	LC003
 161  00ac 1c0005        	addw	x,#L7_SwInfo+3
 162  00af cd0000        	call	c_lsub
 164  00b2 be02          	ldw	x,c_lreg+2
 165  00b4 cd0000        	call	_abs
 167  00b7 c60006        	ld	a,L11_DebounceTime
 168  00ba 905f          	clrw	y
 169  00bc 9097          	ld	yl,a
 170  00be 90bf00        	ldw	c_y,y
 171  00c1 b300          	cpw	x,c_y
 172  00c3 2f3c          	jrslt	L35
 173                     ; 169           SwInfo[swNo].press = (uint8_t)(
 173                     ; 170             SwInfo[swNo].press == OPEN ? CLOSED : OPEN);
 174  00c5 7b09          	ld	a,(OFST+0,sp)
 175  00c7 cd014d        	call	LC003
 176  00ca 89            	pushw	x
 177  00cb 7b0b          	ld	a,(OFST+2,sp)
 178  00cd ad7e          	call	LC003
 179  00cf d60003        	ld	a,(L7_SwInfo+1,x)
 180  00d2 2603          	jrne	L62
 181  00d4 4c            	inc	a
 182  00d5 2001          	jra	L03
 183  00d7               L62:
 184  00d7 4f            	clr	a
 185  00d8               L03:
 186  00d8 85            	popw	x
 187  00d9 d70003        	ld	(L7_SwInfo+1,x),a
 188                     ; 171           SwInfo[swNo].debounce = FALSE;
 189  00dc 7b09          	ld	a,(OFST+0,sp)
 190  00de ad6d          	call	LC003
 191  00e0 201b          	jp	L34
 192  00e2               L54:
 193                     ; 180         SwInfo[swNo].backuptime = bspSysTime;
 194  00e2 7b08          	ld	a,(OFST-1,sp)
 195  00e4 d70008        	ld	(L7_SwInfo+6,x),a
 196  00e7 7b07          	ld	a,(OFST-2,sp)
 197  00e9 d70007        	ld	(L7_SwInfo+5,x),a
 198  00ec 7b06          	ld	a,(OFST-3,sp)
 199  00ee d70006        	ld	(L7_SwInfo+4,x),a
 200  00f1 7b05          	ld	a,(OFST-4,sp)
 201  00f3 d70005        	ld	(L7_SwInfo+3,x),a
 202                     ; 181         SwInfo[swNo].debounce = TRUE;
 203  00f6 a601          	ld	a,#1
 204  00f8 d70004        	ld	(L7_SwInfo+2,x),a
 205  00fb 2004          	jra	L35
 206  00fd               L34:
 207                     ; 186       SwInfo[swNo].debounce = FALSE;
 208  00fd 724f0004      	clr	(L7_SwInfo+2,x)
 209  0101               L35:
 210                     ; 189     SetSwitchState(swNo, SwInfo[swNo].press);
 211  0101 7b09          	ld	a,(OFST+0,sp)
 212  0103 ad48          	call	LC003
 213  0105 d60003        	ld	a,(L7_SwInfo+1,x)
 214  0108 6b03          	ld	(OFST-6,sp),a
 215                     ; 81   if(SwInfo[swNo].state == SW_STATE_IDLE)
 216  010a 724d0002      	tnz	(L7_SwInfo,x)
 217  010e 2606          	jrne	L55
 218                     ; 83     if(pressState == CLOSED)
 219  0110 4a            	dec	a
 220  0111 262c          	jrne	L13
 221                     ; 86       SwInfo[swNo].state = SW_STATE_PRESSED;
 222  0113 4c            	inc	a
 223                     ; 89       if(SwitchCB != NULL)
 224                     ; 91         SwitchCB(swNo, SwInfo[swNo].state);
 226  0114 200c          	jp	LC002
 227  0116               L55:
 228                     ; 95   else if(SwInfo[swNo].state == SW_STATE_PRESSED)
 229  0116 d60002        	ld	a,(L7_SwInfo,x)
 230  0119 4a            	dec	a
 231  011a 261f          	jrne	L56
 232                     ; 97     if(pressState == OPEN)
 233  011c 7b03          	ld	a,(OFST-6,sp)
 234  011e 261f          	jrne	L13
 235                     ; 99       SwInfo[swNo].state = SW_STATE_RELEASED;
 236  0120 a602          	ld	a,#2
 237                     ; 102       if(SwitchCB != NULL)
 238                     ; 104         SwitchCB(swNo, SwInfo[swNo].state);
 239  0122               LC002:
 240  0122 d70002        	ld	(L7_SwInfo,x),a
 241  0125 ce0000        	ldw	x,L31_SwitchCB
 242  0128 2715          	jreq	L13
 243  012a 7b09          	ld	a,(OFST+0,sp)
 244  012c ad1f          	call	LC003
 245  012e d60002        	ld	a,(L7_SwInfo,x)
 246  0131 97            	ld	xl,a
 247  0132 7b09          	ld	a,(OFST+0,sp)
 248  0134 95            	ld	xh,a
 249  0135 72cd0000      	call	[L31_SwitchCB.w]
 251  0139 2004          	jra	L13
 252  013b               L56:
 253                     ; 110     SwInfo[swNo].state = SW_STATE_IDLE;
 254  013b 724f0002      	clr	(L7_SwInfo,x)
 255  013f               L13:
 256                     ; 155   for(swNo = 0; swNo < SW_MAX; swNo++)
 257  013f 0c09          	inc	(OFST+0,sp)
 259  0141 7b09          	ld	a,(OFST+0,sp)
 260  0143 a103          	cp	a,#3
 261  0145 2403cc0069    	jrult	L53
 263  014a 5b09          	addw	sp,#9
 264  014c 81            	ret	
 265  014d               LC003:
 266  014d 97            	ld	xl,a
 267  014e a607          	ld	a,#7
 268  0150 42            	mul	x,a
 269  0151 81            	ret	
 271                     ; 199 uint8_t SW_IsPressed(uint8_t swNo)
 271                     ; 200 {
 272  0152               _SW_IsPressed:
 274                     ; 202   if(SwInfo[swNo].state == SW_STATE_PRESSED)
 275  0152 97            	ld	xl,a
 276  0153 a607          	ld	a,#7
 277  0155 42            	mul	x,a
 278  0156 d60002        	ld	a,(L7_SwInfo,x)
 279  0159 4a            	dec	a
 280  015a 2602          	jrne	L57
 281                     ; 204     return SW_PRESSED;
 282  015c 4c            	inc	a
 284  015d 81            	ret	
 285  015e               L57:
 286                     ; 208     return SW_RELEASED;
 287  015e 4f            	clr	a
 289  015f 81            	ret	
 291                     ; 218 void SW_SetDebounceTime(uint8_t debounce)
 291                     ; 219 {
 292  0160               _SW_SetDebounceTime:
 294                     ; 220   DebounceTime = (debounce < 1) ? (1) : (debounce);
 295  0160 4d            	tnz	a
 296  0161 2601          	jrne	L24
 297  0163 4c            	inc	a
 298  0164               L24:
 299  0164 c70006        	ld	L11_DebounceTime,a
 300                     ; 221 }
 301  0167 81            	ret	
 303                     ; 228 uint8_t SW_GetDebounceTime(void)
 303                     ; 229 {
 304  0168               _SW_GetDebounceTime:
 306                     ; 230   return DebounceTime;
 307  0168 c60006        	ld	a,L11_DebounceTime
 309  016b 81            	ret	
 311                     ; 238 void SW_AddEventListener(void (* cb)(uint8_t, uint8_t))
 311                     ; 239 {
 312  016c               _SW_AddEventListener:
 314                     ; 240   SwitchCB = cb;
 315  016c cf0000        	ldw	L31_SwitchCB,x
 316                     ; 241 }
 317  016f 81            	ret	
 319                     	switch	.bss
 320  0000               L31_SwitchCB:
 321  0000 0000          	ds.b	2
 322  0002               L7_SwInfo:
 323  0002 000000000000  	ds.b	21
 324                     	xref	_TurretExecute
 325                     	xdef	_SW_AddEventListener
 326                     	xdef	_SW_GetDebounceTime
 327                     	xdef	_SW_SetDebounceTime
 328                     	xdef	_SW_IsPressed
 329                     	xdef	_SW_Scan
 330                     	xdef	_SW_Init
 331                     	xref	_SensorCounter
 332                     	xref	_CounterMode
 333                     	xref	_FlagSensorEn
 334                     	xref	_FlagUvDetect
 335                     	xref	_FlagAddCount
 336                     	xref	_FlagAutoCount
 337                     	xref	_FlagValueCount
 338                     	xref	_SystemTimer
 339                     	xref	_AdcValue
 340                     	xref	_BuzzerOnTime
 341                     	xref	_GPIO_Init
 342                     	xref	_abs
 343                     	xref.b	c_lreg
 344                     	xref.b	c_y
 345                     	xref	c_lsub
 346                     	xref	c_ltor
 347                     	end
