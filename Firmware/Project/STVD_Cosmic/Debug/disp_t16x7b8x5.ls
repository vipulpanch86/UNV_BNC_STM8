   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L7_MS_GPIO_PIN:
  22  0000 0002          	dc.w	2
  23  0002 0000          	dc.w	0
  24  0004 0000          	dc.w	0
  25  0006 0040          	dc.w	64
  26  0008 0000          	dc.w	0
  27  000a 0001          	dc.w	1
  28  000c 0000          	dc.w	0
  29  000e 0040          	dc.w	64
  30  0010 0002          	dc.w	2
  31  0012 0001          	dc.w	1
  32  0014 0000          	dc.w	0
  33  0016 0040          	dc.w	64
  34  0018 0000          	dc.w	0
  35  001a 0000          	dc.w	0
  36  001c 0080          	dc.w	128
  37  001e 0040          	dc.w	64
  38  0020 0002          	dc.w	2
  39  0022 0000          	dc.w	0
  40  0024 0080          	dc.w	128
  41  0026 0040          	dc.w	64
  42  0028 0000          	dc.w	0
  43  002a 0001          	dc.w	1
  44  002c 0080          	dc.w	128
  45  002e 0040          	dc.w	64
  46  0030 0002          	dc.w	2
  47  0032 0001          	dc.w	1
  48  0034 0080          	dc.w	128
  49  0036 0040          	dc.w	64
  50  0038 0002          	dc.w	2
  51  003a 0000          	dc.w	0
  52  003c 0000          	dc.w	0
  53  003e 0000          	dc.w	0
  54  0040 0000          	dc.w	0
  55  0042 0001          	dc.w	1
  56  0044 0000          	dc.w	0
  57  0046 0000          	dc.w	0
  58  0048 0002          	dc.w	2
  59  004a 0001          	dc.w	1
  60  004c 0000          	dc.w	0
  61  004e 0000          	dc.w	0
  62  0050 0000          	dc.w	0
  63  0052 0000          	dc.w	0
  64  0054 0080          	dc.w	128
  65  0056 0000          	dc.w	0
  66  0058 0002          	dc.w	2
  67  005a 0000          	dc.w	0
  68  005c 0080          	dc.w	128
  69  005e 0000          	dc.w	0
  70  0060               L11_TURR_GPIO_PIN:
  71  0060 0010          	dc.w	16
  72  0062 0000          	dc.w	0
  73  0064 0000          	dc.w	0
  74  0066 0000          	dc.w	0
  75  0068 0000          	dc.w	0
  76  006a 0020          	dc.w	32
  77  006c 0000          	dc.w	0
  78  006e 0000          	dc.w	0
  79  0070 0000          	dc.w	0
  80  0072 0000          	dc.w	0
  81  0074 0040          	dc.w	64
  82  0076 0000          	dc.w	0
  83  0078 0000          	dc.w	0
  84  007a 0000          	dc.w	0
  85  007c 0000          	dc.w	0
  86  007e 0080          	dc.w	128
  87  0080               L31_LED_BITMAP:
  88  0080 0002          	dc.w	2
  89  0082 0001          	dc.w	1
  90  0084 0004          	dc.w	4
  91  0086 0008          	dc.w	8
  92  0088 0020          	dc.w	32
  93  008a 0010          	dc.w	16
  94  008c 0080          	dc.w	128
  95  008e 0040          	dc.w	64
  96  0090 0000          	dc.w	0
  97  0092 0100          	dc.w	256
  98  0094 1000          	dc.w	4096
  99  0096 0400          	dc.w	1024
 100  0098 0800          	dc.w	2048
 101  009a 0200          	dc.w	512
 102  009c 2000          	dc.w	8192
 103  009e               _DispInfoT16x7B8x4:
 104  009e 01            	dc.b	1
 105  009f 07            	dc.b	7
 106  00a0 00            	dc.b	0
 107  00a1 04            	dc.b	4
 108  00a2 0080          	dc.w	L31_LED_BITMAP
 109  00a4 00b1          	dc.w	L51
 110  00a6 00ac          	dc.w	L71
 112  00a8 0000          	dc.w	L3_DispInit
 114  00aa 00d2          	dc.w	L5_DispWrite
 115                     ; 142 static void DispInit(void)
 115                     ; 143 {
 116                     	scross	off
 117                     	switch	.text
 118  0000               L3_DispInit:
 120                     ; 147  	GPIO_Init(DISP_DB0_GPIO_PORT, DISP_DB0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 121  0000 4bc0          	push	#192
 122  0002 4b01          	push	#1
 123  0004 ae500f        	ldw	x,#20495
 124  0007 cd0000        	call	_GPIO_Init
 126  000a 85            	popw	x
 127                     ; 148   GPIO_Init(DISP_DB1_GPIO_PORT, DISP_DB1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 128  000b 4bc0          	push	#192
 129  000d 4b02          	push	#2
 130  000f ae500f        	ldw	x,#20495
 131  0012 cd0000        	call	_GPIO_Init
 133  0015 85            	popw	x
 134                     ; 149   GPIO_Init(DISP_DB2_GPIO_PORT, DISP_DB2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 135  0016 4bc0          	push	#192
 136  0018 4b04          	push	#4
 137  001a ae500f        	ldw	x,#20495
 138  001d cd0000        	call	_GPIO_Init
 140  0020 85            	popw	x
 141                     ; 150   GPIO_Init(DISP_DB3_GPIO_PORT, DISP_DB3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 142  0021 4bc0          	push	#192
 143  0023 4b08          	push	#8
 144  0025 ae500f        	ldw	x,#20495
 145  0028 cd0000        	call	_GPIO_Init
 147  002b 85            	popw	x
 148                     ; 151   GPIO_Init(DISP_DB4_GPIO_PORT, DISP_DB4_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 149  002c 4bc0          	push	#192
 150  002e 4b10          	push	#16
 151  0030 ae500f        	ldw	x,#20495
 152  0033 cd0000        	call	_GPIO_Init
 154  0036 85            	popw	x
 155                     ; 152   GPIO_Init(DISP_DB5_GPIO_PORT, DISP_DB5_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 156  0037 4bc0          	push	#192
 157  0039 4b20          	push	#32
 158  003b ae500f        	ldw	x,#20495
 159  003e cd0000        	call	_GPIO_Init
 161  0041 85            	popw	x
 162                     ; 153   GPIO_Init(DISP_DB6_GPIO_PORT, DISP_DB6_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 163  0042 4bc0          	push	#192
 164  0044 4b40          	push	#64
 165  0046 ae500f        	ldw	x,#20495
 166  0049 cd0000        	call	_GPIO_Init
 168  004c 85            	popw	x
 169                     ; 154   GPIO_Init(DISP_DB7_GPIO_PORT, DISP_DB7_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 170  004d 4bc0          	push	#192
 171  004f 4b80          	push	#128
 172  0051 ae500f        	ldw	x,#20495
 173  0054 cd0000        	call	_GPIO_Init
 175  0057 85            	popw	x
 176                     ; 159 	GPIO_Init(DISP_LOE_GPIO_PORT, DISP_LOE_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 177  0058 4bd0          	push	#208
 178  005a 4b04          	push	#4
 179  005c ae500a        	ldw	x,#20490
 180  005f cd0000        	call	_GPIO_Init
 182  0062 85            	popw	x
 183                     ; 164   GPIO_Init(DISP_LE0_GPIO_PORT, DISP_LE0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 184  0063 4bc0          	push	#192
 185  0065 4b10          	push	#16
 186  0067 ae500a        	ldw	x,#20490
 187  006a cd0000        	call	_GPIO_Init
 189  006d 85            	popw	x
 190                     ; 165   GPIO_Init(DISP_LE1_GPIO_PORT, DISP_LE1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 191  006e 4bc0          	push	#192
 192  0070 4b20          	push	#32
 193  0072 ae500a        	ldw	x,#20490
 194  0075 cd0000        	call	_GPIO_Init
 196  0078 85            	popw	x
 197                     ; 170   GPIO_Init(DISP_MS0_GPIO_PORT, DISP_MS0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 198  0079 4bc0          	push	#192
 199  007b 4b02          	push	#2
 200  007d ae501e        	ldw	x,#20510
 201  0080 cd0000        	call	_GPIO_Init
 203  0083 85            	popw	x
 204                     ; 171   GPIO_Init(DISP_MS1_GPIO_PORT, DISP_MS1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 205  0084 4bc0          	push	#192
 206  0086 4b01          	push	#1
 207  0088 ae501e        	ldw	x,#20510
 208  008b cd0000        	call	_GPIO_Init
 210  008e 85            	popw	x
 211                     ; 172   GPIO_Init(DISP_MS2_GPIO_PORT, DISP_MS2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 212  008f 4bc0          	push	#192
 213  0091 4b80          	push	#128
 214  0093 ae500a        	ldw	x,#20490
 215  0096 cd0000        	call	_GPIO_Init
 217  0099 85            	popw	x
 218                     ; 173   GPIO_Init(DISP_MS3_GPIO_PORT, DISP_MS3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 219  009a 4bc0          	push	#192
 220  009c 4b40          	push	#64
 221  009e ae500a        	ldw	x,#20490
 222  00a1 cd0000        	call	_GPIO_Init
 224  00a4 85            	popw	x
 225                     ; 178   GPIO_Init(TURR_DIG0_GPIO_PORT, TURR_DIG0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 226  00a5 4bd0          	push	#208
 227  00a7 4b10          	push	#16
 228  00a9 ae5019        	ldw	x,#20505
 229  00ac cd0000        	call	_GPIO_Init
 231  00af 85            	popw	x
 232                     ; 179   GPIO_Init(TURR_DIG1_GPIO_PORT, TURR_DIG1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 233  00b0 4bd0          	push	#208
 234  00b2 4b20          	push	#32
 235  00b4 ae5019        	ldw	x,#20505
 236  00b7 cd0000        	call	_GPIO_Init
 238  00ba 85            	popw	x
 239                     ; 180   GPIO_Init(TURR_DIG2_GPIO_PORT, TURR_DIG2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 240  00bb 4bd0          	push	#208
 241  00bd 4b40          	push	#64
 242  00bf ae5019        	ldw	x,#20505
 243  00c2 cd0000        	call	_GPIO_Init
 245  00c5 85            	popw	x
 246                     ; 181   GPIO_Init(TURR_DIG3_GPIO_PORT, TURR_DIG3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 247  00c6 4bd0          	push	#208
 248  00c8 4b80          	push	#128
 249  00ca ae5019        	ldw	x,#20505
 250  00cd cd0000        	call	_GPIO_Init
 252  00d0 85            	popw	x
 253                     ; 182 }
 254  00d1 81            	ret	
 256                     ; 190 static void DispWrite(uint8_t dispNo, volatile uint16_t data)
 256                     ; 191 {
 257  00d2               L5_DispWrite:
 258  00d2 88            	push	a
 259  00d3 89            	pushw	x
 260       00000002      OFST:	set	2
 262                     ; 192   volatile uint16_t data8bit = 0;
 263  00d4 5f            	clrw	x
 264  00d5 1f01          	ldw	(OFST-1,sp),x
 265                     ; 195   TURR_DIG0_GPIO_PORT->ODR |= TURR_DIG0_GPIO_PIN;
 266  00d7 72185019      	bset	20505,#4
 267                     ; 196   TURR_DIG1_GPIO_PORT->ODR |= TURR_DIG1_GPIO_PIN;
 268  00db 721a5019      	bset	20505,#5
 269                     ; 197   TURR_DIG2_GPIO_PORT->ODR |= TURR_DIG2_GPIO_PIN;
 270  00df 721c5019      	bset	20505,#6
 271                     ; 198   TURR_DIG3_GPIO_PORT->ODR |= TURR_DIG3_GPIO_PIN;
 272  00e3 721e5019      	bset	20505,#7
 273                     ; 201   DISP_LOE_GPIO_PORT->ODR |= (uint8_t)DISP_LOE_GPIO_PIN;
 274  00e7 7214500a      	bset	20490,#2
 275                     ; 204   if(dispNo < MAX_SEL)
 276  00eb a10c          	cp	a,#12
 277  00ed 2465          	jruge	L12
 278                     ; 207     data8bit = (uint8_t)((data >> 0) & 0xFF);
 279  00ef 7b07          	ld	a,(OFST+5,sp)
 280  00f1 97            	ld	xl,a
 281  00f2 1f01          	ldw	(OFST-1,sp),x
 282                     ; 208     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 283  00f4 7b02          	ld	a,(OFST+0,sp)
 284  00f6 c7500f        	ld	20495,a
 285                     ; 211     DISP_LE0_GPIO_PORT->ODR |= DISP_LE0_GPIO_PIN;
 286  00f9 7218500a      	bset	20490,#4
 287                     ; 212     DISP_LE0_GPIO_PORT->ODR &= ~DISP_LE0_GPIO_PIN;
 288  00fd 7219500a      	bres	20490,#4
 289                     ; 215     data8bit = (uint8_t)((data >> 8) & 0xFF);
 290  0101 7b06          	ld	a,(OFST+4,sp)
 291  0103 5f            	clrw	x
 292  0104 97            	ld	xl,a
 293  0105 1f01          	ldw	(OFST-1,sp),x
 294                     ; 216     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 295  0107 7b02          	ld	a,(OFST+0,sp)
 296  0109 c7500f        	ld	20495,a
 297                     ; 219     DISP_LE1_GPIO_PORT->ODR |= DISP_LE1_GPIO_PIN;
 298  010c 721a500a      	bset	20490,#5
 299                     ; 220     DISP_LE1_GPIO_PORT->ODR &= ~DISP_LE1_GPIO_PIN;
 300  0110 721b500a      	bres	20490,#5
 301                     ; 223     DISP_MS3_GPIO_PORT->ODR &= ~DISP_MS3_GPIO_PIN;
 302  0114 721d500a      	bres	20490,#6
 303                     ; 224     DISP_MS3_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][3];
 304  0118 7b03          	ld	a,(OFST+1,sp)
 305  011a 97            	ld	xl,a
 306  011b a608          	ld	a,#8
 307  011d 42            	mul	x,a
 308  011e c6500a        	ld	a,20490
 309  0121 da0007        	or	a,(L7_MS_GPIO_PIN+7,x)
 310  0124 c7500a        	ld	20490,a
 311                     ; 226     DISP_MS2_GPIO_PORT->ODR &= ~DISP_MS2_GPIO_PIN;
 312  0127 721f500a      	bres	20490,#7
 313                     ; 227     DISP_MS2_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][2];
 314  012b c6500a        	ld	a,20490
 315  012e da0005        	or	a,(L7_MS_GPIO_PIN+5,x)
 316  0131 c7500a        	ld	20490,a
 317                     ; 229     DISP_MS1_GPIO_PORT->ODR &= ~DISP_MS1_GPIO_PIN;
 318  0134 7211501e      	bres	20510,#0
 319                     ; 230     DISP_MS1_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][1];
 320  0138 c6501e        	ld	a,20510
 321  013b da0003        	or	a,(L7_MS_GPIO_PIN+3,x)
 322  013e c7501e        	ld	20510,a
 323                     ; 232     DISP_MS0_GPIO_PORT->ODR &= ~DISP_MS0_GPIO_PIN;
 324  0141 7213501e      	bres	20510,#1
 325                     ; 233     DISP_MS0_GPIO_PORT->ODR |= MS_GPIO_PIN[dispNo][0];
 326  0145 c6501e        	ld	a,20510
 327  0148 da0001        	or	a,(L7_MS_GPIO_PIN+1,x)
 328  014b c7501e        	ld	20510,a
 329                     ; 236     DISP_LOE_GPIO_PORT->ODR &= ~DISP_LOE_GPIO_PIN;
 330  014e 7215500a      	bres	20490,#2
 332  0152 202e          	jra	L32
 333  0154               L12:
 334                     ; 238   else if(dispNo < (MAX_SEL + DISP_TURRET_MAX_SEL))
 335  0154 7b03          	ld	a,(OFST+1,sp)
 336  0156 a110          	cp	a,#16
 337  0158 2428          	jruge	L32
 338                     ; 241     dispNo -= MAX_SEL;
 339  015a a00c          	sub	a,#12
 340  015c 6b03          	ld	(OFST+1,sp),a
 341                     ; 244     data8bit = (uint8_t)((data >> 0) & 0xFF);
 342  015e 7b07          	ld	a,(OFST+5,sp)
 343  0160 97            	ld	xl,a
 344  0161 1f01          	ldw	(OFST-1,sp),x
 345                     ; 245     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 346  0163 7b02          	ld	a,(OFST+0,sp)
 347  0165 c7500f        	ld	20495,a
 348                     ; 248     TURR_DIG0_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][0];
 349  0168 7b03          	ld	a,(OFST+1,sp)
 350  016a 97            	ld	xl,a
 351  016b a608          	ld	a,#8
 352  016d 42            	mul	x,a
 353  016e d60061        	ld	a,(L11_TURR_GPIO_PIN+1,x)
 354  0171 ad12          	call	LC001
 355                     ; 249     TURR_DIG1_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][1];
 356  0173 d60063        	ld	a,(L11_TURR_GPIO_PIN+3,x)
 357  0176 ad0d          	call	LC001
 358                     ; 250     TURR_DIG2_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][2];
 359  0178 d60065        	ld	a,(L11_TURR_GPIO_PIN+5,x)
 360  017b ad08          	call	LC001
 361                     ; 251     TURR_DIG3_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][3];
 362  017d d60067        	ld	a,(L11_TURR_GPIO_PIN+7,x)
 363  0180 ad03          	call	LC001
 364  0182               L32:
 365                     ; 253 }
 366  0182 5b03          	addw	sp,#3
 367  0184 81            	ret	
 368  0185               LC001:
 369  0185 43            	cpl	a
 370  0186 c45019        	and	a,20505
 371  0189 c75019        	ld	20505,a
 372  018c 81            	ret	
 374                     	xdef	_DispInfoT16x7B8x4
 375                     	xref	_TurretExecute
 376                     	xref	_SensorCounter
 377                     	xref	_CounterMode
 378                     	xref	_FlagSensorEn
 379                     	xref	_FlagUvDetect
 380                     	xref	_FlagAddCount
 381                     	xref	_FlagAutoCount
 382                     	xref	_FlagValueCount
 383                     	xref	_SystemTimer
 384                     	xref	_AdcValue
 385                     	xref	_BuzzerOnTime
 386                     	xref	_GPIO_Init
 387                     	switch	.const
 388  00ac               L71:
 389  00ac 25346c7500    	dc.b	"%4lu",0
 390  00b1               L51:
 391  00b1 25376c7500    	dc.b	"%7lu",0
 392                     	end
