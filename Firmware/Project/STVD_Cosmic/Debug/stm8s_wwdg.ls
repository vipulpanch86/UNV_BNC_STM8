   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  20                     ; 54 {
  21                     	scross	off
  22  0000               _WWDG_Init:
  23  0000 89            	pushw	x
  24       00000000      OFST:	set	0
  26                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  27  0001 9f            	ld	a,xl
  28  0002 a180          	cp	a,#128
  29  0004 250e          	jrult	L6
  30  0006 ae0038        	ldw	x,#56
  31  0009 89            	pushw	x
  32  000a 5f            	clrw	x
  33  000b 89            	pushw	x
  34  000c ae0000        	ldw	x,#L3
  35  000f cd0000        	call	_assert_failed
  37  0012 5b04          	addw	sp,#4
  38  0014               L6:
  39                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  40  0014 357f50d2      	mov	20690,#127
  41                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  42  0018 7b01          	ld	a,(OFST+1,sp)
  43  001a aac0          	or	a,#192
  44  001c c750d1        	ld	20689,a
  45                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  46  001f 7b02          	ld	a,(OFST+2,sp)
  47  0021 a47f          	and	a,#127
  48  0023 aa40          	or	a,#64
  49  0025 c750d2        	ld	20690,a
  50                     ; 61 }
  51  0028 85            	popw	x
  52  0029 81            	ret	
  54                     ; 69 void WWDG_SetCounter(uint8_t Counter)
  54                     ; 70 {
  55  002a               _WWDG_SetCounter:
  56  002a 88            	push	a
  57       00000000      OFST:	set	0
  59                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
  60  002b a180          	cp	a,#128
  61  002d 250e          	jrult	L61
  62  002f ae0048        	ldw	x,#72
  63  0032 89            	pushw	x
  64  0033 5f            	clrw	x
  65  0034 89            	pushw	x
  66  0035 ae0000        	ldw	x,#L3
  67  0038 cd0000        	call	_assert_failed
  69  003b 5b04          	addw	sp,#4
  70  003d               L61:
  71                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
  72  003d 7b01          	ld	a,(OFST+1,sp)
  73  003f a47f          	and	a,#127
  74  0041 c750d1        	ld	20689,a
  75                     ; 77 }
  76  0044 84            	pop	a
  77  0045 81            	ret	
  79                     ; 86 uint8_t WWDG_GetCounter(void)
  79                     ; 87 {
  80  0046               _WWDG_GetCounter:
  82                     ; 88   return(WWDG->CR);
  83  0046 c650d1        	ld	a,20689
  85  0049 81            	ret	
  87                     ; 96 void WWDG_SWReset(void)
  87                     ; 97 {
  88  004a               _WWDG_SWReset:
  90                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
  91  004a 358050d1      	mov	20689,#128
  92                     ; 99 }
  93  004e 81            	ret	
  95                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
  95                     ; 109 {
  96  004f               _WWDG_SetWindowValue:
  97  004f 88            	push	a
  98       00000000      OFST:	set	0
 100                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 101  0050 a180          	cp	a,#128
 102  0052 250e          	jrult	L23
 103  0054 ae006f        	ldw	x,#111
 104  0057 89            	pushw	x
 105  0058 5f            	clrw	x
 106  0059 89            	pushw	x
 107  005a ae0000        	ldw	x,#L3
 108  005d cd0000        	call	_assert_failed
 110  0060 5b04          	addw	sp,#4
 111  0062               L23:
 112                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 113  0062 7b01          	ld	a,(OFST+1,sp)
 114  0064 a47f          	and	a,#127
 115  0066 aa40          	or	a,#64
 116  0068 c750d2        	ld	20690,a
 117                     ; 114 }
 118  006b 84            	pop	a
 119  006c 81            	ret	
 121                     	xdef	_WWDG_SetWindowValue
 122                     	xdef	_WWDG_SWReset
 123                     	xdef	_WWDG_GetCounter
 124                     	xdef	_WWDG_SetCounter
 125                     	xdef	_WWDG_Init
 126                     	xref	_assert_failed
 127                     .const:	section	.text
 128  0000               L3:
 129  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm8s_stdper"
 130  0012 6970685f6472  	dc.b	"iph_driver\src\stm"
 131  0024 38735f777764  	dc.b	"8s_wwdg.c",0
 132                     	end
