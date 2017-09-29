   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_BkupSwScanTime:
  22  0000 00000000      	dc.l	0
  23                     ; 31 void coil_test(void)
  23                     ; 32 {
  24                     	scross	off
  25                     	switch	.text
  26  0000               _coil_test:
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
  40                     ; 37   printf("\r\nCoil Test");
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
  78                     ; 52       BSP_B_CoilEnable(TRUE);
  79  0042 72175014      	bres	20500,#3
  81  0046 2004          	jra	L12
  82  0048               L71:
  83                     ; 56       BSP_B_CoilEnable(FALSE);
  84  0048 72165014      	bset	20500,#3
  85  004c               L12:
  86                     ; 59     if(SW_IsPressed(SW_AUTO) == TRUE)
  87  004c a602          	ld	a,#2
  88  004e cd0000        	call	_SW_IsPressed
  90  0051 4a            	dec	a
  91  0052 2606          	jrne	L32
  92                     ; 61       BSP_S_CoilEnable(TRUE);
  93  0054 72195014      	bres	20500,#4
  95  0058 20b9          	jra	L11
  96  005a               L32:
  97                     ; 65       BSP_S_CoilEnable(FALSE);
  98  005a 72185014      	bset	20500,#4
  99  005e 20b3          	jra	L11
 101                     	xdef	_coil_test
 102                     	xref	_TurretExecute
 103                     	xref	_SW_IsPressed
 104                     	xref	_SW_Scan
 105                     	xref	_SW_Init
 106                     	xref	_SensorCounter
 107                     	xref	_CounterMode
 108                     	xref	_FlagSensorEn
 109                     	xref	_FlagUvDetect
 110                     	xref	_FlagAddCount
 111                     	xref	_FlagAutoCount
 112                     	xref	_FlagValueCount
 113                     	xref	_BSP_Init
 114                     	xref	_SystemTimer
 115                     	xref	_AdcValue
 116                     	xref	_BuzzerOnTime
 117                     	xref	_printf
 118                     .const:	section	.text
 119  0000               L7:
 120  0000 0d0a436f696c  	dc.b	13,10,67,111,105,108
 121  0006 205465737400  	dc.b	" Test",0
 122                     	xref	c_lrzmp
 123                     	xref	c_lsub
 124                     	xref	c_ltor
 125                     	end
