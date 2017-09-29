   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 53 void EXTI_DeInit(void)
  20                     ; 54 {
  21                     	scross	off
  22  0000               _EXTI_DeInit:
  24                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  25  0000 725f50a0      	clr	20640
  26                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  27  0004 725f50a1      	clr	20641
  28                     ; 57 }
  29  0008 81            	ret	
  31                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
  31                     ; 71 {
  32  0009               _EXTI_SetExtIntSensitivity:
  33  0009 89            	pushw	x
  34       00000000      OFST:	set	0
  36                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
  37  000a 9e            	ld	a,xh
  38  000b 4d            	tnz	a
  39  000c 2718          	jreq	L21
  40  000e 9e            	ld	a,xh
  41  000f 4a            	dec	a
  42  0010 2714          	jreq	L21
  43  0012 9e            	ld	a,xh
  44  0013 a102          	cp	a,#2
  45  0015 270f          	jreq	L21
  46  0017 9e            	ld	a,xh
  47  0018 a103          	cp	a,#3
  48  001a 270a          	jreq	L21
  49  001c 9e            	ld	a,xh
  50  001d a104          	cp	a,#4
  51  001f 2705          	jreq	L21
  52  0021 ae0049        	ldw	x,#73
  53  0024 ad7c          	call	LC004
  54  0026               L21:
  55                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
  56  0026 7b02          	ld	a,(OFST+2,sp)
  57  0028 2711          	jreq	L22
  58  002a a101          	cp	a,#1
  59  002c 270d          	jreq	L22
  60  002e a102          	cp	a,#2
  61  0030 2709          	jreq	L22
  62  0032 a103          	cp	a,#3
  63  0034 2705          	jreq	L22
  64  0036 ae004a        	ldw	x,#74
  65  0039 ad67          	call	LC004
  66  003b               L22:
  67                     ; 77   switch (Port)
  68  003b 7b01          	ld	a,(OFST+1,sp)
  70                     ; 99   default:
  70                     ; 100     break;
  71  003d 270e          	jreq	L3
  72  003f 4a            	dec	a
  73  0040 271a          	jreq	L5
  74  0042 4a            	dec	a
  75  0043 2725          	jreq	L7
  76  0045 4a            	dec	a
  77  0046 2731          	jreq	L11
  78  0048 4a            	dec	a
  79  0049 2745          	jreq	L31
  80  004b 2053          	jra	L32
  81  004d               L3:
  82                     ; 79   case EXTI_PORT_GPIOA:
  82                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
  83  004d c650a0        	ld	a,20640
  84  0050 a4fc          	and	a,#252
  85  0052 c750a0        	ld	20640,a
  86                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
  87  0055 c650a0        	ld	a,20640
  88  0058 1a02          	or	a,(OFST+2,sp)
  89                     ; 82     break;
  90  005a 202f          	jp	LC001
  91  005c               L5:
  92                     ; 83   case EXTI_PORT_GPIOB:
  92                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
  93  005c c650a0        	ld	a,20640
  94  005f a4f3          	and	a,#243
  95  0061 c750a0        	ld	20640,a
  96                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
  97  0064 7b02          	ld	a,(OFST+2,sp)
  98  0066 48            	sll	a
  99  0067 48            	sll	a
 100                     ; 86     break;
 101  0068 201e          	jp	LC002
 102  006a               L7:
 103                     ; 87   case EXTI_PORT_GPIOC:
 103                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 104  006a c650a0        	ld	a,20640
 105  006d a4cf          	and	a,#207
 106  006f c750a0        	ld	20640,a
 107                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 108  0072 7b02          	ld	a,(OFST+2,sp)
 109  0074 97            	ld	xl,a
 110  0075 a610          	ld	a,#16
 111                     ; 90     break;
 112  0077 200d          	jp	LC003
 113  0079               L11:
 114                     ; 91   case EXTI_PORT_GPIOD:
 114                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 115  0079 c650a0        	ld	a,20640
 116  007c a43f          	and	a,#63
 117  007e c750a0        	ld	20640,a
 118                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 119  0081 7b02          	ld	a,(OFST+2,sp)
 120  0083 97            	ld	xl,a
 121  0084 a640          	ld	a,#64
 122  0086               LC003:
 123  0086 42            	mul	x,a
 124  0087 9f            	ld	a,xl
 125  0088               LC002:
 126  0088 ca50a0        	or	a,20640
 127  008b               LC001:
 128  008b c750a0        	ld	20640,a
 129                     ; 94     break;
 130  008e 2010          	jra	L32
 131  0090               L31:
 132                     ; 95   case EXTI_PORT_GPIOE:
 132                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 133  0090 c650a1        	ld	a,20641
 134  0093 a4fc          	and	a,#252
 135  0095 c750a1        	ld	20641,a
 136                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 137  0098 c650a1        	ld	a,20641
 138  009b 1a02          	or	a,(OFST+2,sp)
 139  009d c750a1        	ld	20641,a
 140                     ; 98     break;
 141                     ; 99   default:
 141                     ; 100     break;
 142  00a0               L32:
 143                     ; 102 }
 144  00a0 85            	popw	x
 145  00a1 81            	ret	
 146  00a2               LC004:
 147  00a2 89            	pushw	x
 148  00a3 5f            	clrw	x
 149  00a4 89            	pushw	x
 150  00a5 ae0000        	ldw	x,#L71
 151  00a8 cd0000        	call	_assert_failed
 153  00ab 5b04          	addw	sp,#4
 154  00ad 81            	ret	
 156                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 156                     ; 112 {
 157  00ae               _EXTI_SetTLISensitivity:
 158  00ae 88            	push	a
 159       00000000      OFST:	set	0
 161                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 162  00af 4d            	tnz	a
 163  00b0 2712          	jreq	L43
 164  00b2 a104          	cp	a,#4
 165  00b4 270e          	jreq	L43
 166  00b6 ae0072        	ldw	x,#114
 167  00b9 89            	pushw	x
 168  00ba 5f            	clrw	x
 169  00bb 89            	pushw	x
 170  00bc ae0000        	ldw	x,#L71
 171  00bf cd0000        	call	_assert_failed
 173  00c2 5b04          	addw	sp,#4
 174  00c4               L43:
 175                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 176  00c4 721550a1      	bres	20641,#2
 177                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 178  00c8 c650a1        	ld	a,20641
 179  00cb 1a01          	or	a,(OFST+1,sp)
 180  00cd c750a1        	ld	20641,a
 181                     ; 119 }
 182  00d0 84            	pop	a
 183  00d1 81            	ret	
 185                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 185                     ; 127 {
 186  00d2               _EXTI_GetExtIntSensitivity:
 187  00d2 88            	push	a
 188  00d3 88            	push	a
 189       00000001      OFST:	set	1
 191                     ; 128   uint8_t value = 0;
 192  00d4 0f01          	clr	(OFST+0,sp)
 193                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 194  00d6 4d            	tnz	a
 195  00d7 271e          	jreq	L64
 196  00d9 a101          	cp	a,#1
 197  00db 271a          	jreq	L64
 198  00dd a102          	cp	a,#2
 199  00df 2716          	jreq	L64
 200  00e1 a103          	cp	a,#3
 201  00e3 2712          	jreq	L64
 202  00e5 a104          	cp	a,#4
 203  00e7 270e          	jreq	L64
 204  00e9 ae0083        	ldw	x,#131
 205  00ec 89            	pushw	x
 206  00ed 5f            	clrw	x
 207  00ee 89            	pushw	x
 208  00ef ae0000        	ldw	x,#L71
 209  00f2 cd0000        	call	_assert_failed
 211  00f5 5b04          	addw	sp,#4
 212  00f7               L64:
 213                     ; 133   switch (Port)
 214  00f7 7b02          	ld	a,(OFST+1,sp)
 216                     ; 150   default:
 216                     ; 151     break;
 217  00f9 2710          	jreq	L52
 218  00fb 4a            	dec	a
 219  00fc 2712          	jreq	L72
 220  00fe 4a            	dec	a
 221  00ff 2718          	jreq	L13
 222  0101 4a            	dec	a
 223  0102 271b          	jreq	L33
 224  0104 4a            	dec	a
 225  0105 2722          	jreq	L53
 226  0107 7b01          	ld	a,(OFST+0,sp)
 227  0109 2023          	jra	LC005
 228  010b               L52:
 229                     ; 135   case EXTI_PORT_GPIOA:
 229                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 230  010b c650a0        	ld	a,20640
 231                     ; 137     break;
 232  010e 201c          	jp	LC006
 233  0110               L72:
 234                     ; 138   case EXTI_PORT_GPIOB:
 234                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 235  0110 c650a0        	ld	a,20640
 236  0113 a40c          	and	a,#12
 237  0115 44            	srl	a
 238  0116 44            	srl	a
 239                     ; 140     break;
 240  0117 2015          	jp	LC005
 241  0119               L13:
 242                     ; 141   case EXTI_PORT_GPIOC:
 242                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 243  0119 c650a0        	ld	a,20640
 244  011c 4e            	swap	a
 245                     ; 143     break;
 246  011d 200d          	jp	LC006
 247  011f               L33:
 248                     ; 144   case EXTI_PORT_GPIOD:
 248                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 249  011f c650a0        	ld	a,20640
 250  0122 4e            	swap	a
 251  0123 a40c          	and	a,#12
 252  0125 44            	srl	a
 253  0126 44            	srl	a
 254                     ; 146     break;
 255  0127 2003          	jp	LC006
 256  0129               L53:
 257                     ; 147   case EXTI_PORT_GPIOE:
 257                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 258  0129 c650a1        	ld	a,20641
 259  012c               LC006:
 260  012c a403          	and	a,#3
 261  012e               LC005:
 262                     ; 149     break;
 263                     ; 150   default:
 263                     ; 151     break;
 264                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 266  012e 85            	popw	x
 267  012f 81            	ret	
 269                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 269                     ; 163 {
 270  0130               _EXTI_GetTLISensitivity:
 271       00000001      OFST:	set	1
 273                     ; 164   uint8_t value = 0;
 274                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 275  0130 c650a1        	ld	a,20641
 276  0133 a404          	and	a,#4
 277                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 279  0135 81            	ret	
 281                     	xdef	_EXTI_GetTLISensitivity
 282                     	xdef	_EXTI_GetExtIntSensitivity
 283                     	xdef	_EXTI_SetTLISensitivity
 284                     	xdef	_EXTI_SetExtIntSensitivity
 285                     	xdef	_EXTI_DeInit
 286                     	xref	_assert_failed
 287                     .const:	section	.text
 288  0000               L71:
 289  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 290  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 291  0024 38735f657874  	dc.b	"8s_exti.c",0
 292                     	end
