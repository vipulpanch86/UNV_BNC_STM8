   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 116 static uint8_t StoreContext(void)
  20                     ; 117 {
  21                     	scross	off
  22  0000               L52_StoreContext:
  24                     ; 118   if(ContextPtr < CONTEXT_SZ)
  25  0000 c6003f        	ld	a,L3_ContextPtr
  26  0003 a108          	cp	a,#8
  27  0005 2415          	jruge	L72
  28                     ; 121     ContextBuffer[ContextPtr] = CurContext;
  29  0007 97            	ld	xl,a
  30  0008 a604          	ld	a,#4
  31  000a 42            	mul	x,a
  32  000b 1c0013        	addw	x,#L31_ContextBuffer
  33  000e 90ae0033      	ldw	y,#L11_CurContext
  34  0012 cd0000        	call	c_xymvx
  36                     ; 122     ContextPtr++;
  37  0015 725c003f      	inc	L3_ContextPtr
  38                     ; 124     return UI_SUCCESS;
  39  0019 a601          	ld	a,#1
  41  001b 81            	ret	
  42  001c               L72:
  43                     ; 127   return UI_FAILURE;
  44  001c 4f            	clr	a
  46  001d 81            	ret	
  48                     ; 137 static uint8_t RestoreContext(void)
  48                     ; 138 {
  49  001e               L13_RestoreContext:
  51                     ; 139   if(ContextPtr > 0)
  52  001e c6003f        	ld	a,L3_ContextPtr
  53  0021 271d          	jreq	L33
  54                     ; 142     ContextPtr--;
  55  0023 725a003f      	dec	L3_ContextPtr
  56                     ; 143     CurContext = ContextBuffer[ContextPtr];
  57  0027 ae0033        	ldw	x,#L11_CurContext
  58  002a c6003f        	ld	a,L3_ContextPtr
  59  002d 905f          	clrw	y
  60  002f 9097          	ld	yl,a
  61  0031 9058          	sllw	y
  62  0033 9058          	sllw	y
  63  0035 72a90013      	addw	y,#L31_ContextBuffer
  64  0039 a604          	ld	a,#4
  65  003b cd0000        	call	c_xymvx
  67                     ; 145     return UI_SUCCESS;
  68  003e a601          	ld	a,#1
  70  0040               L33:
  71                     ; 148   return UI_FAILURE;
  73  0040 81            	ret	
  75                     .const:	section	.text
  76  0000               L53_msg:
  77  0000 00            	dc.b	0
  78  0001 00            	dc.b	0
  79  0002               L01:
  80  0002 00000008      	dc.l	8
  81                     ; 166 void UI_Init(void)
  81                     ; 167 {
  82                     	switch	.text
  83  0041               _UI_Init:
  84  0041 5206          	subw	sp,#6
  85       00000006      OFST:	set	6
  87                     ; 169   UI_MSG_T msg = {0, UIMSG_INIT};
  88  0043 c60000        	ld	a,L53_msg
  89  0046 6b01          	ld	(OFST-5,sp),a
  90  0048 c60001        	ld	a,L53_msg+1
  91  004b 6b02          	ld	(OFST-4,sp),a
  92                     ; 171   MsgWrIdx = 0;
  93  004d 725f0011      	clr	L71_MsgWrIdx
  94                     ; 172   MsgRdIdx = 0;
  95  0051 725f0012      	clr	L51_MsgRdIdx
  96                     ; 173   MsgUnProcessed = 0;
  97  0055 725f0010      	clr	L12_MsgUnProcessed
  98                     ; 175   RefreshMsgInterval = 0;
  99  0059 5f            	clrw	x
 100  005a cf003d        	ldw	L5_RefreshMsgInterval+2,x
 101  005d cf003b        	ldw	L5_RefreshMsgInterval,x
 102                     ; 176   BkupRefreshTimer = 0;
 103  0060 cf0039        	ldw	L7_BkupRefreshTimer+2,x
 104  0063 cf0037        	ldw	L7_BkupRefreshTimer,x
 105                     ; 179   for(cnt = 0; cnt < MSG_STACK_SZ; cnt++)
 106  0066 1f05          	ldw	(OFST-1,sp),x
 107  0068 1f03          	ldw	(OFST-3,sp),x
 108  006a               L73:
 109                     ; 181     MsgStack[cnt].message = 0;
 110  006a 1e05          	ldw	x,(OFST-1,sp)
 111  006c 58            	sllw	x
 112                     ; 182     MsgStack[cnt].param = 0;
 113  006d 724f0000      	clr	(L32_MsgStack,x)
 114  0071 724f0001      	clr	(L32_MsgStack+1,x)
 115                     ; 179   for(cnt = 0; cnt < MSG_STACK_SZ; cnt++)
 116  0075 96            	ldw	x,sp
 117  0076 1c0003        	addw	x,#OFST-3
 118  0079 a601          	ld	a,#1
 119  007b cd0000        	call	c_lgadc
 122  007e 96            	ldw	x,sp
 123  007f 1c0003        	addw	x,#OFST-3
 124  0082 cd0000        	call	c_ltor
 126  0085 ae0002        	ldw	x,#L01
 127  0088 cd0000        	call	c_lcmp
 129  008b 25dd          	jrult	L73
 130                     ; 186   UI_MenuInit();
 131  008d cd0000        	call	_UI_MenuInit
 133                     ; 189   CurContext.process = UI_PROC_HOME_ID;
 134  0090 725f0034      	clr	L11_CurContext+1
 135                     ; 191   CurContext.menu = UI_MENU_MAIN_ID;
 136  0094 725f0033      	clr	L11_CurContext
 137                     ; 192   CurContext.type = UI_TYPE_PROCESS;
 138  0098 35010036      	mov	L11_CurContext+3,#1
 139                     ; 193   CurContext.child = 0;
 140  009c 725f0035      	clr	L11_CurContext+2
 141                     ; 196   UI_PostMessage(&msg);
 142  00a0 96            	ldw	x,sp
 143  00a1 5c            	incw	x
 144  00a2 ad51          	call	_UI_PostMessage
 146                     ; 197 }
 147  00a4 5b06          	addw	sp,#6
 148  00a6 81            	ret	
 150                     ; 205 uint8_t UI_GetMessage(UI_MSG_T *pMsg)
 150                     ; 206 {
 151  00a7               _UI_GetMessage:
 152  00a7 89            	pushw	x
 153       00000000      OFST:	set	0
 155                     ; 207   if((MsgWrIdx != MsgRdIdx) && (MsgUnProcessed) && (pMsg != 0))
 156  00a8 c60011        	ld	a,L71_MsgWrIdx
 157  00ab c10012        	cp	a,L51_MsgRdIdx
 158  00ae 2742          	jreq	L54
 160  00b0 c60010        	ld	a,L12_MsgUnProcessed
 161  00b3 273d          	jreq	L54
 163  00b5 5d            	tnzw	x
 164  00b6 273a          	jreq	L54
 165                     ; 209     pMsg->message = MsgStack[MsgRdIdx].message;
 166  00b8 c60012        	ld	a,L51_MsgRdIdx
 167  00bb 5f            	clrw	x
 168  00bc 97            	ld	xl,a
 169  00bd 58            	sllw	x
 170  00be d60001        	ld	a,(L32_MsgStack+1,x)
 171  00c1 1e01          	ldw	x,(OFST+1,sp)
 172  00c3 e701          	ld	(1,x),a
 173                     ; 210     pMsg->param = MsgStack[MsgRdIdx].param;
 174  00c5 5f            	clrw	x
 175  00c6 c60012        	ld	a,L51_MsgRdIdx
 176  00c9 97            	ld	xl,a
 177  00ca 58            	sllw	x
 178  00cb d60000        	ld	a,(L32_MsgStack,x)
 179  00ce 1e01          	ldw	x,(OFST+1,sp)
 180  00d0 f7            	ld	(x),a
 181                     ; 211     MsgRdIdx = (uint8_t)((MsgRdIdx + 1 == MSG_STACK_SZ) ? (0) : (MsgRdIdx + 1));
 182  00d1 4f            	clr	a
 183  00d2 97            	ld	xl,a
 184  00d3 4c            	inc	a
 185  00d4 cb0012        	add	a,L51_MsgRdIdx
 186  00d7 2401          	jrnc	L22
 187  00d9 5c            	incw	x
 188  00da               L22:
 189  00da 02            	rlwa	x,a
 190  00db a30008        	cpw	x,#8
 191  00de 2603          	jrne	L02
 192  00e0 4f            	clr	a
 193  00e1 2004          	jra	L42
 194  00e3               L02:
 195  00e3 c60012        	ld	a,L51_MsgRdIdx
 196  00e6 4c            	inc	a
 197  00e7               L42:
 198  00e7 c70012        	ld	L51_MsgRdIdx,a
 199                     ; 212     MsgUnProcessed--;
 200                     ; 213     return UI_SUCCESS;
 201  00ea a601          	ld	a,#1
 202  00ec 725a0010      	dec	L12_MsgUnProcessed
 204  00f0 2001          	jra	L62
 205  00f2               L54:
 206                     ; 216   return UI_FAILURE;
 207  00f2 4f            	clr	a
 209  00f3               L62:
 210  00f3 85            	popw	x
 211  00f4 81            	ret	
 213                     ; 225 uint8_t UI_PostMessage(UI_MSG_T *pMsg)
 213                     ; 226 {
 214  00f5               _UI_PostMessage:
 215  00f5 89            	pushw	x
 216       00000000      OFST:	set	0
 218                     ; 227   if(((MsgWrIdx != MsgRdIdx) || (!MsgUnProcessed)) && (pMsg != 0))
 219  00f6 c60011        	ld	a,L71_MsgWrIdx
 220  00f9 c10012        	cp	a,L51_MsgRdIdx
 221  00fc 2606          	jrne	L15
 223  00fe 725d0010      	tnz	L12_MsgUnProcessed
 224  0102 263a          	jrne	L74
 225  0104               L15:
 227  0104 5d            	tnzw	x
 228  0105 2737          	jreq	L74
 229                     ; 229     MsgStack[MsgWrIdx].message = pMsg->message;
 230  0107 5f            	clrw	x
 231  0108 97            	ld	xl,a
 232  0109 1601          	ldw	y,(OFST+1,sp)
 233  010b 58            	sllw	x
 234  010c 90e601        	ld	a,(1,y)
 235  010f d70001        	ld	(L32_MsgStack+1,x),a
 236                     ; 230     MsgStack[MsgWrIdx].param = pMsg->param;
 237  0112 5f            	clrw	x
 238  0113 c60011        	ld	a,L71_MsgWrIdx
 239  0116 97            	ld	xl,a
 240  0117 58            	sllw	x
 241  0118 90f6          	ld	a,(y)
 242  011a d70000        	ld	(L32_MsgStack,x),a
 243                     ; 231     MsgWrIdx = (uint8_t)((MsgWrIdx + 1 == MSG_STACK_SZ) ? (0) : (MsgWrIdx + 1));
 244  011d 4f            	clr	a
 245  011e 97            	ld	xl,a
 246  011f 4c            	inc	a
 247  0120 cb0011        	add	a,L71_MsgWrIdx
 248  0123 2401          	jrnc	L43
 249  0125 5c            	incw	x
 250  0126               L43:
 251  0126 02            	rlwa	x,a
 252  0127 a30008        	cpw	x,#8
 253  012a 2603          	jrne	L23
 254  012c 4f            	clr	a
 255  012d 2004          	jra	L63
 256  012f               L23:
 257  012f c60011        	ld	a,L71_MsgWrIdx
 258  0132 4c            	inc	a
 259  0133               L63:
 260  0133 c70011        	ld	L71_MsgWrIdx,a
 261                     ; 232     MsgUnProcessed++;
 262                     ; 233     return UI_SUCCESS;
 263  0136 a601          	ld	a,#1
 264  0138 725c0010      	inc	L12_MsgUnProcessed
 266  013c 2001          	jra	L04
 267  013e               L74:
 268                     ; 236   return UI_FAILURE;          /* Unprocessed UI_MSG_T Stack Full */
 269  013e 4f            	clr	a
 271  013f               L04:
 272  013f 85            	popw	x
 273  0140 81            	ret	
 275                     ; 244 void UI_ClearAllMessage(void)
 275                     ; 245 {
 276  0141               _UI_ClearAllMessage:
 277  0141 5204          	subw	sp,#4
 278       00000004      OFST:	set	4
 280                     ; 248   MsgWrIdx = 0;
 281  0143 725f0011      	clr	L71_MsgWrIdx
 282                     ; 249   MsgRdIdx = 0;
 283  0147 725f0012      	clr	L51_MsgRdIdx
 284                     ; 250   MsgUnProcessed = 0;
 285  014b 725f0010      	clr	L12_MsgUnProcessed
 286                     ; 252   RefreshMsgInterval = 0;
 287  014f 5f            	clrw	x
 288  0150 cf003d        	ldw	L5_RefreshMsgInterval+2,x
 289  0153 cf003b        	ldw	L5_RefreshMsgInterval,x
 290                     ; 253   BkupRefreshTimer = 0;
 291  0156 cf0039        	ldw	L7_BkupRefreshTimer+2,x
 292  0159 cf0037        	ldw	L7_BkupRefreshTimer,x
 293                     ; 256   for(cnt = 0; cnt < MSG_STACK_SZ; cnt++)
 294  015c 1f03          	ldw	(OFST-1,sp),x
 295  015e 1f01          	ldw	(OFST-3,sp),x
 296  0160               L35:
 297                     ; 258     MsgStack[cnt].message = 0;
 298  0160 1e03          	ldw	x,(OFST-1,sp)
 299  0162 58            	sllw	x
 300                     ; 259     MsgStack[cnt].param = 0;
 301  0163 724f0000      	clr	(L32_MsgStack,x)
 302  0167 724f0001      	clr	(L32_MsgStack+1,x)
 303                     ; 256   for(cnt = 0; cnt < MSG_STACK_SZ; cnt++)
 304  016b 96            	ldw	x,sp
 305  016c 5c            	incw	x
 306  016d a601          	ld	a,#1
 307  016f cd0000        	call	c_lgadc
 310  0172 96            	ldw	x,sp
 311  0173 5c            	incw	x
 312  0174 cd0000        	call	c_ltor
 314  0177 ae0002        	ldw	x,#L01
 315  017a cd0000        	call	c_lcmp
 317  017d 25e1          	jrult	L35
 318                     ; 261 }
 319  017f 5b04          	addw	sp,#4
 320  0181 81            	ret	
 322                     ; 269 void UI_GetContext(UI_CONTEXT_T *pContext)
 322                     ; 270 {
 323  0182               _UI_GetContext:
 324  0182 89            	pushw	x
 325       00000000      OFST:	set	0
 327                     ; 271   memcpy(pContext, &CurContext, sizeof(UI_CONTEXT_T));
 328  0183 ae0004        	ldw	x,#4
 329  0186 89            	pushw	x
 330  0187 ae0033        	ldw	x,#L11_CurContext
 331  018a 89            	pushw	x
 332  018b 1e05          	ldw	x,(OFST+5,sp)
 333  018d cd0000        	call	_memcpy
 335                     ; 272 }
 336  0190 5b06          	addw	sp,#6
 337  0192 81            	ret	
 339                     ; 279 uint8_t UI_GetNbOfMsgUnProcessed(void)
 339                     ; 280 {
 340  0193               _UI_GetNbOfMsgUnProcessed:
 342                     ; 281   return MsgUnProcessed;
 343  0193 c60010        	ld	a,L12_MsgUnProcessed
 345  0196 81            	ret	
 347                     ; 289 uint8_t UI_InvokeMenu(uint8_t id)
 347                     ; 290 {
 348  0197               _UI_InvokeMenu:
 349  0197 88            	push	a
 350  0198 88            	push	a
 351       00000001      OFST:	set	1
 353                     ; 291   uint8_t cnt = UI_GetMenuNbEnabledChild(id);
 354  0199 cd0000        	call	_UI_GetMenuNbEnabledChild
 356  019c 6b01          	ld	(OFST+0,sp),a
 357                     ; 293   if(cnt > 0)
 358  019e 2722          	jreq	L16
 359                     ; 295     if(StoreContext() == UI_SUCCESS)
 360  01a0 cd0000        	call	L52_StoreContext
 362  01a3 4a            	dec	a
 363  01a4 261c          	jrne	L16
 364                     ; 297       if(id < UI_MENU_MAX_ITEM)
 365  01a6 7b02          	ld	a,(OFST+1,sp)
 366  01a8 a105          	cp	a,#5
 367  01aa 2416          	jruge	L16
 368                     ; 299         CurContext.menu = id;
 369  01ac c70033        	ld	L11_CurContext,a
 370                     ; 300         CurContext.child = 0;
 371  01af 725f0035      	clr	L11_CurContext+2
 372                     ; 301         CurContext.type = UI_TYPE_MENU;
 373  01b3 725f0036      	clr	L11_CurContext+3
 374                     ; 302         CurContext.process = 0;
 375  01b7 725f0034      	clr	L11_CurContext+1
 376                     ; 304         UI_UpdateMenu();
 377  01bb cd0000        	call	_UI_UpdateMenu
 379                     ; 306         return UI_SUCCESS;
 380  01be a601          	ld	a,#1
 382  01c0 2001          	jra	L26
 383  01c2               L16:
 384                     ; 311   return UI_FAILURE;
 385  01c2 4f            	clr	a
 387  01c3               L26:
 388  01c3 85            	popw	x
 389  01c4 81            	ret	
 391                     	switch	.const
 392  0006               L76_ini:
 393  0006 00            	dc.b	0
 394  0007 00            	dc.b	0
 395                     ; 319 uint8_t UI_InvokeProcess(uint8_t id)
 395                     ; 320 {
 396                     	switch	.text
 397  01c5               _UI_InvokeProcess:
 398  01c5 88            	push	a
 399  01c6 89            	pushw	x
 400       00000002      OFST:	set	2
 402                     ; 321   if(StoreContext() == UI_SUCCESS)
 403  01c7 cd0000        	call	L52_StoreContext
 405  01ca 4a            	dec	a
 406  01cb 262a          	jrne	L17
 407                     ; 323     if(id < UI_PROC_MAX_ITEM)
 408  01cd 7b03          	ld	a,(OFST+1,sp)
 409  01cf a110          	cp	a,#16
 410  01d1 2424          	jruge	L17
 411                     ; 325       UI_MSG_T ini = {0, UIMSG_INIT};
 412  01d3 c60006        	ld	a,L76_ini
 413  01d6 6b01          	ld	(OFST-1,sp),a
 414  01d8 c60007        	ld	a,L76_ini+1
 415  01db 6b02          	ld	(OFST+0,sp),a
 416                     ; 327       CurContext.menu = 0;
 417  01dd 725f0033      	clr	L11_CurContext
 418                     ; 328       CurContext.child = 0;
 419  01e1 725f0035      	clr	L11_CurContext+2
 420                     ; 329       CurContext.type = UI_TYPE_PROCESS;
 421  01e5 35010036      	mov	L11_CurContext+3,#1
 422                     ; 330       CurContext.process = id;
 423  01e9 7b03          	ld	a,(OFST+1,sp)
 424  01eb c70034        	ld	L11_CurContext+1,a
 425                     ; 332       UI_PostMessage(&ini);
 426  01ee 96            	ldw	x,sp
 427  01ef 5c            	incw	x
 428  01f0 cd00f5        	call	_UI_PostMessage
 430                     ; 334       return UI_SUCCESS;
 431  01f3 a601          	ld	a,#1
 433  01f5 2001          	jra	L27
 434  01f7               L17:
 435                     ; 338   return UI_FAILURE;
 436  01f7 4f            	clr	a
 438  01f8               L27:
 439  01f8 5b03          	addw	sp,#3
 440  01fa 81            	ret	
 442                     ; 348 void UI_SetRefreshMsg(uint32_t interval)
 442                     ; 349 {
 443  01fb               _UI_SetRefreshMsg:
 444       00000000      OFST:	set	0
 446                     ; 350   RefreshMsgInterval = interval;
 447  01fb 1e05          	ldw	x,(OFST+5,sp)
 448  01fd cf003d        	ldw	L5_RefreshMsgInterval+2,x
 449  0200 1e03          	ldw	x,(OFST+3,sp)
 450  0202 cf003b        	ldw	L5_RefreshMsgInterval,x
 451                     ; 328   return SystemTimer;
 452  0205 ce0002        	ldw	x,_SystemTimer+2
 453  0208 cf0039        	ldw	L7_BkupRefreshTimer+2,x
 454  020b ce0000        	ldw	x,_SystemTimer
 455  020e cf0037        	ldw	L7_BkupRefreshTimer,x
 458                     ; 352 }
 459  0211 81            	ret	
 461                     	switch	.const
 462  0008               L77_rfshMsg:
 463  0008 00            	dc.b	0
 464  0009 01            	dc.b	1
 465                     ; 361 void UI_Exec(void)
 465                     ; 362 {
 466                     	switch	.text
 467  0212               _UI_Exec:
 468  0212 5206          	subw	sp,#6
 469       00000006      OFST:	set	6
 471                     ; 364   if(RefreshMsgInterval != 0)
 472  0214 ae003b        	ldw	x,#L5_RefreshMsgInterval
 473  0217 cd0000        	call	c_lzmp
 475  021a 273d          	jreq	L301
 476                     ; 328   return SystemTimer;
 477  021c ce0002        	ldw	x,_SystemTimer+2
 478  021f 1f05          	ldw	(OFST-1,sp),x
 479  0221 ce0000        	ldw	x,_SystemTimer
 480  0224 1f03          	ldw	(OFST-3,sp),x
 483                     ; 369     if(abs((int32_t)(sysTime - BkupRefreshTimer)) >= RefreshMsgInterval)
 484  0226 96            	ldw	x,sp
 485  0227 1c0003        	addw	x,#OFST-3
 486  022a cd0000        	call	c_ltor
 488  022d ae0037        	ldw	x,#L7_BkupRefreshTimer
 489  0230 cd0000        	call	c_lsub
 491  0233 be02          	ldw	x,c_lreg+2
 492  0235 cd0000        	call	_abs
 494  0238 cd0000        	call	c_itolx
 496  023b ae003b        	ldw	x,#L5_RefreshMsgInterval
 497  023e cd0000        	call	c_lcmp
 499  0241 2516          	jrult	L301
 500                     ; 371       UI_MSG_T rfshMsg = {0, UIMSG_REFRESH};
 501  0243 c60008        	ld	a,L77_rfshMsg
 502  0246 6b01          	ld	(OFST-5,sp),a
 503  0248 c60009        	ld	a,L77_rfshMsg+1
 504  024b 6b02          	ld	(OFST-4,sp),a
 505                     ; 373       RefreshMsgInterval = 0;
 506  024d 5f            	clrw	x
 507  024e cf003d        	ldw	L5_RefreshMsgInterval+2,x
 508  0251 cf003b        	ldw	L5_RefreshMsgInterval,x
 509                     ; 374       UI_PostMessage(&rfshMsg);
 510  0254 96            	ldw	x,sp
 511  0255 5c            	incw	x
 512  0256 cd00f5        	call	_UI_PostMessage
 514  0259               L301:
 515                     ; 377 }
 516  0259 5b06          	addw	sp,#6
 517  025b 81            	ret	
 519                     	switch	.const
 520  000a               L701_ini:
 521  000a 00            	dc.b	0
 522  000b 00            	dc.b	0
 523  000c               L121_ini:
 524  000c 00            	dc.b	0
 525  000d 00            	dc.b	0
 526  000e               L521_ini:
 527  000e 00            	dc.b	0
 528  000f 00            	dc.b	0
 529                     ; 387 void UI_ProcessMsg(void)
 529                     ; 388 {
 530                     	switch	.text
 531  025c               _UI_ProcessMsg:
 532  025c 5207          	subw	sp,#7
 533       00000007      OFST:	set	7
 535                     ; 392   if(UI_GetMessage(&msg) == UI_SUCCESS)
 536  025e 96            	ldw	x,sp
 537  025f 1c0006        	addw	x,#OFST-1
 538  0262 cd00a7        	call	_UI_GetMessage
 540  0265 4a            	dec	a
 541  0266 2703cc03c0    	jrne	L131
 542                     ; 394     if(CurContext.type == UI_TYPE_PROCESS)
 543  026b c60036        	ld	a,L11_CurContext+3
 544  026e 4a            	dec	a
 545  026f 263a          	jrne	L331
 546                     ; 397       UI_PROC_PF pfProcess = UI_GetProcessInfo(CurContext.process);
 547  0271 c60034        	ld	a,L11_CurContext+1
 548  0274 5f            	clrw	x
 549  0275 97            	ld	xl,a
 550  0276 cd0000        	call	_UI_GetProcessInfo
 552  0279 1f04          	ldw	(OFST-3,sp),x
 553                     ; 399       if(pfProcess != 0)
 554  027b 2710          	jreq	L531
 555                     ; 407         if(pfProcess((void *)&CurContext, &msg) != UI_RC_FINISH)
 556  027d 96            	ldw	x,sp
 557  027e 1c0006        	addw	x,#OFST-1
 558  0281 89            	pushw	x
 559  0282 ae0033        	ldw	x,#L11_CurContext
 560  0285 1606          	ldw	y,(OFST-1,sp)
 561  0287 90fd          	call	(y)
 563  0289 4d            	tnz	a
 564  028a 85            	popw	x
 565  028b 26db          	jrne	L131
 566                     ; 409           return;
 567  028d               L531:
 568                     ; 413       if(CurContext.type == UI_TYPE_PROCESS)
 569  028d c60036        	ld	a,L11_CurContext+3
 570  0290 4a            	dec	a
 571  0291 2603          	jrne	L141
 572                     ; 415         RestoreContext();
 573  0293 cd001e        	call	L13_RestoreContext
 575  0296               L141:
 576                     ; 418       if(CurContext.type == UI_TYPE_MENU)
 577  0296 c60036        	ld	a,L11_CurContext+3
 578                     ; 420         UI_UpdateMenu();
 581  0299 2603cc0399    	jreq	L312
 582                     ; 424         UI_MSG_T ini = {0, UIMSG_INIT};
 583  029e c6000a        	ld	a,L701_ini
 584  02a1 6b02          	ld	(OFST-5,sp),a
 585  02a3 c6000b        	ld	a,L701_ini+1
 586  02a6 6b03          	ld	(OFST-4,sp),a
 587                     ; 426         UI_PostMessage(&ini);
 589  02a8 cc03b9        	jp	LC002
 590  02ab               L331:
 591                     ; 432       switch(msg.message)
 592  02ab 7b07          	ld	a,(OFST+0,sp)
 594                     ; 572         default:
 594                     ; 573           break;
 595  02ad 27ec          	jreq	L312
 596  02af a002          	sub	a,#2
 597  02b1 2775          	jreq	L711
 598  02b3 a018          	sub	a,#24
 599  02b5 2715          	jreq	L311
 600  02b7 4a            	dec	a
 601  02b8 2745          	jreq	L511
 602  02ba 4a            	dec	a
 603  02bb 270f          	jreq	L311
 604  02bd 4a            	dec	a
 605  02be 273f          	jreq	L511
 606  02c0 4a            	dec	a
 607  02c1 2603cc0347    	jreq	L321
 608  02c6 4a            	dec	a
 609  02c7 275f          	jreq	L711
 610  02c9 cc03c0        	jra	L131
 611                     ; 434         case UIMSG_INIT:
 611                     ; 435           UI_UpdateMenu();
 613                     ; 436           break;
 614  02cc               L311:
 615                     ; 438         case UIMSG_KEY_BACK:
 615                     ; 439         case UIMSG_KEY_UP:
 615                     ; 440           if((uint8_t)msg.param == UI_KEY_PRESS)
 616  02cc 7b06          	ld	a,(OFST-1,sp)
 617  02ce 26f9          	jrne	L131
 618                     ; 443             uint8_t curChildNo = CurContext.child;
 619  02d0 c60035        	ld	a,L11_CurContext+2
 620  02d3 6b05          	ld	(OFST-2,sp),a
 621                     ; 444             uint8_t nbTotalChild = UI_GetMenuNbTotalChild(CurContext.menu);
 622  02d5 c60033        	ld	a,L11_CurContext
 623  02d8 cd0000        	call	_UI_GetMenuNbTotalChild
 625  02db 6b04          	ld	(OFST-3,sp),a
 626  02dd               L751:
 627                     ; 450               curChildNo = (uint8_t)((curChildNo < (nbTotalChild - 1)) ?
 627                     ; 451                                      (curChildNo + 1) : 0);
 628  02dd 7b04          	ld	a,(OFST-3,sp)
 629  02df 5f            	clrw	x
 630  02e0 97            	ld	xl,a
 631  02e1 5a            	decw	x
 632  02e2 7b05          	ld	a,(OFST-2,sp)
 633  02e4 905f          	clrw	y
 634  02e6 9097          	ld	yl,a
 635  02e8 90bf00        	ldw	c_y,y
 636  02eb b300          	cpw	x,c_y
 637  02ed 2d03          	jrsle	L621
 638  02ef 4c            	inc	a
 639  02f0 2001          	jra	L031
 640  02f2               L621:
 641  02f2 4f            	clr	a
 642  02f3               L031:
 643  02f3 6b05          	ld	(OFST-2,sp),a
 644                     ; 452               enFlag = UI_GetMenuEnableFlag(CurContext.menu, curChildNo);
 645  02f5 cd03c3        	call	LC006
 647  02f8 6b03          	ld	(OFST-4,sp),a
 648                     ; 454               if(enFlag == UI_ENABLED)
 649  02fa 4a            	dec	a
 650  02fb 26e0          	jrne	L751
 651                     ; 456                 CurContext.child = curChildNo;
 652                     ; 457                 UI_UpdateMenu();
 654                     ; 458                 break;
 655  02fd 2022          	jp	LC005
 656  02ff               L511:
 657                     ; 464         case UIMSG_KEY_NEXT:
 657                     ; 465         case UIMSG_KEY_DOWN:
 657                     ; 466           if((uint8_t)msg.param == UI_KEY_PRESS)
 658  02ff 7b06          	ld	a,(OFST-1,sp)
 659  0301 26c6          	jrne	L131
 660                     ; 469             uint8_t curChildNo = CurContext.child;
 661  0303 c60035        	ld	a,L11_CurContext+2
 662  0306 6b05          	ld	(OFST-2,sp),a
 663                     ; 470             uint8_t nbTotalChild = UI_GetMenuNbTotalChild(CurContext.menu);
 664  0308 c60033        	ld	a,L11_CurContext
 665  030b cd0000        	call	_UI_GetMenuNbTotalChild
 667  030e 6b04          	ld	(OFST-3,sp),a
 668  0310               L761:
 669                     ; 476               curChildNo = (uint8_t)((curChildNo > 0) ? (curChildNo - 1) :
 669                     ; 477                                      (nbTotalChild - 1));
 670  0310 7b05          	ld	a,(OFST-2,sp)
 671  0312 2602          	jrne	L241
 672  0314 7b04          	ld	a,(OFST-3,sp)
 673  0316               L241:
 674  0316 4a            	dec	a
 675  0317 6b05          	ld	(OFST-2,sp),a
 676                     ; 478               enFlag = UI_GetMenuEnableFlag(CurContext.menu, curChildNo);
 677  0319 cd03c3        	call	LC006
 679  031c 6b03          	ld	(OFST-4,sp),a
 680                     ; 480               if(enFlag == UI_ENABLED)
 681  031e 4a            	dec	a
 682  031f 26ef          	jrne	L761
 683                     ; 482                 CurContext.child = curChildNo;
 684  0321               LC005:
 685  0321 7b05          	ld	a,(OFST-2,sp)
 686  0323               LC004:
 687  0323 c70035        	ld	L11_CurContext+2,a
 688                     ; 483                 UI_UpdateMenu();
 690                     ; 484                 break;
 691  0326 2071          	jp	L312
 692  0328               L711:
 693                     ; 490         case UIMSG_KEY_CLR:
 693                     ; 491         case UIMSG_SW_RESET:
 693                     ; 492 
 693                     ; 493           /* Go Back to the Previous Menu */
 693                     ; 494           if((uint8_t)msg.param == UI_SW_PRESS)
 694  0328 7b06          	ld	a,(OFST-1,sp)
 695  032a 269d          	jrne	L131
 696                     ; 496             if(RestoreContext() == UI_SUCCESS)
 697  032c cd001e        	call	L13_RestoreContext
 699  032f 4a            	dec	a
 700  0330 2697          	jrne	L131
 701                     ; 498               if(CurContext.type == UI_TYPE_MENU)
 702  0332 c60036        	ld	a,L11_CurContext+3
 703                     ; 500                 UI_UpdateMenu();
 706  0335 2762          	jreq	L312
 707                     ; 504                 UI_MSG_T ini = {0, UIMSG_INIT};
 708  0337 c6000c        	ld	a,L121_ini
 709  033a 6b04          	ld	(OFST-3,sp),a
 710  033c c6000d        	ld	a,L121_ini+1
 711  033f 6b05          	ld	(OFST-2,sp),a
 712                     ; 505                 UI_PostMessage(&ini);
 713  0341 96            	ldw	x,sp
 714  0342 1c0004        	addw	x,#OFST-3
 716  0345 2076          	jp	LC001
 717  0347               L321:
 718                     ; 514         case UIMSG_KEY_ENT:
 718                     ; 515           /* Enter the Menu */
 718                     ; 516           if((uint8_t)msg.param == UI_KEY_PRESS)
 719  0347 7b06          	ld	a,(OFST-1,sp)
 720  0349 2675          	jrne	L131
 721                     ; 519             pChild = UI_GetMenuChildInfo(CurContext.menu, CurContext.child);
 722  034b c60035        	ld	a,L11_CurContext+2
 723  034e 97            	ld	xl,a
 724  034f c60033        	ld	a,L11_CurContext
 725  0352 95            	ld	xh,a
 726  0353 cd0000        	call	_UI_GetMenuChildInfo
 728  0356 1f04          	ldw	(OFST-3,sp),x
 729                     ; 521             if(pChild->type == UI_TYPE_MENU)
 730  0358 e603          	ld	a,(3,x)
 731  035a 2642          	jrne	L112
 732                     ; 523               if(UI_GetMenuNbEnabledChild(CurContext.menu) > 0)
 733  035c c60033        	ld	a,L11_CurContext
 734  035f cd0000        	call	_UI_GetMenuNbEnabledChild
 736  0362 4d            	tnz	a
 737  0363 2734          	jreq	L312
 738                     ; 525                 if(StoreContext() == UI_SUCCESS)
 739  0365 cd0000        	call	L52_StoreContext
 741  0368 4a            	dec	a
 742  0369 262e          	jrne	L312
 743                     ; 528                   uint8_t curChildNo = 0;
 744  036b 6b03          	ld	(OFST-4,sp),a
 745                     ; 530                   nbTotalChild = UI_GetMenuNbTotalChild(CurContext.menu);
 746  036d c60033        	ld	a,L11_CurContext
 747  0370 cd0000        	call	_UI_GetMenuNbTotalChild
 749  0373 6b02          	ld	(OFST-5,sp),a
 750                     ; 532                   CurContext.menu = pChild->index;
 751  0375 1e04          	ldw	x,(OFST-3,sp)
 752  0377 e602          	ld	a,(2,x)
 753  0379 c70033        	ld	L11_CurContext,a
 754                     ; 533                   CurContext.type = UI_TYPE_MENU;
 755  037c 725f0036      	clr	L11_CurContext+3
 756                     ; 534                   CurContext.process = 0;
 757  0380 725f0034      	clr	L11_CurContext+1
 759  0384 200d          	jra	L322
 760  0386               L712:
 761                     ; 540                     enFlag = UI_GetMenuEnableFlag(CurContext.menu, curChildNo);
 762  0386 ad3b          	call	LC006
 764  0388 6b01          	ld	(OFST-6,sp),a
 765                     ; 542                     if(enFlag == UI_ENABLED)
 766  038a 4a            	dec	a
 767  038b 2604          	jrne	L722
 768                     ; 544                       CurContext.child = curChildNo;
 769  038d 7b03          	ld	a,(OFST-4,sp)
 770                     ; 545                       break;
 771  038f 2092          	jp	LC004
 772  0391               L722:
 773                     ; 549                       curChildNo++;
 774  0391 0c03          	inc	(OFST-4,sp)
 775  0393               L322:
 776                     ; 536                   while(curChildNo < nbTotalChild)
 777  0393 7b03          	ld	a,(OFST-4,sp)
 778  0395 1102          	cp	a,(OFST-5,sp)
 779  0397 25ed          	jrult	L712
 780  0399               L312:
 781                     ; 555               UI_UpdateMenu();
 782  0399 cd0000        	call	_UI_UpdateMenu
 785  039c 2022          	jra	L131
 786  039e               L112:
 787                     ; 559               if(StoreContext() == UI_SUCCESS)
 788  039e cd0000        	call	L52_StoreContext
 790  03a1 4a            	dec	a
 791  03a2 261c          	jrne	L131
 792                     ; 561                 UI_MSG_T ini = {0, UIMSG_INIT};
 793  03a4 c6000e        	ld	a,L521_ini
 794  03a7 6b02          	ld	(OFST-5,sp),a
 795  03a9 c6000f        	ld	a,L521_ini+1
 796  03ac 6b03          	ld	(OFST-4,sp),a
 797                     ; 563                 CurContext.process = pChild->index;
 798  03ae 1e04          	ldw	x,(OFST-3,sp)
 799  03b0 e602          	ld	a,(2,x)
 800  03b2 c70034        	ld	L11_CurContext+1,a
 801                     ; 564                 CurContext.type = UI_TYPE_PROCESS;
 802  03b5 35010036      	mov	L11_CurContext+3,#1
 803                     ; 566                 UI_PostMessage(&ini);
 804  03b9               LC002:
 805  03b9 96            	ldw	x,sp
 806  03ba 1c0002        	addw	x,#OFST-5
 807  03bd               LC001:
 808  03bd cd00f5        	call	_UI_PostMessage
 810                     ; 572         default:
 810                     ; 573           break;
 811  03c0               L131:
 812                     ; 577 }
 813  03c0 5b07          	addw	sp,#7
 814  03c2 81            	ret	
 815  03c3               LC006:
 816  03c3 97            	ld	xl,a
 817  03c4 c60033        	ld	a,L11_CurContext
 818  03c7 95            	ld	xh,a
 819  03c8 cc0000        	jp	_UI_GetMenuEnableFlag
 821                     	switch	.bss
 822  0000               L32_MsgStack:
 823  0000 000000000000  	ds.b	16
 824  0010               L12_MsgUnProcessed:
 825  0010 00            	ds.b	1
 826  0011               L71_MsgWrIdx:
 827  0011 00            	ds.b	1
 828  0012               L51_MsgRdIdx:
 829  0012 00            	ds.b	1
 830  0013               L31_ContextBuffer:
 831  0013 000000000000  	ds.b	32
 832  0033               L11_CurContext:
 833  0033 00000000      	ds.b	4
 834  0037               L7_BkupRefreshTimer:
 835  0037 00000000      	ds.b	4
 836  003b               L5_RefreshMsgInterval:
 837  003b 00000000      	ds.b	4
 838  003f               L3_ContextPtr:
 839  003f 00            	ds.b	1
 840                     	xref	_UI_GetProcessInfo
 841                     	xref	_UI_MenuInit
 842                     	xref	_UI_UpdateMenu
 843                     	xref	_UI_GetMenuChildInfo
 844                     	xref	_UI_GetMenuNbTotalChild
 845                     	xref	_UI_GetMenuNbEnabledChild
 846                     	xref	_UI_GetMenuEnableFlag
 847                     	xdef	_UI_ProcessMsg
 848                     	xdef	_UI_Exec
 849                     	xdef	_UI_SetRefreshMsg
 850                     	xdef	_UI_InvokeProcess
 851                     	xdef	_UI_InvokeMenu
 852                     	xdef	_UI_GetNbOfMsgUnProcessed
 853                     	xdef	_UI_GetContext
 854                     	xdef	_UI_ClearAllMessage
 855                     	xdef	_UI_PostMessage
 856                     	xdef	_UI_GetMessage
 857                     	xdef	_UI_Init
 858                     	xref	_TurretExecute
 859                     	xref	_SensorCounter
 860                     	xref	_CounterMode
 861                     	xref	_FlagSensorEn
 862                     	xref	_FlagUvDetect
 863                     	xref	_FlagAddCount
 864                     	xref	_FlagAutoCount
 865                     	xref	_FlagValueCount
 866                     	xref	_SystemTimer
 867                     	xref	_AdcValue
 868                     	xref	_BuzzerOnTime
 869                     	xref	_memcpy
 870                     	xref	_abs
 871                     	xref.b	c_lreg
 872                     	xref.b	c_x
 873                     	xref.b	c_y
 874                     	xref	c_itolx
 875                     	xref	c_lsub
 876                     	xref	c_lzmp
 877                     	xref	c_lcmp
 878                     	xref	c_ltor
 879                     	xref	c_lgadc
 880                     	xref	c_xymvx
 881                     	end
