   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L7_DISP_EN_GPIO_PORT:
  22  0000 501e          	dc.w	20510
  23  0002 500a          	dc.w	20490
  24  0004 500a          	dc.w	20490
  25  0006 500a          	dc.w	20490
  26  0008 500a          	dc.w	20490
  27  000a 501e          	dc.w	20510
  28  000c 501e          	dc.w	20510
  29  000e 501e          	dc.w	20510
  30  0010 501e          	dc.w	20510
  31                     .const:	section	.text
  32  0000               L11_DISP_EN_GPIO_PIN:
  33  0000 0080          	dc.w	128
  34  0002 0080          	dc.w	128
  35  0004 0040          	dc.w	64
  36  0006 0020          	dc.w	32
  37  0008 0010          	dc.w	16
  38  000a 0004          	dc.w	4
  39  000c 0002          	dc.w	2
  40  000e 0001          	dc.w	1
  41  0010 0008          	dc.w	8
  42  0012               L31_TURR_GPIO_PIN:
  43  0012 0010          	dc.w	16
  44  0014 0000          	dc.w	0
  45  0016 0000          	dc.w	0
  46  0018 0000          	dc.w	0
  47  001a 0000          	dc.w	0
  48  001c 0020          	dc.w	32
  49  001e 0000          	dc.w	0
  50  0020 0000          	dc.w	0
  51  0022 0000          	dc.w	0
  52  0024 0000          	dc.w	0
  53  0026 0040          	dc.w	64
  54  0028 0000          	dc.w	0
  55  002a 0000          	dc.w	0
  56  002c 0000          	dc.w	0
  57  002e 0000          	dc.w	0
  58  0030 0080          	dc.w	128
  59  0032               L51_LED_BITMAP:
  60  0032 0040          	dc.w	64
  61  0034 0020          	dc.w	32
  62  0036 0010          	dc.w	16
  63  0038 0080          	dc.w	128
  64  003a 0001          	dc.w	1
  65  003c 0002          	dc.w	2
  66  003e 0008          	dc.w	8
  67  0040 0004          	dc.w	4
  68  0042 0000          	dc.w	0
  69  0044 0100          	dc.w	256
  70  0046 1000          	dc.w	4096
  71  0048 0400          	dc.w	1024
  72  004a 0800          	dc.w	2048
  73  004c 0200          	dc.w	512
  74  004e 2000          	dc.w	8192
  75  0050               _DispInfoT8x5B8x3:
  76  0050 00            	dc.b	0
  77  0051 05            	dc.b	5
  78  0052 00            	dc.b	0
  79  0053 03            	dc.b	3
  80  0054 0032          	dc.w	L51_LED_BITMAP
  81  0056 0063          	dc.w	L71
  82  0058 005e          	dc.w	L12
  84  005a 0000          	dc.w	L3_DispInit
  86  005c 00e8          	dc.w	L5_DispWrite
  87                     ; 162 static void DispInit(void)
  87                     ; 163 {
  88                     	scross	off
  89                     	switch	.text
  90  0000               L3_DispInit:
  92                     ; 167  	GPIO_Init(DISP_DB0_GPIO_PORT, DISP_DB0_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  93  0000 4bc0          	push	#192
  94  0002 4b01          	push	#1
  95  0004 ae500f        	ldw	x,#20495
  96  0007 cd0000        	call	_GPIO_Init
  98  000a 85            	popw	x
  99                     ; 168   GPIO_Init(DISP_DB1_GPIO_PORT, DISP_DB1_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 100  000b 4bc0          	push	#192
 101  000d 4b02          	push	#2
 102  000f ae500f        	ldw	x,#20495
 103  0012 cd0000        	call	_GPIO_Init
 105  0015 85            	popw	x
 106                     ; 169   GPIO_Init(DISP_DB2_GPIO_PORT, DISP_DB2_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 107  0016 4bc0          	push	#192
 108  0018 4b04          	push	#4
 109  001a ae500f        	ldw	x,#20495
 110  001d cd0000        	call	_GPIO_Init
 112  0020 85            	popw	x
 113                     ; 170   GPIO_Init(DISP_DB3_GPIO_PORT, DISP_DB3_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 114  0021 4bc0          	push	#192
 115  0023 4b08          	push	#8
 116  0025 ae500f        	ldw	x,#20495
 117  0028 cd0000        	call	_GPIO_Init
 119  002b 85            	popw	x
 120                     ; 171   GPIO_Init(DISP_DB4_GPIO_PORT, DISP_DB4_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 121  002c 4bc0          	push	#192
 122  002e 4b10          	push	#16
 123  0030 ae500f        	ldw	x,#20495
 124  0033 cd0000        	call	_GPIO_Init
 126  0036 85            	popw	x
 127                     ; 172   GPIO_Init(DISP_DB5_GPIO_PORT, DISP_DB5_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 128  0037 4bc0          	push	#192
 129  0039 4b20          	push	#32
 130  003b ae500f        	ldw	x,#20495
 131  003e cd0000        	call	_GPIO_Init
 133  0041 85            	popw	x
 134                     ; 173   GPIO_Init(DISP_DB6_GPIO_PORT, DISP_DB6_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 135  0042 4bc0          	push	#192
 136  0044 4b40          	push	#64
 137  0046 ae500f        	ldw	x,#20495
 138  0049 cd0000        	call	_GPIO_Init
 140  004c 85            	popw	x
 141                     ; 174   GPIO_Init(DISP_DB7_GPIO_PORT, DISP_DB7_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 142  004d 4bc0          	push	#192
 143  004f 4b80          	push	#128
 144  0051 ae500f        	ldw	x,#20495
 145  0054 cd0000        	call	_GPIO_Init
 147  0057 85            	popw	x
 148                     ; 179   GPIO_Init(DISP_EN1_GPIO_PORT, DISP_EN1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 149  0058 4bd0          	push	#208
 150  005a 4b80          	push	#128
 151  005c ae501e        	ldw	x,#20510
 152  005f cd0000        	call	_GPIO_Init
 154  0062 85            	popw	x
 155                     ; 180   GPIO_Init(DISP_EN2_GPIO_PORT, DISP_EN2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 156  0063 4bd0          	push	#208
 157  0065 4b80          	push	#128
 158  0067 ae500a        	ldw	x,#20490
 159  006a cd0000        	call	_GPIO_Init
 161  006d 85            	popw	x
 162                     ; 181   GPIO_Init(DISP_EN3_GPIO_PORT, DISP_EN3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 163  006e 4bd0          	push	#208
 164  0070 4b40          	push	#64
 165  0072 ae500a        	ldw	x,#20490
 166  0075 cd0000        	call	_GPIO_Init
 168  0078 85            	popw	x
 169                     ; 182   GPIO_Init(DISP_EN4_GPIO_PORT, DISP_EN4_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 170  0079 4bd0          	push	#208
 171  007b 4b20          	push	#32
 172  007d ae500a        	ldw	x,#20490
 173  0080 cd0000        	call	_GPIO_Init
 175  0083 85            	popw	x
 176                     ; 183   GPIO_Init(DISP_EN5_GPIO_PORT, DISP_EN5_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 177  0084 4bd0          	push	#208
 178  0086 4b10          	push	#16
 179  0088 ae500a        	ldw	x,#20490
 180  008b cd0000        	call	_GPIO_Init
 182  008e 85            	popw	x
 183                     ; 184   GPIO_Init(DISP_EN6_GPIO_PORT, DISP_EN6_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 184  008f 4bd0          	push	#208
 185  0091 4b04          	push	#4
 186  0093 ae501e        	ldw	x,#20510
 187  0096 cd0000        	call	_GPIO_Init
 189  0099 85            	popw	x
 190                     ; 185   GPIO_Init(DISP_EN7_GPIO_PORT, DISP_EN7_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 191  009a 4bd0          	push	#208
 192  009c 4b02          	push	#2
 193  009e ae501e        	ldw	x,#20510
 194  00a1 cd0000        	call	_GPIO_Init
 196  00a4 85            	popw	x
 197                     ; 186   GPIO_Init(DISP_EN8_GPIO_PORT, DISP_EN8_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 198  00a5 4bd0          	push	#208
 199  00a7 4b01          	push	#1
 200  00a9 ae501e        	ldw	x,#20510
 201  00ac cd0000        	call	_GPIO_Init
 203  00af 85            	popw	x
 204                     ; 187   GPIO_Init(DISP_EN9_GPIO_PORT, DISP_EN9_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 205  00b0 4bd0          	push	#208
 206  00b2 4b08          	push	#8
 207  00b4 ae501e        	ldw	x,#20510
 208  00b7 cd0000        	call	_GPIO_Init
 210  00ba 85            	popw	x
 211                     ; 192   GPIO_Init(TURR_DIG0_GPIO_PORT, TURR_DIG0_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 212  00bb 4bd0          	push	#208
 213  00bd 4b10          	push	#16
 214  00bf ae5019        	ldw	x,#20505
 215  00c2 cd0000        	call	_GPIO_Init
 217  00c5 85            	popw	x
 218                     ; 193   GPIO_Init(TURR_DIG1_GPIO_PORT, TURR_DIG1_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 219  00c6 4bd0          	push	#208
 220  00c8 4b20          	push	#32
 221  00ca ae5019        	ldw	x,#20505
 222  00cd cd0000        	call	_GPIO_Init
 224  00d0 85            	popw	x
 225                     ; 194   GPIO_Init(TURR_DIG2_GPIO_PORT, TURR_DIG2_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 226  00d1 4bd0          	push	#208
 227  00d3 4b40          	push	#64
 228  00d5 ae5019        	ldw	x,#20505
 229  00d8 cd0000        	call	_GPIO_Init
 231  00db 85            	popw	x
 232                     ; 195   GPIO_Init(TURR_DIG3_GPIO_PORT, TURR_DIG3_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 233  00dc 4bd0          	push	#208
 234  00de 4b80          	push	#128
 235  00e0 ae5019        	ldw	x,#20505
 236  00e3 cd0000        	call	_GPIO_Init
 238  00e6 85            	popw	x
 239                     ; 196 }
 240  00e7 81            	ret	
 242                     ; 204 static void DispWrite(uint8_t dispNo, volatile uint16_t data)
 242                     ; 205 {
 243  00e8               L5_DispWrite:
 244  00e8 88            	push	a
 245  00e9 88            	push	a
 246       00000001      OFST:	set	1
 248                     ; 206   volatile uint8_t data8bit = 0;
 249  00ea 0f01          	clr	(OFST+0,sp)
 250                     ; 209   TURR_DIG0_GPIO_PORT->ODR |= TURR_DIG0_GPIO_PIN;
 251  00ec 72185019      	bset	20505,#4
 252                     ; 210   TURR_DIG1_GPIO_PORT->ODR |= TURR_DIG1_GPIO_PIN;
 253  00f0 721a5019      	bset	20505,#5
 254                     ; 211   TURR_DIG2_GPIO_PORT->ODR |= TURR_DIG2_GPIO_PIN;
 255  00f4 721c5019      	bset	20505,#6
 256                     ; 212   TURR_DIG3_GPIO_PORT->ODR |= TURR_DIG3_GPIO_PIN;
 257  00f8 721e5019      	bset	20505,#7
 258                     ; 214   DISP_EN1_GPIO_PORT->ODR |= (uint8_t)DISP_EN1_GPIO_PIN;
 259  00fc 721e501e      	bset	20510,#7
 260                     ; 215   DISP_EN2_GPIO_PORT->ODR |= (uint8_t)DISP_EN2_GPIO_PIN;
 261  0100 721e500a      	bset	20490,#7
 262                     ; 216   DISP_EN3_GPIO_PORT->ODR |= (uint8_t)DISP_EN3_GPIO_PIN;
 263  0104 721c500a      	bset	20490,#6
 264                     ; 217   DISP_EN4_GPIO_PORT->ODR |= (uint8_t)DISP_EN4_GPIO_PIN;
 265  0108 721a500a      	bset	20490,#5
 266                     ; 218   DISP_EN5_GPIO_PORT->ODR |= (uint8_t)DISP_EN5_GPIO_PIN;
 267  010c 7218500a      	bset	20490,#4
 268                     ; 219   DISP_EN6_GPIO_PORT->ODR |= (uint8_t)DISP_EN6_GPIO_PIN;
 269  0110 7214501e      	bset	20510,#2
 270                     ; 220   DISP_EN7_GPIO_PORT->ODR |= (uint8_t)DISP_EN7_GPIO_PIN;
 271  0114 7212501e      	bset	20510,#1
 272                     ; 221   DISP_EN8_GPIO_PORT->ODR |= (uint8_t)DISP_EN8_GPIO_PIN;
 273  0118 7210501e      	bset	20510,#0
 274                     ; 222   DISP_EN9_GPIO_PORT->ODR |= (uint8_t)DISP_EN9_GPIO_PIN;
 275  011c 7216501e      	bset	20510,#3
 276                     ; 225   if(dispNo < MAX_SEL)
 277  0120 a109          	cp	a,#9
 278  0122 2420          	jruge	L32
 279                     ; 228     data8bit = (uint8_t)((data >> 0) & 0xFF);
 280  0124 7b06          	ld	a,(OFST+5,sp)
 281  0126 6b01          	ld	(OFST+0,sp),a
 282                     ; 229     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 283  0128 7b01          	ld	a,(OFST+0,sp)
 284  012a c7500f        	ld	20495,a
 285                     ; 231   	DISP_EN_GPIO_PORT[dispNo]->ODR &= (uint8_t)~DISP_EN_GPIO_PIN[dispNo];
 286  012d 7b02          	ld	a,(OFST+1,sp)
 287  012f 5f            	clrw	x
 288  0130 97            	ld	xl,a
 289  0131 58            	sllw	x
 290  0132 905f          	clrw	y
 291  0134 de0000        	ldw	x,(L7_DISP_EN_GPIO_PORT,x)
 292  0137 9097          	ld	yl,a
 293  0139 9058          	sllw	y
 294  013b 90d60001      	ld	a,(L11_DISP_EN_GPIO_PIN+1,y)
 295  013f 43            	cpl	a
 296  0140 f4            	and	a,(x)
 297  0141 f7            	ld	(x),a
 299  0142 202d          	jra	L52
 300  0144               L32:
 301                     ; 234   else if(dispNo < (MAX_SEL + DISP_TURRET_MAX_SEL))
 302  0144 7b02          	ld	a,(OFST+1,sp)
 303  0146 a10d          	cp	a,#13
 304  0148 2427          	jruge	L52
 305                     ; 237     dispNo -= MAX_SEL;
 306  014a a009          	sub	a,#9
 307  014c 6b02          	ld	(OFST+1,sp),a
 308                     ; 240     data8bit = (uint8_t)((data >> 0) & 0xFF);
 309  014e 7b06          	ld	a,(OFST+5,sp)
 310  0150 6b01          	ld	(OFST+0,sp),a
 311                     ; 241     DISP_DB_GPIO_PORT->ODR = (uint8_t)data8bit;
 312  0152 7b01          	ld	a,(OFST+0,sp)
 313  0154 c7500f        	ld	20495,a
 314                     ; 244     TURR_DIG0_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][0];
 315  0157 7b02          	ld	a,(OFST+1,sp)
 316  0159 97            	ld	xl,a
 317  015a a608          	ld	a,#8
 318  015c 42            	mul	x,a
 319  015d d60013        	ld	a,(L31_TURR_GPIO_PIN+1,x)
 320  0160 ad11          	call	LC001
 321                     ; 245     TURR_DIG1_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][1];
 322  0162 d60015        	ld	a,(L31_TURR_GPIO_PIN+3,x)
 323  0165 ad0c          	call	LC001
 324                     ; 246     TURR_DIG2_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][2];
 325  0167 d60017        	ld	a,(L31_TURR_GPIO_PIN+5,x)
 326  016a ad07          	call	LC001
 327                     ; 247     TURR_DIG3_GPIO_PORT->ODR &= ~TURR_GPIO_PIN[dispNo][3];
 328  016c d60019        	ld	a,(L31_TURR_GPIO_PIN+7,x)
 329  016f ad02          	call	LC001
 330  0171               L52:
 331                     ; 249 }
 332  0171 85            	popw	x
 333  0172 81            	ret	
 334  0173               LC001:
 335  0173 43            	cpl	a
 336  0174 c45019        	and	a,20505
 337  0177 c75019        	ld	20505,a
 338  017a 81            	ret	
 340                     	xdef	_DispInfoT8x5B8x3
 341                     	xref	_TurretExecute
 342                     	xref	_SensorCounter
 343                     	xref	_CounterMode
 344                     	xref	_FlagSensorEn
 345                     	xref	_FlagUvDetect
 346                     	xref	_FlagAddCount
 347                     	xref	_FlagAutoCount
 348                     	xref	_FlagValueCount
 349                     	xref	_SystemTimer
 350                     	xref	_AdcValue
 351                     	xref	_BuzzerOnTime
 352                     	xref	_GPIO_Init
 353                     	switch	.const
 354  005e               L12:
 355  005e 25336c7500    	dc.b	"%3lu",0
 356  0063               L71:
 357  0063 25356c7500    	dc.b	"%5lu",0
 358                     	end
