   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 45 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  20                     ; 46 {
  21  0000               f_NonHandledInterrupt:
  23                     ; 50 }
  24  0000 80            	iret	
  25                     ; 58 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  25                     ; 59 {
  26  0001               f_TRAP_IRQHandler:
  28                     ; 63 }
  29  0001 80            	iret	
  30                     ; 69 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  30                     ; 70 {
  31  0002               f_TLI_IRQHandler:
  33                     ; 74 }
  34  0002 80            	iret	
  35                     ; 81 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
  35                     ; 82 {
  36  0003               f_AWU_IRQHandler:
  38                     ; 86 }
  39  0003 80            	iret	
  40                     ; 93 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
  40                     ; 94 {
  41  0004               f_CLK_IRQHandler:
  43                     ; 98 }
  44  0004 80            	iret	
  45                     ; 105 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
  45                     ; 106 {
  46  0005               f_EXTI_PORTA_IRQHandler:
  48                     ; 110 }
  49  0005 80            	iret	
  50                     	xref	_BspSensorCounter
  51                     ; 117 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
  51                     ; 118 {
  52  0006               f_EXTI_PORTB_IRQHandler:
  54                     ; 120   BspSensorCounter++;
  55  0006 ae0000        	ldw	x,#_BspSensorCounter
  56  0009 a601          	ld	a,#1
  57  000b cd0000        	call	c_lgadc
  59                     ; 121 }
  60  000e 80            	iret	
  61                     ; 128 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
  61                     ; 129 {
  62  000f               f_EXTI_PORTC_IRQHandler:
  64                     ; 133 }
  65  000f 80            	iret	
  66                     ; 140 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
  66                     ; 141 {
  67  0010               f_EXTI_PORTD_IRQHandler:
  69                     ; 145 }
  70  0010 80            	iret	
  71                     ; 152 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
  71                     ; 153 {
  72  0011               f_EXTI_PORTE_IRQHandler:
  74                     ; 157 }
  75  0011 80            	iret	
  76                     ; 203 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
  76                     ; 204 {
  77  0012               f_SPI_IRQHandler:
  79                     ; 208 }
  80  0012 80            	iret	
  81                     ; 215 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
  81                     ; 216 {
  82  0013               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
  84                     ; 220 }
  85  0013 80            	iret	
  86                     ; 227 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
  86                     ; 228 {
  87  0014               f_TIM1_CAP_COM_IRQHandler:
  89                     ; 232 }
  90  0014 80            	iret	
  91                     ; 264 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
  91                     ; 265 {
  92  0015               f_TIM2_UPD_OVF_BRK_IRQHandler:
  94                     ; 269 }
  95  0015 80            	iret	
  96                     ; 276 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
  96                     ; 277 {
  97  0016               f_TIM2_CAP_COM_IRQHandler:
  99                     ; 281 }
 100  0016 80            	iret	
 101                     ; 291 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 101                     ; 292 {
 102  0017               f_TIM3_UPD_OVF_BRK_IRQHandler:
 104                     ; 296 }
 105  0017 80            	iret	
 106                     ; 303 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 106                     ; 304 {
 107  0018               f_TIM3_CAP_COM_IRQHandler:
 109                     ; 308 }
 110  0018 80            	iret	
 111                     	xref	_TurretTxPointer
 112                     	xref	_TurretData
 113                     ; 318 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 113                     ; 319 {
 114  0019               f_UART1_TX_IRQHandler:
 115  0019 8a            	push	cc
 116  001a 84            	pop	a
 117  001b a4bf          	and	a,#191
 118  001d 88            	push	a
 119  001e 86            	pop	cc
 120  001f 3b0002        	push	c_x+2
 121  0022 be00          	ldw	x,c_x
 122  0024 89            	pushw	x
 123  0025 3b0002        	push	c_y+2
 124  0028 be00          	ldw	x,c_y
 125  002a 89            	pushw	x
 127                     ; 326   UART1_SendData8(TurretData[TurretTxPointer++]);
 128  002b c60000        	ld	a,_TurretTxPointer
 129  002e 725c0000      	inc	_TurretTxPointer
 130  0032 5f            	clrw	x
 131  0033 97            	ld	xl,a
 132  0034 d60000        	ld	a,(_TurretData,x)
 133  0037 cd0000        	call	_UART1_SendData8
 135                     ; 328   if(TurretTxPointer >= TURR_MAX_PKT_LEN)
 136  003a c60000        	ld	a,_TurretTxPointer
 137  003d a103          	cp	a,#3
 138  003f 2509          	jrult	L3
 139                     ; 330     UART1_ITConfig(UART1_IT_TXE, DISABLE);
 140  0041 4b00          	push	#0
 141  0043 ae0277        	ldw	x,#631
 142  0046 cd0000        	call	_UART1_ITConfig
 144  0049 84            	pop	a
 145  004a               L3:
 146                     ; 332 }
 147  004a 85            	popw	x
 148  004b bf00          	ldw	c_y,x
 149  004d 320002        	pop	c_y+2
 150  0050 85            	popw	x
 151  0051 bf00          	ldw	c_x,x
 152  0053 320002        	pop	c_x+2
 153  0056 80            	iret	
 154                     ; 339 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 154                     ; 340 {
 155  0057               f_UART1_RX_IRQHandler:
 157                     ; 344 }
 158  0057 80            	iret	
 159                     ; 352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 159                     ; 353 {
 160  0058               f_I2C_IRQHandler:
 162                     ; 357 }
 163  0058 80            	iret	
 164                     ; 391 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 164                     ; 392 {
 165  0059               f_UART3_TX_IRQHandler:
 167                     ; 396 }
 168  0059 80            	iret	
 169                     ; 403 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 169                     ; 404 {
 170  005a               f_UART3_RX_IRQHandler:
 172                     ; 408 }
 173  005a 80            	iret	
 174                     ; 417 INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 174                     ; 418 {
 175  005b               f_ADC2_IRQHandler:
 177                     ; 423   return;
 178  005b 80            	iret	
 179                     	xref	_SystemTimer
 180                     ; 461 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 180                     ; 462 {
 181  005c               f_TIM4_UPD_OVF_IRQHandler:
 182  005c 8a            	push	cc
 183  005d 84            	pop	a
 184  005e a4bf          	and	a,#191
 185  0060 88            	push	a
 186  0061 86            	pop	cc
 187  0062 3b0002        	push	c_x+2
 188  0065 be00          	ldw	x,c_x
 189  0067 89            	pushw	x
 190  0068 3b0002        	push	c_y+2
 191  006b be00          	ldw	x,c_y
 192  006d 89            	pushw	x
 194                     ; 464   SystemTimer++;
 195  006e ae0000        	ldw	x,#_SystemTimer
 196  0071 a601          	ld	a,#1
 197  0073 cd0000        	call	c_lgadc
 199                     ; 467   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 200  0076 a601          	ld	a,#1
 201  0078 cd0000        	call	_TIM4_ClearITPendingBit
 203                     ; 469 }
 204  007b 85            	popw	x
 205  007c bf00          	ldw	c_y,x
 206  007e 320002        	pop	c_y+2
 207  0081 85            	popw	x
 208  0082 bf00          	ldw	c_x,x
 209  0084 320002        	pop	c_x+2
 210  0087 80            	iret	
 211                     ; 477 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 211                     ; 478 {
 212  0088               f_EEPROM_EEC_IRQHandler:
 214                     ; 482 }
 215  0088 80            	iret	
 216                     	xref	_TurretExecute
 217                     	xref	_SensorCounter
 218                     	xref	_CounterMode
 219                     	xref	_FlagSensorEn
 220                     	xref	_FlagUvDetect
 221                     	xref	_FlagAddCount
 222                     	xref	_FlagAutoCount
 223                     	xref	_FlagValueCount
 224                     	xref	_SystemTimer
 225                     	xref	_AdcValue
 226                     	xref	_BuzzerOnTime
 227                     	xdef	f_EEPROM_EEC_IRQHandler
 228                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 229                     	xdef	f_ADC2_IRQHandler
 230                     	xdef	f_UART3_TX_IRQHandler
 231                     	xdef	f_UART3_RX_IRQHandler
 232                     	xdef	f_I2C_IRQHandler
 233                     	xdef	f_UART1_RX_IRQHandler
 234                     	xdef	f_UART1_TX_IRQHandler
 235                     	xdef	f_TIM3_CAP_COM_IRQHandler
 236                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 237                     	xdef	f_TIM2_CAP_COM_IRQHandler
 238                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 239                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 240                     	xdef	f_TIM1_CAP_COM_IRQHandler
 241                     	xdef	f_SPI_IRQHandler
 242                     	xdef	f_EXTI_PORTE_IRQHandler
 243                     	xdef	f_EXTI_PORTD_IRQHandler
 244                     	xdef	f_EXTI_PORTC_IRQHandler
 245                     	xdef	f_EXTI_PORTB_IRQHandler
 246                     	xdef	f_EXTI_PORTA_IRQHandler
 247                     	xdef	f_CLK_IRQHandler
 248                     	xdef	f_AWU_IRQHandler
 249                     	xdef	f_TLI_IRQHandler
 250                     	xdef	f_TRAP_IRQHandler
 251                     	xdef	f_NonHandledInterrupt
 252                     	xref	_UART1_SendData8
 253                     	xref	_UART1_ITConfig
 254                     	xref	_TIM4_ClearITPendingBit
 255                     	xref.b	c_x
 256                     	xref.b	c_y
 257                     	xref	c_lgadc
 258                     	end
