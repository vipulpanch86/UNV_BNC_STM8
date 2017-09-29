   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L3_REG:
  22  0000 0003          	dc.w	3
  23  0002 00000001      	dc.l	1
  24  0006 0000270f      	dc.l	9999
  25  000a 00000064      	dc.l	100
  26  000e 0001          	dc.w	1
  27  0010 00000000      	dc.l	0
  28  0014 00000001      	dc.l	1
  29  0018 00000000      	dc.l	0
  30  001c 0007          	dc.w	7
  31  001e 00000000      	dc.l	0
  32  0022 00000001      	dc.l	1
  33  0026 00000001      	dc.l	1
  34  002a 000b          	dc.w	11
  35  002c 00000000      	dc.l	0
  36  0030 00000001      	dc.l	1
  37  0034 00000001      	dc.l	1
  38  0038 0001          	dc.w	1
  39  003a 00000000      	dc.l	0
  40  003e 3b9ac9ff      	dc.l	999999999
  41  0042 00000000      	dc.l	0
  42  0046 0001          	dc.w	1
  43  0048 00000001      	dc.l	1
  44  004c 000000c8      	dc.l	200
  45  0050 00000064      	dc.l	100
  46  0054 0001          	dc.w	1
  47  0056 00000001      	dc.l	1
  48  005a 000000fa      	dc.l	250
  49  005e 00000064      	dc.l	100
  50  0062 0000          	dc.w	0
  51  0064 00000001      	dc.l	1
  52  0068 00000064      	dc.l	100
  53  006c 00000064      	dc.l	100
  54  0070 0001          	dc.w	1
  55  0072 0000000a      	dc.l	10
  56  0076 000003e8      	dc.l	1000
  57  007a 000003e8      	dc.l	1000
  58  007e 000f          	dc.w	15
  59  0080 00000000      	dc.l	0
  60  0084 3b9ac9ff      	dc.l	999999999
  61  0088 00000000      	dc.l	0
  62  008c 0013          	dc.w	19
  63  008e 00000000      	dc.l	0
  64  0092 3b9ac9ff      	dc.l	999999999
  65  0096 00000000      	dc.l	0
  66  009a 0017          	dc.w	23
  67  009c 00000000      	dc.l	0
  68  00a0 3b9ac9ff      	dc.l	999999999
  69  00a4 00000000      	dc.l	0
  70  00a8 001b          	dc.w	27
  71  00aa 00000000      	dc.l	0
  72  00ae 3b9ac9ff      	dc.l	999999999
  73  00b2 00000000      	dc.l	0
  74  00b6 001f          	dc.w	31
  75  00b8 00000000      	dc.l	0
  76  00bc 3b9ac9ff      	dc.l	999999999
  77  00c0 00000000      	dc.l	0
  78  00c4 0001          	dc.w	1
  79  00c6 00000000      	dc.l	0
  80  00ca 0001869f      	dc.l	99999
  81  00ce 00000000      	dc.l	0
  82  00d2 0001          	dc.w	1
  83  00d4 00000000      	dc.l	0
  84  00d8 0001869f      	dc.l	99999
  85  00dc 00000000      	dc.l	0
  86  00e0 0001          	dc.w	1
  87  00e2 00000000      	dc.l	0
  88  00e6 0001869f      	dc.l	99999
  89  00ea 00000000      	dc.l	0
  90  00ee 0023          	dc.w	35
  91  00f0 00000001      	dc.l	1
  92  00f4 000000ff      	dc.l	255
  93  00f8 00000014      	dc.l	20
  94                     ; 209 void REG_Init(uint8_t initDefault)
  94                     ; 210 {
  95                     	scross	off
  96                     	switch	.text
  97  0000               _REG_Init:
  98  0000 88            	push	a
  99  0001 5205          	subw	sp,#5
 100       00000005      OFST:	set	5
 102                     ; 215   for(index = 0; index < REG_MAX_NB; index++)
 103  0003 4f            	clr	a
 104  0004 6b05          	ld	(OFST+0,sp),a
 105  0006               L7:
 106                     ; 219     if((REG[index].defVal <= REG[index].maxVal) &&
 106                     ; 220        (REG[index].defVal >= REG[index].minVal))
 107  0006 cd00a7        	call	LC002
 108  0009 1c000a        	addw	x,#L3_REG+10
 109  000c cd0000        	call	c_ltor
 111  000f 7b05          	ld	a,(OFST+0,sp)
 112  0011 cd00a7        	call	LC002
 113  0014 1c0006        	addw	x,#L3_REG+6
 114  0017 cd0000        	call	c_lcmp
 116  001a 2228          	jrugt	L51
 118  001c 7b05          	ld	a,(OFST+0,sp)
 119  001e cd00a7        	call	LC002
 120  0021 1c000a        	addw	x,#L3_REG+10
 121  0024 cd0000        	call	c_ltor
 123  0027 7b05          	ld	a,(OFST+0,sp)
 124  0029 ad7c          	call	LC002
 125  002b 1c0002        	addw	x,#L3_REG+2
 126  002e cd0000        	call	c_lcmp
 128  0031 2511          	jrult	L51
 129                     ; 222       value = REG[index].defVal;
 130  0033 7b05          	ld	a,(OFST+0,sp)
 131  0035 ad70          	call	LC002
 132  0037 9093          	ldw	y,x
 133  0039 de000c        	ldw	x,(L3_REG+12,x)
 134  003c 1f03          	ldw	(OFST-2,sp),x
 135  003e 93            	ldw	x,y
 136  003f de000a        	ldw	x,(L3_REG+10,x)
 138  0042 2003          	jra	L71
 139  0044               L51:
 140                     ; 226       value = 0;
 141  0044 5f            	clrw	x
 142  0045 1f03          	ldw	(OFST-2,sp),x
 143  0047               L71:
 144  0047 1f01          	ldw	(OFST-4,sp),x
 145                     ; 230     if(REG[index].ret == TRUE)
 146  0049 7b05          	ld	a,(OFST+0,sp)
 147  004b ad5a          	call	LC002
 148  004d d60001        	ld	a,(L3_REG+1,x)
 149  0050 a502          	bcp	a,#2
 150  0052 272b          	jreq	L12
 151                     ; 234       if(initDefault == TRUE)
 152  0054 7b06          	ld	a,(OFST+1,sp)
 153  0056 4a            	dec	a
 154  0057 96            	ldw	x,sp
 155  0058 2613          	jrne	L32
 156                     ; 236         RET_WriteMem((uint8_t)REG[index].retAddr, &value);
 157  005a 1c0001        	addw	x,#OFST-4
 158  005d 89            	pushw	x
 159  005e 7b07          	ld	a,(OFST+2,sp)
 160  0060 ad45          	call	LC002
 161  0062 de0000        	ldw	x,(L3_REG,x)
 162  0065 54            	srlw	x
 163  0066 54            	srlw	x
 164  0067 01            	rrwa	x,a
 165                     
 166  0068 cd0000        	call	_RET_WriteMem
 169  006b 2011          	jp	LC001
 170  006d               L32:
 171                     ; 240         RET_ReadMem((uint8_t)REG[index].retAddr, &value);
 172  006d 1c0001        	addw	x,#OFST-4
 173  0070 89            	pushw	x
 174  0071 7b07          	ld	a,(OFST+2,sp)
 175  0073 ad32          	call	LC002
 176  0075 de0000        	ldw	x,(L3_REG,x)
 177  0078 54            	srlw	x
 178  0079 54            	srlw	x
 179  007a 01            	rrwa	x,a
 180                     
 181  007b cd0000        	call	_RET_ReadMem
 183  007e               LC001:
 184  007e 85            	popw	x
 185  007f               L12:
 186                     ; 244     RegisterBuff[index] = value;
 187  007f 7b05          	ld	a,(OFST+0,sp)
 188  0081 97            	ld	xl,a
 189  0082 a604          	ld	a,#4
 190  0084 42            	mul	x,a
 191  0085 7b04          	ld	a,(OFST-1,sp)
 192  0087 d70003        	ld	(L5_RegisterBuff+3,x),a
 193  008a 7b03          	ld	a,(OFST-2,sp)
 194  008c d70002        	ld	(L5_RegisterBuff+2,x),a
 195  008f 7b02          	ld	a,(OFST-3,sp)
 196  0091 d70001        	ld	(L5_RegisterBuff+1,x),a
 197  0094 7b01          	ld	a,(OFST-4,sp)
 198  0096 d70000        	ld	(L5_RegisterBuff,x),a
 199                     ; 215   for(index = 0; index < REG_MAX_NB; index++)
 200  0099 0c05          	inc	(OFST+0,sp)
 202  009b 7b05          	ld	a,(OFST+0,sp)
 203  009d a112          	cp	a,#18
 204  009f 2403cc0006    	jrult	L7
 205                     ; 246 }
 206  00a4 5b06          	addw	sp,#6
 207  00a6 81            	ret	
 208  00a7               LC002:
 209  00a7 97            	ld	xl,a
 210  00a8 a60e          	ld	a,#14
 211  00aa 42            	mul	x,a
 212  00ab 81            	ret	
 214                     ; 254 uint8_t REG_SetValue(uint32_t *pValue, uint8_t index)
 214                     ; 255 {
 215  00ac               _REG_SetValue:
 216  00ac 89            	pushw	x
 217       00000000      OFST:	set	0
 219                     ; 257   if(index < REG_MAX_NB)
 220  00ad 7b05          	ld	a,(OFST+5,sp)
 221  00af a112          	cp	a,#18
 222  00b1 246e          	jruge	L72
 223                     ; 260     if(REG[index].rw == TRUE)
 224  00b3 ad6f          	call	LC003
 225  00b5 d60001        	ld	a,(L3_REG+1,x)
 226  00b8 a501          	bcp	a,#1
 227  00ba 2765          	jreq	L72
 228                     ; 263       if((*pValue <= REG[index].maxVal) &&
 228                     ; 264          (*pValue >= REG[index].minVal))
 229  00bc 1e01          	ldw	x,(OFST+1,sp)
 230  00be cd0000        	call	c_ltor
 232  00c1 7b05          	ld	a,(OFST+5,sp)
 233  00c3 ad5f          	call	LC003
 234  00c5 1c0006        	addw	x,#L3_REG+6
 235  00c8 cd0000        	call	c_lcmp
 237  00cb 2254          	jrugt	L72
 239  00cd 1e01          	ldw	x,(OFST+1,sp)
 240  00cf cd0000        	call	c_ltor
 242  00d2 7b05          	ld	a,(OFST+5,sp)
 243  00d4 ad4e          	call	LC003
 244  00d6 1c0002        	addw	x,#L3_REG+2
 245  00d9 cd0000        	call	c_lcmp
 247  00dc 2543          	jrult	L72
 248                     ; 267         RegisterBuff[index] = *pValue;
 249  00de 1e01          	ldw	x,(OFST+1,sp)
 250  00e0 7b05          	ld	a,(OFST+5,sp)
 251  00e2 905f          	clrw	y
 252  00e4 9097          	ld	yl,a
 253  00e6 9058          	sllw	y
 254  00e8 9058          	sllw	y
 255  00ea e603          	ld	a,(3,x)
 256  00ec 90d70003      	ld	(L5_RegisterBuff+3,y),a
 257  00f0 e602          	ld	a,(2,x)
 258  00f2 90d70002      	ld	(L5_RegisterBuff+2,y),a
 259  00f6 e601          	ld	a,(1,x)
 260  00f8 90d70001      	ld	(L5_RegisterBuff+1,y),a
 261  00fc f6            	ld	a,(x)
 262  00fd 90d70000      	ld	(L5_RegisterBuff,y),a
 263                     ; 270         if(REG[index].ret == TRUE)
 264  0101 7b05          	ld	a,(OFST+5,sp)
 265  0103 ad1f          	call	LC003
 266  0105 d60001        	ld	a,(L3_REG+1,x)
 267  0108 a502          	bcp	a,#2
 268  010a 2711          	jreq	L53
 269                     ; 272           RET_WriteMem((uint8_t)REG[index].retAddr, pValue);
 270  010c 1e01          	ldw	x,(OFST+1,sp)
 271  010e 89            	pushw	x
 272  010f 7b07          	ld	a,(OFST+7,sp)
 273  0111 ad11          	call	LC003
 274  0113 de0000        	ldw	x,(L3_REG,x)
 275  0116 54            	srlw	x
 276  0117 54            	srlw	x
 277  0118 01            	rrwa	x,a
 278                     
 279  0119 cd0000        	call	_RET_WriteMem
 281  011c 85            	popw	x
 282  011d               L53:
 283                     ; 275         return TRUE;
 284  011d a601          	ld	a,#1
 286  011f 2001          	jra	L41
 287  0121               L72:
 288                     ; 280   return FALSE;
 289  0121 4f            	clr	a
 291  0122               L41:
 292  0122 85            	popw	x
 293  0123 81            	ret	
 294  0124               LC003:
 295  0124 97            	ld	xl,a
 296  0125 a60e          	ld	a,#14
 297  0127 42            	mul	x,a
 298  0128 81            	ret	
 300                     ; 289 uint8_t REG_GetValue(uint32_t *pValue, uint8_t index)
 300                     ; 290 {
 301  0129               _REG_GetValue:
 302  0129 89            	pushw	x
 303       00000000      OFST:	set	0
 305                     ; 292   if(index < REG_MAX_NB)
 306  012a 7b05          	ld	a,(OFST+5,sp)
 307  012c a112          	cp	a,#18
 308  012e 2421          	jruge	L73
 309                     ; 295     *pValue = RegisterBuff[index];
 310  0130 97            	ld	xl,a
 311  0131 a604          	ld	a,#4
 312  0133 42            	mul	x,a
 313  0134 1601          	ldw	y,(OFST+1,sp)
 314  0136 d60003        	ld	a,(L5_RegisterBuff+3,x)
 315  0139 90e703        	ld	(3,y),a
 316  013c d60002        	ld	a,(L5_RegisterBuff+2,x)
 317  013f 90e702        	ld	(2,y),a
 318  0142 d60001        	ld	a,(L5_RegisterBuff+1,x)
 319  0145 90e701        	ld	(1,y),a
 320  0148 d60000        	ld	a,(L5_RegisterBuff,x)
 321  014b 90f7          	ld	(y),a
 322                     ; 297     return TRUE;
 323  014d a601          	ld	a,#1
 325  014f 2001          	jra	L02
 326  0151               L73:
 327                     ; 300   return FALSE;
 328  0151 4f            	clr	a
 330  0152               L02:
 331  0152 85            	popw	x
 332  0153 81            	ret	
 334                     ; 309 uint8_t REG_GetMinValue(uint32_t *pValue, uint8_t index)
 334                     ; 310 {
 335  0154               _REG_GetMinValue:
 336  0154 89            	pushw	x
 337       00000000      OFST:	set	0
 339                     ; 312   if(index < REG_MAX_NB)
 340  0155 7b05          	ld	a,(OFST+5,sp)
 341  0157 a112          	cp	a,#18
 342  0159 2421          	jruge	L14
 343                     ; 315     *pValue = REG[index].minVal;
 344  015b 97            	ld	xl,a
 345  015c a60e          	ld	a,#14
 346  015e 42            	mul	x,a
 347  015f 1601          	ldw	y,(OFST+1,sp)
 348  0161 d60005        	ld	a,(L3_REG+5,x)
 349  0164 90e703        	ld	(3,y),a
 350  0167 d60004        	ld	a,(L3_REG+4,x)
 351  016a 90e702        	ld	(2,y),a
 352  016d d60003        	ld	a,(L3_REG+3,x)
 353  0170 90e701        	ld	(1,y),a
 354  0173 d60002        	ld	a,(L3_REG+2,x)
 355  0176 90f7          	ld	(y),a
 356                     ; 316     return TRUE;
 357  0178 a601          	ld	a,#1
 359  017a 2001          	jra	L42
 360  017c               L14:
 361                     ; 319   return FALSE;
 362  017c 4f            	clr	a
 364  017d               L42:
 365  017d 85            	popw	x
 366  017e 81            	ret	
 368                     ; 328 uint8_t REG_GetMaxValue(uint32_t *pValue, uint8_t index)
 368                     ; 329 {
 369  017f               _REG_GetMaxValue:
 370  017f 89            	pushw	x
 371       00000000      OFST:	set	0
 373                     ; 331   if(index < REG_MAX_NB)
 374  0180 7b05          	ld	a,(OFST+5,sp)
 375  0182 a112          	cp	a,#18
 376  0184 2421          	jruge	L34
 377                     ; 334     *pValue = REG[index].maxVal;
 378  0186 97            	ld	xl,a
 379  0187 a60e          	ld	a,#14
 380  0189 42            	mul	x,a
 381  018a 1601          	ldw	y,(OFST+1,sp)
 382  018c d60009        	ld	a,(L3_REG+9,x)
 383  018f 90e703        	ld	(3,y),a
 384  0192 d60008        	ld	a,(L3_REG+8,x)
 385  0195 90e702        	ld	(2,y),a
 386  0198 d60007        	ld	a,(L3_REG+7,x)
 387  019b 90e701        	ld	(1,y),a
 388  019e d60006        	ld	a,(L3_REG+6,x)
 389  01a1 90f7          	ld	(y),a
 390                     ; 335     return TRUE;
 391  01a3 a601          	ld	a,#1
 393  01a5 2001          	jra	L03
 394  01a7               L34:
 395                     ; 338   return FALSE;
 396  01a7 4f            	clr	a
 398  01a8               L03:
 399  01a8 85            	popw	x
 400  01a9 81            	ret	
 402                     	switch	.bss
 403  0000               L5_RegisterBuff:
 404  0000 000000000000  	ds.b	72
 405                     	xref	_TurretExecute
 406                     	xdef	_REG_GetMaxValue
 407                     	xdef	_REG_GetMinValue
 408                     	xdef	_REG_GetValue
 409                     	xdef	_REG_SetValue
 410                     	xdef	_REG_Init
 411                     	xref	_RET_ReadMem
 412                     	xref	_RET_WriteMem
 413                     	xref	_SensorCounter
 414                     	xref	_CounterMode
 415                     	xref	_FlagSensorEn
 416                     	xref	_FlagUvDetect
 417                     	xref	_FlagAddCount
 418                     	xref	_FlagAutoCount
 419                     	xref	_FlagValueCount
 420                     	xref	_SystemTimer
 421                     	xref	_AdcValue
 422                     	xref	_BuzzerOnTime
 423                     	xref	c_lcmp
 424                     	xref	c_ltor
 425                     	end
