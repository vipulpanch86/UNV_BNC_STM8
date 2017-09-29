   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     .const:	section	.text
  21  0000               L3_MSG_KEY_CODE:
  22  0000 00            	dc.b	0
  23  0001 08            	dc.b	8
  24  0002 01            	dc.b	1
  25  0003 01            	dc.b	1
  26  0004 09            	dc.b	9
  27  0005 01            	dc.b	1
  28  0006 02            	dc.b	2
  29  0007 0a            	dc.b	10
  30  0008 01            	dc.b	1
  31  0009 03            	dc.b	3
  32  000a 0b            	dc.b	11
  33  000b 01            	dc.b	1
  34  000c 04            	dc.b	4
  35  000d 0c            	dc.b	12
  36  000e 01            	dc.b	1
  37  000f 05            	dc.b	5
  38  0010 0d            	dc.b	13
  39  0011 01            	dc.b	1
  40  0012 06            	dc.b	6
  41  0013 0e            	dc.b	14
  42  0014 01            	dc.b	1
  43  0015 07            	dc.b	7
  44  0016 0f            	dc.b	15
  45  0017 01            	dc.b	1
  46  0018 08            	dc.b	8
  47  0019 10            	dc.b	16
  48  001a 01            	dc.b	1
  49  001b 09            	dc.b	9
  50  001c 11            	dc.b	17
  51  001d 01            	dc.b	1
  52  001e 0a            	dc.b	10
  53  001f 12            	dc.b	18
  54  0020 01            	dc.b	1
  55  0021 0b            	dc.b	11
  56  0022 13            	dc.b	19
  57  0023 01            	dc.b	1
  58  0024 0c            	dc.b	12
  59  0025 14            	dc.b	20
  60  0026 01            	dc.b	1
  61  0027 0d            	dc.b	13
  62  0028 15            	dc.b	21
  63  0029 01            	dc.b	1
  64  002a 0e            	dc.b	14
  65  002b 16            	dc.b	22
  66  002c 01            	dc.b	1
  67  002d 0f            	dc.b	15
  68  002e 17            	dc.b	23
  69  002f 01            	dc.b	1
  70  0030 10            	dc.b	16
  71  0031 18            	dc.b	24
  72  0032 01            	dc.b	1
  73  0033 11            	dc.b	17
  74  0034 19            	dc.b	25
  75  0035 01            	dc.b	1
  76  0036 12            	dc.b	18
  77  0037 1a            	dc.b	26
  78  0038 01            	dc.b	1
  79  0039 13            	dc.b	19
  80  003a 1b            	dc.b	27
  81  003b 01            	dc.b	1
  82  003c 14            	dc.b	20
  83  003d 1c            	dc.b	28
  84  003e 01            	dc.b	1
  85  003f 15            	dc.b	21
  86  0040 1d            	dc.b	29
  87  0041 01            	dc.b	1
  88  0042 16            	dc.b	22
  89  0043 1e            	dc.b	30
  90  0044 01            	dc.b	1
  91  0045 17            	dc.b	23
  92  0046 1f            	dc.b	31
  93  0047 01            	dc.b	1
  94  0048               L5_MSG_SW_CODE:
  95  0048 00            	dc.b	0
  96  0049 02            	dc.b	2
  97  004a 00            	dc.b	0
  98  004b 01            	dc.b	1
  99  004c 03            	dc.b	3
 100  004d 00            	dc.b	0
 101  004e 02            	dc.b	2
 102  004f 04            	dc.b	4
 103  0050 01            	dc.b	1
 104  0051               L7_msg:
 105  0051 00            	dc.b	0
 106  0052 00            	dc.b	0
 107                     ; 162 void UI_KeyCallBack(uint8_t keyNb, uint8_t keyState)
 107                     ; 163 {
 108                     	scross	off
 109                     	switch	.text
 110  0000               _UI_KeyCallBack:
 111  0000 89            	pushw	x
 112  0001 5204          	subw	sp,#4
 113       00000004      OFST:	set	4
 115                     ; 164   UI_MSG_T msg = {0, 0};
 116  0003 c60051        	ld	a,L7_msg
 117  0006 6b02          	ld	(OFST-2,sp),a
 118  0008 c60052        	ld	a,L7_msg+1
 119  000b 6b03          	ld	(OFST-1,sp),a
 120                     ; 166   uint8_t totalNbKeys = sizeof(MSG_KEY_CODE) / sizeof(MSG_MAP_T);
 121  000d a618          	ld	a,#24
 122  000f 6b01          	ld	(OFST-3,sp),a
 123                     ; 168   for(index = 0; index < totalNbKeys;)
 124  0011 0f04          	clr	(OFST+0,sp)
 126  0013 2017          	jra	L52
 127  0015               L12:
 128                     ; 170     if(MSG_KEY_CODE[index].nb == keyNb)
 129  0015 97            	ld	xl,a
 130  0016 a603          	ld	a,#3
 131  0018 42            	mul	x,a
 132  0019 d60000        	ld	a,(L3_MSG_KEY_CODE,x)
 133  001c 1105          	cp	a,(OFST+1,sp)
 134  001e 260a          	jrne	L13
 135                     ; 172       break;
 136  0020               L72:
 137                     ; 180   switch(keyState)
 138  0020 7b06          	ld	a,(OFST+2,sp)
 140                     ; 207     default:
 140                     ; 208       return;
 141  0022 4a            	dec	a
 142  0023 270f          	jreq	L11
 143  0025 4a            	dec	a
 144  0026 2728          	jreq	L51
 146  0028 2039          	jra	L6
 147  002a               L13:
 148                     ; 176       index++;
 149  002a 0c04          	inc	(OFST+0,sp)
 150  002c               L52:
 151                     ; 168   for(index = 0; index < totalNbKeys;)
 152  002c 7b04          	ld	a,(OFST+0,sp)
 153  002e 1101          	cp	a,(OFST-3,sp)
 154  0030 25e3          	jrult	L12
 155  0032 20ec          	jra	L72
 156  0034               L11:
 157                     ; 186     case KEY_STATE_PRESSED:
 157                     ; 187       if(MSG_KEY_CODE[index].msg != UIMSG_INVALID)
 158  0034 7b04          	ld	a,(OFST+0,sp)
 159  0036 ad2e          	call	LC001
 160  0038 2722          	jreq	L73
 161                     ; 189         msg.message = MSG_KEY_CODE[index].msg;
 162  003a 6b03          	ld	(OFST-1,sp),a
 163                     ; 190         msg.param   = (uint8_t)UI_KEY_PRESS;
 164  003c 0f02          	clr	(OFST-2,sp)
 165                     ; 192         if(MSG_KEY_CODE[index].buzz == TRUE)
 166  003e d60002        	ld	a,(L3_MSG_KEY_CODE+2,x)
 167  0041 4a            	dec	a
 168  0042 2618          	jrne	L73
 169                     ; 338   BuzzerOnTime = buzzTime;
 170  0044 ae0064        	ldw	x,#100
 171  0047 cf0002        	ldw	_BuzzerOnTime+2,x
 172  004a 5f            	clrw	x
 173  004b cf0000        	ldw	_BuzzerOnTime,x
 174  004e 200c          	jra	L73
 175  0050               L51:
 176                     ; 199     case KEY_STATE_RELEASED:
 176                     ; 200       if(MSG_KEY_CODE[index].msg != UIMSG_INVALID)
 177  0050 7b04          	ld	a,(OFST+0,sp)
 178  0052 ad12          	call	LC001
 179  0054 2706          	jreq	L73
 180                     ; 202         msg.message = MSG_KEY_CODE[index].msg;
 181  0056 6b03          	ld	(OFST-1,sp),a
 182                     ; 203         msg.param   = (uint8_t)UI_KEY_RELEASE;
 183  0058 a601          	ld	a,#1
 184  005a 6b02          	ld	(OFST-2,sp),a
 185  005c               L73:
 186                     ; 211   UI_PostMessage(&msg);
 187  005c 96            	ldw	x,sp
 188  005d 1c0002        	addw	x,#OFST-2
 189  0060 cd0000        	call	_UI_PostMessage
 191                     ; 212 }
 192  0063               L6:
 193  0063 5b06          	addw	sp,#6
 194  0065 81            	ret	
 195  0066               LC001:
 196  0066 97            	ld	xl,a
 197  0067 a603          	ld	a,#3
 198  0069 42            	mul	x,a
 199  006a d60001        	ld	a,(L3_MSG_KEY_CODE+1,x)
 200  006d a1ff          	cp	a,#255
 201  006f 81            	ret	
 203                     	switch	.const
 204  0053               L74_msg:
 205  0053 00            	dc.b	0
 206  0054 00            	dc.b	0
 207                     ; 222 void UI_SwCallBack(uint8_t swNb, uint8_t swState)
 207                     ; 223 {
 208                     	switch	.text
 209  0070               _UI_SwCallBack:
 210  0070 89            	pushw	x
 211  0071 5204          	subw	sp,#4
 212       00000004      OFST:	set	4
 214                     ; 224   UI_MSG_T msg = {0, 0};
 215  0073 c60053        	ld	a,L74_msg
 216  0076 6b02          	ld	(OFST-2,sp),a
 217  0078 c60054        	ld	a,L74_msg+1
 218  007b 6b03          	ld	(OFST-1,sp),a
 219                     ; 226   uint8_t totalNbSw = sizeof(MSG_SW_CODE) / sizeof(MSG_MAP_T);
 220  007d a603          	ld	a,#3
 221  007f 6b01          	ld	(OFST-3,sp),a
 222                     ; 228   for(index = 0; index < totalNbSw;)
 223  0081 0f04          	clr	(OFST+0,sp)
 225  0083 2017          	jra	L56
 226  0085               L16:
 227                     ; 230     if(MSG_SW_CODE[index].nb == swNb)
 228  0085 97            	ld	xl,a
 229  0086 a603          	ld	a,#3
 230  0088 42            	mul	x,a
 231  0089 d60048        	ld	a,(L5_MSG_SW_CODE,x)
 232  008c 1105          	cp	a,(OFST+1,sp)
 233  008e 260a          	jrne	L17
 234                     ; 232       break;
 235  0090               L76:
 236                     ; 240   switch(swState)
 237  0090 7b06          	ld	a,(OFST+2,sp)
 239                     ; 267     default:
 239                     ; 268       return;
 240  0092 4a            	dec	a
 241  0093 270f          	jreq	L15
 242  0095 4a            	dec	a
 243  0096 2728          	jreq	L55
 245  0098 2039          	jra	L41
 246  009a               L17:
 247                     ; 236       index++;
 248  009a 0c04          	inc	(OFST+0,sp)
 249  009c               L56:
 250                     ; 228   for(index = 0; index < totalNbSw;)
 251  009c 7b04          	ld	a,(OFST+0,sp)
 252  009e 1101          	cp	a,(OFST-3,sp)
 253  00a0 25e3          	jrult	L16
 254  00a2 20ec          	jra	L76
 255  00a4               L15:
 256                     ; 246     case SW_STATE_PRESSED:
 256                     ; 247       if(MSG_SW_CODE[index].msg != UIMSG_INVALID)
 257  00a4 7b04          	ld	a,(OFST+0,sp)
 258  00a6 ad2e          	call	LC002
 259  00a8 2722          	jreq	L77
 260                     ; 249         msg.message = MSG_SW_CODE[index].msg;
 261  00aa 6b03          	ld	(OFST-1,sp),a
 262                     ; 250         msg.param   = (uint8_t)UI_SW_PRESS;
 263  00ac 0f02          	clr	(OFST-2,sp)
 264                     ; 252         if(MSG_SW_CODE[index].buzz == TRUE)
 265  00ae d6004a        	ld	a,(L5_MSG_SW_CODE+2,x)
 266  00b1 4a            	dec	a
 267  00b2 2618          	jrne	L77
 268                     ; 338   BuzzerOnTime = buzzTime;
 269  00b4 ae0064        	ldw	x,#100
 270  00b7 cf0002        	ldw	_BuzzerOnTime+2,x
 271  00ba 5f            	clrw	x
 272  00bb cf0000        	ldw	_BuzzerOnTime,x
 273  00be 200c          	jra	L77
 274  00c0               L55:
 275                     ; 259     case SW_STATE_RELEASED:
 275                     ; 260       if(MSG_SW_CODE[index].msg != UIMSG_INVALID)
 276  00c0 7b04          	ld	a,(OFST+0,sp)
 277  00c2 ad12          	call	LC002
 278  00c4 2706          	jreq	L77
 279                     ; 262         msg.message = MSG_SW_CODE[index].msg;
 280  00c6 6b03          	ld	(OFST-1,sp),a
 281                     ; 263         msg.param   = (uint8_t)UI_SW_RELEASE;
 282  00c8 a601          	ld	a,#1
 283  00ca 6b02          	ld	(OFST-2,sp),a
 284  00cc               L77:
 285                     ; 271   UI_PostMessage(&msg);
 286  00cc 96            	ldw	x,sp
 287  00cd 1c0002        	addw	x,#OFST-2
 288  00d0 cd0000        	call	_UI_PostMessage
 290                     ; 272 }
 291  00d3               L41:
 292  00d3 5b06          	addw	sp,#6
 293  00d5 81            	ret	
 294  00d6               LC002:
 295  00d6 97            	ld	xl,a
 296  00d7 a603          	ld	a,#3
 297  00d9 42            	mul	x,a
 298  00da d60049        	ld	a,(L5_MSG_SW_CODE+1,x)
 299  00dd a1ff          	cp	a,#255
 300  00df 81            	ret	
 302                     	xdef	_UI_SwCallBack
 303                     	xdef	_UI_KeyCallBack
 304                     	xref	_UI_PostMessage
 305                     	xref	_TurretExecute
 306                     	xref	_SensorCounter
 307                     	xref	_CounterMode
 308                     	xref	_FlagSensorEn
 309                     	xref	_FlagUvDetect
 310                     	xref	_FlagAddCount
 311                     	xref	_FlagAutoCount
 312                     	xref	_FlagValueCount
 313                     	xref	_SystemTimer
 314                     	xref	_AdcValue
 315                     	xref	_BuzzerOnTime
 316                     	end
