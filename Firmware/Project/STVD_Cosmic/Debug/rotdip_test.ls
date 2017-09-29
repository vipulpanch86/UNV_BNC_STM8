   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 51 void rotdip_test(void)
  20                     ; 52 {
  21                     	scross	off
  22  0000               _rotdip_test:
  23  0000 89            	pushw	x
  24       00000002      OFST:	set	2
  26                     ; 53   uint8_t dipPos = 0;
  27  0001 0f02          	clr	(OFST+0,sp)
  28                     ; 60   BSP_Init();
  29  0003 cd0000        	call	_BSP_Init
  31                     ; 63   printf("\n\rROTARY DIP SWITCH TEST: \n\r");
  32  0006 ae000d        	ldw	x,#L3
  33  0009 cd0000        	call	_printf
  35  000c               L5:
  36                     ; 67     uint8_t dippos_loc = BSP_ReadRotDipSwitch();
  37  000c cd0000        	call	_BSP_ReadRotDipSwitch
  39  000f 6b01          	ld	(OFST-1,sp),a
  40                     ; 68     if(dippos_loc != dipPos)
  41  0011 1102          	cp	a,(OFST+0,sp)
  42  0013 27f7          	jreq	L5
  43                     ; 70       dipPos = dippos_loc;
  44  0015 6b02          	ld	(OFST+0,sp),a
  45                     ; 71       printf("\n\rSW POS: %u", (unsigned int)dipPos );
  46  0017 5f            	clrw	x
  47  0018 97            	ld	xl,a
  48  0019 89            	pushw	x
  49  001a ae0000        	ldw	x,#L31
  50  001d cd0000        	call	_printf
  52  0020 85            	popw	x
  53  0021 20e9          	jra	L5
  55                     	xdef	_rotdip_test
  56                     	xref	_TurretExecute
  57                     	xref	_SensorCounter
  58                     	xref	_CounterMode
  59                     	xref	_FlagSensorEn
  60                     	xref	_FlagUvDetect
  61                     	xref	_FlagAddCount
  62                     	xref	_FlagAutoCount
  63                     	xref	_FlagValueCount
  64                     	xref	_BSP_ReadRotDipSwitch
  65                     	xref	_BSP_Init
  66                     	xref	_SystemTimer
  67                     	xref	_AdcValue
  68                     	xref	_BuzzerOnTime
  69                     	xref	_printf
  70                     .const:	section	.text
  71  0000               L31:
  72  0000 0a0d53572050  	dc.b	10,13,83,87,32,80
  73  0006 4f533a202575  	dc.b	"OS: %u",0
  74  000d               L3:
  75  000d 0a0d524f5441  	dc.b	10,13,82,79,84,65
  76  0013 525920444950  	dc.b	"RY DIP SWITCH TEST"
  77  0025 3a200a        	dc.b	": ",10
  78  0028 0d00          	dc.b	13,0
  79                     	end
