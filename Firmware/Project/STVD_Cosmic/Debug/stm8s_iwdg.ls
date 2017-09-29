   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  20                     ; 49 {
  21                     	scross	off
  22  0000               _IWDG_WriteAccessCmd:
  23  0000 88            	push	a
  24       00000000      OFST:	set	0
  26                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  27  0001 a155          	cp	a,#85
  28  0003 2711          	jreq	L01
  29  0005 4d            	tnz	a
  30  0006 270e          	jreq	L01
  31  0008 ae0033        	ldw	x,#51
  32  000b 89            	pushw	x
  33  000c 5f            	clrw	x
  34  000d 89            	pushw	x
  35  000e ae0000        	ldw	x,#L3
  36  0011 cd0000        	call	_assert_failed
  38  0014 5b04          	addw	sp,#4
  39  0016               L01:
  40                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  41  0016 7b01          	ld	a,(OFST+1,sp)
  42  0018 c750e0        	ld	20704,a
  43                     ; 54 }
  44  001b 84            	pop	a
  45  001c 81            	ret	
  47                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
  47                     ; 64 {
  48  001d               _IWDG_SetPrescaler:
  49  001d 88            	push	a
  50       00000000      OFST:	set	0
  52                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
  53  001e 4d            	tnz	a
  54  001f 2726          	jreq	L22
  55  0021 a101          	cp	a,#1
  56  0023 2722          	jreq	L22
  57  0025 a102          	cp	a,#2
  58  0027 271e          	jreq	L22
  59  0029 a103          	cp	a,#3
  60  002b 271a          	jreq	L22
  61  002d a104          	cp	a,#4
  62  002f 2716          	jreq	L22
  63  0031 a105          	cp	a,#5
  64  0033 2712          	jreq	L22
  65  0035 a106          	cp	a,#6
  66  0037 270e          	jreq	L22
  67  0039 ae0042        	ldw	x,#66
  68  003c 89            	pushw	x
  69  003d 5f            	clrw	x
  70  003e 89            	pushw	x
  71  003f ae0000        	ldw	x,#L3
  72  0042 cd0000        	call	_assert_failed
  74  0045 5b04          	addw	sp,#4
  75  0047               L22:
  76                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
  77  0047 7b01          	ld	a,(OFST+1,sp)
  78  0049 c750e1        	ld	20705,a
  79                     ; 69 }
  80  004c 84            	pop	a
  81  004d 81            	ret	
  83                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
  83                     ; 79 {
  84  004e               _IWDG_SetReload:
  86                     ; 80   IWDG->RLR = IWDG_Reload;
  87  004e c750e2        	ld	20706,a
  88                     ; 81 }
  89  0051 81            	ret	
  91                     ; 89 void IWDG_ReloadCounter(void)
  91                     ; 90 {
  92  0052               _IWDG_ReloadCounter:
  94                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
  95  0052 35aa50e0      	mov	20704,#170
  96                     ; 92 }
  97  0056 81            	ret	
  99                     ; 99 void IWDG_Enable(void)
  99                     ; 100 {
 100  0057               _IWDG_Enable:
 102                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 103  0057 35cc50e0      	mov	20704,#204
 104                     ; 102 }
 105  005b 81            	ret	
 107                     	xdef	_IWDG_Enable
 108                     	xdef	_IWDG_ReloadCounter
 109                     	xdef	_IWDG_SetReload
 110                     	xdef	_IWDG_SetPrescaler
 111                     	xdef	_IWDG_WriteAccessCmd
 112                     	xref	_assert_failed
 113                     .const:	section	.text
 114  0000               L3:
 115  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 116  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 117  0024 38735f697764  	dc.b	"8s_iwdg.c",0
 118                     	end
