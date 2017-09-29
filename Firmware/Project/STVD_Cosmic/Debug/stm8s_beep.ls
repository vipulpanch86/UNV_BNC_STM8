   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 54 void BEEP_DeInit(void)
  20                     ; 55 {
  21                     	scross	off
  22  0000               _BEEP_DeInit:
  24                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  25  0000 351f50f3      	mov	20723,#31
  26                     ; 57 }
  27  0004 81            	ret	
  29                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
  29                     ; 68 {
  30  0005               _BEEP_Init:
  31  0005 88            	push	a
  32       00000000      OFST:	set	0
  34                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
  35  0006 4d            	tnz	a
  36  0007 2716          	jreq	L21
  37  0009 a140          	cp	a,#64
  38  000b 2712          	jreq	L21
  39  000d a180          	cp	a,#128
  40  000f 270e          	jreq	L21
  41  0011 ae0046        	ldw	x,#70
  42  0014 89            	pushw	x
  43  0015 5f            	clrw	x
  44  0016 89            	pushw	x
  45  0017 ae000c        	ldw	x,#L3
  46  001a cd0000        	call	_assert_failed
  48  001d 5b04          	addw	sp,#4
  49  001f               L21:
  50                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
  51  001f c650f3        	ld	a,20723
  52  0022 a41f          	and	a,#31
  53  0024 a11f          	cp	a,#31
  54  0026 2610          	jrne	L5
  55                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
  56  0028 c650f3        	ld	a,20723
  57  002b a4e0          	and	a,#224
  58  002d c750f3        	ld	20723,a
  59                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
  60  0030 c650f3        	ld	a,20723
  61  0033 aa0b          	or	a,#11
  62  0035 c750f3        	ld	20723,a
  63  0038               L5:
  64                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
  65  0038 c650f3        	ld	a,20723
  66  003b a43f          	and	a,#63
  67  003d c750f3        	ld	20723,a
  68                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
  69  0040 c650f3        	ld	a,20723
  70  0043 1a01          	or	a,(OFST+1,sp)
  71  0045 c750f3        	ld	20723,a
  72                     ; 82 }
  73  0048 84            	pop	a
  74  0049 81            	ret	
  76                     ; 91 void BEEP_Cmd(FunctionalState NewState)
  76                     ; 92 {
  77  004a               _BEEP_Cmd:
  79                     ; 93   if (NewState != DISABLE)
  80  004a 4d            	tnz	a
  81  004b 2705          	jreq	L7
  82                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
  83  004d 721a50f3      	bset	20723,#5
  85  0051 81            	ret	
  86  0052               L7:
  87                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
  88  0052 721b50f3      	bres	20723,#5
  89                     ; 103 }
  90  0056 81            	ret	
  92                     .const:	section	.text
  93  0000               L42:
  94  0000 0001adb0      	dc.l	110000
  95  0004               L62:
  96  0004 000249f1      	dc.l	150001
  97  0008               L43:
  98  0008 000003e8      	dc.l	1000
  99                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
  99                     ; 119 {
 100                     	switch	.text
 101  0057               _BEEP_LSICalibrationConfig:
 102  0057 5206          	subw	sp,#6
 103       00000006      OFST:	set	6
 105                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 106  0059 96            	ldw	x,sp
 107  005a 1c0009        	addw	x,#OFST+3
 108  005d cd0000        	call	c_ltor
 110  0060 ae0000        	ldw	x,#L42
 111  0063 cd0000        	call	c_lcmp
 113  0066 250f          	jrult	L22
 114  0068 96            	ldw	x,sp
 115  0069 1c0009        	addw	x,#OFST+3
 116  006c cd0000        	call	c_ltor
 118  006f ae0004        	ldw	x,#L62
 119  0072 cd0000        	call	c_lcmp
 121  0075 250e          	jrult	L03
 122  0077               L22:
 123  0077 ae007c        	ldw	x,#124
 124  007a 89            	pushw	x
 125  007b 5f            	clrw	x
 126  007c 89            	pushw	x
 127  007d ae000c        	ldw	x,#L3
 128  0080 cd0000        	call	_assert_failed
 130  0083 5b04          	addw	sp,#4
 131  0085               L03:
 132                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 133  0085 96            	ldw	x,sp
 134  0086 1c0009        	addw	x,#OFST+3
 135  0089 cd0000        	call	c_ltor
 137  008c ae0008        	ldw	x,#L43
 138  008f cd0000        	call	c_ludv
 140  0092 be02          	ldw	x,c_lreg+2
 141  0094 1f03          	ldw	(OFST-3,sp),x
 142                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 143  0096 c650f3        	ld	a,20723
 144  0099 a4e0          	and	a,#224
 145  009b c750f3        	ld	20723,a
 146                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 147  009e 54            	srlw	x
 148  009f 54            	srlw	x
 149  00a0 54            	srlw	x
 150  00a1 1f05          	ldw	(OFST-1,sp),x
 151                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 152  00a3 58            	sllw	x
 153  00a4 58            	sllw	x
 154  00a5 58            	sllw	x
 155  00a6 1f01          	ldw	(OFST-5,sp),x
 156  00a8 1e03          	ldw	x,(OFST-3,sp)
 157  00aa 72f001        	subw	x,(OFST-5,sp)
 158  00ad 1605          	ldw	y,(OFST-1,sp)
 159  00af 9058          	sllw	y
 160  00b1 905c          	incw	y
 161  00b3 cd0000        	call	c_imul
 163  00b6 1605          	ldw	y,(OFST-1,sp)
 164  00b8 9058          	sllw	y
 165  00ba 9058          	sllw	y
 166  00bc bf00          	ldw	c_x,x
 167  00be 9058          	sllw	y
 168  00c0 90b300        	cpw	y,c_x
 169  00c3 7b06          	ld	a,(OFST+0,sp)
 170  00c5 2504          	jrult	L31
 171                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 172  00c7 a002          	sub	a,#2
 174  00c9 2001          	jra	L51
 175  00cb               L31:
 176                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 177  00cb 4a            	dec	a
 178  00cc               L51:
 179  00cc ca50f3        	or	a,20723
 180  00cf c750f3        	ld	20723,a
 181                     ; 142 }
 182  00d2 5b06          	addw	sp,#6
 183  00d4 81            	ret	
 185                     	xdef	_BEEP_LSICalibrationConfig
 186                     	xdef	_BEEP_Cmd
 187                     	xdef	_BEEP_Init
 188                     	xdef	_BEEP_DeInit
 189                     	xref	_assert_failed
 190                     	switch	.const
 191  000c               L3:
 192  000c 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 193  001e 6970685f6472  	dc.b	"iph_driver\src\stm"
 194  0030 38735f626565  	dc.b	"8s_beep.c",0
 195                     	xref.b	c_lreg
 196                     	xref.b	c_x
 197                     	xref	c_imul
 198                     	xref	c_ludv
 199                     	xref	c_lcmp
 200                     	xref	c_ltor
 201                     	end
