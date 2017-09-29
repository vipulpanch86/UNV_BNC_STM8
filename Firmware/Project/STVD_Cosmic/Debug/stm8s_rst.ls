   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
  20                     ; 55 {
  21                     	scross	off
  22  0000               _RST_GetFlagStatus:
  23  0000 88            	push	a
  24       00000000      OFST:	set	0
  26                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
  27  0001 a110          	cp	a,#16
  28  0003 271d          	jreq	L01
  29  0005 a108          	cp	a,#8
  30  0007 2719          	jreq	L01
  31  0009 a104          	cp	a,#4
  32  000b 2715          	jreq	L01
  33  000d a102          	cp	a,#2
  34  000f 2711          	jreq	L01
  35  0011 4a            	dec	a
  36  0012 270e          	jreq	L01
  37  0014 ae0039        	ldw	x,#57
  38  0017 89            	pushw	x
  39  0018 5f            	clrw	x
  40  0019 89            	pushw	x
  41  001a ae0000        	ldw	x,#L3
  42  001d cd0000        	call	_assert_failed
  44  0020 5b04          	addw	sp,#4
  45  0022               L01:
  46                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
  47  0022 c650b3        	ld	a,20659
  48  0025 1501          	bcp	a,(OFST+1,sp)
  49  0027 2603          	jrne	L41
  50  0029 4f            	clr	a
  51  002a 2002          	jra	L61
  52  002c               L41:
  53  002c a601          	ld	a,#1
  54  002e               L61:
  56  002e 5b01          	addw	sp,#1
  57  0030 81            	ret	
  59                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
  59                     ; 70 {
  60  0031               _RST_ClearFlag:
  61  0031 88            	push	a
  62       00000000      OFST:	set	0
  64                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
  65  0032 a110          	cp	a,#16
  66  0034 271d          	jreq	L62
  67  0036 a108          	cp	a,#8
  68  0038 2719          	jreq	L62
  69  003a a104          	cp	a,#4
  70  003c 2715          	jreq	L62
  71  003e a102          	cp	a,#2
  72  0040 2711          	jreq	L62
  73  0042 4a            	dec	a
  74  0043 270e          	jreq	L62
  75  0045 ae0048        	ldw	x,#72
  76  0048 89            	pushw	x
  77  0049 5f            	clrw	x
  78  004a 89            	pushw	x
  79  004b ae0000        	ldw	x,#L3
  80  004e cd0000        	call	_assert_failed
  82  0051 5b04          	addw	sp,#4
  83  0053               L62:
  84                     ; 74   RST->SR = (uint8_t)RST_Flag;
  85  0053 7b01          	ld	a,(OFST+1,sp)
  86  0055 c750b3        	ld	20659,a
  87                     ; 75 }
  88  0058 84            	pop	a
  89  0059 81            	ret	
  91                     	xdef	_RST_ClearFlag
  92                     	xdef	_RST_GetFlagStatus
  93                     	xref	_assert_failed
  94                     .const:	section	.text
  95  0000               L3:
  96  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
  97  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
  98  0024 38735f727374  	dc.b	"8s_rst.c",0
  99                     	end
