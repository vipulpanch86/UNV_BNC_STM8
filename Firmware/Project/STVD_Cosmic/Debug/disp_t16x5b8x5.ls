   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L7_MS_GPIO_PIN:
  22  0000 0010          	dc.w	16
  23  0002 0000          	dc.w	0
  24  0004 0000          	dc.w	0
  25  0006 0000          	dc.w	0
  26  0008 0000          	dc.w	0
  27  000a 0008          	dc.w	8
  28  000c 0000          	dc.w	0
  29  000e 0000          	dc.w	0
  30  0010 0010          	dc.w	16
  31  0012 0008          	dc.w	8
  32  0014 0000          	dc.w	0
  33  0016 0000          	dc.w	0
  34  0018 0000          	dc.w	0
  35  001a 0000          	dc.w	0
  36  001c 0004          	dc.w	4
  37  001e 0000          	dc.w	0
  38  0020 0010          	dc.w	16
  39  0022 0000          	dc.w	0
  40  0024 0004          	dc.w	4
  41  0026 0000          	dc.w	0
  42  0028 0000          	dc.w	0
  43  002a 0008          	dc.w	8
  44  002c 0004          	dc.w	4
  45  002e 0000          	dc.w	0
  46  0030 0010          	dc.w	16
  47  0032 0008          	dc.w	8
  48  0034 0004          	dc.w	4
  49  0036 0000          	dc.w	0
  50  0038 0000          	dc.w	0
  51  003a 0000          	dc.w	0
  52  003c 0000          	dc.w	0
  53  003e 0010          	dc.w	16
  54  0040 0010          	dc.w	16
  55  0042 0000          	dc.w	0
  56  0044 0000          	dc.w	0
  57  0046 0010          	dc.w	16
  58  0048 0000          	dc.w	0
  59  004a 0008          	dc.w	8
  60  004c 0000          	dc.w	0
  61  004e 0010          	dc.w	16
  62  0050               L11_TURR_GPIO_PIN:
  63  0050 0010          	dc.w	16
  64  0052 0000          	dc.w	0
  65  0054 0000          	dc.w	0
  66  0056 0000          	dc.w	0
  67  0058 0000          	dc.w	0
  68  005a 0020          	dc.w	32
  69  005c 0000          	dc.w	0
  70  005e 0000          	dc.w	0
  71  0060 0000          	dc.w	0
  72  0062 0000          	dc.w	0
  73  0064 0040          	dc.w	64
  74  0066 0000          	dc.w	0
  75  0068 0000          	dc.w	0
  76  006a 0000          	dc.w	0
  77  006c 0000          	dc.w	0
  78  006e 0080          	dc.w	128
  79  0070               L31_LED_BITMAP:
  80  0070 0001          	dc.w	1
  81  0072 0002          	dc.w	2
  82  0074 0004          	dc.w	4
  83  0076 0008          	dc.w	8
  84  0078 0010          	dc.w	16
  85  007a 0020          	dc.w	32
  86  007c 0040          	dc.w	64
  87  007e 0080          	dc.w	128
  88  0080 0000          	dc.w	0
  89  0082 0100          	dc.w	256
  90  0084 0200          	dc.w	512
  91  0086 0400          	dc.w	1024
  92  0088 0800          	dc.w	2048
  93  008a 1000          	dc.w	4096
  94  008c 2000          	dc.w	8192
  95  008e               _DispInfoT16x5B8x4:
  96  008e 01            	dc.b	1
  97  008f 05            	dc.b	5
  98  0090 00            	dc.b	0
  99  0091 04            	dc.b	4
 100  0092 0070          	dc.w	L31_LED_BITMAP
 101  0094 00a1          	dc.w	L51
 102  0096 009c          	dc.w	L71
 104  0098 0000          	dc.w	L3_DispInit
 106  009a 00d2          	dc.w	L5_DispWrite
 107                     ; 143 static void DispInit(void)
 107                     ; 144 {
 108                     	scross	off
 109                     	switch	.text
 110  0000               L3_DispInit:
 112                     ; 148 	GPIO_Init(DISP_DB0_GPIO_PORT, DISP_DB0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 113  0000 4bc0          	push	#192
 114  0002 4b01          	push	#1
 115  0004 ae500f        	ldw	x,#20495
 116  0007 cd0000        	call	_GPIO_Init
 118  000a 85            	popw	x
 119                     ; 149   GPIO_Init(DISP_DB1_GPIO_PORT, DISP_DB1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 120  000b 4bc0          	push	#192
 121  000d 4b02          	push	#2
 122  000f ae500f        	ldw	x,#20495
 123  0012 cd0000        	call	_GPIO_Init
 125  0015 85            	popw	x
 126                     ; 150   GPIO_Init(DISP_DB2_GPIO_PORT, DISP_DB2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 127  0016 4bc0          	push	#192
 128  0018 4b04          	push	#4
 129  001a ae500f        	ldw	x,#20495
 130  001d cd0000        	call	_GPIO_Init
 132  0020 85            	popw	x
 133                     ; 151   GPIO_Init(DISP_DB3_GPIO_PORT, DISP_DB3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 134  0021 4bc0          	push	#192
 135  0023 4b08          	push	#8
 136  0025 ae500f        	ldw	x,#20495
 137  0028 cd0000        	call	_GPIO_Init
 139  002b 85            	popw	x
 140                     ; 152   GPIO_Init(DISP_DB4_GPIO_PORT, DISP_DB4_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 141  002c 4bc0          	push	#192
 142  002e 4b10          	push	#16
 143  0030 ae500f        	ldw	x,#20495
 144  0033 cd0000        	call	_GPIO_Init
 146  0036 85            	popw	x
 147                     ; 153   GPIO_Init(DISP_DB5_GPIO_PORT, DISP_DB5_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 148  0037 4bc0          	push	#192
 149  0039 4b20          	push	#32
 150  003b ae500f        	ldw	x,#20495
 151  003e cd0000        	call	_GPIO_Init
 153  0041 85            	popw	x
 154                     ; 154   GPIO_Init(DISP_DB6_GPIO_PORT, DISP_DB6_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 155  0042 4bc0          	push	#192
 156  0044 4b40          	push	#64
 157  0046 ae500f        	ldw	x,#20495
 158  0049 cd0000        	call	_GPIO_Init
 160  004c 85            	popw	x
 161                     ; 155   GPIO_Init(DISP_DB7_GPIO_PORT, DISP_DB7_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 162  004d 4bc0          	push	#192
 163  004f 4b80          	push	#128
 164  0051 ae500f        	ldw	x,#20495
 165  0054 cd0000        	call	_GPIO_Init
 167  0057 85            	popw	x
 168                     ; 160   GPIO_Init(DISP_LOE_GPIO_PORT, DISP_LOE_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 169  0058 4bd0          	push	#208
 170  005a 4b01          	push	#1
 171  005c ae501e        	ldw	x,#20510
 172  005f cd0000        	call	_GPIO_Init
 174  0062 85            	popw	x
 175                     ; 165   GPIO_Init(DISP_LE0_GPIO_PORT, DISP_LE0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 176  0063 4bc0          	push	#192
 177  0065 4b02          	push	#2
 178  0067 ae501e        	ldw	x,#20510
 179  006a cd0000        	call	_GPIO_Init
 181  006d 85            	popw	x
 182                     ; 166   GPIO_Init(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 183  006e 4bc0          	push	#192
 184  0070 4b04          	push	#4
 185  0072 ae500a        	ldw	x,#20490
 186  0075 cd0000        	call	_GPIO_Init
 188  0078 85            	popw	x
 189                     ; 171   GPIO_Init(DISP_MS0_GPIO_PORT, DISP_MS0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 190  0079 4bc0          	push	#192
 191  007b 4b10          	push	#16
 192  007d ae501e        	ldw	x,#20510
 193  0080 cd0000        	call	_GPIO_Init
 195  0083 85            	popw	x
 196                     ; 172   GPIO_Init(DISP_MS1_GPIO_PORT, DISP_MS1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 197  0084 4bc0          	push	#192
 198  0086 4b08          	push	#8
 199  0088 ae501e        	ldw	x,#20510
 200  008b cd0000        	call	_GPIO_Init
 202  008e 85            	popw	x
 203                     ; 173   GPIO_Init(DISP_MS2_GPIO_PORT, DISP_MS2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 204  008f 4bc0          	push	#192
 205  0091 4b04          	push	#4
 206  0093 ae501e        	ldw	x,#20510
 207  0096 cd0000        	call	_GPIO_Init
 209  0099 85            	popw	x
 210                     ; 174   GPIO_Init(DISP_MS3_GPIO_PORT, DISP_MS3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 211  009a 4bc0          	push	#192
 212  009c 4b10          	push	#16
 213  009e ae500a        	ldw	x,#20490
 214  00a1 cd0000        	call	_GPIO_Init
 216  00a4 85            	popw	x
 217                     ; 179   GPIO_Init(TURR_DIG0_GPIO_PORT, TURR_DIG0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 218  00a5 4bd0          	push	#208
 219  00a7 4b10          	push	#16
 220  00a9 ae5019        	ldw	x,#20505
 221  00ac cd0000        	call	_GPIO_Init
 223  00af 85            	popw	x
 224                     ; 180   GPIO_Init(TURR_DIG1_GPIO_PORT, TURR_DIG1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 225  00b0 4bd0          	push	#208
 226  00b2 4b20          	push	#32
 227  00b4 ae5019        	ldw	x,#20505
 228  00b7 cd0000        	call	_GPIO_Init
 230  00ba 85            	popw	x
 231                     ; 181   GPIO_Init(TURR_DIG2_GPIO_PORT, TURR_DIG2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 232  00bb 4bd0          	push	#208
 233  00bd 4b40          	push	#64
 234  00bf ae5019        	ldw	x,#20505
 235  00c2 cd0000        	call	_GPIO_Init
 237  00c5 85            	popw	x
 238                     ; 182   GPIO_Init(TURR_DIG3_GPIO_PORT, TURR_DIG3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 239  00c6 4bd0          	push	#208
 240  00c8 4b80          	push	#128
 241  00ca ae5019        	ldw	x,#20505
 242  00cd cd0000        	call	_GPIO_Init
 244  00d0 85            	popw	x
 245                     ; 183 }
 246  00d1 81            	ret	
 248                     ; 191 static void DispWrite(uint8_t dispNo, volatile uint16_t data)
 248                     ; 192 {
 249  00d2               L5_DispWrite:
 250  00d2 88            	push	a
 251  00d3 88            	push	a
 252       00000001      OFST:	set	1
 254                     ; 193   volatile uint8_t data8bit = 0;
 255  00d4 0f01          	clr	(OFST+0,sp)
 256                     ; 196   TURR_DIG0_GPIO_PORT->ODR |= TURR_DIG0_GPIO_PIN;
 257  00d6 72185019      	bset	20505,#4
 258                     ; 197   TURR_DIG1_GPIO_PORT->ODR |= TURR_DIG1_GPIO_PIN;
 259  00da 721a5019      	bset	20505,#5
 260                     ; 198   TURR_DIG2_GPIO_PORT->ODR |= TURR_DIG2_GPIO_PIN;
 261  00de 721c5019      	bset	20505,#6
 262                     ; 199   TURR_DIG3_GPIO_PORT->ODR |= TURR_DIG3_GPIO_PIN;
 263  00e2 721e5019      	bset	20505,#7
 264                     ; 202   DISP_LOE_GPIO_PORT->ODR |= (uint8_t)DISP_LOE_GPIO_PIN;
 265  00e6 7210501e      	bset	20510,#0
 266                     ; 205   if(dispNo < MAX_SEL)
 267  00ea a10a          	cp	a,#10
 268  00ec 2462          	jruge	L12
 269                     ; 209     data8bit = (uint8_t)((data >> 0) & 0xFF);
 270  00ee 7b06          	ld	a,(OFST+5,sp)
 271  00f0 6b01          	ld	(OFST+0,sp),a
 272                     ; 210     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 273  00f2 7b01          	ld	a,(OFST+0,sp)
 274  00f4 c7500f        	ld	20495,a
 275                     ; 213     DISP_LE0_GPIO_PORT->ODR |= DISP_LE0_GPIO_PIN;
 276  00f7 7212501e      	bset	20510,#1
 277                     ; 214     DISP_LE0_GPIO_PORT->ODR &= ~DISP_LE0_GPIO_PIN;
 278  00fb 7213501e      	bres	20510,#1
 279                     ; 217     data8bit = (uint8_t)((data >> 8) & 0xFF);
 280  00ff 7b05          	ld	a,(OFST+4,sp)
 281  0101 6b01          	ld	(OFST+0,sp),a
 282                     ; 218     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 283  0103 7b01          	ld	a,(OFST+0,sp)
 284  0105 c7500f        	ld	20495,a
 285                     ; 221     DISP_LE1_GPIO_PORT->ODR |= DISP_LE1_GPIO_PIN;
 286  0108 7214500a      	bset	20490,#2
 287                     ; 222     DISP_LE1_GPIO_PORT->ODR &= ~DISP_LE1_GPIO_PIN;
 288  010c 7215500a      	bres	20490,#2
 289                     ; 225     DISP_MS3_GPIO_PORT->ODR &= ~DISP_MS3_GPIO_PIN;
 290  0110 7219500a      	bres	20490,#4
 291                     ; 226     DISP_MS3_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][3];
 292  0114 7b02          	ld	a,(OFST+1,sp)
 293  0116 97            	ld	xl,a
 294  0117 a608          	ld	a,#8
 295  0119 42            	mul	x,a
 296  011a c6500a        	ld	a,20490
 297  011d da0007        	or	a,(L7_MS_GPIO_PIN+7,x)
 298  0120 c7500a        	ld	20490,a
 299                     ; 228     DISP_MS2_GPIO_PORT->ODR &= ~DISP_MS2_GPIO_PIN;
 300  0123 7215501e      	bres	20510,#2
 301                     ; 229     DISP_MS2_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][2];
 302  0127 c6501e        	ld	a,20510
 303  012a da0005        	or	a,(L7_MS_GPIO_PIN+5,x)
 304  012d c7501e        	ld	20510,a
 305                     ; 231     DISP_MS1_GPIO_PORT->ODR &= ~DISP_MS1_GPIO_PIN;
 306  0130 7217501e      	bres	20510,#3
 307                     ; 232     DISP_MS1_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][1];
 308  0134 c6501e        	ld	a,20510
 309  0137 da0003        	or	a,(L7_MS_GPIO_PIN+3,x)
 310  013a c7501e        	ld	20510,a
 311                     ; 234     DISP_MS0_GPIO_PORT->ODR &= ~DISP_MS0_GPIO_PIN;
 312  013d 7219501e      	bres	20510,#4
 313                     ; 235     DISP_MS0_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][0];
 314  0141 c6501e        	ld	a,20510
 315  0144 da0001        	or	a,(L7_MS_GPIO_PIN+1,x)
 316  0147 c7501e        	ld	20510,a
 317                     ; 238     DISP_LOE_GPIO_PORT->ODR &= ~DISP_LOE_GPIO_PIN;
 318  014a 7211501e      	bres	20510,#0
 320  014e 202d          	jra	L32
 321  0150               L12:
 322                     ; 241   else if(dispNo < (MAX_SEL + DISP_TURRET_MAX_SEL))
 323  0150 7b02          	ld	a,(OFST+1,sp)
 324  0152 a10e          	cp	a,#14
 325  0154 2427          	jruge	L32
 326                     ; 244     dispNo -= MAX_SEL;
 327  0156 a00a          	sub	a,#10
 328  0158 6b02          	ld	(OFST+1,sp),a
 329                     ; 247     data8bit = (uint8_t)((data >> 0) & 0xFF);
 330  015a 7b06          	ld	a,(OFST+5,sp)
 331  015c 6b01          	ld	(OFST+0,sp),a
 332                     ; 248     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 333  015e 7b01          	ld	a,(OFST+0,sp)
 334  0160 c7500f        	ld	20495,a
 335                     ; 251     TURR_DIG0_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][0];
 336  0163 7b02          	ld	a,(OFST+1,sp)
 337  0165 97            	ld	xl,a
 338  0166 a608          	ld	a,#8
 339  0168 42            	mul	x,a
 340  0169 d60051        	ld	a,(L11_TURR_GPIO_PIN+1,x)
 341  016c ad11          	call	LC001
 342                     ; 252     TURR_DIG1_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][1];
 343  016e d60053        	ld	a,(L11_TURR_GPIO_PIN+3,x)
 344  0171 ad0c          	call	LC001
 345                     ; 253     TURR_DIG2_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][2];
 346  0173 d60055        	ld	a,(L11_TURR_GPIO_PIN+5,x)
 347  0176 ad07          	call	LC001
 348                     ; 254     TURR_DIG3_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][3];
 349  0178 d60057        	ld	a,(L11_TURR_GPIO_PIN+7,x)
 350  017b ad02          	call	LC001
 351  017d               L32:
 352                     ; 256 }
 353  017d 85            	popw	x
 354  017e 81            	ret	
 355  017f               LC001:
 356  017f 43            	cpl	a
 357  0180 c45019        	and	a,20505
 358  0183 c75019        	ld	20505,a
 359  0186 81            	ret	
 361                     	xdef	_DispInfoT16x5B8x4
 362                     	xref	_TurretExecute
 363                     	xref	_SensorCounter
 364                     	xref	_CounterMode
 365                     	xref	_FlagSensorEn
 366                     	xref	_FlagUvDetect
 367                     	xref	_FlagAddCount
 368                     	xref	_FlagAutoCount
 369                     	xref	_FlagValueCount
 370                     	xref	_SystemTimer
 371                     	xref	_AdcValue
 372                     	xref	_BuzzerOnTime
 373                     	xref	_GPIO_Init
 374                     	switch	.const
 375  009c               L71:
 376  009c 25346c7500    	dc.b	"%4lu",0
 377  00a1               L51:
 378  00a1 25356c7500    	dc.b	"%5lu",0
 379                     	end
