   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               _BuzzerEnable:
  22  0000 00            	dc.b	0
  23  0001               _BuzzerOnTime:
  24  0001 00000000      	dc.l	0
  25  0005               _AdcValue:
  26  0005 0000          	dc.w	0
  27  0007               _SystemTimer:
  28  0007 00000000      	dc.l	0
  29  000b               _BspSensorCounter:
  30  000b 00000000      	dc.l	0
  31                     ; 34 static void CLK_Config(void)
  31                     ; 35 {
  32                     	scross	off
  33                     	switch	.text
  34  0000               L3_CLK_Config:
  36                     ; 36   CLK_DeInit();
  37  0000 cd0000        	call	_CLK_DeInit
  39                     ; 39   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  40  0003 a680          	ld	a,#128
  41  0005 cd0000        	call	_CLK_SYSCLKConfig
  43                     ; 42   CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  44  0008 4f            	clr	a
  45  0009 cd0000        	call	_CLK_SYSCLKConfig
  47                     ; 45   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE,
  47                     ; 46                         CLK_CURRENTCLOCKSTATE_DISABLE);
  48  000c 4b00          	push	#0
  49  000e 4b00          	push	#0
  50  0010 ae01b4        	ldw	x,#436
  51  0013 cd0000        	call	_CLK_ClockSwitchConfig
  53  0016 85            	popw	x
  54                     ; 47 }
  55  0017 81            	ret	
  57                     ; 54 static void GPIO_Config(void)
  57                     ; 55 {
  58  0018               L5_GPIO_Config:
  60                     ; 59   GPIO_Init(TRIACV_GPIO_PORT, TRIACV_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  61  0018 4bd0          	push	#208
  62  001a 4b01          	push	#1
  63  001c ae5019        	ldw	x,#20505
  64  001f cd0000        	call	_GPIO_Init
  66  0022 85            	popw	x
  67                     ; 63   GPIO_Init(TRIACS_GPIO_PORT, TRIACS_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  68  0023 4bd0          	push	#208
  69  0025 4b80          	push	#128
  70  0027 ae5005        	ldw	x,#20485
  71  002a cd0000        	call	_GPIO_Init
  73  002d 85            	popw	x
  74                     ; 67   GPIO_Init(TRIACV_GPIO_PORT, TRIACH_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  75  002e 4bd0          	push	#208
  76  0030 4b40          	push	#64
  77  0032 ae5019        	ldw	x,#20505
  78  0035 cd0000        	call	_GPIO_Init
  80  0038 85            	popw	x
  81                     ; 71   GPIO_Init(BATCH_GPIO_PORT, BATCH_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  82  0039 4bd0          	push	#208
  83  003b 4b08          	push	#8
  84  003d ae5014        	ldw	x,#20500
  85  0040 cd0000        	call	_GPIO_Init
  87  0043 85            	popw	x
  88                     ; 75   GPIO_Init(STAMP_GPIO_PORT, STAMP_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
  89  0044 4bd0          	push	#208
  90  0046 4b10          	push	#16
  91  0048 ae5014        	ldw	x,#20500
  92  004b cd0000        	call	_GPIO_Init
  94  004e 85            	popw	x
  95                     ; 79   GPIO_Init(BUZZER_GPIO_PORT, BUZZER_GPIO_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
  96  004f 4bc0          	push	#192
  97  0051 4b02          	push	#2
  98  0053 ae500a        	ldw	x,#20490
  99  0056 cd0000        	call	_GPIO_Init
 101  0059 85            	popw	x
 102                     ; 83   GPIO_Init(SW_RST_GPIO_PORT, SW_RST_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 103  005a 4b40          	push	#64
 104  005c 4b08          	push	#8
 105  005e ae500a        	ldw	x,#20490
 106  0061 cd0000        	call	_GPIO_Init
 108  0064 85            	popw	x
 109                     ; 87 	GPIO_Init(SW_CAM_GPIO_PORT, SW_CAM_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 110  0065 4b40          	push	#64
 111  0067 4b40          	push	#64
 112  0069 ae5014        	ldw	x,#20500
 113  006c cd0000        	call	_GPIO_Init
 115  006f 85            	popw	x
 116                     ; 91   GPIO_Init(SW_AUTO_GPIO_PORT, SW_AUTO_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 117  0070 4b40          	push	#64
 118  0072 4b80          	push	#128
 119  0074 ae5014        	ldw	x,#20500
 120  0077 cd0000        	call	_GPIO_Init
 122  007a 85            	popw	x
 123                     ; 95   GPIO_Init(ROT_DIP0_GPIO_PORT, ROT_DIP0_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 124  007b 4b40          	push	#64
 125  007d 4b01          	push	#1
 126  007f ae5005        	ldw	x,#20485
 127  0082 cd0000        	call	_GPIO_Init
 129  0085 85            	popw	x
 130                     ; 99   GPIO_Init(ROT_DIP1_GPIO_PORT, ROT_DIP1_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 131  0086 4b40          	push	#64
 132  0088 4b02          	push	#2
 133  008a ae5005        	ldw	x,#20485
 134  008d cd0000        	call	_GPIO_Init
 136  0090 85            	popw	x
 137                     ; 103   GPIO_Init(ROT_DIP2_GPIO_PORT, ROT_DIP2_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 138  0091 4b40          	push	#64
 139  0093 4b04          	push	#4
 140  0095 ae5005        	ldw	x,#20485
 141  0098 cd0000        	call	_GPIO_Init
 143  009b 85            	popw	x
 144                     ; 107   GPIO_Init(ROT_DIP3_GPIO_PORT, ROT_DIP3_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 145  009c 4b40          	push	#64
 146  009e 4b08          	push	#8
 147  00a0 ae5005        	ldw	x,#20485
 148  00a3 cd0000        	call	_GPIO_Init
 150  00a6 85            	popw	x
 151                     ; 108 }
 152  00a7 81            	ret	
 154                     ; 115 void SENSOR_Config(void)
 154                     ; 116 {
 155  00a8               _SENSOR_Config:
 157                     ; 118   GPIO_Init(SENSOR_GPIO_PORT, SENSOR_GPIO_PIN, GPIO_MODE_IN_FL_IT);
 158  00a8 4b20          	push	#32
 159  00aa 4b20          	push	#32
 160  00ac ae5014        	ldw	x,#20500
 161  00af cd0000        	call	_GPIO_Init
 163  00b2 85            	popw	x
 164                     ; 120   EXTI_SetExtIntSensitivity(SENSOR_EXTI, SENSOR_EXTI_SENSE);
 165  00b3 ae0403        	ldw	x,#1027
 167                     ; 122 }
 168  00b6 cc0000        	jp	_EXTI_SetExtIntSensitivity
 170                     ; 128 void FLASH_Config(void)
 170                     ; 129 {
 171  00b9               _FLASH_Config:
 173                     ; 130   FLASH_DeInit();
 174  00b9 cd0000        	call	_FLASH_DeInit
 176                     ; 133   FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 177  00bc 4f            	clr	a
 179                     ; 134 }
 180  00bd cc0000        	jp	_FLASH_SetProgrammingTime
 182                     ; 141 static void TIM4_Config(void)
 182                     ; 142 {
 183  00c0               L7_TIM4_Config:
 185                     ; 153   TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
 186  00c0 ae07bb        	ldw	x,#1979
 187  00c3 cd0000        	call	_TIM4_TimeBaseInit
 189                     ; 155   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 190  00c6 a601          	ld	a,#1
 191  00c8 cd0000        	call	_TIM4_ClearFlag
 193                     ; 157   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 194  00cb ae0101        	ldw	x,#257
 195  00ce cd0000        	call	_TIM4_ITConfig
 197                     ; 159   TIM4_Cmd(ENABLE);
 198  00d1 a601          	ld	a,#1
 200                     ; 160 }
 201  00d3 cc0000        	jp	_TIM4_Cmd
 203                     ; 167 static void UART1_Config(void)
 203                     ; 168 {
 204  00d6               L11_UART1_Config:
 206                     ; 170   UART1_DeInit();
 207  00d6 cd0000        	call	_UART1_DeInit
 209                     ; 182   UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1,
 209                     ; 183              UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE,
 209                     ; 184              UART1_MODE_TXRX_ENABLE);
 210  00d9 4b0c          	push	#12
 211  00db 4b80          	push	#128
 212  00dd 4b00          	push	#0
 213  00df 4b00          	push	#0
 214  00e1 4b00          	push	#0
 215  00e3 ae2580        	ldw	x,#9600
 216  00e6 89            	pushw	x
 217  00e7 5f            	clrw	x
 218  00e8 89            	pushw	x
 219  00e9 cd0000        	call	_UART1_Init
 221  00ec 5b09          	addw	sp,#9
 222                     ; 187   UART1_Cmd(ENABLE);
 223  00ee a601          	ld	a,#1
 225                     ; 188 }
 226  00f0 cc0000        	jp	_UART1_Cmd
 228                     ; 195 static void UV_Config(void)
 228                     ; 196 {
 229  00f3               L31_UV_Config:
 231                     ; 200   GPIO_Init(UV_ENB_GPIO_PORT, UV_ENB_GPIO_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);
 232  00f3 4bd0          	push	#208
 233  00f5 4b10          	push	#16
 234  00f7 ae5005        	ldw	x,#20485
 235  00fa cd0000        	call	_GPIO_Init
 237  00fd 85            	popw	x
 238                     ; 203   GPIO_Init(UV_AIN_GPIO_PORT, UV_AIN_GPIO_PIN, GPIO_MODE_IN_FL_NO_IT);
 239  00fe 4b00          	push	#0
 240  0100 4b20          	push	#32
 241  0102 ae5005        	ldw	x,#20485
 242  0105 cd0000        	call	_GPIO_Init
 244  0108 85            	popw	x
 245                     ; 205   ADC2_DeInit();
 246  0109 cd0000        	call	_ADC2_DeInit
 248                     ; 208   ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_5, ADC2_PRESSEL_FCPU_D18, \
 248                     ; 209             ADC2_EXTTRIG_TIM, DISABLE, ADC2_ALIGN_RIGHT, ADC2_SCHMITTTRIG_CHANNEL8, \
 248                     ; 210             DISABLE);
 249  010c 4b00          	push	#0
 250  010e 4b08          	push	#8
 251  0110 4b08          	push	#8
 252  0112 4b00          	push	#0
 253  0114 4b00          	push	#0
 254  0116 4b70          	push	#112
 255  0118 ae0005        	ldw	x,#5
 256  011b cd0000        	call	_ADC2_Init
 258  011e 5b06          	addw	sp,#6
 259                     ; 213   ADC2_StartConversion();
 261                     ; 214 }
 262  0120 cc0000        	jp	_ADC2_StartConversion
 264                     	switch	.data
 265  000f               L51_BackupSysTime:
 266  000f 00000000      	dc.l	0
 267                     ; 221 void BSP_BuzzerExec(void)
 267                     ; 222 {
 268                     	switch	.text
 269  0123               _BSP_BuzzerExec:
 271                     ; 225   if(BuzzerEnable == TRUE)
 272  0123 c60000        	ld	a,_BuzzerEnable
 273  0126 4a            	dec	a
 274  0127 2635          	jrne	L71
 275                     ; 227     if(absolute((int32_t)(SystemTimer - BackupSysTime)) >= BuzzerOnTime)
 276  0129 ae0007        	ldw	x,#_SystemTimer
 277  012c cd0000        	call	c_ltor
 279  012f ae000f        	ldw	x,#L51_BackupSysTime
 280  0132 cd0000        	call	c_lsub
 282  0135 be02          	ldw	x,c_lreg+2
 283  0137 89            	pushw	x
 284  0138 be00          	ldw	x,c_lreg
 285  013a 89            	pushw	x
 286  013b cd0000        	call	_absolute
 288  013e 5b04          	addw	sp,#4
 289  0140 ae0001        	ldw	x,#_BuzzerOnTime
 290  0143 cd0000        	call	c_lcmp
 292  0146 2532          	jrult	L32
 293                     ; 229       BuzzerEnable = FALSE;
 294  0148 725f0000      	clr	_BuzzerEnable
 295                     ; 230       BuzzerOnTime = 0;
 296  014c 5f            	clrw	x
 297  014d cf0003        	ldw	_BuzzerOnTime+2,x
 298  0150 cf0001        	ldw	_BuzzerOnTime,x
 299                     ; 231       BackupSysTime = 0;
 300  0153 cf0011        	ldw	L51_BackupSysTime+2,x
 301  0156 cf000f        	ldw	L51_BackupSysTime,x
 302                     ; 233       BUZZER_GPIO_PORT->ODR &= ~BUZZER_GPIO_PIN;
 303  0159 7213500a      	bres	20490,#1
 304  015d 81            	ret	
 305  015e               L71:
 306                     ; 238     if(BuzzerOnTime > 0)
 307  015e ae0001        	ldw	x,#_BuzzerOnTime
 308  0161 cd0000        	call	c_lzmp
 310  0164 2714          	jreq	L32
 311                     ; 240       BuzzerEnable = TRUE;
 312  0166 35010000      	mov	_BuzzerEnable,#1
 313                     ; 241       BackupSysTime = SystemTimer;
 314  016a ce0009        	ldw	x,_SystemTimer+2
 315  016d cf0011        	ldw	L51_BackupSysTime+2,x
 316  0170 ce0007        	ldw	x,_SystemTimer
 317  0173 cf000f        	ldw	L51_BackupSysTime,x
 318                     ; 243       BUZZER_GPIO_PORT->ODR |= BUZZER_GPIO_PIN;
 319  0176 7212500a      	bset	20490,#1
 320  017a               L32:
 321                     ; 246 }
 322  017a 81            	ret	
 324                     ; 253 void BSP_AdcExec(void)
 324                     ; 254 {
 325  017b               _BSP_AdcExec:
 326  017b 5206          	subw	sp,#6
 327       00000006      OFST:	set	6
 329                     ; 257   ADC2_ClearFlag();
 330  017d cd0000        	call	_ADC2_ClearFlag
 332                     ; 258   adcVal = ADC2_GetConversionValue();
 333  0180 cd0000        	call	_ADC2_GetConversionValue
 335  0183 1f05          	ldw	(OFST-1,sp),x
 336                     ; 259   ADC2_StartConversion();
 337  0185 cd0000        	call	_ADC2_StartConversion
 339                     ; 260   AdcValue = (AdcValue >> 1) + (AdcValue >> 2) + (adcVal >> 2);
 340  0188 1e05          	ldw	x,(OFST-1,sp)
 341  018a 54            	srlw	x
 342  018b 54            	srlw	x
 343  018c 1f03          	ldw	(OFST-3,sp),x
 344  018e ce0005        	ldw	x,_AdcValue
 345  0191 54            	srlw	x
 346  0192 54            	srlw	x
 347  0193 1f01          	ldw	(OFST-5,sp),x
 348  0195 ce0005        	ldw	x,_AdcValue
 349  0198 54            	srlw	x
 350  0199 72fb01        	addw	x,(OFST-5,sp)
 351  019c 72fb03        	addw	x,(OFST-3,sp)
 352  019f cf0005        	ldw	_AdcValue,x
 353                     ; 261 }
 354  01a2 5b06          	addw	sp,#6
 355  01a4 81            	ret	
 357                     ; 268 void BSP_EepromDeInit(void)
 357                     ; 269 {
 358  01a5               _BSP_EepromDeInit:
 360                     ; 271   I2C_Cmd(DISABLE);
 361  01a5 4f            	clr	a
 362  01a6 cd0000        	call	_I2C_Cmd
 364                     ; 274   I2C_DeInit();
 365  01a9 cd0000        	call	_I2C_DeInit
 367                     ; 277   CLK_PeripheralClockConfig(EE_I2C_CLK, DISABLE);
 368  01ac 5f            	clrw	x
 369  01ad cd0000        	call	_CLK_PeripheralClockConfig
 371                     ; 281   GPIO_Init(EE_I2C_SCL_GPIO_PORT, EE_I2C_SCL_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 372  01b0 ad00          	call	LC001
 373                     ; 284   GPIO_Init(EE_I2C_SCL_GPIO_PORT, EE_I2C_SCL_GPIO_PIN, GPIO_MODE_IN_PU_NO_IT);
 374                     ; 285 }
 375  01b2               LC001:
 376  01b2 4b40          	push	#64
 377  01b4 4b02          	push	#2
 378  01b6 ae5014        	ldw	x,#20500
 379  01b9 cd0000        	call	_GPIO_Init
 381  01bc 85            	popw	x
 382  01bd 81            	ret	
 384                     ; 292 void BSP_EepromInit(void)
 384                     ; 293 {
 385  01be               _BSP_EepromInit:
 387                     ; 295   CLK_PeripheralClockConfig(EE_I2C_CLK, ENABLE);
 388  01be ae0001        	ldw	x,#1
 390                     ; 296 }
 391  01c1 cc0000        	jp	_CLK_PeripheralClockConfig
 393                     ; 304 void BSP_Init(void)
 393                     ; 305 {
 394  01c4               _BSP_Init:
 396                     ; 307   GPIO_Config();
 397  01c4 cd0018        	call	L5_GPIO_Config
 399                     ; 310   SENSOR_Config();
 400  01c7 cd00a8        	call	_SENSOR_Config
 402                     ; 313   FLASH_Config();
 403  01ca cd00b9        	call	_FLASH_Config
 405                     ; 316   CLK_Config();
 406  01cd cd0000        	call	L3_CLK_Config
 408                     ; 319   TIM4_Config();
 409  01d0 cd00c0        	call	L7_TIM4_Config
 411                     ; 322   UART1_Config();
 412  01d3 cd00d6        	call	L11_UART1_Config
 414                     ; 325   UV_Config();
 415  01d6 cd00f3        	call	L31_UV_Config
 417                     ; 328   enableInterrupts();
 419  01d9 9a            	rim	
 421                     ; 329 }
 422  01da 81            	ret	
 424                     ; 336 uint8_t BSP_ReadRotDipSwitch(void)
 424                     ; 337 {
 425  01db               _BSP_ReadRotDipSwitch:
 426  01db 88            	push	a
 427       00000001      OFST:	set	1
 429                     ; 338   uint8_t dipSwitchVal = 0;
 430  01dc 0f01          	clr	(OFST+0,sp)
 431                     ; 340   dipSwitchVal |= (uint8_t)((ROT_DIP0_GPIO_PORT->IDR & ROT_DIP0_GPIO_PIN) ? 0: 1<<0);
 432  01de 7201500603    	btjf	20486,#0,L002
 433  01e3 4f            	clr	a
 434  01e4 2002          	jra	L202
 435  01e6               L002:
 436  01e6 a601          	ld	a,#1
 437  01e8               L202:
 438  01e8 1a01          	or	a,(OFST+0,sp)
 439  01ea 6b01          	ld	(OFST+0,sp),a
 440                     ; 341   dipSwitchVal |= (uint8_t)((ROT_DIP1_GPIO_PORT->IDR & ROT_DIP1_GPIO_PIN) ? 0: 1<<1);
 441  01ec 7203500603    	btjf	20486,#1,L402
 442  01f1 4f            	clr	a
 443  01f2 2002          	jra	L602
 444  01f4               L402:
 445  01f4 a602          	ld	a,#2
 446  01f6               L602:
 447  01f6 1a01          	or	a,(OFST+0,sp)
 448  01f8 6b01          	ld	(OFST+0,sp),a
 449                     ; 342   dipSwitchVal |= (uint8_t)((ROT_DIP2_GPIO_PORT->IDR & ROT_DIP2_GPIO_PIN) ? 0: 1<<2);
 450  01fa 7205500603    	btjf	20486,#2,L012
 451  01ff 4f            	clr	a
 452  0200 2002          	jra	L212
 453  0202               L012:
 454  0202 a604          	ld	a,#4
 455  0204               L212:
 456  0204 1a01          	or	a,(OFST+0,sp)
 457  0206 6b01          	ld	(OFST+0,sp),a
 458                     ; 343   dipSwitchVal |= (uint8_t)((ROT_DIP3_GPIO_PORT->IDR & ROT_DIP3_GPIO_PIN) ? 0: 1<<3);
 459  0208 7207500603    	btjf	20486,#3,L412
 460  020d 4f            	clr	a
 461  020e 2002          	jra	L612
 462  0210               L412:
 463  0210 a608          	ld	a,#8
 464  0212               L612:
 465  0212 1a01          	or	a,(OFST+0,sp)
 466                     ; 346   return (dipSwitchVal) ;
 468  0214 5b01          	addw	sp,#1
 469  0216 81            	ret	
 471                     ; 354 void BSP_ReadFromFlash(uint16_t size, uint8_t *pData)
 471                     ; 355 {
 472  0217               _BSP_ReadFromFlash:
 473  0217 89            	pushw	x
 474       00000000      OFST:	set	0
 476                     ; 364     EE_ReadBuffer(pData, 0, &size);
 477  0218 96            	ldw	x,sp
 478  0219 5c            	incw	x
 479  021a 89            	pushw	x
 480  021b 5f            	clrw	x
 481  021c 89            	pushw	x
 482  021d 1e09          	ldw	x,(OFST+9,sp)
 483  021f cd0000        	call	_EE_ReadBuffer
 485                     ; 366 }
 486  0222 5b06          	addw	sp,#6
 487  0224 81            	ret	
 489                     ; 374 void BSP_WriteToFlash(uint16_t size, uint8_t *pData)
 489                     ; 375 {
 490  0225               _BSP_WriteToFlash:
 491  0225 89            	pushw	x
 492       00000000      OFST:	set	0
 494                     ; 392   EE_I2C_WP_GPIO_PORT->ODR &= ~EE_I2C_WP_GPIO_PIN;
 495  0226 72115014      	bres	20500,#0
 496                     ; 394   EE_WriteBuffer(pData, 0, size);
 497  022a 89            	pushw	x
 498  022b 5f            	clrw	x
 499  022c 89            	pushw	x
 500  022d 1e09          	ldw	x,(OFST+9,sp)
 501  022f cd0000        	call	_EE_WriteBuffer
 503  0232 5b04          	addw	sp,#4
 504                     ; 397   EE_I2C_WP_GPIO_PORT->ODR |= EE_I2C_WP_GPIO_PIN;
 505  0234 72105014      	bset	20500,#0
 506                     ; 399 }
 507  0238 85            	popw	x
 508  0239 81            	ret	
 510                     	xdef	_FLASH_Config
 511                     	xdef	_SENSOR_Config
 512                     	xdef	_BuzzerEnable
 513                     	xref	_EE_WriteBuffer
 514                     	xref	_EE_ReadBuffer
 515                     	xref	_TurretExecute
 516                     	xref	_absolute
 517                     	xref	_SensorCounter
 518                     	xref	_CounterMode
 519                     	xref	_FlagSensorEn
 520                     	xref	_FlagUvDetect
 521                     	xref	_FlagAddCount
 522                     	xref	_FlagAutoCount
 523                     	xref	_FlagValueCount
 524                     	xdef	_BSP_EepromInit
 525                     	xdef	_BSP_EepromDeInit
 526                     	xdef	_BSP_WriteToFlash
 527                     	xdef	_BSP_ReadFromFlash
 528                     	xdef	_BSP_ReadRotDipSwitch
 529                     	xdef	_BSP_AdcExec
 530                     	xdef	_BSP_BuzzerExec
 531                     	xdef	_BSP_Init
 532                     	xdef	_BspSensorCounter
 533                     	xdef	_SystemTimer
 534                     	xdef	_AdcValue
 535                     	xdef	_BuzzerOnTime
 536                     	xref	_UART1_Cmd
 537                     	xref	_UART1_Init
 538                     	xref	_UART1_DeInit
 539                     	xref	_TIM4_ClearFlag
 540                     	xref	_TIM4_ITConfig
 541                     	xref	_TIM4_Cmd
 542                     	xref	_TIM4_TimeBaseInit
 543                     	xref	_I2C_Cmd
 544                     	xref	_I2C_DeInit
 545                     	xref	_GPIO_Init
 546                     	xref	_FLASH_SetProgrammingTime
 547                     	xref	_FLASH_DeInit
 548                     	xref	_EXTI_SetExtIntSensitivity
 549                     	xref	_CLK_SYSCLKConfig
 550                     	xref	_CLK_ClockSwitchConfig
 551                     	xref	_CLK_PeripheralClockConfig
 552                     	xref	_CLK_DeInit
 553                     	xref	_ADC2_ClearFlag
 554                     	xref	_ADC2_GetConversionValue
 555                     	xref	_ADC2_StartConversion
 556                     	xref	_ADC2_Init
 557                     	xref	_ADC2_DeInit
 558                     	xref.b	c_lreg
 559                     	xref	c_lzmp
 560                     	xref	c_lcmp
 561                     	xref	c_lsub
 562                     	xref	c_ltor
 563                     	end
