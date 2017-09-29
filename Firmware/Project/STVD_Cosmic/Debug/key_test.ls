   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_KEYS_STR:
  22  0000 00e7          	dc.w	L5
  23  0002 00de          	dc.w	L7
  24  0004 00d5          	dc.w	L11
  25  0006 00cc          	dc.w	L31
  26  0008 00c3          	dc.w	L51
  27  000a 00ba          	dc.w	L71
  28  000c 00b1          	dc.w	L12
  29  000e 00a8          	dc.w	L32
  30  0010 009f          	dc.w	L52
  31  0012 0096          	dc.w	L72
  32  0014 008e          	dc.w	L13
  33  0016 0083          	dc.w	L33
  34  0018 007a          	dc.w	L53
  35  001a 0073          	dc.w	L73
  36  001c 006a          	dc.w	L14
  37  001e 005f          	dc.w	L34
  38  0020 0056          	dc.w	L54
  39  0022 004d          	dc.w	L74
  40  0024 0046          	dc.w	L15
  41  0026 003d          	dc.w	L35
  42  0028 0034          	dc.w	L55
  43  002a 002b          	dc.w	L75
  44  002c 0023          	dc.w	L16
  45  002e 001b          	dc.w	L36
  46                     ; 53 void KeyCallBack(uint8_t keyNb, uint8_t keyState)
  46                     ; 54 {
  47                     	scross	off
  48                     	switch	.text
  49  0000               _KeyCallBack:
  51                     ; 55   printf("\n\r%s, St: %u", KEYS_STR[keyNb], keyState);
  52  0000 9f            	ld	a,xl
  53  0001 88            	push	a
  54  0002 9e            	ld	a,xh
  55  0003 5f            	clrw	x
  56  0004 97            	ld	xl,a
  57  0005 58            	sllw	x
  58  0006 de0000        	ldw	x,(L3_KEYS_STR,x)
  59  0009 89            	pushw	x
  60  000a ae000e        	ldw	x,#L56
  61  000d cd0000        	call	_printf
  63  0010 5b03          	addw	sp,#3
  64                     ; 57 }
  65  0012 81            	ret	
  67                     	switch	.data
  68  0030               L76_BkupKpdScanTime:
  69  0030 00000000      	dc.l	0
  71                     ; 65 void key_test(void)
  71                     ; 66 {
  72                     	switch	.text
  73  0013               _key_test:
  74  0013 5204          	subw	sp,#4
  75       00000004      OFST:	set	4
  77                     ; 68   BSP_Init();
  78  0015 cd0000        	call	_BSP_Init
  80                     ; 69   KPD_Init(1, 20, KeyCallBack);
  81  0018 ae0000        	ldw	x,#_KeyCallBack
  82  001b 89            	pushw	x
  83  001c ae0114        	ldw	x,#276
  84  001f cd0000        	call	_KPD_Init
  86  0022 85            	popw	x
  87                     ; 72   printf("\r\nKEYPAD Test");
  88  0023 ae0000        	ldw	x,#L37
  89  0026 cd0000        	call	_printf
  91  0029               L57:
  92                     ; 328   return SystemTimer;
  93  0029 ce0002        	ldw	x,_SystemTimer+2
  94  002c 1f03          	ldw	(OFST-1,sp),x
  95  002e ce0000        	ldw	x,_SystemTimer
  96  0031 1f01          	ldw	(OFST-3,sp),x
  99                     ; 79     if((sysTime - BkupKpdScanTime) >= KPD_SCAN_MS)
 100  0033 96            	ldw	x,sp
 101  0034 5c            	incw	x
 102  0035 cd0000        	call	c_ltor
 104  0038 ae0030        	ldw	x,#L76_BkupKpdScanTime
 105  003b cd0000        	call	c_lsub
 107  003e cd0000        	call	c_lrzmp
 109  0041 27e6          	jreq	L57
 110                     ; 81       BkupKpdScanTime = sysTime;
 111  0043 1e03          	ldw	x,(OFST-1,sp)
 112  0045 cf0032        	ldw	L76_BkupKpdScanTime+2,x
 113  0048 1e01          	ldw	x,(OFST-3,sp)
 114  004a cf0030        	ldw	L76_BkupKpdScanTime,x
 115                     ; 82       KPD_Scan();
 116  004d cd0000        	call	_KPD_Scan
 118  0050 20d7          	jra	L57
 120                     	xdef	_key_test
 121                     	xdef	_KeyCallBack
 122                     	xref	_TurretExecute
 123                     	xref	_KPD_Scan
 124                     	xref	_KPD_Init
 125                     	xref	_SensorCounter
 126                     	xref	_CounterMode
 127                     	xref	_FlagSensorEn
 128                     	xref	_FlagUvDetect
 129                     	xref	_FlagAddCount
 130                     	xref	_FlagAutoCount
 131                     	xref	_FlagValueCount
 132                     	xref	_BSP_Init
 133                     	xref	_SystemTimer
 134                     	xref	_AdcValue
 135                     	xref	_BuzzerOnTime
 136                     	xref	_printf
 137                     .const:	section	.text
 138  0000               L37:
 139  0000 0d0a4b455950  	dc.b	13,10,75,69,89,80
 140  0006 414420546573  	dc.b	"AD Test",0
 141  000e               L56:
 142  000e 0a0d25732c20  	dc.b	10,13,37,115,44,32
 143  0014 53743a202575  	dc.b	"St: %u",0
 144  001b               L36:
 145  001b 4b45595f434c  	dc.b	"KEY_CLR",0
 146  0023               L16:
 147  0023 4b45595f454e  	dc.b	"KEY_ENT",0
 148  002b               L75:
 149  002b 4b45595f4e45  	dc.b	"KEY_NEXT",0
 150  0034               L55:
 151  0034 4b45595f4241  	dc.b	"KEY_BACK",0
 152  003d               L35:
 153  003d 4b45595f444f  	dc.b	"KEY_DOWN",0
 154  0046               L15:
 155  0046 4b45595f5550  	dc.b	"KEY_UP",0
 156  004d               L74:
 157  004d 4b45595f4655  	dc.b	"KEY_FUNC",0
 158  0056               L54:
 159  0056 4b45595f4d4f  	dc.b	"KEY_MODE",0
 160  005f               L34:
 161  005f 4b45595f4d41  	dc.b	"KEY_MANUAL",0
 162  006a               L14:
 163  006a 4b45595f4155  	dc.b	"KEY_AUTO",0
 164  0073               L73:
 165  0073 4b45595f5556  	dc.b	"KEY_UV",0
 166  007a               L53:
 167  007a 4b45595f5641  	dc.b	"KEY_VALM",0
 168  0083               L33:
 169  0083 4b45595f4144  	dc.b	"KEY_ADD_UV",0
 170  008e               L13:
 171  008e 4b45595f4144  	dc.b	"KEY_ADD",0
 172  0096               L72:
 173  0096 4b45595f4449  	dc.b	"KEY_DIG9",0
 174  009f               L52:
 175  009f 4b45595f4449  	dc.b	"KEY_DIG8",0
 176  00a8               L32:
 177  00a8 4b45595f4449  	dc.b	"KEY_DIG7",0
 178  00b1               L12:
 179  00b1 4b45595f4449  	dc.b	"KEY_DIG6",0
 180  00ba               L71:
 181  00ba 4b45595f4449  	dc.b	"KEY_DIG5",0
 182  00c3               L51:
 183  00c3 4b45595f4449  	dc.b	"KEY_DIG4",0
 184  00cc               L31:
 185  00cc 4b45595f4449  	dc.b	"KEY_DIG3",0
 186  00d5               L11:
 187  00d5 4b45595f4449  	dc.b	"KEY_DIG2",0
 188  00de               L7:
 189  00de 4b45595f4449  	dc.b	"KEY_DIG1",0
 190  00e7               L5:
 191  00e7 4b45595f4449  	dc.b	"KEY_DIG0",0
 192                     	xref	c_lrzmp
 193                     	xref	c_lsub
 194                     	xref	c_ltor
 195                     	end
