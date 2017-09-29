   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
   4                     ; Optimizer V4.4.6 - 08 Feb 2017
  20                     ; 47 void printf_test(void)
  20                     ; 48 {
  21                     	scross	off
  22  0000               _printf_test:
  23  0000 88            	push	a
  24       00000001      OFST:	set	1
  26                     ; 51   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  27  0001 4f            	clr	a
  28  0002 cd0000        	call	_CLK_HSIPrescalerConfig
  30                     ; 53   UART1_DeInit();
  31  0005 cd0000        	call	_UART1_DeInit
  33                     ; 63   UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
  33                     ; 64               UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  34  0008 4b0c          	push	#12
  35  000a 4b80          	push	#128
  36  000c 4b00          	push	#0
  37  000e 4b00          	push	#0
  38  0010 4b00          	push	#0
  39  0012 aec200        	ldw	x,#49664
  40  0015 89            	pushw	x
  41  0016 ae0001        	ldw	x,#1
  42  0019 89            	pushw	x
  43  001a cd0000        	call	_UART1_Init
  45  001d 5b09          	addw	sp,#9
  46                     ; 67   printf("\n\rUART1 Example :retarget the C library printf()/getchar() functions to the UART\n\r");
  47  001f ae0012        	ldw	x,#L3
  48  0022 cd0000        	call	_printf
  50                     ; 68   printf("\n\rEnter Text\n\r");
  51  0025 ae0003        	ldw	x,#L5
  52  0028 cd0000        	call	_printf
  54  002b               L7:
  55                     ; 72     ans = getchar();
  56  002b cd0000        	call	_getchar
  58  002e 6b01          	ld	(OFST+0,sp),a
  59                     ; 73     printf("%c", ans);  
  60  0030 88            	push	a
  61  0031 ae0000        	ldw	x,#L31
  62  0034 cd0000        	call	_printf
  64  0037 84            	pop	a
  66  0038 20f1          	jra	L7
  68                     	xdef	_printf_test
  69                     	xref	_printf
  70                     	xref	_getchar
  71                     	xref	_UART1_Init
  72                     	xref	_UART1_DeInit
  73                     	xref	_CLK_HSIPrescalerConfig
  74                     .const:	section	.text
  75  0000               L31:
  76  0000 256300        	dc.b	"%c",0
  77  0003               L5:
  78  0003 0a0d456e7465  	dc.b	10,13,69,110,116,101
  79  0009 722054657874  	dc.b	"r Text",10
  80  0010 0d00          	dc.b	13,0
  81  0012               L3:
  82  0012 0a0d55415254  	dc.b	10,13,85,65,82,84
  83  0018 31204578616d  	dc.b	"1 Example :retarge"
  84  002a 742074686520  	dc.b	"t the C library pr"
  85  003c 696e74662829  	dc.b	"intf()/getchar() f"
  86  004e 756e6374696f  	dc.b	"unctions to the UA"
  87  0060 52540a        	dc.b	"RT",10
  88  0063 0d00          	dc.b	13,0
  89                     	end
