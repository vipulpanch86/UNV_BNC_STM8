   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 50 uint8_t ITC_GetCPUCC(void)
  20                     ; 51 {
  21                     	scross	off
  22  0000               _ITC_GetCPUCC:
  24                     ; 53   _asm("push cc");
  26  0000 8a            	push	cc
  28                     ; 54   _asm("pop a");
  30  0001 84            	pop	a
  32                     ; 55   return 0; /* Ignore compiler warning, the returned value is in A register */
  33  0002 4f            	clr	a
  35  0003 81            	ret	
  37                     ; 80 void ITC_DeInit(void)
  37                     ; 81 {
  38  0004               _ITC_DeInit:
  40                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  41  0004 35ff7f70      	mov	32624,#255
  42                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  43  0008 35ff7f71      	mov	32625,#255
  44                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  45  000c 35ff7f72      	mov	32626,#255
  46                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  47  0010 35ff7f73      	mov	32627,#255
  48                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  49  0014 35ff7f74      	mov	32628,#255
  50                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  51  0018 35ff7f75      	mov	32629,#255
  52                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
  53  001c 35ff7f76      	mov	32630,#255
  54                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
  55  0020 35ff7f77      	mov	32631,#255
  56                     ; 90 }
  57  0024 81            	ret	
  59                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
  59                     ; 98 {
  60  0025               _ITC_GetSoftIntStatus:
  62                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
  63  0025 add9          	call	_ITC_GetCPUCC
  65  0027 a428          	and	a,#40
  67  0029 81            	ret	
  69                     .const:	section	.text
  70  0000               L03:
  71  0000 005f          	dc.w	L3
  72  0002 005f          	dc.w	L3
  73  0004 005f          	dc.w	L3
  74  0006 005f          	dc.w	L3
  75  0008 0064          	dc.w	L5
  76  000a 0064          	dc.w	L5
  77  000c 0064          	dc.w	L5
  78  000e 0064          	dc.w	L5
  79  0010 0084          	dc.w	L72
  80  0012 0084          	dc.w	L72
  81  0014 0069          	dc.w	L7
  82  0016 0069          	dc.w	L7
  83  0018 006e          	dc.w	L11
  84  001a 006e          	dc.w	L11
  85  001c 006e          	dc.w	L11
  86  001e 006e          	dc.w	L11
  87  0020 0073          	dc.w	L31
  88  0022 0073          	dc.w	L31
  89  0024 0073          	dc.w	L31
  90  0026 0073          	dc.w	L31
  91  0028 0078          	dc.w	L51
  92  002a 0078          	dc.w	L51
  93  002c 0078          	dc.w	L51
  94  002e 0078          	dc.w	L51
  95  0030 007d          	dc.w	L71
  96                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
  96                     ; 108 {
  97                     	switch	.text
  98  002a               _ITC_GetSoftwarePriority:
  99  002a 88            	push	a
 100  002b 89            	pushw	x
 101       00000002      OFST:	set	2
 103                     ; 109   uint8_t Value = 0;
 104  002c 0f02          	clr	(OFST+0,sp)
 105                     ; 110   uint8_t Mask = 0;
 106                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 107  002e a119          	cp	a,#25
 108  0030 250e          	jrult	L61
 109  0032 ae0071        	ldw	x,#113
 110  0035 89            	pushw	x
 111  0036 5f            	clrw	x
 112  0037 89            	pushw	x
 113  0038 ae0064        	ldw	x,#L32
 114  003b cd0000        	call	_assert_failed
 116  003e 5b04          	addw	sp,#4
 117  0040               L61:
 118                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 119  0040 7b03          	ld	a,(OFST+1,sp)
 120  0042 a403          	and	a,#3
 121  0044 48            	sll	a
 122  0045 5f            	clrw	x
 123  0046 97            	ld	xl,a
 124  0047 a603          	ld	a,#3
 125  0049 5d            	tnzw	x
 126  004a 2704          	jreq	L22
 127  004c               L42:
 128  004c 48            	sll	a
 129  004d 5a            	decw	x
 130  004e 26fc          	jrne	L42
 131  0050               L22:
 132  0050 6b01          	ld	(OFST-1,sp),a
 133                     ; 118   switch (IrqNum)
 134  0052 7b03          	ld	a,(OFST+1,sp)
 136                     ; 198   default:
 136                     ; 199     break;
 137  0054 a119          	cp	a,#25
 138  0056 242c          	jruge	L72
 139  0058 5f            	clrw	x
 140  0059 97            	ld	xl,a
 141  005a 58            	sllw	x
 142  005b de0000        	ldw	x,(L03,x)
 143  005e fc            	jp	(x)
 144  005f               L3:
 145                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 145                     ; 121   case ITC_IRQ_AWU:
 145                     ; 122   case ITC_IRQ_CLK:
 145                     ; 123   case ITC_IRQ_PORTA:
 145                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 146  005f c67f70        	ld	a,32624
 147                     ; 125     break;
 148  0062 201c          	jp	LC001
 149  0064               L5:
 150                     ; 127   case ITC_IRQ_PORTB:
 150                     ; 128   case ITC_IRQ_PORTC:
 150                     ; 129   case ITC_IRQ_PORTD:
 150                     ; 130   case ITC_IRQ_PORTE:
 150                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 151  0064 c67f71        	ld	a,32625
 152                     ; 132     break;
 153  0067 2017          	jp	LC001
 154  0069               L7:
 155                     ; 141   case ITC_IRQ_SPI:
 155                     ; 142   case ITC_IRQ_TIM1_OVF:
 155                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 156  0069 c67f72        	ld	a,32626
 157                     ; 144     break;
 158  006c 2012          	jp	LC001
 159  006e               L11:
 160                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 160                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 160                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 160                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 160                     ; 150 #else
 160                     ; 151   case ITC_IRQ_TIM2_OVF:
 160                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 160                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 160                     ; 154   case ITC_IRQ_TIM3_OVF:
 160                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 161  006e c67f73        	ld	a,32627
 162                     ; 156     break;
 163  0071 200d          	jp	LC001
 164  0073               L31:
 165                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 165                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 165                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 165                     ; 161   case ITC_IRQ_UART1_TX:
 165                     ; 162   case ITC_IRQ_UART1_RX:
 165                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 165                     ; 164 #if defined(STM8AF622x)
 165                     ; 165   case ITC_IRQ_UART4_TX:
 165                     ; 166   case ITC_IRQ_UART4_RX:
 165                     ; 167 #endif /*STM8AF622x */
 165                     ; 168   case ITC_IRQ_I2C:
 165                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 166  0073 c67f74        	ld	a,32628
 167                     ; 170     break;
 168  0076 2008          	jp	LC001
 169  0078               L51:
 170                     ; 178   case ITC_IRQ_UART3_TX:
 170                     ; 179   case ITC_IRQ_UART3_RX:
 170                     ; 180   case ITC_IRQ_ADC2:
 170                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 170                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 170                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 170                     ; 184   case ITC_IRQ_ADC1:
 170                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 170                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 170                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 170                     ; 188 #else
 170                     ; 189   case ITC_IRQ_TIM4_OVF:
 170                     ; 190 #endif /*STM8S903 or STM8AF622x */
 170                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 171  0078 c67f75        	ld	a,32629
 172                     ; 192     break;
 173  007b 2003          	jp	LC001
 174  007d               L71:
 175                     ; 194   case ITC_IRQ_EEPROM_EEC:
 175                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 176  007d c67f76        	ld	a,32630
 177  0080               LC001:
 178  0080 1401          	and	a,(OFST-1,sp)
 179  0082 6b02          	ld	(OFST+0,sp),a
 180                     ; 196     break;
 181                     ; 198   default:
 181                     ; 199     break;
 182  0084               L72:
 183                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 184  0084 7b03          	ld	a,(OFST+1,sp)
 185  0086 a403          	and	a,#3
 186  0088 48            	sll	a
 187  0089 5f            	clrw	x
 188  008a 97            	ld	xl,a
 189  008b 7b02          	ld	a,(OFST+0,sp)
 190  008d 5d            	tnzw	x
 191  008e 2704          	jreq	L23
 192  0090               L43:
 193  0090 44            	srl	a
 194  0091 5a            	decw	x
 195  0092 26fc          	jrne	L43
 196  0094               L23:
 197                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 199  0094 5b03          	addw	sp,#3
 200  0096 81            	ret	
 202                     	switch	.const
 203  0032               L001:
 204  0032 00fd          	dc.w	L13
 205  0034 00fd          	dc.w	L13
 206  0036 00fd          	dc.w	L13
 207  0038 00fd          	dc.w	L13
 208  003a 010f          	dc.w	L33
 209  003c 010f          	dc.w	L33
 210  003e 010f          	dc.w	L33
 211  0040 010f          	dc.w	L33
 212  0042 0179          	dc.w	L35
 213  0044 0179          	dc.w	L35
 214  0046 0121          	dc.w	L53
 215  0048 0121          	dc.w	L53
 216  004a 0133          	dc.w	L73
 217  004c 0133          	dc.w	L73
 218  004e 0133          	dc.w	L73
 219  0050 0133          	dc.w	L73
 220  0052 0145          	dc.w	L14
 221  0054 0145          	dc.w	L14
 222  0056 0145          	dc.w	L14
 223  0058 0145          	dc.w	L14
 224  005a 0157          	dc.w	L34
 225  005c 0157          	dc.w	L34
 226  005e 0157          	dc.w	L34
 227  0060 0157          	dc.w	L34
 228  0062 0169          	dc.w	L54
 229                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 229                     ; 221 {
 230                     	switch	.text
 231  0097               _ITC_SetSoftwarePriority:
 232  0097 89            	pushw	x
 233  0098 89            	pushw	x
 234       00000002      OFST:	set	2
 236                     ; 222   uint8_t Mask = 0;
 237                     ; 223   uint8_t NewPriority = 0;
 238                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 239  0099 9e            	ld	a,xh
 240  009a a119          	cp	a,#25
 241  009c 2506          	jrult	L24
 242  009e ae00e2        	ldw	x,#226
 243  00a1 cd017c        	call	LC002
 244  00a4               L24:
 245                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 246  00a4 7b04          	ld	a,(OFST+2,sp)
 247  00a6 a102          	cp	a,#2
 248  00a8 2711          	jreq	L25
 249  00aa 4a            	dec	a
 250  00ab 270e          	jreq	L25
 251  00ad 7b04          	ld	a,(OFST+2,sp)
 252  00af 270a          	jreq	L25
 253  00b1 a103          	cp	a,#3
 254  00b3 2706          	jreq	L25
 255  00b5 ae00e3        	ldw	x,#227
 256  00b8 cd017c        	call	LC002
 257  00bb               L25:
 258                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 259  00bb cd0025        	call	_ITC_GetSoftIntStatus
 261  00be a128          	cp	a,#40
 262  00c0 2706          	jreq	L26
 263  00c2 ae00e6        	ldw	x,#230
 264  00c5 cd017c        	call	LC002
 265  00c8               L26:
 266                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 267  00c8 7b03          	ld	a,(OFST+1,sp)
 268  00ca a403          	and	a,#3
 269  00cc 48            	sll	a
 270  00cd 5f            	clrw	x
 271  00ce 97            	ld	xl,a
 272  00cf a603          	ld	a,#3
 273  00d1 5d            	tnzw	x
 274  00d2 2704          	jreq	L66
 275  00d4               L07:
 276  00d4 48            	sll	a
 277  00d5 5a            	decw	x
 278  00d6 26fc          	jrne	L07
 279  00d8               L66:
 280  00d8 43            	cpl	a
 281  00d9 6b01          	ld	(OFST-1,sp),a
 282                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 283  00db 7b03          	ld	a,(OFST+1,sp)
 284  00dd a403          	and	a,#3
 285  00df 48            	sll	a
 286  00e0 5f            	clrw	x
 287  00e1 97            	ld	xl,a
 288  00e2 7b04          	ld	a,(OFST+2,sp)
 289  00e4 5d            	tnzw	x
 290  00e5 2704          	jreq	L27
 291  00e7               L47:
 292  00e7 48            	sll	a
 293  00e8 5a            	decw	x
 294  00e9 26fc          	jrne	L47
 295  00eb               L27:
 296  00eb 6b02          	ld	(OFST+0,sp),a
 297                     ; 239   switch (IrqNum)
 298  00ed 7b03          	ld	a,(OFST+1,sp)
 300                     ; 329   default:
 300                     ; 330     break;
 301  00ef a119          	cp	a,#25
 302  00f1 2503cc0179    	jruge	L35
 303  00f6 5f            	clrw	x
 304  00f7 97            	ld	xl,a
 305  00f8 58            	sllw	x
 306  00f9 de0032        	ldw	x,(L001,x)
 307  00fc fc            	jp	(x)
 308  00fd               L13:
 309                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 309                     ; 242   case ITC_IRQ_AWU:
 309                     ; 243   case ITC_IRQ_CLK:
 309                     ; 244   case ITC_IRQ_PORTA:
 309                     ; 245     ITC->ISPR1 &= Mask;
 310  00fd c67f70        	ld	a,32624
 311  0100 1401          	and	a,(OFST-1,sp)
 312  0102 c77f70        	ld	32624,a
 313                     ; 246     ITC->ISPR1 |= NewPriority;
 314  0105 c67f70        	ld	a,32624
 315  0108 1a02          	or	a,(OFST+0,sp)
 316  010a c77f70        	ld	32624,a
 317                     ; 247     break;
 318  010d 206a          	jra	L35
 319  010f               L33:
 320                     ; 249   case ITC_IRQ_PORTB:
 320                     ; 250   case ITC_IRQ_PORTC:
 320                     ; 251   case ITC_IRQ_PORTD:
 320                     ; 252   case ITC_IRQ_PORTE:
 320                     ; 253     ITC->ISPR2 &= Mask;
 321  010f c67f71        	ld	a,32625
 322  0112 1401          	and	a,(OFST-1,sp)
 323  0114 c77f71        	ld	32625,a
 324                     ; 254     ITC->ISPR2 |= NewPriority;
 325  0117 c67f71        	ld	a,32625
 326  011a 1a02          	or	a,(OFST+0,sp)
 327  011c c77f71        	ld	32625,a
 328                     ; 255     break;
 329  011f 2058          	jra	L35
 330  0121               L53:
 331                     ; 264   case ITC_IRQ_SPI:
 331                     ; 265   case ITC_IRQ_TIM1_OVF:
 331                     ; 266     ITC->ISPR3 &= Mask;
 332  0121 c67f72        	ld	a,32626
 333  0124 1401          	and	a,(OFST-1,sp)
 334  0126 c77f72        	ld	32626,a
 335                     ; 267     ITC->ISPR3 |= NewPriority;
 336  0129 c67f72        	ld	a,32626
 337  012c 1a02          	or	a,(OFST+0,sp)
 338  012e c77f72        	ld	32626,a
 339                     ; 268     break;
 340  0131 2046          	jra	L35
 341  0133               L73:
 342                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 342                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 342                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 342                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 342                     ; 274 #else
 342                     ; 275   case ITC_IRQ_TIM2_OVF:
 342                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 342                     ; 277 #endif /*STM8S903 or STM8AF622x */
 342                     ; 278   case ITC_IRQ_TIM3_OVF:
 342                     ; 279     ITC->ISPR4 &= Mask;
 343  0133 c67f73        	ld	a,32627
 344  0136 1401          	and	a,(OFST-1,sp)
 345  0138 c77f73        	ld	32627,a
 346                     ; 280     ITC->ISPR4 |= NewPriority;
 347  013b c67f73        	ld	a,32627
 348  013e 1a02          	or	a,(OFST+0,sp)
 349  0140 c77f73        	ld	32627,a
 350                     ; 281     break;
 351  0143 2034          	jra	L35
 352  0145               L14:
 353                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 353                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 353                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 353                     ; 286   case ITC_IRQ_UART1_TX:
 353                     ; 287   case ITC_IRQ_UART1_RX:
 353                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 353                     ; 289 #if defined(STM8AF622x)
 353                     ; 290   case ITC_IRQ_UART4_TX:
 353                     ; 291   case ITC_IRQ_UART4_RX:
 353                     ; 292 #endif /*STM8AF622x */
 353                     ; 293   case ITC_IRQ_I2C:
 353                     ; 294     ITC->ISPR5 &= Mask;
 354  0145 c67f74        	ld	a,32628
 355  0148 1401          	and	a,(OFST-1,sp)
 356  014a c77f74        	ld	32628,a
 357                     ; 295     ITC->ISPR5 |= NewPriority;
 358  014d c67f74        	ld	a,32628
 359  0150 1a02          	or	a,(OFST+0,sp)
 360  0152 c77f74        	ld	32628,a
 361                     ; 296     break;
 362  0155 2022          	jra	L35
 363  0157               L34:
 364                     ; 305   case ITC_IRQ_UART3_TX:
 364                     ; 306   case ITC_IRQ_UART3_RX:
 364                     ; 307   case ITC_IRQ_ADC2:
 364                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 364                     ; 309     
 364                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 364                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 364                     ; 312   case ITC_IRQ_ADC1:
 364                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 364                     ; 314     
 364                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 364                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 364                     ; 317 #else
 364                     ; 318   case ITC_IRQ_TIM4_OVF:
 364                     ; 319 #endif /* STM8S903 or STM8AF622x */
 364                     ; 320     ITC->ISPR6 &= Mask;
 365  0157 c67f75        	ld	a,32629
 366  015a 1401          	and	a,(OFST-1,sp)
 367  015c c77f75        	ld	32629,a
 368                     ; 321     ITC->ISPR6 |= NewPriority;
 369  015f c67f75        	ld	a,32629
 370  0162 1a02          	or	a,(OFST+0,sp)
 371  0164 c77f75        	ld	32629,a
 372                     ; 322     break;
 373  0167 2010          	jra	L35
 374  0169               L54:
 375                     ; 324   case ITC_IRQ_EEPROM_EEC:
 375                     ; 325     ITC->ISPR7 &= Mask;
 376  0169 c67f76        	ld	a,32630
 377  016c 1401          	and	a,(OFST-1,sp)
 378  016e c77f76        	ld	32630,a
 379                     ; 326     ITC->ISPR7 |= NewPriority;
 380  0171 c67f76        	ld	a,32630
 381  0174 1a02          	or	a,(OFST+0,sp)
 382  0176 c77f76        	ld	32630,a
 383                     ; 327     break;
 384                     ; 329   default:
 384                     ; 330     break;
 385  0179               L35:
 386                     ; 332 }
 387  0179 5b04          	addw	sp,#4
 388  017b 81            	ret	
 389  017c               LC002:
 390  017c 89            	pushw	x
 391  017d 5f            	clrw	x
 392  017e 89            	pushw	x
 393  017f ae0064        	ldw	x,#L32
 394  0182 cd0000        	call	_assert_failed
 396  0185 5b04          	addw	sp,#4
 397  0187 81            	ret	
 399                     	xdef	_ITC_GetSoftwarePriority
 400                     	xdef	_ITC_SetSoftwarePriority
 401                     	xdef	_ITC_GetSoftIntStatus
 402                     	xdef	_ITC_DeInit
 403                     	xdef	_ITC_GetCPUCC
 404                     	xref	_assert_failed
 405                     	switch	.const
 406  0064               L32:
 407  0064 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 408  0076 6970685f6472  	dc.b	"iph_driver\src\stm"
 409  0088 38735f697463  	dc.b	"8s_itc.c",0
 410                     	end
