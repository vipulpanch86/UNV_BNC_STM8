   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               _Tx1Buffer:
  22  0000 53544d385320  	dc.b	"STM8S I2C Firmware"
  23  0012 204c69627261  	dc.b	" Library EEPROM dr"
  24  0024 697665722065  	dc.b	"iver example : I2C"
  25  0036 3120696e7465  	dc.b	"1 interfacing with"
  26  0048 203234433032  	dc.b	" 24C02 EEPROM */",0
  27  0059               _Tx2Buffer:
  28  0059 546869732066  	dc.b	"This firmware prov"
  29  006b 696465732061  	dc.b	"ides an example of"
  30  007d 207468652049  	dc.b	" the I2C firmware "
  31  008f 6c6962726172  	dc.b	"library and an ass"
  32  00a1 6f6369617465  	dc.b	"ociate I2C EEPROM "
  33  00b3 647269766572  	dc.b	"driver to communic"
  34  00c5 617465207769  	dc.b	"ate with an I2C EE"
  35  00d7 50524f4d2064  	dc.b	"PROM device I2C pe"
  36  00e9 726970686572  	dc.b	"ripheral is config"
  37  00fb 757265642069  	dc.b	"ured in Master tra"
  38  010d 6e736d697474  	dc.b	"nsmitter during wr"
  39  011f 697465206f70  	dc.b	"ite operation and "
  40  0131 696e4d617374  	dc.b	"inMaster receiver "
  41  0143 647572696e67  	dc.b	"during read operat"
  42  0155 696f6e        	dc.b	"ion"
  43  0158 2e00          	dc.b	".",0
  44  015a               _TransferStatus1:
  45  015a 00            	dc.b	0
  46  015b               _TransferStatus2:
  47  015b 00            	dc.b	0
  48  015c               _NumDataRead:
  49  015c 0000          	dc.w	0
  50                     ; 79 void eeprom_test(void)
  50                     ; 80 {
  51                     	scross	off
  52                     	switch	.text
  53  0000               _eeprom_test:
  55                     ; 87   BSP_Init();
  56  0000 cd0000        	call	_BSP_Init
  58                     ; 89   printf("\r\nSTM32F0xx FW Library");
  59  0003 ae00a2        	ldw	x,#L3
  60  0006 cd0000        	call	_printf
  62                     ; 90   printf("\r\nEEPROM Test");
  63  0009 ae0094        	ldw	x,#L5
  64  000c cd0000        	call	_printf
  66                     ; 93   EE_Init();  
  67  000f cd0000        	call	_EE_Init
  69                     ; 96   GPIO_WriteLow(EE_I2C_WP_GPIO_PORT, EE_I2C_WP_GPIO_PIN);
  70  0012 4b01          	push	#1
  71  0014 ae5014        	ldw	x,#20500
  72  0017 cd0000        	call	_GPIO_WriteLow
  74  001a ae0058        	ldw	x,#88
  75  001d 84            	pop	a
  76                     ; 100   EE_WriteBuffer(Tx1Buffer, sEE_WRITE_ADDRESS1, BUFFER_SIZE1); 
  77  001e 89            	pushw	x
  78  001f 5f            	clrw	x
  79  0020 89            	pushw	x
  80  0021 ae0000        	ldw	x,#_Tx1Buffer
  81  0024 cd0000        	call	_EE_WriteBuffer
  83  0027 5b04          	addw	sp,#4
  84                     ; 103   EE_WaitEepromStandbyState();  
  85  0029 cd0000        	call	_EE_WaitEepromStandbyState
  87                     ; 106   NumDataRead = BUFFER_SIZE1;
  88  002c ae0058        	ldw	x,#88
  89  002f cf015c        	ldw	_NumDataRead,x
  90                     ; 109   EE_ReadBuffer(Rx1Buffer, sEE_READ_ADDRESS1, (uint16_t *)(&NumDataRead)); 
  91  0032 ae015c        	ldw	x,#_NumDataRead
  92  0035 89            	pushw	x
  93  0036 5f            	clrw	x
  94  0037 89            	pushw	x
  95  0038 ae0100        	ldw	x,#_Rx1Buffer
  96  003b cd0000        	call	_EE_ReadBuffer
  98  003e 5b04          	addw	sp,#4
  99                     ; 111   printf("\n\rTransfer 1 Ongoing: %u", (unsigned int)BUFFER_SIZE1);
 100  0040 ae0058        	ldw	x,#88
 101  0043 89            	pushw	x
 102  0044 ae007b        	ldw	x,#L7
 103  0047 cd0000        	call	_printf
 105  004a 85            	popw	x
 106                     ; 112   printf("\n\rTX: %s", Tx1Buffer);
 107  004b ae0000        	ldw	x,#_Tx1Buffer
 108  004e 89            	pushw	x
 109  004f ae0072        	ldw	x,#L11
 110  0052 cd0000        	call	_printf
 112  0055 85            	popw	x
 113                     ; 113   printf("\n\rRX: %s", Rx1Buffer);
 114  0056 ae0100        	ldw	x,#_Rx1Buffer
 115  0059 89            	pushw	x
 116  005a ae0069        	ldw	x,#L31
 117  005d cd0000        	call	_printf
 119  0060 85            	popw	x
 120                     ; 115   TransferStatus1 = Buffercmp(Tx1Buffer, Rx1Buffer, BUFFER_SIZE1);
 121  0061 ae0058        	ldw	x,#88
 122  0064 89            	pushw	x
 123  0065 ae0100        	ldw	x,#_Rx1Buffer
 124  0068 89            	pushw	x
 125  0069 ae0000        	ldw	x,#_Tx1Buffer
 126  006c cd00f7        	call	_Buffercmp
 128  006f 5b04          	addw	sp,#4
 129  0071 c7015a        	ld	_TransferStatus1,a
 130                     ; 120   if (TransferStatus1 == PASSED)
 131  0074 c6015a        	ld	a,_TransferStatus1
 132  0077 4a            	dec	a
 133  0078 2605          	jrne	L51
 134                     ; 122     printf("\n\rTransfer 1 PASSED");
 135  007a ae0055        	ldw	x,#L71
 138  007d 2003          	jra	L12
 139  007f               L51:
 140                     ; 126     printf("\n\rTransfer 1 FAILED");
 141  007f ae0041        	ldw	x,#L32
 143  0082               L12:
 144  0082 cd0000        	call	_printf
 145                     ; 131   EE_WriteBuffer(Tx2Buffer, sEE_WRITE_ADDRESS2, BUFFER_SIZE2); 
 146  0085 ae0100        	ldw	x,#256
 147  0088 89            	pushw	x
 148  0089 ae0058        	ldw	x,#88
 149  008c 89            	pushw	x
 150  008d ae0059        	ldw	x,#_Tx2Buffer
 151  0090 cd0000        	call	_EE_WriteBuffer
 153  0093 5b04          	addw	sp,#4
 154                     ; 134   EE_WaitEepromStandbyState();  
 155  0095 cd0000        	call	_EE_WaitEepromStandbyState
 157                     ; 137   NumDataRead = BUFFER_SIZE2;  
 158  0098 ae0100        	ldw	x,#256
 159  009b cf015c        	ldw	_NumDataRead,x
 160                     ; 140   EE_ReadBuffer(Rx2Buffer, sEE_READ_ADDRESS2, (uint16_t *)(&NumDataRead));
 161  009e ae015c        	ldw	x,#_NumDataRead
 162  00a1 89            	pushw	x
 163  00a2 ae0058        	ldw	x,#88
 164  00a5 89            	pushw	x
 165  00a6 ae0000        	ldw	x,#_Rx2Buffer
 166  00a9 cd0000        	call	_EE_ReadBuffer
 168  00ac 5b04          	addw	sp,#4
 169                     ; 142   printf("\n\rTransfer 2 Ongoing: %u", (unsigned int)BUFFER_SIZE2);
 170  00ae ae0100        	ldw	x,#256
 171  00b1 89            	pushw	x
 172  00b2 ae0028        	ldw	x,#L52
 173  00b5 cd0000        	call	_printf
 175  00b8 85            	popw	x
 176                     ; 143   printf("\n\rTX: %s", Tx2Buffer);
 177  00b9 ae0059        	ldw	x,#_Tx2Buffer
 178  00bc 89            	pushw	x
 179  00bd ae0072        	ldw	x,#L11
 180  00c0 cd0000        	call	_printf
 182  00c3 85            	popw	x
 183                     ; 144   printf("\n\rRX: %s", Rx2Buffer);
 184  00c4 ae0000        	ldw	x,#_Rx2Buffer
 185  00c7 89            	pushw	x
 186  00c8 ae0069        	ldw	x,#L31
 187  00cb cd0000        	call	_printf
 189  00ce 85            	popw	x
 190                     ; 147   TransferStatus2 = Buffercmp(Tx2Buffer, Rx2Buffer, BUFFER_SIZE2);
 191  00cf ae0100        	ldw	x,#256
 192  00d2 89            	pushw	x
 193  00d3 ae0000        	ldw	x,#_Rx2Buffer
 194  00d6 89            	pushw	x
 195  00d7 ae0059        	ldw	x,#_Tx2Buffer
 196  00da ad1b          	call	_Buffercmp
 198  00dc 5b04          	addw	sp,#4
 199  00de c7015b        	ld	_TransferStatus2,a
 200                     ; 152   if (TransferStatus2 == PASSED)
 201  00e1 c6015b        	ld	a,_TransferStatus2
 202  00e4 4a            	dec	a
 203  00e5 2605          	jrne	L72
 204                     ; 154     printf("\n\rTransfer 2 PASSED");
 205  00e7 ae0014        	ldw	x,#L13
 208  00ea 2003          	jra	L33
 209  00ec               L72:
 210                     ; 158     printf("\n\rTransfer 2 FAILED");
 211  00ec ae0000        	ldw	x,#L53
 213  00ef               L33:
 214  00ef cd0000        	call	_printf
 215                     ; 162   EE_DeInit();
 216  00f2 cd0000        	call	_EE_DeInit
 218  00f5               L73:
 220  00f5 20fe          	jra	L73
 222                     ; 202 TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
 222                     ; 203 {
 223  00f7               _Buffercmp:
 224  00f7 89            	pushw	x
 225       00000000      OFST:	set	0
 227  00f8 2015          	jra	L54
 228  00fa               L34:
 229                     ; 206     if(*pBuffer1 != *pBuffer2)
 230  00fa 1e01          	ldw	x,(OFST+1,sp)
 231  00fc f6            	ld	a,(x)
 232  00fd 1e05          	ldw	x,(OFST+5,sp)
 233  00ff f1            	cp	a,(x)
 234  0100 2703          	jreq	L15
 235                     ; 208       return FAILED;
 236  0102 4f            	clr	a
 238  0103 2014          	jra	L66
 239  0105               L15:
 240                     ; 211     pBuffer1++;
 241  0105 1e01          	ldw	x,(OFST+1,sp)
 242  0107 5c            	incw	x
 243  0108 1f01          	ldw	(OFST+1,sp),x
 244                     ; 212     pBuffer2++;
 245  010a 1e05          	ldw	x,(OFST+5,sp)
 246  010c 5c            	incw	x
 247  010d 1f05          	ldw	(OFST+5,sp),x
 248  010f               L54:
 249                     ; 204   while(BufferLength--)
 250  010f 1e07          	ldw	x,(OFST+7,sp)
 251  0111 5a            	decw	x
 252  0112 1f07          	ldw	(OFST+7,sp),x
 253  0114 5c            	incw	x
 254  0115 26e3          	jrne	L34
 255                     ; 215   return PASSED;  
 256  0117 a601          	ld	a,#1
 258  0119               L66:
 259  0119 85            	popw	x
 260  011a 81            	ret	
 262                     	xdef	_eeprom_test
 263                     	xdef	_Buffercmp
 264                     	xdef	_NumDataRead
 265                     	xdef	_TransferStatus2
 266                     	xdef	_TransferStatus1
 267                     	switch	.bss
 268  0000               _Rx2Buffer:
 269  0000 000000000000  	ds.b	256
 270                     	xdef	_Rx2Buffer
 271  0100               _Rx1Buffer:
 272  0100 000000000000  	ds.b	88
 273                     	xdef	_Rx1Buffer
 274                     	xdef	_Tx2Buffer
 275                     	xdef	_Tx1Buffer
 276                     	xref	_EE_WaitEepromStandbyState
 277                     	xref	_EE_WriteBuffer
 278                     	xref	_EE_ReadBuffer
 279                     	xref	_EE_Init
 280                     	xref	_EE_DeInit
 281                     	xref	_TurretExecute
 282                     	xref	_SensorCounter
 283                     	xref	_CounterMode
 284                     	xref	_FlagSensorEn
 285                     	xref	_FlagUvDetect
 286                     	xref	_FlagAddCount
 287                     	xref	_FlagAutoCount
 288                     	xref	_FlagValueCount
 289                     	xref	_BSP_Init
 290                     	xref	_SystemTimer
 291                     	xref	_AdcValue
 292                     	xref	_BuzzerOnTime
 293                     	xref	_GPIO_WriteLow
 294                     	xref	_printf
 295                     .const:	section	.text
 296  0000               L53:
 297  0000 0a0d5472616e  	dc.b	10,13,84,114,97,110
 298  0006 736665722032  	dc.b	"sfer 2 FAILED",0
 299  0014               L13:
 300  0014 0a0d5472616e  	dc.b	10,13,84,114,97,110
 301  001a 736665722032  	dc.b	"sfer 2 PASSED",0
 302  0028               L52:
 303  0028 0a0d5472616e  	dc.b	10,13,84,114,97,110
 304  002e 736665722032  	dc.b	"sfer 2 Ongoing: %u",0
 305  0041               L32:
 306  0041 0a0d5472616e  	dc.b	10,13,84,114,97,110
 307  0047 736665722031  	dc.b	"sfer 1 FAILED",0
 308  0055               L71:
 309  0055 0a0d5472616e  	dc.b	10,13,84,114,97,110
 310  005b 736665722031  	dc.b	"sfer 1 PASSED",0
 311  0069               L31:
 312  0069 0a0d52583a20  	dc.b	10,13,82,88,58,32
 313  006f 257300        	dc.b	"%s",0
 314  0072               L11:
 315  0072 0a0d54583a20  	dc.b	10,13,84,88,58,32
 316  0078 257300        	dc.b	"%s",0
 317  007b               L7:
 318  007b 0a0d5472616e  	dc.b	10,13,84,114,97,110
 319  0081 736665722031  	dc.b	"sfer 1 Ongoing: %u",0
 320  0094               L5:
 321  0094 0d0a45455052  	dc.b	13,10,69,69,80,82
 322  009a 4f4d20546573  	dc.b	"OM Test",0
 323  00a2               L3:
 324  00a2 0d0a53544d33  	dc.b	13,10,83,84,77,51
 325  00a8 324630787820  	dc.b	"2F0xx FW Library",0
 326                     	end
