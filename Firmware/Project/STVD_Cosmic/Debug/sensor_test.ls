   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_BkupSensorCounter:
  22  0000 00000000      	dc.l	0
  23                     	xref	_BspSensorCounter
  24                     ; 29 void sensor_test(void)
  24                     ; 30 {
  25                     	scross	off
  26                     	switch	.text
  27  0000               _sensor_test:
  29                     ; 32   BSP_Init();
  30  0000 cd0000        	call	_BSP_Init
  32                     ; 34   printf("\r\nSENSOR Test");
  33  0003 ae0016        	ldw	x,#L5
  34  0006 cd0000        	call	_printf
  36  0009               L7:
  37                     ; 42     if(BkupSensorCounter != BspSensorCounter)
  38  0009 ae0000        	ldw	x,#L3_BkupSensorCounter
  39  000c cd0000        	call	c_ltor
  41  000f ae0000        	ldw	x,#_BspSensorCounter
  42  0012 cd0000        	call	c_lcmp
  44  0015 27f2          	jreq	L7
  45                     ; 44       BkupSensorCounter = BspSensorCounter;
  46  0017 ce0002        	ldw	x,_BspSensorCounter+2
  47  001a cf0002        	ldw	L3_BkupSensorCounter+2,x
  48  001d ce0000        	ldw	x,_BspSensorCounter
  49  0020 cf0000        	ldw	L3_BkupSensorCounter,x
  50                     ; 45       printf("\r\nSensor Counter = %u", (unsigned int)BspSensorCounter);
  51  0023 ce0002        	ldw	x,_BspSensorCounter+2
  52  0026 89            	pushw	x
  53  0027 ae0000        	ldw	x,#L51
  54  002a cd0000        	call	_printf
  56  002d 85            	popw	x
  57  002e 20d9          	jra	L7
  59                     	xdef	_sensor_test
  60                     	xref	_TurretExecute
  61                     	xref	_SensorCounter
  62                     	xref	_CounterMode
  63                     	xref	_FlagSensorEn
  64                     	xref	_FlagUvDetect
  65                     	xref	_FlagAddCount
  66                     	xref	_FlagAutoCount
  67                     	xref	_FlagValueCount
  68                     	xref	_BSP_Init
  69                     	xref	_SystemTimer
  70                     	xref	_AdcValue
  71                     	xref	_BuzzerOnTime
  72                     	xref	_printf
  73                     .const:	section	.text
  74  0000               L51:
  75  0000 0d0a53656e73  	dc.b	13,10,83,101,110,115
  76  0006 6f7220436f75  	dc.b	"or Counter = %u",0
  77  0016               L5:
  78  0016 0d0a53454e53  	dc.b	13,10,83,69,78,83
  79  001c 4f5220546573  	dc.b	"OR Test",0
  80                     	xref	c_lcmp
  81                     	xref	c_ltor
  82                     	end
