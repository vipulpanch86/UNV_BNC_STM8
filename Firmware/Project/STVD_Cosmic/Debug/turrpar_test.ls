   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L5_counter:
  22  0000 00000000      	dc.l	0
  23                     .const:	section	.text
  24  0000               L01:
  25  0000 00002710      	dc.l	10000
  26                     ; 25 static void turrpar_update(void)
  26                     ; 26 {
  27                     	scross	off
  28                     	switch	.text
  29  0000               L3_turrpar_update:
  30  0000 5220          	subw	sp,#32
  31       00000020      OFST:	set	32
  33                     ; 30   sprintf(buffer, "%04u", counter);
  34  0002 ce0002        	ldw	x,L5_counter+2
  35  0005 89            	pushw	x
  36  0006 ce0000        	ldw	x,L5_counter
  37  0009 89            	pushw	x
  38  000a ae0008        	ldw	x,#L7
  39  000d 89            	pushw	x
  40  000e 96            	ldw	x,sp
  41  000f 1c0007        	addw	x,#OFST-25
  42  0012 cd0000        	call	_sprintf
  44  0015 5b06          	addw	sp,#6
  45                     ; 32   DISP_TurrPutStr(&buffer[0], 0);
  46  0017 4b00          	push	#0
  47  0019 96            	ldw	x,sp
  48  001a 1c0002        	addw	x,#OFST-30
  49  001d cd0000        	call	_DISP_TurrPutStr
  51  0020 ae0000        	ldw	x,#L5_counter
  52  0023 84            	pop	a
  53                     ; 34   counter++;
  54  0024 a601          	ld	a,#1
  55  0026 cd0000        	call	c_lgadc
  57                     ; 35   counter %= 10000;
  58  0029 cd0000        	call	c_ltor
  60  002c ae0000        	ldw	x,#L01
  61  002f cd0000        	call	c_lumd
  63  0032 ae0000        	ldw	x,#L5_counter
  64  0035 cd0000        	call	c_rtol
  66                     ; 36 }
  67  0038 5b20          	addw	sp,#32
  68  003a 81            	ret	
  70                     	switch	.data
  71  0004               L11_BkupDispExecTime:
  72  0004 00000000      	dc.l	0
  73  0008               L31_BkupDispUpdateTime:
  74  0008 00000000      	dc.l	0
  75                     	switch	.const
  76  0004               L02:
  77  0004 0000000a      	dc.l	10
  78                     ; 43 void turrpar_test(void)
  78                     ; 44 {
  79                     	switch	.text
  80  003b               _turrpar_test:
  81  003b 5204          	subw	sp,#4
  82       00000004      OFST:	set	4
  84                     ; 46   BSP_Init();
  85  003d cd0000        	call	_BSP_Init
  87                     ; 47   DISP_Init(0);
  88  0040 4f            	clr	a
  89  0041 cd0000        	call	_DISP_Init
  91  0044               L71:
  92                     ; 328   return SystemTimer;
  93  0044 ce0002        	ldw	x,_SystemTimer+2
  94  0047 1f03          	ldw	(OFST-1,sp),x
  95  0049 ce0000        	ldw	x,_SystemTimer
  96  004c 1f01          	ldw	(OFST-3,sp),x
  99                     ; 55     if((sysTime - BkupDispUpdateTime) >= 10)
 100  004e 96            	ldw	x,sp
 101  004f 5c            	incw	x
 102  0050 cd0000        	call	c_ltor
 104  0053 ae0008        	ldw	x,#L31_BkupDispUpdateTime
 105  0056 cd0000        	call	c_lsub
 107  0059 ae0004        	ldw	x,#L02
 108  005c cd0000        	call	c_lcmp
 110  005f 250c          	jrult	L32
 111                     ; 57       BkupDispUpdateTime = sysTime;
 112  0061 1e03          	ldw	x,(OFST-1,sp)
 113  0063 cf000a        	ldw	L31_BkupDispUpdateTime+2,x
 114  0066 1e01          	ldw	x,(OFST-3,sp)
 115  0068 cf0008        	ldw	L31_BkupDispUpdateTime,x
 116                     ; 58       turrpar_update();
 117  006b ad93          	call	L3_turrpar_update
 119  006d               L32:
 120                     ; 61     if((sysTime - BkupDispExecTime) >= DISP_EXEC_MS)
 121  006d 96            	ldw	x,sp
 122  006e 5c            	incw	x
 123  006f cd0000        	call	c_ltor
 125  0072 ae0004        	ldw	x,#L11_BkupDispExecTime
 126  0075 cd0000        	call	c_lsub
 128  0078 cd0000        	call	c_lrzmp
 130  007b 27c7          	jreq	L71
 131                     ; 63       BkupDispExecTime = sysTime;
 132  007d 1e03          	ldw	x,(OFST-1,sp)
 133  007f cf0006        	ldw	L11_BkupDispExecTime+2,x
 134  0082 1e01          	ldw	x,(OFST-3,sp)
 135  0084 cf0004        	ldw	L11_BkupDispExecTime,x
 136                     ; 64       DISP_Exec();
 137  0087 cd0000        	call	_DISP_Exec
 139  008a 20b8          	jra	L71
 141                     	xdef	_turrpar_test
 142                     	xref	_TurretExecute
 143                     	xref	_DISP_Exec
 144                     	xref	_DISP_TurrPutStr
 145                     	xref	_DISP_Init
 146                     	xref	_SensorCounter
 147                     	xref	_CounterMode
 148                     	xref	_FlagSensorEn
 149                     	xref	_FlagUvDetect
 150                     	xref	_FlagAddCount
 151                     	xref	_FlagAutoCount
 152                     	xref	_FlagValueCount
 153                     	xref	_BSP_Init
 154                     	xref	_SystemTimer
 155                     	xref	_AdcValue
 156                     	xref	_BuzzerOnTime
 157                     	xref	_sprintf
 158                     	switch	.const
 159  0008               L7:
 160  0008 2530347500    	dc.b	"%04u",0
 161                     	xref.b	c_x
 162                     	xref	c_lrzmp
 163                     	xref	c_lcmp
 164                     	xref	c_lsub
 165                     	xref	c_rtol
 166                     	xref	c_lumd
 167                     	xref	c_ltor
 168                     	xref	c_lgadc
 169                     	end
