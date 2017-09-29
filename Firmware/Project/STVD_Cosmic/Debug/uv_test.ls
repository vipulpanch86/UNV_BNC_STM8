   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_BkupAdcPrintTime:
  22  0000 00000000      	dc.l	0
  23                     .const:	section	.text
  24  0000               L21:
  25  0000 000001f4      	dc.l	500
  26                     ; 29 
  26                     ; 30 #define LOW                   (0)
  27                     	scross	off
  28                     	switch	.text
  29  0000               _uv_test:
  30  0000 5206          	subw	sp,#6
  31       00000006      OFST:	set	6
  33                     ; 32   BSP_Init();
  34  0002 cd0000        	call	_BSP_Init
  36                     ; 33   BSP_UV_DetectEnable(FALSE);
  37  0005 72185005      	bset	20485,#4
  38                     ; 34   printf("\r\nUV Test");
  39  0009 ae0013        	ldw	x,#L11
  40  000c cd0000        	call	_printf
  42  000f               L31:
  43                     ; 38     BSP_AdcExec();
  44  000f cd0000        	call	_BSP_AdcExec
  46                     ; 328   return SystemTimer;
  47  0012 ce0002        	ldw	x,_SystemTimer+2
  48  0015 1f05          	ldw	(OFST-1,sp),x
  49  0017 ce0000        	ldw	x,_SystemTimer
  50  001a 1f03          	ldw	(OFST-3,sp),x
  53                     ; 43     if((sysTime - BkupAdcPrintTime) >= 500)
  54  001c 96            	ldw	x,sp
  55  001d 1c0003        	addw	x,#OFST-3
  56  0020 cd0000        	call	c_ltor
  58  0023 ae0000        	ldw	x,#L3_BkupAdcPrintTime
  59  0026 cd0000        	call	c_lsub
  61  0029 ae0000        	ldw	x,#L21
  62  002c cd0000        	call	c_lcmp
  64  002f 25de          	jrult	L31
  65                     ; 45       BkupAdcPrintTime = sysTime;
  66  0031 1e05          	ldw	x,(OFST-1,sp)
  67  0033 cf0002        	ldw	L3_BkupAdcPrintTime+2,x
  68  0036 1e03          	ldw	x,(OFST-3,sp)
  69  0038 cf0000        	ldw	L3_BkupAdcPrintTime,x
  70                     ; 358   return AdcValue;
  71  003b ce0000        	ldw	x,_AdcValue
  72  003e 1f01          	ldw	(OFST-5,sp),x
  75  0040 89            	pushw	x
  76  0041 ae0004        	ldw	x,#L12
  77  0044 cd0000        	call	_printf
  79  0047 85            	popw	x
  80  0048 20c5          	jra	L31
  82                     	xdef	_uv_test
  83                     	xref	_TurretExecute
  84                     	xref	_SensorCounter
  85                     	xref	_CounterMode
  86                     	xref	_FlagSensorEn
  87                     	xref	_FlagUvDetect
  88                     	xref	_FlagAddCount
  89                     	xref	_FlagAutoCount
  90                     	xref	_FlagValueCount
  91                     	xref	_BSP_AdcExec
  92                     	xref	_BSP_Init
  93                     	xref	_SystemTimer
  94                     	xref	_AdcValue
  95                     	xref	_BuzzerOnTime
  96                     	xref	_printf
  97                     	switch	.const
  98  0004               L12:
  99  0004 0d0a41444320  	dc.b	13,10,65,68,67,32
 100  000a 56616c203d20  	dc.b	"Val = %u",0
 101  0013               L11:
 102  0013 0d0a55562054  	dc.b	13,10,85,86,32,84
 103  0019 65737400      	dc.b	"est",0
 104                     	xref	c_lcmp
 105                     	xref	c_lsub
 106                     	xref	c_ltor
 107                     	end
