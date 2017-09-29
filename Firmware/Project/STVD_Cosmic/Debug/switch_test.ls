   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 27 void SwCallBack(uint8_t swNb, uint8_t swState)
  20                     ; 28 {
  21                     	scross	off
  22  0000               _SwCallBack:
  24                     ; 29   printf("\n\rSw no: %u, SwState: %u", swNb, swState);
  25  0000 9f            	ld	a,xl
  26  0001 88            	push	a
  27  0002 9e            	ld	a,xh
  28  0003 88            	push	a
  29  0004 ae000e        	ldw	x,#L5
  30  0007 cd0000        	call	_printf
  32  000a 85            	popw	x
  33                     ; 30 }
  34  000b 81            	ret	
  36                     	switch	.data
  37  0000               L7_BkupSwScanTime:
  38  0000 00000000      	dc.l	0
  40                     ; 38 void switch_test(void)
  40                     ; 39 {
  41                     	switch	.text
  42  000c               _switch_test:
  43  000c 5204          	subw	sp,#4
  44       00000004      OFST:	set	4
  46                     ; 41   BSP_Init();
  47  000e cd0000        	call	_BSP_Init
  49                     ; 42   SW_Init(20, SwCallBack);
  50  0011 ae0000        	ldw	x,#_SwCallBack
  51  0014 89            	pushw	x
  52  0015 a614          	ld	a,#20
  53  0017 cd0000        	call	_SW_Init
  55  001a 85            	popw	x
  56                     ; 44   printf("\r\nSwitch Test");
  57  001b ae0000        	ldw	x,#L31
  58  001e cd0000        	call	_printf
  60  0021               L51:
  61                     ; 328   return SystemTimer;
  62  0021 ce0002        	ldw	x,_SystemTimer+2
  63  0024 1f03          	ldw	(OFST-1,sp),x
  64  0026 ce0000        	ldw	x,_SystemTimer
  65  0029 1f01          	ldw	(OFST-3,sp),x
  68                     ; 51     if((sysTime - BkupSwScanTime) >= SW_SCAN_MS)
  69  002b 96            	ldw	x,sp
  70  002c 5c            	incw	x
  71  002d cd0000        	call	c_ltor
  73  0030 ae0000        	ldw	x,#L7_BkupSwScanTime
  74  0033 cd0000        	call	c_lsub
  76  0036 cd0000        	call	c_lrzmp
  78  0039 27e6          	jreq	L51
  79                     ; 53       BkupSwScanTime = sysTime;
  80  003b 1e03          	ldw	x,(OFST-1,sp)
  81  003d cf0002        	ldw	L7_BkupSwScanTime+2,x
  82  0040 1e01          	ldw	x,(OFST-3,sp)
  83  0042 cf0000        	ldw	L7_BkupSwScanTime,x
  84                     ; 54       SW_Scan();
  85  0045 cd0000        	call	_SW_Scan
  87  0048 20d7          	jra	L51
  89                     	xdef	_switch_test
  90                     	xdef	_SwCallBack
  91                     	xref	_TurretExecute
  92                     	xref	_SW_Scan
  93                     	xref	_SW_Init
  94                     	xref	_SensorCounter
  95                     	xref	_CounterMode
  96                     	xref	_FlagSensorEn
  97                     	xref	_FlagUvDetect
  98                     	xref	_FlagAddCount
  99                     	xref	_FlagAutoCount
 100                     	xref	_FlagValueCount
 101                     	xref	_BSP_Init
 102                     	xref	_SystemTimer
 103                     	xref	_AdcValue
 104                     	xref	_BuzzerOnTime
 105                     	xref	_printf
 106                     .const:	section	.text
 107  0000               L31:
 108  0000 0d0a53776974  	dc.b	13,10,83,119,105,116
 109  0006 636820546573  	dc.b	"ch Test",0
 110  000e               L5:
 111  000e 0a0d5377206e  	dc.b	10,13,83,119,32,110
 112  0014 6f3a2025752c  	dc.b	"o: %u, SwState: %u",0
 113                     	xref	c_lrzmp
 114                     	xref	c_lsub
 115                     	xref	c_ltor
 116                     	end
