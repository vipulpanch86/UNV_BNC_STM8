   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L5_UpdateRet:
  22  0000 00            	dc.b	0
  23  0001               L7_EnableRet:
  24  0001 00            	dc.b	0
  25                     ; 35 void RET_Init(void)
  25                     ; 36 {
  26                     	scross	off
  27                     	switch	.text
  28  0000               _RET_Init:
  30                     ; 37   BSP_ReadFromFlash(RET_MEM_SIZE, (uint8_t *)&RetentionMem[0]);
  31  0000 ae0000        	ldw	x,#L3_RetentionMem
  32  0003 89            	pushw	x
  33  0004 ae0040        	ldw	x,#64
  34  0007 cd0000        	call	_BSP_ReadFromFlash
  36  000a 725f0000      	clr	L5_UpdateRet
  37  000e 85            	popw	x
  38                     ; 38   UpdateRet = FALSE;
  39                     ; 39 }
  40  000f 81            	ret	
  42                     ; 46 void RET_ClearMemory(void)
  42                     ; 47 {
  43  0010               _RET_ClearMemory:
  44  0010 89            	pushw	x
  45       00000002      OFST:	set	2
  47                     ; 50   for(cnt = 0; cnt < (RET_MEM_SIZE / 4); cnt++)
  48  0011 5f            	clrw	x
  49  0012 1f01          	ldw	(OFST-1,sp),x
  50  0014               L11:
  51                     ; 52     RetentionMem[cnt] = 0;
  52  0014 58            	sllw	x
  53  0015 58            	sllw	x
  54  0016 4f            	clr	a
  55  0017 d70003        	ld	(L3_RetentionMem+3,x),a
  56  001a d70002        	ld	(L3_RetentionMem+2,x),a
  57  001d d70001        	ld	(L3_RetentionMem+1,x),a
  58  0020 d70000        	ld	(L3_RetentionMem,x),a
  59                     ; 50   for(cnt = 0; cnt < (RET_MEM_SIZE / 4); cnt++)
  60  0023 1e01          	ldw	x,(OFST-1,sp)
  61  0025 5c            	incw	x
  62  0026 1f01          	ldw	(OFST-1,sp),x
  64  0028 a30010        	cpw	x,#16
  65  002b 25e7          	jrult	L11
  66                     ; 55   UpdateRet = TRUE;
  67  002d 35010000      	mov	L5_UpdateRet,#1
  68                     ; 56 }
  69  0031 85            	popw	x
  70  0032 81            	ret	
  72                     ; 64 void RET_WriteMem(uint8_t idx, uint32_t *pData)
  72                     ; 65 {
  73  0033               _RET_WriteMem:
  74       ffffffff      OFST: set -1
  76                     ; 66   RetentionMem[idx]  = *pData;
  77  0033 1e03          	ldw	x,(OFST+4,sp)
  78  0035 905f          	clrw	y
  79  0037 9097          	ld	yl,a
  80  0039 9058          	sllw	y
  81  003b 9058          	sllw	y
  82  003d e603          	ld	a,(3,x)
  83  003f 90d70003      	ld	(L3_RetentionMem+3,y),a
  84  0043 e602          	ld	a,(2,x)
  85  0045 90d70002      	ld	(L3_RetentionMem+2,y),a
  86  0049 e601          	ld	a,(1,x)
  87  004b 90d70001      	ld	(L3_RetentionMem+1,y),a
  88  004f f6            	ld	a,(x)
  89  0050 90d70000      	ld	(L3_RetentionMem,y),a
  90                     ; 67   UpdateRet = TRUE;
  91  0054 35010000      	mov	L5_UpdateRet,#1
  92                     ; 68 }
  93  0058 81            	ret	
  95                     ; 76 void RET_ReadMem(uint8_t idx, uint32_t *pData)
  95                     ; 77 {
  96  0059               _RET_ReadMem:
  97       ffffffff      OFST: set -1
  99                     ; 78   *pData = RetentionMem[idx];
 100  0059 97            	ld	xl,a
 101  005a a604          	ld	a,#4
 102  005c 42            	mul	x,a
 103  005d 1603          	ldw	y,(OFST+4,sp)
 104  005f d60003        	ld	a,(L3_RetentionMem+3,x)
 105  0062 90e703        	ld	(3,y),a
 106  0065 d60002        	ld	a,(L3_RetentionMem+2,x)
 107  0068 90e702        	ld	(2,y),a
 108  006b d60001        	ld	a,(L3_RetentionMem+1,x)
 109  006e 90e701        	ld	(1,y),a
 110  0071 d60000        	ld	a,(L3_RetentionMem,x)
 111  0074 90f7          	ld	(y),a
 112                     ; 79 }
 113  0076 81            	ret	
 115                     ; 86 void RET_WriteRetEnbale(uint8_t enable)
 115                     ; 87 {
 116  0077               _RET_WriteRetEnbale:
 118                     ; 88   EnableRet = (uint8_t)(enable ? TRUE : FALSE);
 119  0077 4d            	tnz	a
 120  0078 2702          	jreq	L61
 121  007a a601          	ld	a,#1
 122  007c               L61:
 123  007c c70001        	ld	L7_EnableRet,a
 124                     ; 89 }
 125  007f 81            	ret	
 127                     ; 96 void RET_UpdateFlash(void)
 127                     ; 97 {
 128  0080               _RET_UpdateFlash:
 130                     ; 98   BSP_WriteToFlash(RET_MEM_SIZE, (uint8_t *)&RetentionMem[0]);
 131  0080 ae0000        	ldw	x,#L3_RetentionMem
 132  0083 89            	pushw	x
 133  0084 ae0040        	ldw	x,#64
 134  0087 cd0000        	call	_BSP_WriteToFlash
 136  008a 85            	popw	x
 137                     ; 99 }
 138  008b 81            	ret	
 140                     ; 106 void RET_Exec(void)
 140                     ; 107 {
 141  008c               _RET_Exec:
 143                     ; 108   if((UpdateRet == TRUE) && (EnableRet == TRUE))
 144  008c c60000        	ld	a,L5_UpdateRet
 145  008f 4a            	dec	a
 146  0090 2614          	jrne	L71
 148  0092 c60001        	ld	a,L7_EnableRet
 149  0095 4a            	dec	a
 150  0096 260e          	jrne	L71
 151                     ; 110     UpdateRet = FALSE;
 152  0098 c70000        	ld	L5_UpdateRet,a
 153                     ; 111     BSP_WriteToFlash(RET_MEM_SIZE, (uint8_t *)&RetentionMem[0]);
 154  009b ae0000        	ldw	x,#L3_RetentionMem
 155  009e 89            	pushw	x
 156  009f ae0040        	ldw	x,#64
 157  00a2 cd0000        	call	_BSP_WriteToFlash
 159  00a5 85            	popw	x
 160  00a6               L71:
 161                     ; 113 }
 162  00a6 81            	ret	
 164                     	switch	.bss
 165  0000               L3_RetentionMem:
 166  0000 000000000000  	ds.b	64
 167                     	xref	_TurretExecute
 168                     	xdef	_RET_Exec
 169                     	xdef	_RET_UpdateFlash
 170                     	xdef	_RET_WriteRetEnbale
 171                     	xdef	_RET_ReadMem
 172                     	xdef	_RET_WriteMem
 173                     	xdef	_RET_ClearMemory
 174                     	xdef	_RET_Init
 175                     	xref	_SensorCounter
 176                     	xref	_CounterMode
 177                     	xref	_FlagSensorEn
 178                     	xref	_FlagUvDetect
 179                     	xref	_FlagAddCount
 180                     	xref	_FlagAutoCount
 181                     	xref	_FlagValueCount
 182                     	xref	_BSP_WriteToFlash
 183                     	xref	_BSP_ReadFromFlash
 184                     	xref	_SystemTimer
 185                     	xref	_AdcValue
 186                     	xref	_BuzzerOnTime
 187                     	end
