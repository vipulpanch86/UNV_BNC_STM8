   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  20                     ; 54 {
  21                     	scross	off
  22  0000               _GPIO_DeInit:
  24                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  25  0000 7f            	clr	(x)
  26                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  27  0001 6f02          	clr	(2,x)
  28                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  29  0003 6f03          	clr	(3,x)
  30                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
  31  0005 6f04          	clr	(4,x)
  32                     ; 59 }
  33  0007 81            	ret	
  35                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
  35                     ; 72 {
  36  0008               _GPIO_Init:
  37  0008 89            	pushw	x
  38       00000000      OFST:	set	0
  40                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
  41  0009 7b06          	ld	a,(OFST+6,sp)
  42  000b 2731          	jreq	L21
  43  000d a140          	cp	a,#64
  44  000f 272d          	jreq	L21
  45  0011 a120          	cp	a,#32
  46  0013 2729          	jreq	L21
  47  0015 a160          	cp	a,#96
  48  0017 2725          	jreq	L21
  49  0019 a1a0          	cp	a,#160
  50  001b 2721          	jreq	L21
  51  001d a1e0          	cp	a,#224
  52  001f 271d          	jreq	L21
  53  0021 a180          	cp	a,#128
  54  0023 2719          	jreq	L21
  55  0025 a1c0          	cp	a,#192
  56  0027 2715          	jreq	L21
  57  0029 a1b0          	cp	a,#176
  58  002b 2711          	jreq	L21
  59  002d a1f0          	cp	a,#240
  60  002f 270d          	jreq	L21
  61  0031 a190          	cp	a,#144
  62  0033 2709          	jreq	L21
  63  0035 a1d0          	cp	a,#208
  64  0037 2705          	jreq	L21
  65  0039 ae004d        	ldw	x,#77
  66  003c ad5d          	call	LC001
  67  003e               L21:
  68                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
  69  003e 7b05          	ld	a,(OFST+5,sp)
  70  0040 2607          	jrne	L02
  71  0042 ae004e        	ldw	x,#78
  72  0045 ad54          	call	LC001
  73  0047 7b05          	ld	a,(OFST+5,sp)
  74  0049               L02:
  75                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  76  0049 1e01          	ldw	x,(OFST+1,sp)
  77  004b 43            	cpl	a
  78  004c e404          	and	a,(4,x)
  79  004e e704          	ld	(4,x),a
  80                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
  81  0050 7b06          	ld	a,(OFST+6,sp)
  82  0052 2a14          	jrpl	L5
  83                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
  84  0054 a510          	bcp	a,#16
  85  0056 2705          	jreq	L7
  86                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
  87  0058 f6            	ld	a,(x)
  88  0059 1a05          	or	a,(OFST+5,sp)
  90  005b 2004          	jra	L11
  91  005d               L7:
  92                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
  93  005d 7b05          	ld	a,(OFST+5,sp)
  94  005f 43            	cpl	a
  95  0060 f4            	and	a,(x)
  96  0061               L11:
  97  0061 f7            	ld	(x),a
  98                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
  99  0062 e602          	ld	a,(2,x)
 100  0064 1a05          	or	a,(OFST+5,sp)
 102  0066 2005          	jra	L31
 103  0068               L5:
 104                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 105  0068 7b05          	ld	a,(OFST+5,sp)
 106  006a 43            	cpl	a
 107  006b e402          	and	a,(2,x)
 108  006d               L31:
 109  006d e702          	ld	(2,x),a
 110                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 111  006f 7b06          	ld	a,(OFST+6,sp)
 112  0071 a540          	bcp	a,#64
 113  0073 2706          	jreq	L51
 114                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 115  0075 e603          	ld	a,(3,x)
 116  0077 1a05          	or	a,(OFST+5,sp)
 118  0079 2005          	jra	L71
 119  007b               L51:
 120                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 121  007b 7b05          	ld	a,(OFST+5,sp)
 122  007d 43            	cpl	a
 123  007e e403          	and	a,(3,x)
 124  0080               L71:
 125  0080 e703          	ld	(3,x),a
 126                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 127  0082 7b06          	ld	a,(OFST+6,sp)
 128  0084 a520          	bcp	a,#32
 129  0086 2708          	jreq	L12
 130                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 131  0088 1e01          	ldw	x,(OFST+1,sp)
 132  008a e604          	ld	a,(4,x)
 133  008c 1a05          	or	a,(OFST+5,sp)
 135  008e 2007          	jra	L32
 136  0090               L12:
 137                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 138  0090 1e01          	ldw	x,(OFST+1,sp)
 139  0092 7b05          	ld	a,(OFST+5,sp)
 140  0094 43            	cpl	a
 141  0095 e404          	and	a,(4,x)
 142  0097               L32:
 143  0097 e704          	ld	(4,x),a
 144                     ; 131 }
 145  0099 85            	popw	x
 146  009a 81            	ret	
 147  009b               LC001:
 148  009b 89            	pushw	x
 149  009c 5f            	clrw	x
 150  009d 89            	pushw	x
 151  009e ae0000        	ldw	x,#L3
 152  00a1 cd0000        	call	_assert_failed
 154  00a4 5b04          	addw	sp,#4
 155  00a6 81            	ret	
 157                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 157                     ; 142 {
 158  00a7               _GPIO_Write:
 159       fffffffe      OFST: set -2
 161                     ; 143   GPIOx->ODR = PortVal;
 162  00a7 7b03          	ld	a,(OFST+5,sp)
 163  00a9 f7            	ld	(x),a
 164                     ; 144 }
 165  00aa 81            	ret	
 167                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 167                     ; 155 {
 168  00ab               _GPIO_WriteHigh:
 169       fffffffe      OFST: set -2
 171                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 172  00ab f6            	ld	a,(x)
 173  00ac 1a03          	or	a,(OFST+5,sp)
 174  00ae f7            	ld	(x),a
 175                     ; 157 }
 176  00af 81            	ret	
 178                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 178                     ; 168 {
 179  00b0               _GPIO_WriteLow:
 180       fffffffe      OFST: set -2
 182                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 183  00b0 7b03          	ld	a,(OFST+5,sp)
 184  00b2 43            	cpl	a
 185  00b3 f4            	and	a,(x)
 186  00b4 f7            	ld	(x),a
 187                     ; 170 }
 188  00b5 81            	ret	
 190                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 190                     ; 181 {
 191  00b6               _GPIO_WriteReverse:
 192       fffffffe      OFST: set -2
 194                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 195  00b6 f6            	ld	a,(x)
 196  00b7 1803          	xor	a,(OFST+5,sp)
 197  00b9 f7            	ld	(x),a
 198                     ; 183 }
 199  00ba 81            	ret	
 201                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 201                     ; 192 {
 202  00bb               _GPIO_ReadOutputData:
 204                     ; 193   return ((uint8_t)GPIOx->ODR);
 205  00bb f6            	ld	a,(x)
 207  00bc 81            	ret	
 209                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 209                     ; 203 {
 210  00bd               _GPIO_ReadInputData:
 212                     ; 204   return ((uint8_t)GPIOx->IDR);
 213  00bd e601          	ld	a,(1,x)
 215  00bf 81            	ret	
 217                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 217                     ; 214 {
 218  00c0               _GPIO_ReadInputPin:
 219       fffffffe      OFST: set -2
 221                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 222  00c0 e601          	ld	a,(1,x)
 223  00c2 1403          	and	a,(OFST+5,sp)
 225  00c4 81            	ret	
 227                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 227                     ; 226 {
 228  00c5               _GPIO_ExternalPullUpConfig:
 229  00c5 89            	pushw	x
 230       00000000      OFST:	set	0
 232                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 233  00c6 7b05          	ld	a,(OFST+5,sp)
 234  00c8 2605          	jrne	L64
 235  00ca ae00e4        	ldw	x,#228
 236  00cd ad23          	call	LC002
 237  00cf               L64:
 238                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 239  00cf 7b06          	ld	a,(OFST+6,sp)
 240  00d1 2708          	jreq	L65
 241  00d3 4a            	dec	a
 242  00d4 2705          	jreq	L65
 243  00d6 ae00e5        	ldw	x,#229
 244  00d9 ad17          	call	LC002
 245  00db               L65:
 246                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 247  00db 7b06          	ld	a,(OFST+6,sp)
 248  00dd 2708          	jreq	L52
 249                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 250  00df 1e01          	ldw	x,(OFST+1,sp)
 251  00e1 e603          	ld	a,(3,x)
 252  00e3 1a05          	or	a,(OFST+5,sp)
 254  00e5 2007          	jra	L72
 255  00e7               L52:
 256                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 257  00e7 1e01          	ldw	x,(OFST+1,sp)
 258  00e9 7b05          	ld	a,(OFST+5,sp)
 259  00eb 43            	cpl	a
 260  00ec e403          	and	a,(3,x)
 261  00ee               L72:
 262  00ee e703          	ld	(3,x),a
 263                     ; 238 }
 264  00f0 85            	popw	x
 265  00f1 81            	ret	
 266  00f2               LC002:
 267  00f2 89            	pushw	x
 268  00f3 5f            	clrw	x
 269  00f4 89            	pushw	x
 270  00f5 ae0000        	ldw	x,#L3
 271  00f8 cd0000        	call	_assert_failed
 273  00fb 5b04          	addw	sp,#4
 274  00fd 81            	ret	
 276                     	xdef	_GPIO_ExternalPullUpConfig
 277                     	xdef	_GPIO_ReadInputPin
 278                     	xdef	_GPIO_ReadOutputData
 279                     	xdef	_GPIO_ReadInputData
 280                     	xdef	_GPIO_WriteReverse
 281                     	xdef	_GPIO_WriteLow
 282                     	xdef	_GPIO_WriteHigh
 283                     	xdef	_GPIO_Write
 284                     	xdef	_GPIO_Init
 285                     	xdef	_GPIO_DeInit
 286                     	xref	_assert_failed
 287                     .const:	section	.text
 288  0000               L3:
 289  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 290  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 291  0024 38735f677069  	dc.b	"8s_gpio.c",0
 292                     	end
