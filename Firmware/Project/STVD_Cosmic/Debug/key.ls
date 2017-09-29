   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     	switch	.data
  21  0000               L3_KeypadType:
  22  0000 0000          	dc.w	_KeypadType_18_3x7
  23  0002 0000          	dc.w	_KeypadType_26_7x4
  24  0004               L7_pKeypad:
  25  0004 0000          	dc.w	0
  26  0006               L11_DebounceTime:
  27  0006 00            	dc.b	0
  28                     ; 55 void KPD_Init(uint8_t index, uint8_t debounce, void (* cb)(uint8_t, uint8_t))
  28                     ; 56 {
  29                     	scross	off
  30                     	switch	.text
  31  0000               _KPD_Init:
  32  0000 89            	pushw	x
  33  0001 88            	push	a
  34       00000001      OFST:	set	1
  36                     ; 59   if(index < KPD_TYPE_MAX_NB)
  37  0002 9e            	ld	a,xh
  38  0003 a102          	cp	a,#2
  39  0005 240d          	jruge	L51
  40                     ; 61     pKeypad = KeypadType[index];
  41  0007 9e            	ld	a,xh
  42  0008 5f            	clrw	x
  43  0009 97            	ld	xl,a
  44  000a 58            	sllw	x
  45  000b de0000        	ldw	x,(L3_KeypadType,x)
  46  000e cf0004        	ldw	L7_pKeypad,x
  47                     ; 62     pKeypad->kpdInit();
  48  0011 ee05          	ldw	x,(5,x)
  49  0013 fd            	call	(x)
  51  0014               L51:
  52                     ; 65   DebounceTime = (debounce < 1) ? (1) : (debounce);
  53  0014 7b03          	ld	a,(OFST+2,sp)
  54  0016 2601          	jrne	L6
  55  0018 4c            	inc	a
  56  0019               L6:
  57  0019 c70006        	ld	L11_DebounceTime,a
  58                     ; 66   KeypadCB = cb;
  59  001c 1e06          	ldw	x,(OFST+5,sp)
  60  001e cf0000        	ldw	L31_KeypadCB,x
  61                     ; 71   for(key = 0; key < KPD_KEY_MAX; key++)
  62  0021 4f            	clr	a
  63  0022 6b01          	ld	(OFST+0,sp),a
  64  0024               L71:
  65                     ; 73     KeyInfo[key].state = KEY_STATE_IDLE;
  66  0024 97            	ld	xl,a
  67  0025 a607          	ld	a,#7
  68  0027 42            	mul	x,a
  69                     ; 74     KeyInfo[key].press = OPEN;
  70  0028 724f0003      	clr	(L5_KeyInfo+1,x)
  71  002c 724f0002      	clr	(L5_KeyInfo,x)
  72                     ; 75     KeyInfo[key].debounce = FALSE;
  73  0030 724f0004      	clr	(L5_KeyInfo+2,x)
  74                     ; 76     KeyInfo[key].backuptime = 0;
  75  0034 4f            	clr	a
  76  0035 d70008        	ld	(L5_KeyInfo+6,x),a
  77  0038 d70007        	ld	(L5_KeyInfo+5,x),a
  78  003b d70006        	ld	(L5_KeyInfo+4,x),a
  79  003e d70005        	ld	(L5_KeyInfo+3,x),a
  80                     ; 71   for(key = 0; key < KPD_KEY_MAX; key++)
  81  0041 0c01          	inc	(OFST+0,sp)
  83  0043 7b01          	ld	a,(OFST+0,sp)
  84  0045 a118          	cp	a,#24
  85  0047 25db          	jrult	L71
  86                     ; 78 }
  87  0049 5b03          	addw	sp,#3
  88  004b 81            	ret	
  90                     ; 88 void KPD_SetState(uint8_t key, uint8_t pressState)
  90                     ; 89 {
  91  004c               _KPD_SetState:
  92  004c 89            	pushw	x
  93       00000000      OFST:	set	0
  95                     ; 90   if(key < KPD_KEY_MAX)
  96  004d 9e            	ld	a,xh
  97  004e a118          	cp	a,#24
  98  0050 243b          	jruge	L52
  99                     ; 93     if(KeyInfo[key].state == KEY_STATE_IDLE)
 100  0052 9e            	ld	a,xh
 101  0053 ad3a          	call	LC002
 102  0055 260f          	jrne	L72
 103                     ; 95       if(pressState == CLOSED)
 104  0057 7b02          	ld	a,(OFST+2,sp)
 105  0059 4a            	dec	a
 106  005a 2631          	jrne	L52
 107                     ; 98         KeyInfo[key].state = KEY_STATE_PRESSED;
 108  005c 7b01          	ld	a,(OFST+1,sp)
 109  005e 97            	ld	xl,a
 110  005f a607          	ld	a,#7
 111  0061 42            	mul	x,a
 112  0062 a601          	ld	a,#1
 113                     ; 101         if(KeypadCB != NULL)
 114                     ; 103           KeypadCB(key, KeyInfo[key].state);
 116  0064 200d          	jp	LC001
 117  0066               L72:
 118                     ; 107     else if(KeyInfo[key].state == KEY_STATE_PRESSED)
 119  0066 7b01          	ld	a,(OFST+1,sp)
 120  0068 ad25          	call	LC002
 121  006a 4a            	dec	a
 122  006b 261c          	jrne	L73
 123                     ; 109       if(pressState == OPEN)
 124  006d 7b02          	ld	a,(OFST+2,sp)
 125  006f 261c          	jrne	L52
 126                     ; 111         KeyInfo[key].state = KEY_STATE_RELEASED;
 127  0071 a602          	ld	a,#2
 128                     ; 114         if(KeypadCB != NULL)
 129                     ; 116           KeypadCB(key, KeyInfo[key].state);
 130  0073               LC001:
 131  0073 d70002        	ld	(L5_KeyInfo,x),a
 132  0076 ce0000        	ldw	x,L31_KeypadCB
 133  0079 2712          	jreq	L52
 134  007b 7b01          	ld	a,(OFST+1,sp)
 135  007d ad10          	call	LC002
 136  007f 97            	ld	xl,a
 137  0080 7b01          	ld	a,(OFST+1,sp)
 138  0082 95            	ld	xh,a
 139  0083 72cd0000      	call	[L31_KeypadCB.w]
 141  0087 2004          	jra	L52
 142  0089               L73:
 143                     ; 122       KeyInfo[key].state = KEY_STATE_IDLE;
 144  0089 724f0002      	clr	(L5_KeyInfo,x)
 145  008d               L52:
 146                     ; 125 }
 147  008d 85            	popw	x
 148  008e 81            	ret	
 149  008f               LC002:
 150  008f 97            	ld	xl,a
 151  0090 a607          	ld	a,#7
 152  0092 42            	mul	x,a
 153  0093 d60002        	ld	a,(L5_KeyInfo,x)
 154  0096 81            	ret	
 156                     ; 134 void KPD_Scan(void)
 156                     ; 135 {
 157  0097               _KPD_Scan:
 159                     ; 136   if(pKeypad != NULL)
 160  0097 ce0004        	ldw	x,L7_pKeypad
 161  009a 270c          	jreq	L74
 162                     ; 138     pKeypad->kpdScan(&KeyInfo[0]);
 163  009c 90ce0004      	ldw	y,L7_pKeypad
 164  00a0 ae0002        	ldw	x,#L5_KeyInfo
 165  00a3 90ee07        	ldw	y,(7,y)
 166  00a6 90fd          	call	(y)
 168  00a8               L74:
 169                     ; 140 }
 170  00a8 81            	ret	
 172                     ; 148 uint8_t KPD_IsPressed(uint8_t key)
 172                     ; 149 {
 173  00a9               _KPD_IsPressed:
 175                     ; 151   if(KeyInfo[key].state == KEY_STATE_PRESSED)
 176  00a9 97            	ld	xl,a
 177  00aa a607          	ld	a,#7
 178  00ac 42            	mul	x,a
 179  00ad d60002        	ld	a,(L5_KeyInfo,x)
 180  00b0 4a            	dec	a
 181  00b1 2602          	jrne	L15
 182                     ; 153     return KPD_KEY_PRESSED;
 183  00b3 4c            	inc	a
 185  00b4 81            	ret	
 186  00b5               L15:
 187                     ; 157     return KPD_KEY_RELEASED;
 188  00b5 4f            	clr	a
 190  00b6 81            	ret	
 192                     ; 167 void KPD_SetDebounceTime(uint8_t debounce)
 192                     ; 168 {
 193  00b7               _KPD_SetDebounceTime:
 195                     ; 169   DebounceTime = (debounce < 1) ? (1) : (debounce);
 196  00b7 4d            	tnz	a
 197  00b8 2601          	jrne	L03
 198  00ba 4c            	inc	a
 199  00bb               L03:
 200  00bb c70006        	ld	L11_DebounceTime,a
 201                     ; 170 }
 202  00be 81            	ret	
 204                     ; 177 uint8_t KPD_GetDebounceTime(void)
 204                     ; 178 {
 205  00bf               _KPD_GetDebounceTime:
 207                     ; 179   return DebounceTime;
 208  00bf c60006        	ld	a,L11_DebounceTime
 210  00c2 81            	ret	
 212                     ; 187 void KPD_AddEventListener(void (* cb)(uint8_t, uint8_t))
 212                     ; 188 {
 213  00c3               _KPD_AddEventListener:
 215                     ; 189   KeypadCB = cb;
 216  00c3 cf0000        	ldw	L31_KeypadCB,x
 217                     ; 190 }
 218  00c6 81            	ret	
 220                     	switch	.bss
 221  0000               L31_KeypadCB:
 222  0000 0000          	ds.b	2
 223  0002               L5_KeyInfo:
 224  0002 000000000000  	ds.b	168
 225                     	xref	_KeypadType_26_7x4
 226                     	xref	_KeypadType_18_3x7
 227                     	xref	_TurretExecute
 228                     	xdef	_KPD_AddEventListener
 229                     	xdef	_KPD_GetDebounceTime
 230                     	xdef	_KPD_SetDebounceTime
 231                     	xdef	_KPD_IsPressed
 232                     	xdef	_KPD_Scan
 233                     	xdef	_KPD_SetState
 234                     	xdef	_KPD_Init
 235                     	xref	_SensorCounter
 236                     	xref	_CounterMode
 237                     	xref	_FlagSensorEn
 238                     	xref	_FlagUvDetect
 239                     	xref	_FlagAddCount
 240                     	xref	_FlagAutoCount
 241                     	xref	_FlagValueCount
 242                     	xref	_SystemTimer
 243                     	xref	_AdcValue
 244                     	xref	_BuzzerOnTime
 245                     	end
