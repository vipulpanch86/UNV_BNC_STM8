   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_BkupSwScanTime:
  22  0000 00000000      	dc.l	0
  23                     ; 31 void triac_test(void)
  23                     ; 32 {
  24                     	scross	off
  25                     	switch	.text
  26  0000               _triac_test:
  27  0000 5204          	subw	sp,#4
  28       00000004      OFST:	set	4
  30                     ; 34   BSP_Init();
  31  0002 cd0000        	call	_BSP_Init
  33                     ; 35   SW_Init(20, NULL);
  34  0005 5f            	clrw	x
  35  0006 89            	pushw	x
  36  0007 a614          	ld	a,#20
  37  0009 cd0000        	call	_SW_Init
  39  000c 85            	popw	x
  40                     ; 37   printf("\r\nTriac Test");
  41  000d ae0000        	ldw	x,#L7
  42  0010 cd0000        	call	_printf
  44  0013               L11:
  45                     ; 328   return SystemTimer;
  46  0013 ce0002        	ldw	x,_SystemTimer+2
  47  0016 1f03          	ldw	(OFST-1,sp),x
  48  0018 ce0000        	ldw	x,_SystemTimer
  49  001b 1f01          	ldw	(OFST-3,sp),x
  52                     ; 44     if((sysTime - BkupSwScanTime) >= SW_SCAN_MS)
  53  001d 96            	ldw	x,sp
  54  001e 5c            	incw	x
  55  001f cd0000        	call	c_ltor
  57  0022 ae0000        	ldw	x,#L3_BkupSwScanTime
  58  0025 cd0000        	call	c_lsub
  60  0028 cd0000        	call	c_lrzmp
  62  002b 270d          	jreq	L51
  63                     ; 46       BkupSwScanTime = sysTime;
  64  002d 1e03          	ldw	x,(OFST-1,sp)
  65  002f cf0002        	ldw	L3_BkupSwScanTime+2,x
  66  0032 1e01          	ldw	x,(OFST-3,sp)
  67  0034 cf0000        	ldw	L3_BkupSwScanTime,x
  68                     ; 47       SW_Scan();
  69  0037 cd0000        	call	_SW_Scan
  71  003a               L51:
  72                     ; 50     if(SW_IsPressed(SW_CAM) == TRUE)
  73  003a a601          	ld	a,#1
  74  003c cd0000        	call	_SW_IsPressed
  76  003f 4a            	dec	a
  77  0040 2606          	jrne	L71
  78                     ; 52       BSP_H_MotorEnable(TRUE);
  79  0042 721d5005      	bres	20485,#6
  81  0046 2004          	jra	L12
  82  0048               L71:
  83                     ; 56       BSP_H_MotorEnable(FALSE);
  84  0048 721c5005      	bset	20485,#6
  85  004c               L12:
  86                     ; 59     if(SW_IsPressed(SW_AUTO) == TRUE)
  87  004c a602          	ld	a,#2
  88  004e cd0000        	call	_SW_IsPressed
  90  0051 4a            	dec	a
  91  0052 2606          	jrne	L32
  92                     ; 61       BSP_S_MotorEnable(TRUE);
  93  0054 721f5005      	bres	20485,#7
  95  0058 2004          	jra	L52
  96  005a               L32:
  97                     ; 65       BSP_S_MotorEnable(FALSE);
  98  005a 721e5005      	bset	20485,#7
  99  005e               L52:
 100                     ; 68     if(SW_IsPressed(SW_RESET) == TRUE)
 101  005e 4f            	clr	a
 102  005f cd0000        	call	_SW_IsPressed
 104  0062 4a            	dec	a
 105  0063 2606          	jrne	L72
 106                     ; 70       BSP_V_PumpEnable(TRUE);
 107  0065 72115019      	bres	20505,#0
 109  0069 20a8          	jra	L11
 110  006b               L72:
 111                     ; 74       BSP_V_PumpEnable(FALSE);
 112  006b 72105019      	bset	20505,#0
 113  006f 20a2          	jra	L11
 115                     	xdef	_triac_test
 116                     	xref	_TurretExecute
 117                     	xref	_SW_IsPressed
 118                     	xref	_SW_Scan
 119                     	xref	_SW_Init
 120                     	xref	_SensorCounter
 121                     	xref	_CounterMode
 122                     	xref	_FlagSensorEn
 123                     	xref	_FlagUvDetect
 124                     	xref	_FlagAddCount
 125                     	xref	_FlagAutoCount
 126                     	xref	_FlagValueCount
 127                     	xref	_BSP_Init
 128                     	xref	_SystemTimer
 129                     	xref	_AdcValue
 130                     	xref	_BuzzerOnTime
 131                     	xref	_printf
 132                     .const:	section	.text
 133  0000               L7:
 134  0000 0d0a54726961  	dc.b	13,10,84,114,105,97
 135  0006 632054657374  	dc.b	"c Test",0
 136                     	xref	c_lrzmp
 137                     	xref	c_lsub
 138                     	xref	c_ltor
 139                     	end
