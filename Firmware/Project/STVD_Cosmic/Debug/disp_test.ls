   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_counter:
  22  0000 00000000      	dc.l	0
  23                     .const:	section	.text
  24  0000               L21:
  25  0000 00002710      	dc.l	10000
  26  0004               L61:
  27  0004 00989680      	dc.l	10000000
  28                     ; 25 void DISP_Update(void)
  28                     ; 26 {
  29                     	scross	off
  30                     	switch	.text
  31  0000               _DISP_Update:
  32  0000 5224          	subw	sp,#36
  33       00000024      OFST:	set	36
  35                     ; 30   sprintf(buffer, "%07u", (uint32_t)counter);
  36  0002 ce0002        	ldw	x,L3_counter+2
  37  0005 89            	pushw	x
  38  0006 ce0000        	ldw	x,L3_counter
  39  0009 89            	pushw	x
  40  000a ae001e        	ldw	x,#L5
  41  000d 89            	pushw	x
  42  000e 96            	ldw	x,sp
  43  000f 1c000b        	addw	x,#OFST-25
  44  0012 cd0000        	call	_sprintf
  46  0015 5b06          	addw	sp,#6
  47                     ; 33   DISP_UpperPutStr("HELLO W", 0);
  48  0017 4b00          	push	#0
  49  0019 ae0016        	ldw	x,#L7
  50  001c cd0000        	call	_DISP_UpperPutStr
  52  001f ae0000        	ldw	x,#L3_counter
  53  0022 84            	pop	a
  54                     ; 35   sprintf(buffer, "%04u", (uint32_t)(10000 - (counter%10000)));
  55  0023 cd0000        	call	c_ltor
  57  0026 ae0000        	ldw	x,#L21
  58  0029 cd0000        	call	c_lumd
  60  002c 96            	ldw	x,sp
  61  002d 5c            	incw	x
  62  002e cd0000        	call	c_rtol
  64  0031 ae2710        	ldw	x,#10000
  65  0034 bf02          	ldw	c_lreg+2,x
  66  0036 5f            	clrw	x
  67  0037 bf00          	ldw	c_lreg,x
  68  0039 96            	ldw	x,sp
  69  003a 5c            	incw	x
  70  003b cd0000        	call	c_lsub
  72  003e be02          	ldw	x,c_lreg+2
  73  0040 89            	pushw	x
  74  0041 be00          	ldw	x,c_lreg
  75  0043 89            	pushw	x
  76  0044 ae0011        	ldw	x,#L11
  77  0047 89            	pushw	x
  78  0048 96            	ldw	x,sp
  79  0049 1c000b        	addw	x,#OFST-25
  80  004c cd0000        	call	_sprintf
  82  004f 5b06          	addw	sp,#6
  83                     ; 37   DISP_LowerPutStr("ORLD", 0);
  84  0051 4b00          	push	#0
  85  0053 ae000c        	ldw	x,#L31
  86  0056 cd0000        	call	_DISP_LowerPutStr
  88  0059 ae0000        	ldw	x,#L3_counter
  89  005c 84            	pop	a
  90                     ; 40   counter++;
  91  005d a601          	ld	a,#1
  92  005f cd0000        	call	c_lgadc
  94                     ; 41   counter %= 10000000;
  95  0062 cd0000        	call	c_ltor
  97  0065 ae0004        	ldw	x,#L61
  98  0068 cd0000        	call	c_lumd
 100  006b ae0000        	ldw	x,#L3_counter
 101  006e cd0000        	call	c_rtol
 103                     ; 42 }
 104  0071 5b24          	addw	sp,#36
 105  0073 81            	ret	
 107                     	switch	.data
 108  0004               L51_BkupDispExecTime:
 109  0004 00000000      	dc.l	0
 110  0008               L71_BkupDispUpdateTime:
 111  0008 00000000      	dc.l	0
 112                     	switch	.const
 113  0008               L62:
 114  0008 0000000a      	dc.l	10
 115                     ; 49 void disp_test(void)
 115                     ; 50 {
 116                     	switch	.text
 117  0074               _disp_test:
 118  0074 5204          	subw	sp,#4
 119       00000004      OFST:	set	4
 121                     ; 52   BSP_Init();
 122  0076 cd0000        	call	_BSP_Init
 124                     ; 53   DISP_Init(1);
 125  0079 a601          	ld	a,#1
 126  007b cd0000        	call	_DISP_Init
 128  007e               L32:
 129                     ; 328   return SystemTimer;
 130  007e ce0002        	ldw	x,_SystemTimer+2
 131  0081 1f03          	ldw	(OFST-1,sp),x
 132  0083 ce0000        	ldw	x,_SystemTimer
 133  0086 1f01          	ldw	(OFST-3,sp),x
 136                     ; 62     if((sysTime - BkupDispUpdateTime) >= 10)
 137  0088 96            	ldw	x,sp
 138  0089 5c            	incw	x
 139  008a cd0000        	call	c_ltor
 141  008d ae0008        	ldw	x,#L71_BkupDispUpdateTime
 142  0090 cd0000        	call	c_lsub
 144  0093 ae0008        	ldw	x,#L62
 145  0096 cd0000        	call	c_lcmp
 147  0099 250d          	jrult	L72
 148                     ; 64       BkupDispUpdateTime = sysTime;
 149  009b 1e03          	ldw	x,(OFST-1,sp)
 150  009d cf000a        	ldw	L71_BkupDispUpdateTime+2,x
 151  00a0 1e01          	ldw	x,(OFST-3,sp)
 152  00a2 cf0008        	ldw	L71_BkupDispUpdateTime,x
 153                     ; 65       DISP_Update();
 154  00a5 cd0000        	call	_DISP_Update
 156  00a8               L72:
 157                     ; 68     if((sysTime - BkupDispExecTime) >= 1)
 158  00a8 96            	ldw	x,sp
 159  00a9 5c            	incw	x
 160  00aa cd0000        	call	c_ltor
 162  00ad ae0004        	ldw	x,#L51_BkupDispExecTime
 163  00b0 cd0000        	call	c_lsub
 165  00b3 cd0000        	call	c_lrzmp
 167  00b6 27c6          	jreq	L32
 168                     ; 70       BkupDispExecTime = sysTime;
 169  00b8 1e03          	ldw	x,(OFST-1,sp)
 170  00ba cf0006        	ldw	L51_BkupDispExecTime+2,x
 171  00bd 1e01          	ldw	x,(OFST-3,sp)
 172  00bf cf0004        	ldw	L51_BkupDispExecTime,x
 173                     ; 71       DISP_Exec();
 174  00c2 cd0000        	call	_DISP_Exec
 176  00c5 20b7          	jra	L32
 178                     	xdef	_disp_test
 179                     	xdef	_DISP_Update
 180                     	xref	_TurretExecute
 181                     	xref	_DISP_Exec
 182                     	xref	_DISP_UpperPutStr
 183                     	xref	_DISP_LowerPutStr
 184                     	xref	_DISP_Init
 185                     	xref	_SensorCounter
 186                     	xref	_CounterMode
 187                     	xref	_FlagSensorEn
 188                     	xref	_FlagUvDetect
 189                     	xref	_FlagAddCount
 190                     	xref	_FlagAutoCount
 191                     	xref	_FlagValueCount
 192                     	xref	_BSP_Init
 193                     	xref	_SystemTimer
 194                     	xref	_AdcValue
 195                     	xref	_BuzzerOnTime
 196                     	xref	_sprintf
 197                     	switch	.const
 198  000c               L31:
 199  000c 4f524c4400    	dc.b	"ORLD",0
 200  0011               L11:
 201  0011 2530347500    	dc.b	"%04u",0
 202  0016               L7:
 203  0016 48454c4c4f20  	dc.b	"HELLO W",0
 204  001e               L5:
 205  001e 2530377500    	dc.b	"%07u",0
 206                     	xref.b	c_lreg
 207                     	xref.b	c_x
 208                     	xref	c_lrzmp
 209                     	xref	c_lcmp
 210                     	xref	c_lgadc
 211                     	xref	c_lsub
 212                     	xref	c_rtol
 213                     	xref	c_lumd
 214                     	xref	c_ltor
 215                     	end
