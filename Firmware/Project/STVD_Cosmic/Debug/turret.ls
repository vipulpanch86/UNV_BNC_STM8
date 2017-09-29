   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               _TurretTxPointer:
  22  0000 00            	dc.b	0
  23  0001               _TurretExecute:
  24  0001 00            	dc.b	0
  25  0002               _TurretValue:
  26  0002 ffff          	dc.w	-1
  27                     ; 33 void TURR_Clear(void)
  27                     ; 34 {
  28                     	scross	off
  29                     	switch	.text
  30  0000               _TURR_Clear:
  32                     ; 35   if(TurretValue != 0xFFFF)
  33  0000 ce0002        	ldw	x,_TurretValue
  34  0003 5c            	incw	x
  35  0004 2716          	jreq	L3
  36                     ; 37     TurretValue = 0xFFFF;
  37  0006 aeffff        	ldw	x,#65535
  38  0009 cf0002        	ldw	_TurretValue,x
  39                     ; 38     TurretExecute = TRUE;
  40  000c 35010001      	mov	_TurretExecute,#1
  41                     ; 40     TurretData[0] = TURR_START;
  42  0010 35aa0000      	mov	_TurretData,#170
  43                     ; 41     TurretData[1] = 0xAF;
  44  0014 35af0001      	mov	_TurretData+1,#175
  45                     ; 42     TurretData[2] = 0xFA;
  46  0018 35fa0002      	mov	_TurretData+2,#250
  47  001c               L3:
  48                     ; 44 }
  49  001c 81            	ret	
  51                     ; 53 void TURR_PutVal(uint16_t value)
  51                     ; 54 {
  52  001d               _TURR_PutVal:
  53  001d 89            	pushw	x
  54       00000000      OFST:	set	0
  56                     ; 55   if(TurretValue != value)
  57  001e c30002        	cpw	x,_TurretValue
  58  0021 275d          	jreq	L5
  59                     ; 57     TurretValue = value;
  60  0023 cf0002        	ldw	_TurretValue,x
  61                     ; 58     TurretExecute = TRUE;
  62  0026 35010001      	mov	_TurretExecute,#1
  63                     ; 60     TurretData[0] = TURR_START;
  64  002a 35aa0000      	mov	_TurretData,#170
  65                     ; 63     TurretData[1] = (uint8_t)(((value / 1) % 10) << 0);
  66  002e a60a          	ld	a,#10
  67  0030 62            	div	x,a
  68  0031 c70001        	ld	_TurretData+1,a
  69                     ; 66     TurretData[1] |= (uint8_t)((value > 9) ? (((value / 10) % 10) << 4) : 0xA0);
  70  0034 1e01          	ldw	x,(OFST+1,sp)
  71  0036 a3000a        	cpw	x,#10
  72  0039 2507          	jrult	L6
  73  003b a60a          	ld	a,#10
  74  003d 62            	div	x,a
  75  003e ad42          	call	LC001
  76  0040 2004          	jra	L01
  77  0042               L6:
  78  0042 ae00a0        	ldw	x,#160
  79  0045 9f            	ld	a,xl
  80  0046               L01:
  81  0046 9f            	ld	a,xl
  82  0047 ca0001        	or	a,_TurretData+1
  83  004a c70001        	ld	_TurretData+1,a
  84                     ; 69     TurretData[2] = (uint8_t)((value > 99) ? (((value / 100) % 10) << 0) : 0x0A);
  85  004d 1e01          	ldw	x,(OFST+1,sp)
  86  004f a30064        	cpw	x,#100
  87  0052 2509          	jrult	L41
  88  0054 a664          	ld	a,#100
  89  0056 62            	div	x,a
  90  0057 a60a          	ld	a,#10
  91  0059 62            	div	x,a
  92  005a 97            	ld	xl,a
  93  005b 2004          	jra	L61
  94  005d               L41:
  95  005d ae000a        	ldw	x,#10
  96  0060 9f            	ld	a,xl
  97  0061               L61:
  98  0061 9f            	ld	a,xl
  99  0062 c70002        	ld	_TurretData+2,a
 100                     ; 72     TurretData[2] |= (uint8_t)((value > 999) ? (((value / 1000) % 10) << 4) : 0xF0);
 101  0065 1e01          	ldw	x,(OFST+1,sp)
 102  0067 a303e8        	cpw	x,#1000
 103  006a 2509          	jrult	L22
 104  006c 90ae03e8      	ldw	y,#1000
 105  0070 65            	divw	x,y
 106  0071 ad0f          	call	LC001
 107  0073 2004          	jra	L42
 108  0075               L22:
 109  0075 ae00f0        	ldw	x,#240
 110  0078 9f            	ld	a,xl
 111  0079               L42:
 112  0079 9f            	ld	a,xl
 113  007a ca0002        	or	a,_TurretData+2
 114  007d c70002        	ld	_TurretData+2,a
 115  0080               L5:
 116                     ; 74 }
 117  0080 85            	popw	x
 118  0081 81            	ret	
 119  0082               LC001:
 120  0082 a60a          	ld	a,#10
 121  0084 62            	div	x,a
 122  0085 5f            	clrw	x
 123  0086 97            	ld	xl,a
 124  0087 58            	sllw	x
 125  0088 58            	sllw	x
 126  0089 58            	sllw	x
 127  008a 58            	sllw	x
 128  008b 81            	ret	
 130                     ; 81 void TURR_Exec(void)
 130                     ; 82 {
 131  008c               _TURR_Exec:
 133                     ; 83   TurretExecute = FALSE;
 134  008c 725f0001      	clr	_TurretExecute
 135                     ; 85   TurretTxPointer = 0;
 136  0090 725f0000      	clr	_TurretTxPointer
 137                     ; 88   UART1_ITConfig(UART1_IT_TXE, ENABLE);
 138  0094 4b01          	push	#1
 139  0096 ae0277        	ldw	x,#631
 140  0099 cd0000        	call	_UART1_ITConfig
 142  009c 84            	pop	a
 143                     ; 89 }
 144  009d 81            	ret	
 146                     	xdef	_TurretValue
 147                     	xdef	_TurretTxPointer
 148                     	switch	.bss
 149  0000               _TurretData:
 150  0000 000000        	ds.b	3
 151                     	xdef	_TurretData
 152                     	xdef	_TURR_Exec
 153                     	xdef	_TURR_PutVal
 154                     	xdef	_TURR_Clear
 155                     	xdef	_TurretExecute
 156                     	xref	_SensorCounter
 157                     	xref	_CounterMode
 158                     	xref	_FlagSensorEn
 159                     	xref	_FlagUvDetect
 160                     	xref	_FlagAddCount
 161                     	xref	_FlagAutoCount
 162                     	xref	_FlagValueCount
 163                     	xref	_SystemTimer
 164                     	xref	_AdcValue
 165                     	xref	_BuzzerOnTime
 166                     	xref	_UART1_ITConfig
 167                     	end
