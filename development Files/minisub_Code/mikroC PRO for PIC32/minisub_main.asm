_InitGameShield:
;gaming-shield.h,246 :: 		void InitGameShield(){
;gaming-shield.h,252 :: 		upButtonDirection = 1;       //up
LBU	R2, Offset(TRISA+0)(GP)
ORI	R2, R2, 64
SB	R2, Offset(TRISA+0)(GP)
;gaming-shield.h,253 :: 		downButtonDirection = 1;     //down
LBU	R2, Offset(TRISA+0)(GP)
ORI	R2, R2, 128
SB	R2, Offset(TRISA+0)(GP)
;gaming-shield.h,254 :: 		rightButtonDirection = 1;    //right
LBU	R2, Offset(TRISD+1)(GP)
ORI	R2, R2, 4
SB	R2, Offset(TRISD+1)(GP)
;gaming-shield.h,255 :: 		leftButtonDirection = 1;     //left
LBU	R2, Offset(TRISA+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(TRISA+0)(GP)
;gaming-shield.h,256 :: 		triangleButtonDirection = 1; //triangle up
LBU	R2, Offset(TRISD+1)(GP)
ORI	R2, R2, 64
SB	R2, Offset(TRISD+1)(GP)
;gaming-shield.h,257 :: 		xButtonDirection = 1;        //x down
LBU	R2, Offset(TRISD+1)(GP)
ORI	R2, R2, 128
SB	R2, Offset(TRISD+1)(GP)
;gaming-shield.h,258 :: 		circleButtonDirection = 1;   //circle right
LBU	R2, Offset(TRISF+0)(GP)
ORI	R2, R2, 16
SB	R2, Offset(TRISF+0)(GP)
;gaming-shield.h,259 :: 		squareButtonDirection = 1;   //square left
LBU	R2, Offset(TRISD+1)(GP)
ORI	R2, R2, 8
SB	R2, Offset(TRISD+1)(GP)
;gaming-shield.h,260 :: 		startButtonDirection = 1;    //start
LBU	R2, Offset(TRISF+0)(GP)
ORI	R2, R2, 32
SB	R2, Offset(TRISF+0)(GP)
;gaming-shield.h,265 :: 		LED1_Direction = 0; //led 1
LBU	R2, Offset(TRISE+1)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(TRISE+1)(GP)
;gaming-shield.h,266 :: 		LED2_Direction = 0; //led 2
LBU	R2, Offset(TRISE+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(TRISE+1)(GP)
;gaming-shield.h,267 :: 		LED3_Direction = 0; //led 3
LBU	R2, Offset(TRISA+1)(GP)
INS	R2, R0, 6, 1
SB	R2, Offset(TRISA+1)(GP)
;gaming-shield.h,268 :: 		LED4_Direction = 0; //led 4
LBU	R2, Offset(TRISA+1)(GP)
INS	R2, R0, 7, 1
SB	R2, Offset(TRISA+1)(GP)
;gaming-shield.h,270 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_InitGameShield0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_InitGameShield0
NOP	
;gaming-shield.h,272 :: 		LED1 = 0;
LBU	R2, Offset(LATE+1)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(LATE+1)(GP)
;gaming-shield.h,273 :: 		LED2 = 0;
LBU	R2, Offset(LATE+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(LATE+1)(GP)
;gaming-shield.h,274 :: 		LED3 = 0;
LBU	R2, Offset(LATA+1)(GP)
INS	R2, R0, 6, 1
SB	R2, Offset(LATA+1)(GP)
;gaming-shield.h,275 :: 		LED4 = 0;
LBU	R2, Offset(LATA+1)(GP)
INS	R2, R0, 7, 1
SB	R2, Offset(LATA+1)(GP)
;gaming-shield.h,276 :: 		}
L_end_InitGameShield:
JR	RA
NOP	
; end of _InitGameShield
_main:
;minisub_main.c,140 :: 		void main() {
;minisub_main.c,142 :: 		Start_TP();
JAL	_Start_TP+0
NOP	
;minisub_main.c,145 :: 		TFT_Fill_Screen(CL_BLACK);
MOVZ	R25, R0, R0
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,147 :: 		Start_WS();
JAL	_Start_WS+0
NOP	
;minisub_main.c,150 :: 		InitGameShield();
JAL	_InitGameShield+0
NOP	
;minisub_main.c,154 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,157 :: 		file_loaded = 0;
SB	R0, Offset(_file_loaded+0)(GP)
;minisub_main.c,158 :: 		MP3_Start();
JAL	_MP3_Start+0
NOP	
;minisub_main.c,160 :: 		Startup_Volume(80);  //Set the startup volume to 50%
ORI	R25, R0, 80
JAL	_Startup_Volume+0
NOP	
;minisub_main.c,163 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,165 :: 		UART1_Write_Line("Mini-Sub Game Started");
LUI	R25, #hi_addr(?lstr1_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr1_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,167 :: 		while (1) {
L_main2:
;minisub_main.c,170 :: 		ResetGame();
JAL	_ResetGame+0
NOP	
;minisub_main.c,173 :: 		ShowTitles();
JAL	_ShowTitles+0
NOP	
;minisub_main.c,178 :: 		show_main_menu=1;
ORI	R2, R0, 1
SH	R2, Offset(_show_main_menu+0)(GP)
;minisub_main.c,179 :: 		start_game_flag=1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,181 :: 		RefreshMenu();
JAL	_RefreshMenu+0
NOP	
;minisub_main.c,183 :: 		while(show_main_menu==1)
L_main4:
LH	R3, Offset(_show_main_menu+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main349
NOP	
J	L_main5
NOP	
L__main349:
;minisub_main.c,185 :: 		if(toggled_main_menu){
LH	R2, Offset(_toggled_main_menu+0)(GP)
BNE	R2, R0, L__main351
NOP	
J	L_main6
NOP	
L__main351:
;minisub_main.c,186 :: 		RefreshMenu();
JAL	_RefreshMenu+0
NOP	
;minisub_main.c,187 :: 		toggled_main_menu=0;
SH	R0, Offset(_toggled_main_menu+0)(GP)
;minisub_main.c,188 :: 		}
L_main6:
;minisub_main.c,190 :: 		Check_TP();
JAL	_Check_TP+0
NOP	
;minisub_main.c,192 :: 		UART1_Write_Line(".");
LUI	R25, #hi_addr(?lstr2_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr2_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,193 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,195 :: 		}
J	L_main4
NOP	
L_main5:
;minisub_main.c,198 :: 		while(subLives){
L_main7:
LH	R2, Offset(_subLives+0)(GP)
BNE	R2, R0, L__main353
NOP	
J	L_main8
NOP	
L__main353:
;minisub_main.c,201 :: 		InitSprites();
JAL	_InitSprites+0
NOP	
;minisub_main.c,204 :: 		while (mineHit == 0) {
L_main9:
LH	R2, Offset(_mineHit+0)(GP)
BEQ	R2, R0, L__main354
NOP	
J	L_main10
NOP	
L__main354:
;minisub_main.c,207 :: 		if(play_next_song){
LH	R2, Offset(_play_next_song+0)(GP)
BNE	R2, R0, L__main356
NOP	
J	L_main11
NOP	
L__main356:
;minisub_main.c,209 :: 		GetNextSong();
JAL	_GetNextSong+0
NOP	
;minisub_main.c,210 :: 		}
J	L_main12
NOP	
L_main11:
;minisub_main.c,211 :: 		else if( (frame_counter % 2) == 0){
LW	R2, Offset(_frame_counter+0)(GP)
ANDI	R2, R2, 1
BEQ	R2, R0, L__main357
NOP	
J	L_main13
NOP	
L__main357:
;minisub_main.c,213 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,214 :: 		}
L_main13:
L_main12:
;minisub_main.c,217 :: 		if(show_main_menu==1)
LH	R3, Offset(_show_main_menu+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__main358
NOP	
J	L_main14
NOP	
L__main358:
;minisub_main.c,219 :: 		if(toggled_main_menu){
LH	R2, Offset(_toggled_main_menu+0)(GP)
BNE	R2, R0, L__main360
NOP	
J	L_main15
NOP	
L__main360:
;minisub_main.c,220 :: 		RefreshMenu();
JAL	_RefreshMenu+0
NOP	
;minisub_main.c,221 :: 		toggled_main_menu=0;
SH	R0, Offset(_toggled_main_menu+0)(GP)
;minisub_main.c,222 :: 		}
L_main15:
;minisub_main.c,224 :: 		Check_TP();
JAL	_Check_TP+0
NOP	
;minisub_main.c,225 :: 		}
J	L_main16
NOP	
L_main14:
;minisub_main.c,229 :: 		if(toggled_main_menu){
LH	R2, Offset(_toggled_main_menu+0)(GP)
BNE	R2, R0, L__main362
NOP	
J	L_main17
NOP	
L__main362:
;minisub_main.c,231 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,234 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,237 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,239 :: 		toggled_main_menu=0;
SH	R0, Offset(_toggled_main_menu+0)(GP)
;minisub_main.c,240 :: 		}
L_main17:
;minisub_main.c,243 :: 		GetInput();
JAL	_GetInput+0
NOP	
;minisub_main.c,246 :: 		RenderScreen();
JAL	_RenderScreen+0
NOP	
;minisub_main.c,249 :: 		SavePreviousVal();
JAL	_SavePreviousVal+0
NOP	
;minisub_main.c,252 :: 		frame_counter++;
LW	R2, Offset(_frame_counter+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_frame_counter+0)(GP)
;minisub_main.c,253 :: 		}
L_main16:
;minisub_main.c,257 :: 		} //End of the current sub life
J	L_main9
NOP	
L_main10:
;minisub_main.c,260 :: 		mineHit = 0;
SH	R0, Offset(_mineHit+0)(GP)
;minisub_main.c,263 :: 		mineExplode = 0;
SH	R0, Offset(_mineExplode+0)(GP)
;minisub_main.c,266 :: 		subLives--;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,267 :: 		}
J	L_main7
NOP	
L_main8:
;minisub_main.c,270 :: 		ShowGameOver();
JAL	_ShowGameOver+0
NOP	
;minisub_main.c,271 :: 		}
J	L_main2
NOP	
;minisub_main.c,273 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Start_WS:
;minisub_main.c,277 :: 		void Start_WS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,279 :: 		WS_Init();                      //Setup the Mikromedia Workstation
SW	R25, 4(SP)
JAL	_WS_Init+0
NOP	
;minisub_main.c,281 :: 		WS_UART_Init(256000);
LUI	R25, 3
ORI	R25, R25, 59392
JAL	_WS_UART_Init+0
NOP	
;minisub_main.c,282 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
LUI	R24, 40
ORI	R24, R24, 45226
L_Start_WS18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Start_WS18
NOP	
;minisub_main.c,283 :: 		}
L_end_Start_WS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Start_WS
_UART1_Write_Line:
;minisub_main.c,286 :: 		void UART1_Write_Line(char *uart_text) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,287 :: 		UART1_Write_Text(uart_text);
SW	R25, 4(SP)
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,288 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,289 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,290 :: 		}
L_end_UART1_Write_Line:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _UART1_Write_Line
_UART1_Write_Variable:
;minisub_main.c,293 :: 		void UART1_Write_Variable(int var) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,295 :: 		IntToStr(var, var_txt);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
JAL	_IntToStr+0
NOP	
;minisub_main.c,296 :: 		UART1_Write_Text(var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,297 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,298 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,299 :: 		}
L_end_UART1_Write_Variable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _UART1_Write_Variable
_UART1_Write_Long_Variable:
;minisub_main.c,302 :: 		void UART1_Write_Long_Variable(long var){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;minisub_main.c,304 :: 		LongWordToStr(var, var_txt);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
JAL	_LongWordToStr+0
NOP	
;minisub_main.c,305 :: 		UART1_Write_Text(var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,306 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,307 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,308 :: 		}
L_end_UART1_Write_Long_Variable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _UART1_Write_Long_Variable
_ShowTitles:
;minisub_main.c,312 :: 		void ShowTitles(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,313 :: 		int step_value = 15;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R30, R0, 15
SH	R30, 20(SP)
;minisub_main.c,316 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,319 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,321 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,324 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, bgColor, bgColor);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
LH	R2, Offset(_bgColor+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 2(SP)
LH	R2, Offset(_bgColor+0)(GP)
SH	R2, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,327 :: 		TFT_Image(35, (SCREEN_HEIGHT/2)-47, title_bmp, 1);
LUI	R2, #hi_addr(_title_bmp+0)
ORI	R2, R2, #lo_addr(_title_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 73
ORI	R25, R0, 35
JAL	_TFT_Image+0
NOP	
;minisub_main.c,333 :: 		TFT_Write_Text("Loading the game...", 100, 220);
ORI	R27, R0, 220
ORI	R26, R0, 100
LUI	R25, #hi_addr(?lstr3_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr3_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,336 :: 		sub.y = 160;
ORI	R2, R0, 160
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,339 :: 		sub.x = step_value+1;
LH	R2, 20(SP)
ADDIU	R3, R2, 1
SH	R3, Offset(_sub+0)(GP)
;minisub_main.c,340 :: 		TFT_Image(sub.x, sub.y, sub_bmp, 1);
LUI	R2, #hi_addr(_sub_bmp+0)
ORI	R2, R2, #lo_addr(_sub_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 160
SEH	R25, R3
JAL	_TFT_Image+0
NOP	
;minisub_main.c,343 :: 		GetNextSong();
JAL	_GetNextSong+0
NOP	
;minisub_main.c,346 :: 		for(sub.x = step_value+1;(sub.x <= (SCREEN_WIDTH+1)) && (!startButton);sub.x+=step_value){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, Offset(_sub+0)(GP)
L_ShowTitles20:
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 322
BNE	R2, R0, L__ShowTitles369
NOP	
J	L__ShowTitles282
NOP	
L__ShowTitles369:
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BEQ	R2, R0, L__ShowTitles370
NOP	
J	L__ShowTitles281
NOP	
L__ShowTitles370:
L__ShowTitles280:
;minisub_main.c,349 :: 		TFT_Image(sub.x, sub.y, sub_bmp, 1);
LUI	R2, #hi_addr(_sub_bmp+0)
ORI	R2, R2, #lo_addr(_sub_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_sub+2)(GP)
LH	R25, Offset(_sub+0)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,352 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,355 :: 		TFT_Rectangle(sub.x-step_value, sub.y, sub.x+step_value, sub.y + PLAYER_HEIGHT );
LH	R2, Offset(_sub+2)(GP)
ADDIU	R5, R2, 47
LH	R3, 20(SP)
LH	R2, Offset(_sub+0)(GP)
ADDU	R4, R2, R3
LH	R3, 20(SP)
LH	R2, Offset(_sub+0)(GP)
SUBU	R2, R2, R3
SEH	R28, R5
SEH	R27, R4
LH	R26, Offset(_sub+2)(GP)
SEH	R25, R2
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,358 :: 		frame_counter++;
LW	R2, Offset(_frame_counter+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_frame_counter+0)(GP)
;minisub_main.c,361 :: 		if(TP_TFT_Press_Detect()){
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__ShowTitles372
NOP	
J	L_ShowTitles25
NOP	
L__ShowTitles372:
;minisub_main.c,362 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__ShowTitles373
NOP	
J	L_ShowTitles26
NOP	
L__ShowTitles373:
;minisub_main.c,363 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,364 :: 		}
L_ShowTitles26:
;minisub_main.c,365 :: 		}
L_ShowTitles25:
;minisub_main.c,368 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__ShowTitles375
NOP	
J	L_ShowTitles27
NOP	
L__ShowTitles375:
;minisub_main.c,369 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,370 :: 		}
L_ShowTitles27:
;minisub_main.c,380 :: 		if(muteButton){
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__ShowTitles377
NOP	
J	L_ShowTitles28
NOP	
L__ShowTitles377:
;minisub_main.c,382 :: 		ToggleMute();
JAL	_ToggleMute+0
NOP	
;minisub_main.c,383 :: 		}
L_ShowTitles28:
;minisub_main.c,385 :: 		if(start_game_flag){
LH	R2, Offset(_start_game_flag+0)(GP)
BNE	R2, R0, L__ShowTitles379
NOP	
J	L_ShowTitles29
NOP	
L__ShowTitles379:
;minisub_main.c,386 :: 		break;
J	L_ShowTitles21
NOP	
;minisub_main.c,387 :: 		}
L_ShowTitles29:
;minisub_main.c,346 :: 		for(sub.x = step_value+1;(sub.x <= (SCREEN_WIDTH+1)) && (!startButton);sub.x+=step_value){
LH	R3, 20(SP)
LH	R2, Offset(_sub+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,389 :: 		}
J	L_ShowTitles20
NOP	
L_ShowTitles21:
;minisub_main.c,346 :: 		for(sub.x = step_value+1;(sub.x <= (SCREEN_WIDTH+1)) && (!startButton);sub.x+=step_value){
L__ShowTitles282:
L__ShowTitles281:
;minisub_main.c,392 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,393 :: 		}
L_end_ShowTitles:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ShowTitles
_ShowHelp:
;minisub_main.c,397 :: 		void ShowHelp(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,398 :: 		int loop = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,399 :: 		UART1_Write_Line("Help Screens");
LUI	R25, #hi_addr(?lstr4_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr4_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,402 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,405 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,408 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,412 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,415 :: 		if(!start_game_flag){
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp381
NOP	
J	L_ShowHelp30
NOP	
L__ShowHelp381:
;minisub_main.c,418 :: 		TFT_Write_Text("Overview", 132, 8);
ORI	R27, R0, 8
ORI	R26, R0, 132
LUI	R25, #hi_addr(?lstr5_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr5_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,421 :: 		TFT_Image(8, 46, sub_bmp, 1);   //8, 43
LUI	R2, #hi_addr(_sub_bmp+0)
ORI	R2, R2, #lo_addr(_sub_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 46
ORI	R25, R0, 8
JAL	_TFT_Image+0
NOP	
;minisub_main.c,423 :: 		TFT_Write_Text("Navigate  your  sub  through  an", 86, 48);
ORI	R27, R0, 48
ORI	R26, R0, 86
LUI	R25, #hi_addr(?lstr6_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr6_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,424 :: 		TFT_Write_Text("ocean  filled  with  dangerous  sea", 86, 64);
ORI	R27, R0, 64
ORI	R26, R0, 86
LUI	R25, #hi_addr(?lstr7_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr7_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,425 :: 		TFT_Write_Text("mines  while  collecting  points.", 86, 80);
ORI	R27, R0, 80
ORI	R26, R0, 86
LUI	R25, #hi_addr(?lstr8_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr8_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,428 :: 		TFT_Write_Text("Pickup  bonus  items  as  you  go:", 17, 115); //96
ORI	R27, R0, 115
ORI	R26, R0, 17
LUI	R25, #hi_addr(?lstr9_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr9_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,431 :: 		TFT_Image(18, 137, torpedo_pack_bmp, 1);
LUI	R2, #hi_addr(_torpedo_pack_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_pack_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 137
ORI	R25, R0, 18
JAL	_TFT_Image+0
NOP	
;minisub_main.c,432 :: 		TFT_Write_Text("Pickup  3  extra  torpedoes.", 86, 151);    //130
ORI	R27, R0, 151
ORI	R26, R0, 86
LUI	R25, #hi_addr(?lstr10_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr10_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,435 :: 		TFT_Image(17, 188, heart_pack_bmp, 1);
LUI	R2, #hi_addr(_heart_pack_bmp+0)
ORI	R2, R2, #lo_addr(_heart_pack_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 188
ORI	R25, R0, 17
JAL	_TFT_Image+0
NOP	
;minisub_main.c,436 :: 		TFT_Write_Text("Pickup  an  extra  life.", 86, 202);  //194
ORI	R27, R0, 202
ORI	R26, R0, 86
LUI	R25, #hi_addr(?lstr11_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr11_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,439 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
SH	R0, 20(SP)
L_ShowHelp31:
LH	R2, 20(SP)
SLTI	R2, R2, 81
BNE	R2, R0, L__ShowHelp382
NOP	
J	L__ShowHelp340
NOP	
L__ShowHelp382:
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp383
NOP	
J	L__ShowHelp339
NOP	
L__ShowHelp383:
L__ShowHelp338:
;minisub_main.c,440 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,441 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowHelp36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowHelp36
NOP	
NOP	
NOP	
;minisub_main.c,444 :: 		if(TP_TFT_Press_Detect()){
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__ShowHelp385
NOP	
J	L_ShowHelp38
NOP	
L__ShowHelp385:
;minisub_main.c,445 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__ShowHelp386
NOP	
J	L_ShowHelp39
NOP	
L__ShowHelp386:
;minisub_main.c,446 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,447 :: 		}
L_ShowHelp39:
;minisub_main.c,448 :: 		}
L_ShowHelp38:
;minisub_main.c,452 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__ShowHelp388
NOP	
J	L_ShowHelp40
NOP	
L__ShowHelp388:
;minisub_main.c,453 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,454 :: 		}
L_ShowHelp40:
;minisub_main.c,466 :: 		if(muteButton){
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__ShowHelp390
NOP	
J	L_ShowHelp41
NOP	
L__ShowHelp390:
;minisub_main.c,468 :: 		ToggleMute();
JAL	_ToggleMute+0
NOP	
;minisub_main.c,471 :: 		Delay_ms(250);
LUI	R24, 101
ORI	R24, R24, 47530
L_ShowHelp42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowHelp42
NOP	
;minisub_main.c,472 :: 		}
L_ShowHelp41:
;minisub_main.c,439 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,474 :: 		}
J	L_ShowHelp31
NOP	
;minisub_main.c,439 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
L__ShowHelp340:
L__ShowHelp339:
;minisub_main.c,476 :: 		}
L_ShowHelp30:
;minisub_main.c,478 :: 		if(!start_game_flag){
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp391
NOP	
J	L_ShowHelp44
NOP	
L__ShowHelp391:
;minisub_main.c,482 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,484 :: 		TFT_Write_Text("Overview", 132, 8);
ORI	R27, R0, 8
ORI	R26, R0, 132
LUI	R25, #hi_addr(?lstr12_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr12_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,489 :: 		TFT_Write_Text("Use  the arrow keys to  move  the  sub.", 50, 24);
ORI	R27, R0, 24
ORI	R26, R0, 50
LUI	R25, #hi_addr(?lstr13_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr13_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,494 :: 		TFT_Image(24, 116, sub_bmp, 1);
LUI	R2, #hi_addr(_sub_bmp+0)
ORI	R2, R2, #lo_addr(_sub_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 116
ORI	R25, R0, 24
JAL	_TFT_Image+0
NOP	
;minisub_main.c,497 :: 		TFT_Image(102, 132, torpedo_bmp, 1);
LUI	R2, #hi_addr(_torpedo_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 132
ORI	R25, R0, 102
JAL	_TFT_Image+0
NOP	
;minisub_main.c,500 :: 		TFT_Image(187, 117, mine1_bmp, 1);
LUI	R2, #hi_addr(_mine1_bmp+0)
ORI	R2, R2, #lo_addr(_mine1_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 117
ORI	R25, R0, 187
JAL	_TFT_Image+0
NOP	
;minisub_main.c,501 :: 		TFT_Image(248, 56, mine2_bmp, 1);
LUI	R2, #hi_addr(_mine2_bmp+0)
ORI	R2, R2, #lo_addr(_mine2_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 56
ORI	R25, R0, 248
JAL	_TFT_Image+0
NOP	
;minisub_main.c,503 :: 		TFT_Image(118, 54, dark_mine1_bmp, 1);
LUI	R2, #hi_addr(_dark_mine1_bmp+0)
ORI	R2, R2, #lo_addr(_dark_mine1_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 54
ORI	R25, R0, 118
JAL	_TFT_Image+0
NOP	
;minisub_main.c,508 :: 		TFT_Write_Text("Press  the  square  button  to  fire your torpedoes.", 5, 175);//191
ORI	R27, R0, 175
ORI	R26, R0, 5
LUI	R25, #hi_addr(?lstr14_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr14_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,511 :: 		TFT_Write_Text("Red  sea  mines  take  1  torpedo  hit.", 40, 200);
ORI	R27, R0, 200
ORI	R26, R0, 40
LUI	R25, #hi_addr(?lstr15_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr15_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,512 :: 		TFT_Write_Text("Grey  sea  mines  take  2  torpedo  hits.", 40, 216);
ORI	R27, R0, 216
ORI	R26, R0, 40
LUI	R25, #hi_addr(?lstr16_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr16_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,515 :: 		for(loop = 0; (loop<=100) && (!start_game_flag);loop++){
SH	R0, 20(SP)
L_ShowHelp45:
LH	R2, 20(SP)
SLTI	R2, R2, 101
BNE	R2, R0, L__ShowHelp392
NOP	
J	L__ShowHelp342
NOP	
L__ShowHelp392:
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp393
NOP	
J	L__ShowHelp341
NOP	
L__ShowHelp393:
L__ShowHelp337:
;minisub_main.c,516 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,517 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowHelp50:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowHelp50
NOP	
NOP	
NOP	
;minisub_main.c,520 :: 		if(TP_TFT_Press_Detect()){
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__ShowHelp395
NOP	
J	L_ShowHelp52
NOP	
L__ShowHelp395:
;minisub_main.c,521 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__ShowHelp396
NOP	
J	L_ShowHelp53
NOP	
L__ShowHelp396:
;minisub_main.c,522 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,523 :: 		}
L_ShowHelp53:
;minisub_main.c,524 :: 		}
L_ShowHelp52:
;minisub_main.c,527 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__ShowHelp398
NOP	
J	L_ShowHelp54
NOP	
L__ShowHelp398:
;minisub_main.c,528 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,529 :: 		}
L_ShowHelp54:
;minisub_main.c,540 :: 		if(muteButton){
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__ShowHelp400
NOP	
J	L_ShowHelp55
NOP	
L__ShowHelp400:
;minisub_main.c,542 :: 		ToggleMute();
JAL	_ToggleMute+0
NOP	
;minisub_main.c,546 :: 		}
L_ShowHelp55:
;minisub_main.c,515 :: 		for(loop = 0; (loop<=100) && (!start_game_flag);loop++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,548 :: 		}
J	L_ShowHelp45
NOP	
;minisub_main.c,515 :: 		for(loop = 0; (loop<=100) && (!start_game_flag);loop++){
L__ShowHelp342:
L__ShowHelp341:
;minisub_main.c,550 :: 		}
L_ShowHelp44:
;minisub_main.c,553 :: 		if(!start_game_flag){
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp401
NOP	
J	L_ShowHelp56
NOP	
L__ShowHelp401:
;minisub_main.c,557 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,561 :: 		RenderScore();
JAL	_RenderScore+0
NOP	
;minisub_main.c,563 :: 		TFT_Write_Text("Icons  Explained", 122, 50);
ORI	R27, R0, 50
ORI	R26, R0, 122
LUI	R25, #hi_addr(?lstr17_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr17_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,565 :: 		TFT_Write_Text("This  icon  shows  how  many  lives  remain.", 50, 80);
ORI	R27, R0, 80
ORI	R26, R0, 50
LUI	R25, #hi_addr(?lstr18_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr18_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,566 :: 		TFT_Image(20, 80, lives_bmp, 1);
LUI	R2, #hi_addr(_lives_bmp+0)
ORI	R2, R2, #lo_addr(_lives_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 80
ORI	R25, R0, 20
JAL	_TFT_Image+0
NOP	
;minisub_main.c,568 :: 		TFT_Write_Text("This  icon   shows  your  torpedo  count.", 50, 110);
ORI	R27, R0, 110
ORI	R26, R0, 50
LUI	R25, #hi_addr(?lstr19_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr19_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,569 :: 		TFT_Image(22, 110, torpedo_status_bmp, 1);
LUI	R2, #hi_addr(_torpedo_status_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_status_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 110
ORI	R25, R0, 22
JAL	_TFT_Image+0
NOP	
;minisub_main.c,570 :: 		TFT_Image(28, 110, torpedo_status_bmp, 1);
LUI	R2, #hi_addr(_torpedo_status_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_status_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 110
ORI	R25, R0, 28
JAL	_TFT_Image+0
NOP	
;minisub_main.c,571 :: 		TFT_Image(34, 110, torpedo_status_bmp, 1);
LUI	R2, #hi_addr(_torpedo_status_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_status_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 110
ORI	R25, R0, 34
JAL	_TFT_Image+0
NOP	
;minisub_main.c,573 :: 		TFT_Write_Text("This  icon  shows  the  sound  volume.", 50, 145);
ORI	R27, R0, 145
ORI	R26, R0, 50
LUI	R25, #hi_addr(?lstr20_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr20_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,574 :: 		TFT_Image(20, 145, sound_bmp, 1);
LUI	R2, #hi_addr(_sound_bmp+0)
ORI	R2, R2, #lo_addr(_sound_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 145
ORI	R25, R0, 20
JAL	_TFT_Image+0
NOP	
;minisub_main.c,576 :: 		TFT_Write_Text("Tip:  While   playing   the   game   tap   the   screen", 25, 200);
ORI	R27, R0, 200
ORI	R26, R0, 25
LUI	R25, #hi_addr(?lstr21_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr21_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,577 :: 		TFT_Write_Text("to   load   the   main   menu.", 60, 216);
ORI	R27, R0, 216
ORI	R26, R0, 60
LUI	R25, #hi_addr(?lstr22_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr22_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,580 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
SH	R0, 20(SP)
L_ShowHelp57:
LH	R2, 20(SP)
SLTI	R2, R2, 81
BNE	R2, R0, L__ShowHelp402
NOP	
J	L__ShowHelp344
NOP	
L__ShowHelp402:
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp403
NOP	
J	L__ShowHelp343
NOP	
L__ShowHelp403:
L__ShowHelp336:
;minisub_main.c,581 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,582 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowHelp62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowHelp62
NOP	
NOP	
NOP	
;minisub_main.c,585 :: 		if(TP_TFT_Press_Detect()){
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__ShowHelp405
NOP	
J	L_ShowHelp64
NOP	
L__ShowHelp405:
;minisub_main.c,586 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__ShowHelp406
NOP	
J	L_ShowHelp65
NOP	
L__ShowHelp406:
;minisub_main.c,587 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,588 :: 		}
L_ShowHelp65:
;minisub_main.c,589 :: 		}
L_ShowHelp64:
;minisub_main.c,592 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__ShowHelp408
NOP	
J	L_ShowHelp66
NOP	
L__ShowHelp408:
;minisub_main.c,593 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,594 :: 		}
L_ShowHelp66:
;minisub_main.c,604 :: 		if(muteButton){
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__ShowHelp410
NOP	
J	L_ShowHelp67
NOP	
L__ShowHelp410:
;minisub_main.c,606 :: 		ToggleMute();
JAL	_ToggleMute+0
NOP	
;minisub_main.c,610 :: 		}
L_ShowHelp67:
;minisub_main.c,580 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,612 :: 		}
J	L_ShowHelp57
NOP	
;minisub_main.c,580 :: 		for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
L__ShowHelp344:
L__ShowHelp343:
;minisub_main.c,614 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,616 :: 		}
L_ShowHelp56:
;minisub_main.c,618 :: 		if(!start_game_flag){
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp411
NOP	
J	L_ShowHelp68
NOP	
L__ShowHelp411:
;minisub_main.c,622 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,624 :: 		TFT_Write_Text("Credits", 132, 8);
ORI	R27, R0, 8
ORI	R26, R0, 132
LUI	R25, #hi_addr(?lstr23_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr23_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,627 :: 		TFT_Image(28, 36,  andrew_bmp, 1);
LUI	R2, #hi_addr(_andrew_bmp+0)
ORI	R2, R2, #lo_addr(_andrew_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 36
ORI	R25, R0, 28
JAL	_TFT_Image+0
NOP	
;minisub_main.c,628 :: 		TFT_Image(28, 109, tonyB_bmp, 1);
LUI	R2, #hi_addr(_tonyB_bmp+0)
ORI	R2, R2, #lo_addr(_tonyB_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 109
ORI	R25, R0, 28
JAL	_TFT_Image+0
NOP	
;minisub_main.c,629 :: 		TFT_Image(28, 178, mikroe_bmp, 1);
LUI	R2, #hi_addr(_mikroe_bmp+0)
ORI	R2, R2, #lo_addr(_mikroe_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 178
ORI	R25, R0, 28
JAL	_TFT_Image+0
NOP	
;minisub_main.c,634 :: 		TFT_Write_Text("Game   by   Andrew   Hazelden", 82, 44);
ORI	R27, R0, 44
ORI	R26, R0, 82
LUI	R25, #hi_addr(?lstr24_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr24_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,636 :: 		TFT_Write_Text("Music   by   Tony   B   Machine", 82, 117);
ORI	R27, R0, 117
ORI	R26, R0, 82
LUI	R25, #hi_addr(?lstr25_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr25_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,638 :: 		TFT_Write_Text("Developed   using   MikroElektronika's", 82, 178);
ORI	R27, R0, 178
ORI	R26, R0, 82
LUI	R25, #hi_addr(?lstr26_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr26_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,639 :: 		TFT_Write_Text("MikroC   Pro   for   PIC32   compiler.", 82, 194); //195
ORI	R27, R0, 194
ORI	R26, R0, 82
LUI	R25, #hi_addr(?lstr27_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr27_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,643 :: 		for(loop = 0; (loop<=60) && (!start_game_flag);loop++){
SH	R0, 20(SP)
L_ShowHelp69:
LH	R2, 20(SP)
SLTI	R2, R2, 61
BNE	R2, R0, L__ShowHelp412
NOP	
J	L__ShowHelp346
NOP	
L__ShowHelp412:
LH	R2, Offset(_start_game_flag+0)(GP)
BEQ	R2, R0, L__ShowHelp413
NOP	
J	L__ShowHelp345
NOP	
L__ShowHelp413:
L__ShowHelp335:
;minisub_main.c,644 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,645 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowHelp74:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowHelp74
NOP	
NOP	
NOP	
;minisub_main.c,649 :: 		if(TP_TFT_Press_Detect()){
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__ShowHelp415
NOP	
J	L_ShowHelp76
NOP	
L__ShowHelp415:
;minisub_main.c,650 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__ShowHelp416
NOP	
J	L_ShowHelp77
NOP	
L__ShowHelp416:
;minisub_main.c,651 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,652 :: 		}
L_ShowHelp77:
;minisub_main.c,653 :: 		}
L_ShowHelp76:
;minisub_main.c,656 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__ShowHelp418
NOP	
J	L_ShowHelp78
NOP	
L__ShowHelp418:
;minisub_main.c,657 :: 		start_game_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_start_game_flag+0)(GP)
;minisub_main.c,658 :: 		}
L_ShowHelp78:
;minisub_main.c,670 :: 		if(muteButton){
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__ShowHelp420
NOP	
J	L_ShowHelp79
NOP	
L__ShowHelp420:
;minisub_main.c,672 :: 		ToggleMute();
JAL	_ToggleMute+0
NOP	
;minisub_main.c,676 :: 		}
L_ShowHelp79:
;minisub_main.c,643 :: 		for(loop = 0; (loop<=60) && (!start_game_flag);loop++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,678 :: 		}
J	L_ShowHelp69
NOP	
;minisub_main.c,643 :: 		for(loop = 0; (loop<=60) && (!start_game_flag);loop++){
L__ShowHelp346:
L__ShowHelp345:
;minisub_main.c,680 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,682 :: 		}
L_ShowHelp68:
;minisub_main.c,685 :: 		}
L_end_ShowHelp:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ShowHelp
_ShowNextLevel:
;minisub_main.c,688 :: 		void ShowNextLevel(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,689 :: 		int loop = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,692 :: 		if (prev_level != level){
LH	R3, Offset(_level+0)(GP)
LH	R2, Offset(_prev_level+0)(GP)
BNE	R2, R3, L__ShowNextLevel423
NOP	
J	L_ShowNextLevel80
NOP	
L__ShowNextLevel423:
;minisub_main.c,695 :: 		UART1_Write_Line("Next Level: ");
LUI	R25, #hi_addr(?lstr28_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr28_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,696 :: 		UART1_Write_Variable(level);
LH	R25, Offset(_level+0)(GP)
JAL	_UART1_Write_Variable+0
NOP	
;minisub_main.c,697 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,698 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,701 :: 		UART1_Write_Line("Score: ");
LUI	R25, #hi_addr(?lstr29_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr29_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,702 :: 		UART1_Write_Variable(score);
LH	R25, Offset(_score+0)(GP)
JAL	_UART1_Write_Variable+0
NOP	
;minisub_main.c,703 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,704 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,707 :: 		UART1_Write_Line("Mine Speed: ");
LUI	R25, #hi_addr(?lstr30_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr30_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,708 :: 		UART1_Write_Variable(mine_speed);
LH	R25, Offset(_mine_speed+0)(GP)
JAL	_UART1_Write_Variable+0
NOP	
;minisub_main.c,709 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,710 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,713 :: 		UART1_Write_Line("Bonus distance factor: ");
LUI	R25, #hi_addr(?lstr31_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr31_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,714 :: 		UART1_Write_Variable(bonus_factor);
LH	R25, Offset(_bonus_factor+0)(GP)
JAL	_UART1_Write_Variable+0
NOP	
;minisub_main.c,715 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,716 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,719 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,722 :: 		TFT_Image(35, (SCREEN_HEIGHT/2)-47, title_bmp, 1);
LUI	R2, #hi_addr(_title_bmp+0)
ORI	R2, R2, #lo_addr(_title_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 73
ORI	R25, R0, 35
JAL	_TFT_Image+0
NOP	
;minisub_main.c,725 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,728 :: 		IntToStr(level, level_text);
LUI	R26, #hi_addr(_level_text+0)
ORI	R26, R26, #lo_addr(_level_text+0)
LH	R25, Offset(_level+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,729 :: 		strcpy(level_display_text, "Level: ");
LUI	R26, #hi_addr(?lstr32_minisub_main+0)
ORI	R26, R26, #lo_addr(?lstr32_minisub_main+0)
LUI	R25, #hi_addr(_level_display_text+0)
ORI	R25, R25, #lo_addr(_level_display_text+0)
JAL	_strcpy+0
NOP	
;minisub_main.c,730 :: 		strcat(level_display_text, level_text);
LUI	R26, #hi_addr(_level_text+0)
ORI	R26, R26, #lo_addr(_level_text+0)
LUI	R25, #hi_addr(_level_display_text+0)
ORI	R25, R25, #lo_addr(_level_display_text+0)
JAL	_strcat+0
NOP	
;minisub_main.c,733 :: 		TFT_Write_Text(level_display_text, 140, 150);
ORI	R27, R0, 150
ORI	R26, R0, 140
LUI	R25, #hi_addr(_level_display_text+0)
ORI	R25, R25, #lo_addr(_level_display_text+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,736 :: 		TFT_Write_Text("You  Earned  an  Extra  Life!", 80, 180);
ORI	R27, R0, 180
ORI	R26, R0, 80
LUI	R25, #hi_addr(?lstr33_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr33_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,740 :: 		for(loop = 0; loop<=50;loop++){
; loop start address is: 12 (R3)
MOVZ	R3, R0, R0
; loop end address is: 12 (R3)
L_ShowNextLevel81:
; loop start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 51
BNE	R2, R0, L__ShowNextLevel424
NOP	
J	L_ShowNextLevel82
NOP	
L__ShowNextLevel424:
;minisub_main.c,741 :: 		Play_MP3_Chunk();
SH	R3, 20(SP)
JAL	_Play_MP3_Chunk+0
NOP	
LH	R3, 20(SP)
;minisub_main.c,742 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowNextLevel84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowNextLevel84
NOP	
NOP	
NOP	
;minisub_main.c,740 :: 		for(loop = 0; loop<=50;loop++){
ADDIU	R2, R3, 1
SEH	R3, R2
;minisub_main.c,743 :: 		}
; loop end address is: 12 (R3)
J	L_ShowNextLevel81
NOP	
L_ShowNextLevel82:
;minisub_main.c,747 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,750 :: 		InitSprites();
JAL	_InitSprites+0
NOP	
;minisub_main.c,751 :: 		}
L_ShowNextLevel80:
;minisub_main.c,754 :: 		}
L_end_ShowNextLevel:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ShowNextLevel
_ShowGameOver:
;minisub_main.c,763 :: 		void ShowGameOver(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,764 :: 		int loop = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,766 :: 		UART1_Write_Line("Game Over");
LUI	R25, #hi_addr(?lstr34_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr34_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,769 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,772 :: 		TFT_Image(0, (SCREEN_HEIGHT/2)-47, GameOver_bmp, 1);
LUI	R2, #hi_addr(_gameover_bmp+0)
ORI	R2, R2, #lo_addr(_gameover_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 73
MOVZ	R25, R0, R0
JAL	_TFT_Image+0
NOP	
;minisub_main.c,775 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,779 :: 		if(score > high_score){
LHU	R3, Offset(_high_score+0)(GP)
LH	R2, Offset(_score+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__ShowGameOver426
NOP	
J	L_ShowGameOver86
NOP	
L__ShowGameOver426:
;minisub_main.c,781 :: 		high_score = score;
LH	R2, Offset(_score+0)(GP)
SH	R2, Offset(_high_score+0)(GP)
;minisub_main.c,782 :: 		TFT_Write_Text("You  set  a  High  Score!", 95, 140);
ORI	R27, R0, 140
ORI	R26, R0, 95
LUI	R25, #hi_addr(?lstr35_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr35_minisub_main+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,783 :: 		}
J	L_ShowGameOver87
NOP	
L_ShowGameOver86:
;minisub_main.c,788 :: 		IntToStr(high_score, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LHU	R25, Offset(_high_score+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,789 :: 		strcpy(score_display_text, "High  Score: ");
LUI	R26, #hi_addr(?lstr36_minisub_main+0)
ORI	R26, R26, #lo_addr(?lstr36_minisub_main+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcpy+0
NOP	
;minisub_main.c,790 :: 		strcat(score_display_text, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcat+0
NOP	
;minisub_main.c,793 :: 		TFT_Write_Text(score_display_text, 110, 140);
ORI	R27, R0, 140
ORI	R26, R0, 110
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,794 :: 		}
L_ShowGameOver87:
;minisub_main.c,797 :: 		IntToStr(score, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LH	R25, Offset(_score+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,798 :: 		strcpy(score_display_text, "Your  Score: ");
LUI	R26, #hi_addr(?lstr37_minisub_main+0)
ORI	R26, R26, #lo_addr(?lstr37_minisub_main+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcpy+0
NOP	
;minisub_main.c,799 :: 		strcat(score_display_text, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcat+0
NOP	
;minisub_main.c,802 :: 		TFT_Write_Text(score_display_text, 110, 170);
ORI	R27, R0, 170
ORI	R26, R0, 110
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,805 :: 		for(loop = 0; loop<=60;loop++){
; loop start address is: 12 (R3)
MOVZ	R3, R0, R0
; loop end address is: 12 (R3)
L_ShowGameOver88:
; loop start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 61
BNE	R2, R0, L__ShowGameOver427
NOP	
J	L_ShowGameOver89
NOP	
L__ShowGameOver427:
;minisub_main.c,806 :: 		Play_MP3_Chunk();
SH	R3, 20(SP)
JAL	_Play_MP3_Chunk+0
NOP	
LH	R3, 20(SP)
;minisub_main.c,807 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_ShowGameOver91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ShowGameOver91
NOP	
NOP	
NOP	
;minisub_main.c,805 :: 		for(loop = 0; loop<=60;loop++){
ADDIU	R2, R3, 1
SEH	R3, R2
;minisub_main.c,808 :: 		}
; loop end address is: 12 (R3)
J	L_ShowGameOver88
NOP	
L_ShowGameOver89:
;minisub_main.c,812 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,813 :: 		}
L_end_ShowGameOver:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ShowGameOver
_GetInput:
;minisub_main.c,818 :: 		void GetInput()  {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,819 :: 		int mine_inc = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,820 :: 		int edge_border = 3;
; edge_border start address is: 16 (R4)
ORI	R4, R0, 3
;minisub_main.c,826 :: 		torpedoButton = squareButton;
LBU	R2, Offset(PORTD+1)(GP)
EXT	R2, R2, 3, 1
SH	R2, Offset(_torpedoButton+0)(GP)
;minisub_main.c,881 :: 		if(TP_TFT_Press_Detect()){
SH	R4, 20(SP)
JAL	_TP_TFT_Press_Detect+0
NOP	
LH	R4, 20(SP)
BNE	R2, R0, L__GetInput430
NOP	
J	L_GetInput93
NOP	
L__GetInput430:
;minisub_main.c,883 :: 		if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
SH	R4, 20(SP)
LUI	R26, #hi_addr(_Y_Coord+0)
ORI	R26, R26, #lo_addr(_Y_Coord+0)
LUI	R25, #hi_addr(_X_Coord+0)
ORI	R25, R25, #lo_addr(_X_Coord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
LH	R4, 20(SP)
ANDI	R2, R2, 255
BEQ	R2, R0, L__GetInput431
NOP	
J	L_GetInput94
NOP	
L__GetInput431:
;minisub_main.c,886 :: 		if(Pen_Down == 0){
LBU	R2, Offset(_Pen_Down+0)(GP)
BEQ	R2, R0, L__GetInput432
NOP	
J	L_GetInput95
NOP	
L__GetInput432:
;minisub_main.c,887 :: 		Starting_Pen_Down_X_Coord = X_Coord;
LHU	R2, Offset(_X_Coord+0)(GP)
SH	R2, Offset(_Starting_Pen_Down_X_Coord+0)(GP)
;minisub_main.c,888 :: 		Starting_Pen_Down_Y_Coord = Y_Coord;
LHU	R2, Offset(_Y_Coord+0)(GP)
SH	R2, Offset(_Starting_Pen_Down_Y_Coord+0)(GP)
;minisub_main.c,891 :: 		}
L_GetInput95:
;minisub_main.c,893 :: 		X_Drag_Distance =  Starting_Pen_Down_X_Coord - X_Coord;
LHU	R3, Offset(_X_Coord+0)(GP)
LH	R2, Offset(_Starting_Pen_Down_X_Coord+0)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(_X_Drag_Distance+0)(GP)
;minisub_main.c,896 :: 		Pen_Down = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Pen_Down+0)(GP)
;minisub_main.c,898 :: 		}  //end of tap x / y location checking
L_GetInput94:
;minisub_main.c,900 :: 		}
J	L_GetInput96
NOP	
L_GetInput93:
;minisub_main.c,903 :: 		Pen_Down = 0;
SB	R0, Offset(_Pen_Down+0)(GP)
;minisub_main.c,904 :: 		}
L_GetInput96:
;minisub_main.c,907 :: 		if( (Pen_Down == 1 )) {
LBU	R3, Offset(_Pen_Down+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__GetInput433
NOP	
J	L__GetInput283
NOP	
L__GetInput433:
;minisub_main.c,910 :: 		toggled_main_menu=1;
ORI	R2, R0, 1
SH	R2, Offset(_toggled_main_menu+0)(GP)
;minisub_main.c,912 :: 		if(show_main_menu){
LH	R2, Offset(_show_main_menu+0)(GP)
BNE	R2, R0, L__GetInput435
NOP	
J	L_GetInput98
NOP	
L__GetInput435:
;minisub_main.c,913 :: 		show_main_menu=0;
SH	R0, Offset(_show_main_menu+0)(GP)
;minisub_main.c,914 :: 		}
J	L_GetInput99
NOP	
L_GetInput98:
;minisub_main.c,916 :: 		show_main_menu=1;
ORI	R2, R0, 1
SH	R2, Offset(_show_main_menu+0)(GP)
;minisub_main.c,917 :: 		}
L_GetInput99:
;minisub_main.c,920 :: 		while(!TP_TFT_Press_Detect()){
SEH	R3, R4
L_GetInput100:
; edge_border end address is: 16 (R4)
; edge_border start address is: 12 (R3)
SH	R3, 20(SP)
JAL	_TP_TFT_Press_Detect+0
NOP	
LH	R3, 20(SP)
BEQ	R2, R0, L__GetInput436
NOP	
J	L_GetInput101
NOP	
L__GetInput436:
;minisub_main.c,921 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_GetInput102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetInput102
NOP	
NOP	
NOP	
;minisub_main.c,922 :: 		}
J	L_GetInput100
NOP	
L_GetInput101:
;minisub_main.c,924 :: 		}
J	L_GetInput97
NOP	
; edge_border end address is: 12 (R3)
L__GetInput283:
;minisub_main.c,907 :: 		if( (Pen_Down == 1 )) {
SEH	R3, R4
;minisub_main.c,924 :: 		}
L_GetInput97:
;minisub_main.c,929 :: 		if(muteButton){
; edge_border start address is: 12 (R3)
LH	R2, Offset(_muteButton+0)(GP)
BNE	R2, R0, L__GetInput438
NOP	
J	L_GetInput104
NOP	
L__GetInput438:
;minisub_main.c,931 :: 		ToggleMute();
SH	R3, 20(SP)
JAL	_ToggleMute+0
NOP	
LH	R3, 20(SP)
;minisub_main.c,934 :: 		Delay_ms(250);
LUI	R24, 101
ORI	R24, R24, 47530
L_GetInput105:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetInput105
NOP	
;minisub_main.c,935 :: 		}
L_GetInput104:
;minisub_main.c,938 :: 		if(startButton){
LBU	R2, Offset(PORTF+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__GetInput440
NOP	
J	L_GetInput107
NOP	
L__GetInput440:
;minisub_main.c,943 :: 		}
L_GetInput107:
;minisub_main.c,945 :: 		if(upButton) {
LBU	R2, Offset(PORTA+0)(GP)
EXT	R2, R2, 6, 1
BNE	R2, R0, L__GetInput442
NOP	
J	L_GetInput108
NOP	
L__GetInput442:
;minisub_main.c,946 :: 		sub.y -= SUB_Y_SPEED;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, -8
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,951 :: 		}
J	L_GetInput109
NOP	
L_GetInput108:
;minisub_main.c,952 :: 		else if(downButton){
LBU	R2, Offset(PORTA+0)(GP)
EXT	R2, R2, 7, 1
BNE	R2, R0, L__GetInput444
NOP	
J	L_GetInput110
NOP	
L__GetInput444:
;minisub_main.c,953 :: 		sub.y += SUB_Y_SPEED;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, 8
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,958 :: 		}
J	L_GetInput111
NOP	
L_GetInput110:
;minisub_main.c,959 :: 		else if(leftButton) {
LBU	R2, Offset(PORTA+0)(GP)
EXT	R2, R2, 5, 1
BNE	R2, R0, L__GetInput446
NOP	
J	L_GetInput112
NOP	
L__GetInput446:
;minisub_main.c,960 :: 		sub.x -= SUB_SPEED;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, -12
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,965 :: 		}
J	L_GetInput113
NOP	
L_GetInput112:
;minisub_main.c,966 :: 		else if(rightButton){
LBU	R2, Offset(PORTD+1)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__GetInput448
NOP	
J	L_GetInput114
NOP	
L__GetInput448:
;minisub_main.c,967 :: 		sub.x += SUB_SPEED;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 12
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,972 :: 		}
J	L_GetInput115
NOP	
L_GetInput114:
;minisub_main.c,976 :: 		if( (frame_counter % 2) == 0){
LW	R2, Offset(_frame_counter+0)(GP)
ANDI	R2, R2, 1
BEQ	R2, R0, L__GetInput449
NOP	
J	L_GetInput116
NOP	
L__GetInput449:
;minisub_main.c,978 :: 		if(sub.x > DEFAULT_SUB_X_POS){
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 29
BEQ	R2, R0, L__GetInput450
NOP	
J	L_GetInput117
NOP	
L__GetInput450:
;minisub_main.c,979 :: 		sub.x -= 1;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,980 :: 		}
L_GetInput117:
;minisub_main.c,981 :: 		}
L_GetInput116:
;minisub_main.c,984 :: 		if( (frame_counter % 4) == 0){
LW	R2, Offset(_frame_counter+0)(GP)
ANDI	R2, R2, 3
BEQ	R2, R0, L__GetInput451
NOP	
J	L_GetInput118
NOP	
L__GetInput451:
;minisub_main.c,986 :: 		if(sub.x < DEFAULT_SUB_X_POS){
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 28
BNE	R2, R0, L__GetInput452
NOP	
J	L_GetInput119
NOP	
L__GetInput452:
;minisub_main.c,987 :: 		sub.x += 1;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,988 :: 		}
L_GetInput119:
;minisub_main.c,989 :: 		}
L_GetInput118:
;minisub_main.c,991 :: 		}
L_GetInput115:
L_GetInput113:
L_GetInput111:
L_GetInput109:
;minisub_main.c,995 :: 		if( sub.y <= STATUS_TEXT_CELL_HEIGHT ){
LH	R2, Offset(_sub+2)(GP)
SLTI	R2, R2, 26
BNE	R2, R0, L__GetInput453
NOP	
J	L_GetInput120
NOP	
L__GetInput453:
;minisub_main.c,996 :: 		sub.y = STATUS_TEXT_CELL_HEIGHT;
ORI	R2, R0, 25
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,997 :: 		}
L_GetInput120:
;minisub_main.c,1000 :: 		if( sub.x <= 0 ){
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__GetInput454
NOP	
J	L_GetInput121
NOP	
L__GetInput454:
;minisub_main.c,1001 :: 		sub.x = 0;
SH	R0, Offset(_sub+0)(GP)
;minisub_main.c,1002 :: 		}
L_GetInput121:
;minisub_main.c,1005 :: 		if( sub.y >= (SCREEN_HEIGHT-PLAYER_HEIGHT)){
LH	R2, Offset(_sub+2)(GP)
SLTI	R2, R2, 193
BEQ	R2, R0, L__GetInput455
NOP	
J	L_GetInput122
NOP	
L__GetInput455:
;minisub_main.c,1006 :: 		sub.y = SCREEN_HEIGHT-PLAYER_HEIGHT;
ORI	R2, R0, 193
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,1007 :: 		}
L_GetInput122:
;minisub_main.c,1010 :: 		if( sub.x >= (SCREEN_WIDTH-PLAYER_WIDTH)){
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 257
BEQ	R2, R0, L__GetInput456
NOP	
J	L_GetInput123
NOP	
L__GetInput456:
;minisub_main.c,1011 :: 		sub.x = SCREEN_WIDTH-PLAYER_WIDTH;
ORI	R2, R0, 257
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,1012 :: 		}
L_GetInput123:
;minisub_main.c,1015 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
; mine_inc start address is: 28 (R7)
MOVZ	R7, R0, R0
; edge_border end address is: 12 (R3)
; mine_inc end address is: 28 (R7)
SEH	R8, R3
L_GetInput124:
; mine_inc start address is: 28 (R7)
; edge_border start address is: 32 (R8)
SEH	R2, R7
SLTI	R2, R2, 4
BNE	R2, R0, L__GetInput457
NOP	
J	L_GetInput125
NOP	
L__GetInput457:
;minisub_main.c,1018 :: 		if( mine[mine_inc].x <= edge_border){
SEH	R3, R7
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R3, R2
SEH	R2, R8
SLT	R2, R2, R3
BEQ	R2, R0, L__GetInput458
NOP	
J	L_GetInput127
NOP	
L__GetInput458:
;minisub_main.c,1021 :: 		ResetSeaMine(mine_inc);
SEH	R25, R7
JAL	_ResetSeaMine+0
NOP	
;minisub_main.c,1024 :: 		TFT_Rectangle( mine[mine_inc].prev_x-1, mine[mine_inc].prev_y-1, mine[mine_inc].prev_x + mine[mine_inc].width + 1, mine[mine_inc].prev_y + mine[mine_inc].height + 1);
SEH	R3, R7
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 10
LH	R3, 0(R2)
ADDIU	R2, R4, 2
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, 1
ADDIU	R2, R4, 8
LH	R5, 0(R2)
LHU	R2, 0(R4)
ADDU	R2, R5, R2
ADDIU	R4, R2, 1
ADDIU	R3, R3, -1
ADDIU	R2, R5, -1
SH	R8, 20(SP)
SH	R7, 22(SP)
ANDI	R28, R6, 65535
ANDI	R27, R4, 65535
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Rectangle+0
NOP	
LH	R7, 22(SP)
LH	R8, 20(SP)
;minisub_main.c,1027 :: 		score += 25;
LH	R2, Offset(_score+0)(GP)
ADDIU	R2, R2, 25
SH	R2, Offset(_score+0)(GP)
;minisub_main.c,1028 :: 		}
J	L_GetInput128
NOP	
L_GetInput127:
;minisub_main.c,1031 :: 		mine[mine_inc].x -= mine_speed;
SEH	R3, R7
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R4, R2, 4
LH	R3, 0(R4)
LH	R2, Offset(_mine_speed+0)(GP)
SUBU	R2, R3, R2
SH	R2, 0(R4)
;minisub_main.c,1032 :: 		}
L_GetInput128:
;minisub_main.c,1015 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
ADDIU	R2, R7, 1
; mine_inc end address is: 28 (R7)
; mine_inc start address is: 8 (R2)
;minisub_main.c,1034 :: 		}
; mine_inc end address is: 8 (R2)
SEH	R7, R2
J	L_GetInput124
NOP	
L_GetInput125:
;minisub_main.c,1037 :: 		if(bonus_block.x<=edge_border){
SEH	R3, R8
; edge_border end address is: 32 (R8)
LH	R2, Offset(_bonus_block+4)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__GetInput459
NOP	
J	L_GetInput129
NOP	
L__GetInput459:
;minisub_main.c,1040 :: 		TFT_Rectangle( bonus_block.prev_x-1, bonus_block.prev_y-1, bonus_block.prev_x + bonus_block.width + 1, bonus_block.prev_y + bonus_block.height + 1);
LHU	R3, Offset(_bonus_block+2)(GP)
LH	R2, Offset(_bonus_block+10)(GP)
ADDU	R2, R2, R3
ADDIU	R5, R2, 1
LHU	R3, Offset(_bonus_block+0)(GP)
LH	R2, Offset(_bonus_block+8)(GP)
ADDU	R2, R2, R3
ADDIU	R4, R2, 1
LH	R2, Offset(_bonus_block+10)(GP)
ADDIU	R3, R2, -1
LH	R2, Offset(_bonus_block+8)(GP)
ADDIU	R2, R2, -1
ANDI	R28, R5, 65535
ANDI	R27, R4, 65535
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1043 :: 		ResetBonusBlock();
JAL	_ResetBonusBlock+0
NOP	
;minisub_main.c,1044 :: 		}
L_GetInput129:
;minisub_main.c,1048 :: 		bonus_block.x -= mine_speed;
LH	R3, Offset(_mine_speed+0)(GP)
LH	R2, Offset(_bonus_block+4)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(_bonus_block+4)(GP)
;minisub_main.c,1052 :: 		if(torpedoButton){
LH	R2, Offset(_torpedoButton+0)(GP)
BNE	R2, R0, L__GetInput461
NOP	
J	L_GetInput130
NOP	
L__GetInput461:
;minisub_main.c,1059 :: 		if(torpedo_count>=1) {
LH	R2, Offset(_torpedo_count+0)(GP)
SLTI	R2, R2, 1
BEQ	R2, R0, L__GetInput462
NOP	
J	L_GetInput131
NOP	
L__GetInput462:
;minisub_main.c,1061 :: 		if( fire_torpedo_flag == 0 ) {
LH	R2, Offset(_fire_torpedo_flag+0)(GP)
BEQ	R2, R0, L__GetInput463
NOP	
J	L_GetInput132
NOP	
L__GetInput463:
;minisub_main.c,1063 :: 		torpedo.x = sub.x + PLAYER_WIDTH + 1;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 63
ADDIU	R2, R2, 1
SH	R2, Offset(_torpedo+4)(GP)
;minisub_main.c,1066 :: 		torpedo.y = sub.y + (PLAYER_HEIGHT/2);
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, 23
SH	R2, Offset(_torpedo+6)(GP)
;minisub_main.c,1069 :: 		torpedo.visible = 1;
ORI	R2, R0, 1
SH	R2, Offset(_torpedo+12)(GP)
;minisub_main.c,1072 :: 		fire_torpedo_flag = 1;
ORI	R2, R0, 1
SH	R2, Offset(_fire_torpedo_flag+0)(GP)
;minisub_main.c,1075 :: 		torpedo_count--;
LH	R2, Offset(_torpedo_count+0)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_torpedo_count+0)(GP)
;minisub_main.c,1077 :: 		}
L_GetInput132:
;minisub_main.c,1078 :: 		}
L_GetInput131:
;minisub_main.c,1080 :: 		}
L_GetInput130:
;minisub_main.c,1084 :: 		if( fire_torpedo_flag == 1 ){
LH	R3, Offset(_fire_torpedo_flag+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__GetInput464
NOP	
J	L_GetInput133
NOP	
L__GetInput464:
;minisub_main.c,1085 :: 		torpedo.x += TORPEDO_SPEED;
LH	R2, Offset(_torpedo+4)(GP)
ADDIU	R2, R2, 12
SH	R2, Offset(_torpedo+4)(GP)
;minisub_main.c,1088 :: 		if( torpedo.x > (SCREEN_WIDTH+TORPEDO_SPEED+1) ){
SEH	R2, R2
SLTI	R2, R2, 334
BEQ	R2, R0, L__GetInput465
NOP	
J	L_GetInput134
NOP	
L__GetInput465:
;minisub_main.c,1090 :: 		torpedo.visible = 0;
SH	R0, Offset(_torpedo+12)(GP)
;minisub_main.c,1092 :: 		fire_torpedo_flag = 0;
SH	R0, Offset(_fire_torpedo_flag+0)(GP)
;minisub_main.c,1093 :: 		}
L_GetInput134:
;minisub_main.c,1095 :: 		}
L_GetInput133:
;minisub_main.c,1099 :: 		} //end of MoveSub
L_end_GetInput:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _GetInput
_RandomHeightY:
;minisub_main.c,1102 :: 		int RandomHeightY(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_main.c,1103 :: 		return (rand() % 6) * ((SCREEN_HEIGHT-STATUS_TEXT_CELL_HEIGHT)/6) + STATUS_TEXT_CELL_HEIGHT;
JAL	_rand+0
NOP	
ORI	R3, R0, 6
DIV	R2, R3
MFHI	R3
ORI	R2, R0, 35
MUL	R2, R3, R2
ADDIU	R2, R2, 25
;minisub_main.c,1104 :: 		}
L_end_RandomHeightY:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RandomHeightY
_RandomSeaMineType:
;minisub_main.c,1106 :: 		int RandomSeaMineType(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_main.c,1107 :: 		int mine_type = 0;
;minisub_main.c,1112 :: 		mine_type = rand() % grey_mine_rate;
JAL	_rand+0
NOP	
LH	R3, Offset(_grey_mine_rate+0)(GP)
DIV	R2, R3
MFHI	R2
;minisub_main.c,1115 :: 		if(mine_type == 0){
SEH	R2, R2
BEQ	R2, R0, L__RandomSeaMineType468
NOP	
J	L_RandomSeaMineType135
NOP	
L__RandomSeaMineType468:
;minisub_main.c,1116 :: 		return 1;
ORI	R2, R0, 1
J	L_end_RandomSeaMineType
NOP	
;minisub_main.c,1117 :: 		}
L_RandomSeaMineType135:
;minisub_main.c,1120 :: 		return 0;
MOVZ	R2, R0, R0
;minisub_main.c,1124 :: 		}
L_end_RandomSeaMineType:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RandomSeaMineType
_ResetBonusBlock:
;minisub_main.c,1126 :: 		void ResetBonusBlock(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_main.c,1130 :: 		bonus_block.x = SCREEN_WIDTH*(BONUS_SCREEN_SPACING*bonus_factor);
LH	R2, Offset(_bonus_factor+0)(GP)
SLL	R3, R2, 1
ORI	R2, R0, 320
MUL	R2, R2, R3
SH	R2, Offset(_bonus_block+4)(GP)
;minisub_main.c,1133 :: 		bonus_block.y = RandomHeightY();
JAL	_RandomHeightY+0
NOP	
SH	R2, Offset(_bonus_block+6)(GP)
;minisub_main.c,1136 :: 		bonus_counter += 1;
LH	R2, Offset(_bonus_counter+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_bonus_counter+0)(GP)
;minisub_main.c,1141 :: 		if( (rand() % 3) == 0){
JAL	_rand+0
NOP	
ORI	R3, R0, 3
DIV	R2, R3
MFHI	R2
SEH	R2, R2
BEQ	R2, R0, L__ResetBonusBlock470
NOP	
J	L_ResetBonusBlock137
NOP	
L__ResetBonusBlock470:
;minisub_main.c,1143 :: 		bonus_type = 2;
ORI	R2, R0, 2
SH	R2, Offset(_bonus_type+0)(GP)
;minisub_main.c,1144 :: 		}
J	L_ResetBonusBlock138
NOP	
L_ResetBonusBlock137:
;minisub_main.c,1147 :: 		bonus_type = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_type+0)(GP)
;minisub_main.c,1148 :: 		}
L_ResetBonusBlock138:
;minisub_main.c,1149 :: 		}
L_end_ResetBonusBlock:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ResetBonusBlock
_ResetSeaMine:
;minisub_main.c,1151 :: 		void ResetSeaMine(int mineNumber){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,1154 :: 		mine[mineNumber].x += SCREEN_WIDTH;
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
LH	R2, 0(R3)
ADDIU	R2, R2, 320
SH	R2, 0(R3)
;minisub_main.c,1155 :: 		mine[mineNumber].y = RandomHeightY();
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SW	R2, 4(SP)
JAL	_RandomHeightY+0
NOP	
LW	R3, 4(SP)
SH	R2, 0(R3)
;minisub_main.c,1158 :: 		mine[mineNumber].type = RandomSeaMineType();
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
SW	R2, 4(SP)
JAL	_RandomSeaMineType+0
NOP	
LW	R3, 4(SP)
SH	R2, 0(R3)
;minisub_main.c,1161 :: 		mine[mineNumber].hits = 0;
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
SH	R0, 0(R2)
;minisub_main.c,1162 :: 		}
L_end_ResetSeaMine:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _ResetSeaMine
_RenderScreen:
;minisub_main.c,1166 :: 		void RenderScreen(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,1167 :: 		int mine_inc = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,1170 :: 		int redraw_border = 3;
;minisub_main.c,1173 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
SH	R0, 20(SP)
L_RenderScreen139:
LH	R2, 20(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__RenderScreen473
NOP	
J	L_RenderScreen140
NOP	
L__RenderScreen473:
;minisub_main.c,1175 :: 		clear_mine[mine_inc].top =  mine[mine_inc].prev_y;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
MOVZ	R4, R2, R0
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 10
LH	R2, 0(R2)
SH	R2, 0(R4)
;minisub_main.c,1176 :: 		if(clear_mine[mine_inc].top < 0)
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen474
NOP	
J	L_RenderScreen142
NOP	
L__RenderScreen474:
;minisub_main.c,1177 :: 		clear_mine[mine_inc].top = 0;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
L_RenderScreen142:
;minisub_main.c,1179 :: 		clear_mine[mine_inc].left =  mine[mine_inc].x + mine[mine_inc].width;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 2
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 4
LH	R3, 0(R2)
LHU	R2, 0(R4)
ADDU	R2, R3, R2
SH	R2, 0(R5)
;minisub_main.c,1180 :: 		if(clear_mine[mine_inc].left < 0)
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen475
NOP	
J	L_RenderScreen143
NOP	
L__RenderScreen475:
;minisub_main.c,1181 :: 		clear_mine[mine_inc].left = 0;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 2
SH	R0, 0(R2)
L_RenderScreen143:
;minisub_main.c,1183 :: 		clear_mine[mine_inc].right = mine[mine_inc].prev_x + mine[mine_inc].width;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 6
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 8
LH	R3, 0(R2)
LHU	R2, 0(R4)
ADDU	R2, R3, R2
SH	R2, 0(R5)
;minisub_main.c,1184 :: 		if(clear_mine[mine_inc].right < 0)
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen476
NOP	
J	L_RenderScreen144
NOP	
L__RenderScreen476:
;minisub_main.c,1185 :: 		clear_mine[mine_inc].right = 0;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SH	R0, 0(R2)
L_RenderScreen144:
;minisub_main.c,1187 :: 		clear_mine[mine_inc].bottom = mine[mine_inc].prev_y + mine[mine_inc].height;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R5, R2, 4
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 10
LH	R3, 0(R2)
ADDIU	R2, R4, 2
LHU	R2, 0(R2)
ADDU	R2, R3, R2
SH	R2, 0(R5)
;minisub_main.c,1188 :: 		if(clear_mine[mine_inc].bottom < 0)
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen477
NOP	
J	L_RenderScreen145
NOP	
L__RenderScreen477:
;minisub_main.c,1189 :: 		clear_mine[mine_inc].bottom = 0;
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 4
SH	R0, 0(R2)
L_RenderScreen145:
;minisub_main.c,1173 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,1191 :: 		}
J	L_RenderScreen139
NOP	
L_RenderScreen140:
;minisub_main.c,1194 :: 		if(sub.x > sub.prev_x){
LH	R3, Offset(_sub+4)(GP)
LH	R2, Offset(_sub+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__RenderScreen478
NOP	
J	L_RenderScreen146
NOP	
L__RenderScreen478:
;minisub_main.c,1195 :: 		clear_sub.left = sub.prev_x;
LH	R2, Offset(_sub+4)(GP)
SH	R2, Offset(_clear_sub+2)(GP)
;minisub_main.c,1196 :: 		clear_sub.right =  sub.x;
LH	R2, Offset(_sub+0)(GP)
SH	R2, Offset(_clear_sub+6)(GP)
;minisub_main.c,1197 :: 		clear_sub.top = sub.y;
LH	R2, Offset(_sub+2)(GP)
SH	R2, Offset(_clear_sub+0)(GP)
;minisub_main.c,1198 :: 		clear_sub.bottom = sub.y + PLAYER_HEIGHT;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, 47
SH	R2, Offset(_clear_sub+4)(GP)
;minisub_main.c,1199 :: 		}
L_RenderScreen146:
;minisub_main.c,1202 :: 		if(sub.x < sub.prev_x){
LH	R3, Offset(_sub+4)(GP)
LH	R2, Offset(_sub+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__RenderScreen479
NOP	
J	L_RenderScreen147
NOP	
L__RenderScreen479:
;minisub_main.c,1203 :: 		clear_sub.left = sub.x+PLAYER_WIDTH;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 63
SH	R2, Offset(_clear_sub+2)(GP)
;minisub_main.c,1204 :: 		clear_sub.right = sub.prev_x+PLAYER_WIDTH;
LH	R2, Offset(_sub+4)(GP)
ADDIU	R2, R2, 63
SH	R2, Offset(_clear_sub+6)(GP)
;minisub_main.c,1205 :: 		clear_sub.top = sub.y;
LH	R2, Offset(_sub+2)(GP)
SH	R2, Offset(_clear_sub+0)(GP)
;minisub_main.c,1206 :: 		clear_sub.bottom = sub.y + PLAYER_HEIGHT;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, 47
SH	R2, Offset(_clear_sub+4)(GP)
;minisub_main.c,1207 :: 		}
L_RenderScreen147:
;minisub_main.c,1211 :: 		if(sub.y > sub.prev_y){
LH	R3, Offset(_sub+6)(GP)
LH	R2, Offset(_sub+2)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__RenderScreen480
NOP	
J	L_RenderScreen148
NOP	
L__RenderScreen480:
;minisub_main.c,1212 :: 		clear_sub.left =  sub.x;
LH	R2, Offset(_sub+0)(GP)
SH	R2, Offset(_clear_sub+2)(GP)
;minisub_main.c,1213 :: 		clear_sub.right =  sub.x+PLAYER_WIDTH;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 63
SH	R2, Offset(_clear_sub+6)(GP)
;minisub_main.c,1214 :: 		clear_sub.top = sub.prev_y;
LH	R2, Offset(_sub+6)(GP)
SH	R2, Offset(_clear_sub+0)(GP)
;minisub_main.c,1215 :: 		clear_sub.bottom =  sub.y;
LH	R2, Offset(_sub+2)(GP)
SH	R2, Offset(_clear_sub+4)(GP)
;minisub_main.c,1216 :: 		}
L_RenderScreen148:
;minisub_main.c,1219 :: 		if(sub.y < sub.prev_y){
LH	R3, Offset(_sub+6)(GP)
LH	R2, Offset(_sub+2)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__RenderScreen481
NOP	
J	L_RenderScreen149
NOP	
L__RenderScreen481:
;minisub_main.c,1220 :: 		clear_sub.left =  sub.x;
LH	R2, Offset(_sub+0)(GP)
SH	R2, Offset(_clear_sub+2)(GP)
;minisub_main.c,1221 :: 		clear_sub.right =  sub.x+PLAYER_WIDTH;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R2, R2, 63
SH	R2, Offset(_clear_sub+6)(GP)
;minisub_main.c,1222 :: 		clear_sub.top = sub.y + PLAYER_HEIGHT;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R2, R2, 47
SH	R2, Offset(_clear_sub+0)(GP)
;minisub_main.c,1223 :: 		clear_sub.bottom = sub.prev_y + PLAYER_HEIGHT;
LH	R2, Offset(_sub+6)(GP)
ADDIU	R2, R2, 47
SH	R2, Offset(_clear_sub+4)(GP)
;minisub_main.c,1224 :: 		}
L_RenderScreen149:
;minisub_main.c,1228 :: 		if (clear_sub.left <=0)
LH	R2, Offset(_clear_sub+2)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__RenderScreen482
NOP	
J	L_RenderScreen150
NOP	
L__RenderScreen482:
;minisub_main.c,1229 :: 		clear_sub.left = 0;
SH	R0, Offset(_clear_sub+2)(GP)
L_RenderScreen150:
;minisub_main.c,1232 :: 		if (clear_sub.top <= STATUS_TEXT_CELL_HEIGHT)
LH	R2, Offset(_clear_sub+0)(GP)
SLTI	R2, R2, 26
BNE	R2, R0, L__RenderScreen483
NOP	
J	L_RenderScreen151
NOP	
L__RenderScreen483:
;minisub_main.c,1233 :: 		clear_sub.top = STATUS_TEXT_CELL_HEIGHT;
ORI	R2, R0, 25
SH	R2, Offset(_clear_sub+0)(GP)
L_RenderScreen151:
;minisub_main.c,1236 :: 		clear_torpedo.left = torpedo.prev_x-1;
LH	R2, Offset(_torpedo+8)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_clear_torpedo+2)(GP)
;minisub_main.c,1237 :: 		clear_torpedo.top =  torpedo.prev_y-1;
LH	R2, Offset(_torpedo+10)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_clear_torpedo+0)(GP)
;minisub_main.c,1238 :: 		clear_torpedo.right =  torpedo.x;
LH	R2, Offset(_torpedo+4)(GP)
SH	R2, Offset(_clear_torpedo+6)(GP)
;minisub_main.c,1239 :: 		clear_torpedo.bottom =  torpedo.y+torpedo.height+1;
LHU	R3, Offset(_torpedo+2)(GP)
LH	R2, Offset(_torpedo+6)(GP)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
SH	R2, Offset(_clear_torpedo+4)(GP)
;minisub_main.c,1243 :: 		if (clear_torpedo.left <=0)
LH	R2, Offset(_clear_torpedo+2)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__RenderScreen484
NOP	
J	L_RenderScreen152
NOP	
L__RenderScreen484:
;minisub_main.c,1244 :: 		clear_torpedo.left = 0;
SH	R0, Offset(_clear_torpedo+2)(GP)
L_RenderScreen152:
;minisub_main.c,1246 :: 		if (clear_torpedo.top <=0)
LH	R2, Offset(_clear_torpedo+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__RenderScreen485
NOP	
J	L_RenderScreen153
NOP	
L__RenderScreen485:
;minisub_main.c,1247 :: 		clear_torpedo.top = 0;
SH	R0, Offset(_clear_torpedo+0)(GP)
L_RenderScreen153:
;minisub_main.c,1251 :: 		clear_bonus_block.top =  bonus_block.prev_y;
LH	R2, Offset(_bonus_block+10)(GP)
SH	R2, Offset(_clear_bonus_block+0)(GP)
;minisub_main.c,1252 :: 		if(clear_bonus_block.top < 0)
LH	R2, Offset(_bonus_block+10)(GP)
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen486
NOP	
J	L_RenderScreen154
NOP	
L__RenderScreen486:
;minisub_main.c,1253 :: 		clear_bonus_block.top = 0;
SH	R0, Offset(_clear_bonus_block+0)(GP)
L_RenderScreen154:
;minisub_main.c,1255 :: 		clear_bonus_block.left =  bonus_block.x + bonus_block.width;
LHU	R3, Offset(_bonus_block+0)(GP)
LH	R2, Offset(_bonus_block+4)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_clear_bonus_block+2)(GP)
;minisub_main.c,1256 :: 		if(clear_bonus_block.left < 0)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen487
NOP	
J	L_RenderScreen155
NOP	
L__RenderScreen487:
;minisub_main.c,1257 :: 		clear_bonus_block.left = 0;
SH	R0, Offset(_clear_bonus_block+2)(GP)
L_RenderScreen155:
;minisub_main.c,1259 :: 		clear_bonus_block.right = bonus_block.prev_x + bonus_block.width;
LHU	R3, Offset(_bonus_block+0)(GP)
LH	R2, Offset(_bonus_block+8)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_clear_bonus_block+6)(GP)
;minisub_main.c,1260 :: 		if(clear_bonus_block.right < 0)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen488
NOP	
J	L_RenderScreen156
NOP	
L__RenderScreen488:
;minisub_main.c,1261 :: 		clear_bonus_block.right = 0;
SH	R0, Offset(_clear_bonus_block+6)(GP)
L_RenderScreen156:
;minisub_main.c,1263 :: 		clear_bonus_block.bottom = bonus_block.prev_y + bonus_block.height;
LHU	R3, Offset(_bonus_block+2)(GP)
LH	R2, Offset(_bonus_block+10)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_clear_bonus_block+4)(GP)
;minisub_main.c,1264 :: 		if(clear_bonus_block.bottom < 0)
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__RenderScreen489
NOP	
J	L_RenderScreen157
NOP	
L__RenderScreen489:
;minisub_main.c,1265 :: 		clear_bonus_block.bottom = 0;
SH	R0, Offset(_clear_bonus_block+4)(GP)
L_RenderScreen157:
;minisub_main.c,1269 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,1272 :: 		if( (sub.prev_x != sub.x)|| (sub.prev_y != sub.y) || (sub.x < (0)) || (sub.y < (STATUS_TEXT_CELL_HEIGHT)) ){
LH	R3, Offset(_sub+0)(GP)
LH	R2, Offset(_sub+4)(GP)
BEQ	R2, R3, L__RenderScreen490
NOP	
J	L__RenderScreen328
NOP	
L__RenderScreen490:
LH	R3, Offset(_sub+2)(GP)
LH	R2, Offset(_sub+6)(GP)
BEQ	R2, R3, L__RenderScreen491
NOP	
J	L__RenderScreen327
NOP	
L__RenderScreen491:
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__RenderScreen492
NOP	
J	L__RenderScreen326
NOP	
L__RenderScreen492:
LH	R2, Offset(_sub+2)(GP)
SLTI	R2, R2, 25
BEQ	R2, R0, L__RenderScreen493
NOP	
J	L__RenderScreen325
NOP	
L__RenderScreen493:
J	L_RenderScreen160
NOP	
L__RenderScreen328:
L__RenderScreen327:
L__RenderScreen326:
L__RenderScreen325:
;minisub_main.c,1274 :: 		TFT_Rectangle(clear_sub.left, clear_sub.top, clear_sub.right, clear_sub.bottom);
LH	R28, Offset(_clear_sub+4)(GP)
LH	R27, Offset(_clear_sub+6)(GP)
LH	R26, Offset(_clear_sub+0)(GP)
LH	R25, Offset(_clear_sub+2)(GP)
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1275 :: 		}
L_RenderScreen160:
;minisub_main.c,1278 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
SH	R0, 20(SP)
L_RenderScreen161:
LH	R2, 20(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__RenderScreen494
NOP	
J	L_RenderScreen162
NOP	
L__RenderScreen494:
;minisub_main.c,1279 :: 		TFT_Rectangle( clear_mine[mine_inc].left, clear_mine[mine_inc].top, clear_mine[mine_inc].right, clear_mine[mine_inc].bottom);
LH	R2, 20(SP)
SLL	R3, R2, 3
LUI	R2, #hi_addr(_clear_mine+0)
ORI	R2, R2, #lo_addr(_clear_mine+0)
ADDU	R6, R2, R3
ADDIU	R2, R6, 4
LH	R5, 0(R2)
ADDIU	R2, R6, 6
LH	R4, 0(R2)
LH	R3, 0(R6)
ADDIU	R2, R6, 2
LH	R2, 0(R2)
SEH	R28, R5
SEH	R27, R4
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1278 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,1280 :: 		}
J	L_RenderScreen161
NOP	
L_RenderScreen162:
;minisub_main.c,1283 :: 		if(bonus_block.x <= SCREEN_WIDTH){
LH	R2, Offset(_bonus_block+4)(GP)
SLTI	R2, R2, 321
BNE	R2, R0, L__RenderScreen495
NOP	
J	L_RenderScreen164
NOP	
L__RenderScreen495:
;minisub_main.c,1285 :: 		TFT_Rectangle( clear_bonus_block.left, clear_bonus_block.top, clear_bonus_block.right, clear_bonus_block.bottom);
LH	R28, Offset(_clear_bonus_block+4)(GP)
LH	R27, Offset(_clear_bonus_block+6)(GP)
LH	R26, Offset(_clear_bonus_block+0)(GP)
LH	R25, Offset(_clear_bonus_block+2)(GP)
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1286 :: 		}
L_RenderScreen164:
;minisub_main.c,1290 :: 		if(fire_torpedo_flag){
LH	R2, Offset(_fire_torpedo_flag+0)(GP)
BNE	R2, R0, L__RenderScreen497
NOP	
J	L_RenderScreen165
NOP	
L__RenderScreen497:
;minisub_main.c,1294 :: 		TFT_Rectangle( clear_torpedo.left, clear_torpedo.top, clear_torpedo.right, clear_torpedo.bottom);
LH	R28, Offset(_clear_torpedo+4)(GP)
LH	R27, Offset(_clear_torpedo+6)(GP)
LH	R26, Offset(_clear_torpedo+0)(GP)
LH	R25, Offset(_clear_torpedo+2)(GP)
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1295 :: 		}
L_RenderScreen165:
;minisub_main.c,1298 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,1307 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
SH	R0, 20(SP)
L_RenderScreen166:
LH	R2, 20(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__RenderScreen498
NOP	
J	L_RenderScreen167
NOP	
L__RenderScreen498:
;minisub_main.c,1309 :: 		AnimateSeaMine(mine_inc);
LH	R25, 20(SP)
JAL	_AnimateSeaMine+0
NOP	
;minisub_main.c,1307 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,1310 :: 		}
J	L_RenderScreen166
NOP	
L_RenderScreen167:
;minisub_main.c,1313 :: 		if(bonus_block.x <= SCREEN_WIDTH){
LH	R2, Offset(_bonus_block+4)(GP)
SLTI	R2, R2, 321
BNE	R2, R0, L__RenderScreen499
NOP	
J	L_RenderScreen169
NOP	
L__RenderScreen499:
;minisub_main.c,1316 :: 		if(bonus_type == 2) {
LH	R3, Offset(_bonus_type+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__RenderScreen500
NOP	
J	L_RenderScreen170
NOP	
L__RenderScreen500:
;minisub_main.c,1318 :: 		TFT_Image(bonus_block.x, bonus_block.y, heart_pack_bmp, 1);
LUI	R2, #hi_addr(_heart_pack_bmp+0)
ORI	R2, R2, #lo_addr(_heart_pack_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_bonus_block+6)(GP)
LH	R25, Offset(_bonus_block+4)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1319 :: 		}
J	L_RenderScreen171
NOP	
L_RenderScreen170:
;minisub_main.c,1322 :: 		TFT_Image(bonus_block.x, bonus_block.y, torpedo_pack_bmp, 1);
LUI	R2, #hi_addr(_torpedo_pack_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_pack_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_bonus_block+6)(GP)
LH	R25, Offset(_bonus_block+4)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1323 :: 		}
L_RenderScreen171:
;minisub_main.c,1324 :: 		}
L_RenderScreen169:
;minisub_main.c,1327 :: 		if(fire_torpedo_flag){
LH	R2, Offset(_fire_torpedo_flag+0)(GP)
BNE	R2, R0, L__RenderScreen502
NOP	
J	L_RenderScreen172
NOP	
L__RenderScreen502:
;minisub_main.c,1328 :: 		TFT_Image(torpedo.x, torpedo.y, torpedo_bmp, 1);
LUI	R2, #hi_addr(_torpedo_bmp+0)
ORI	R2, R2, #lo_addr(_torpedo_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_torpedo+6)(GP)
LH	R25, Offset(_torpedo+4)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1329 :: 		}
L_RenderScreen172:
;minisub_main.c,1333 :: 		TFT_Image(sub.x, sub.y, sub_bmp, 1);
LUI	R2, #hi_addr(_sub_bmp+0)
ORI	R2, R2, #lo_addr(_sub_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_sub+2)(GP)
LH	R25, Offset(_sub+0)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1340 :: 		if( (sub.prev_x != sub.x)|| (sub.prev_y != sub.y) || (sub.x < (0)) || (sub.y < (STATUS_TEXT_CELL_HEIGHT)) ){
LH	R3, Offset(_sub+0)(GP)
LH	R2, Offset(_sub+4)(GP)
BEQ	R2, R3, L__RenderScreen503
NOP	
J	L__RenderScreen332
NOP	
L__RenderScreen503:
LH	R3, Offset(_sub+2)(GP)
LH	R2, Offset(_sub+6)(GP)
BEQ	R2, R3, L__RenderScreen504
NOP	
J	L__RenderScreen331
NOP	
L__RenderScreen504:
LH	R2, Offset(_sub+0)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__RenderScreen505
NOP	
J	L__RenderScreen330
NOP	
L__RenderScreen505:
LH	R2, Offset(_sub+2)(GP)
SLTI	R2, R2, 25
BEQ	R2, R0, L__RenderScreen506
NOP	
J	L__RenderScreen329
NOP	
L__RenderScreen506:
J	L_RenderScreen175
NOP	
L__RenderScreen332:
L__RenderScreen331:
L__RenderScreen330:
L__RenderScreen329:
;minisub_main.c,1342 :: 		TFT_Rectangle(clear_sub.left, clear_sub.top, clear_sub.right, clear_sub.bottom);
LH	R28, Offset(_clear_sub+4)(GP)
LH	R27, Offset(_clear_sub+6)(GP)
LH	R26, Offset(_clear_sub+0)(GP)
LH	R25, Offset(_clear_sub+2)(GP)
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1343 :: 		}
L_RenderScreen175:
;minisub_main.c,1347 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
SH	R0, 20(SP)
L_RenderScreen176:
LH	R2, 20(SP)
SLTI	R2, R2, 4
BNE	R2, R0, L__RenderScreen507
NOP	
J	L_RenderScreen177
NOP	
L__RenderScreen507:
;minisub_main.c,1349 :: 		if(IsCollision(sub.x, sub.y, PLAYER_WIDTH, PLAYER_HEIGHT, mine[mine_inc].x, mine[mine_inc].y, mine[mine_inc].width, mine[mine_inc].height)) {
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R6, R2, R3
ADDIU	R2, R6, 2
LHU	R5, 0(R2)
LHU	R4, 0(R6)
ADDIU	R2, R6, 6
LH	R3, 0(R2)
ADDIU	R2, R6, 4
LH	R2, 0(R2)
ORI	R28, R0, 47
ORI	R27, R0, 63
LH	R26, Offset(_sub+2)(GP)
LH	R25, Offset(_sub+0)(GP)
ADDIU	SP, SP, -8
SH	R5, 6(SP)
SH	R4, 4(SP)
SH	R3, 2(SP)
SH	R2, 0(SP)
JAL	_IsCollision+0
NOP	
ADDIU	SP, SP, 8
BNE	R2, R0, L__RenderScreen509
NOP	
J	L_RenderScreen179
NOP	
L__RenderScreen509:
;minisub_main.c,1351 :: 		mineHit = 1;
ORI	R2, R0, 1
SH	R2, Offset(_mineHit+0)(GP)
;minisub_main.c,1354 :: 		destroyed_mine_id = mine_inc;
LH	R2, 20(SP)
SH	R2, Offset(_destroyed_mine_id+0)(GP)
;minisub_main.c,1357 :: 		UART1_Write_Line("You hit a sea mine!");
LUI	R25, #hi_addr(?lstr38_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr38_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,1360 :: 		}
L_RenderScreen179:
;minisub_main.c,1362 :: 		if(fire_torpedo_flag){
LH	R2, Offset(_fire_torpedo_flag+0)(GP)
BNE	R2, R0, L__RenderScreen511
NOP	
J	L_RenderScreen180
NOP	
L__RenderScreen511:
;minisub_main.c,1364 :: 		if(IsCollision(torpedo.x, torpedo.y, torpedo.width, torpedo.height, mine[mine_inc].x, mine[mine_inc].y, mine[mine_inc].width, mine[mine_inc].height)) {
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R6, R2, R3
ADDIU	R2, R6, 2
LHU	R5, 0(R2)
LHU	R4, 0(R6)
ADDIU	R2, R6, 6
LH	R3, 0(R2)
ADDIU	R2, R6, 4
LH	R2, 0(R2)
LHU	R28, Offset(_torpedo+2)(GP)
LHU	R27, Offset(_torpedo+0)(GP)
LH	R26, Offset(_torpedo+6)(GP)
LH	R25, Offset(_torpedo+4)(GP)
ADDIU	SP, SP, -8
SH	R5, 6(SP)
SH	R4, 4(SP)
SH	R3, 2(SP)
SH	R2, 0(SP)
JAL	_IsCollision+0
NOP	
ADDIU	SP, SP, 8
BNE	R2, R0, L__RenderScreen513
NOP	
J	L_RenderScreen181
NOP	
L__RenderScreen513:
;minisub_main.c,1367 :: 		mine[mine_inc].hits++;
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 16
LH	R2, 0(R3)
ADDIU	R2, R2, 1
SH	R2, 0(R3)
;minisub_main.c,1370 :: 		if(mine[mine_inc].type == 0){
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__RenderScreen514
NOP	
J	L_RenderScreen182
NOP	
L__RenderScreen514:
;minisub_main.c,1372 :: 		mineExplode = 1;
ORI	R2, R0, 1
SH	R2, Offset(_mineExplode+0)(GP)
;minisub_main.c,1375 :: 		destroyed_mine_id = mine_inc;
LH	R2, 20(SP)
SH	R2, Offset(_destroyed_mine_id+0)(GP)
;minisub_main.c,1378 :: 		UART1_Write_Line("Your torpedo destroyed a red sea mine!");
LUI	R25, #hi_addr(?lstr39_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr39_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,1379 :: 		}
J	L_RenderScreen183
NOP	
L_RenderScreen182:
;minisub_main.c,1380 :: 		else if( (mine[mine_inc].type == 1) && (mine[mine_inc].hits >= 2) ){
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__RenderScreen515
NOP	
J	L__RenderScreen334
NOP	
L__RenderScreen515:
LH	R3, 20(SP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
LH	R2, 0(R2)
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__RenderScreen516
NOP	
J	L__RenderScreen333
NOP	
L__RenderScreen516:
L__RenderScreen322:
;minisub_main.c,1382 :: 		mineExplode = 1;
ORI	R2, R0, 1
SH	R2, Offset(_mineExplode+0)(GP)
;minisub_main.c,1385 :: 		destroyed_mine_id = mine_inc;
LH	R2, 20(SP)
SH	R2, Offset(_destroyed_mine_id+0)(GP)
;minisub_main.c,1388 :: 		UART1_Write_Line("Your torpedo destroyed a grey sea mine!");
LUI	R25, #hi_addr(?lstr40_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr40_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,1389 :: 		}
J	L_RenderScreen187
NOP	
;minisub_main.c,1380 :: 		else if( (mine[mine_inc].type == 1) && (mine[mine_inc].hits >= 2) ){
L__RenderScreen334:
L__RenderScreen333:
;minisub_main.c,1394 :: 		fire_torpedo_flag = 0;
SH	R0, Offset(_fire_torpedo_flag+0)(GP)
;minisub_main.c,1397 :: 		ClearTorpedo();
JAL	_ClearTorpedo+0
NOP	
;minisub_main.c,1400 :: 		torpedo.x = 0;
SH	R0, Offset(_torpedo+4)(GP)
;minisub_main.c,1401 :: 		torpedo.y = 0;
SH	R0, Offset(_torpedo+6)(GP)
;minisub_main.c,1402 :: 		torpedo.prev_x = 0;
SH	R0, Offset(_torpedo+8)(GP)
;minisub_main.c,1403 :: 		torpedo.prev_y = 0;
SH	R0, Offset(_torpedo+10)(GP)
;minisub_main.c,1405 :: 		}
L_RenderScreen187:
L_RenderScreen183:
;minisub_main.c,1408 :: 		}
L_RenderScreen181:
;minisub_main.c,1409 :: 		}
L_RenderScreen180:
;minisub_main.c,1347 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
LH	R2, 20(SP)
ADDIU	R2, R2, 1
SH	R2, 20(SP)
;minisub_main.c,1413 :: 		}
J	L_RenderScreen176
NOP	
L_RenderScreen177:
;minisub_main.c,1417 :: 		if(IsCollision(sub.x, sub.y, PLAYER_WIDTH, PLAYER_HEIGHT, bonus_block.x, bonus_block.y, bonus_block.width, bonus_block.height)) {
ORI	R28, R0, 47
ORI	R27, R0, 63
LH	R26, Offset(_sub+2)(GP)
LH	R25, Offset(_sub+0)(GP)
LHU	R2, Offset(_bonus_block+2)(GP)
ADDIU	SP, SP, -8
SH	R2, 6(SP)
LHU	R2, Offset(_bonus_block+0)(GP)
SH	R2, 4(SP)
LH	R2, Offset(_bonus_block+6)(GP)
SH	R2, 2(SP)
LH	R2, Offset(_bonus_block+4)(GP)
SH	R2, 0(SP)
JAL	_IsCollision+0
NOP	
ADDIU	SP, SP, 8
BNE	R2, R0, L__RenderScreen518
NOP	
J	L_RenderScreen188
NOP	
L__RenderScreen518:
;minisub_main.c,1420 :: 		bonus_id = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_id+0)(GP)
;minisub_main.c,1423 :: 		if(bonus_type == 2){
LH	R3, Offset(_bonus_type+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__RenderScreen519
NOP	
J	L_RenderScreen189
NOP	
L__RenderScreen519:
;minisub_main.c,1425 :: 		subLives += 1;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1428 :: 		UART1_Write_Line("You picked up an extra life bonus!");
LUI	R25, #hi_addr(?lstr41_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr41_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,1429 :: 		}
J	L_RenderScreen190
NOP	
L_RenderScreen189:
;minisub_main.c,1432 :: 		torpedo_count += 3;
LH	R2, Offset(_torpedo_count+0)(GP)
ADDIU	R2, R2, 3
SH	R2, Offset(_torpedo_count+0)(GP)
;minisub_main.c,1435 :: 		UART1_Write_Line("You picked up a torpedo 3 pack bonus!");
LUI	R25, #hi_addr(?lstr42_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr42_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,1436 :: 		}
L_RenderScreen190:
;minisub_main.c,1440 :: 		ResetBonusBlock();
JAL	_ResetBonusBlock+0
NOP	
;minisub_main.c,1443 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,1444 :: 		}
L_RenderScreen188:
;minisub_main.c,1449 :: 		if(mineHit){
LH	R2, Offset(_mineHit+0)(GP)
BNE	R2, R0, L__RenderScreen521
NOP	
J	L_RenderScreen191
NOP	
L__RenderScreen521:
;minisub_main.c,1453 :: 		fireball.x = (sub.x + (PLAYER_WIDTH/2) ) - (fireball.width/2) ;
LH	R2, Offset(_sub+0)(GP)
ADDIU	R3, R2, 31
LHU	R2, Offset(_fireball+0)(GP)
SRL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, Offset(_fireball+4)(GP)
;minisub_main.c,1454 :: 		fireball.y = (sub.y + (PLAYER_HEIGHT/2) ) - (fireball.height/2) ;
LH	R2, Offset(_sub+2)(GP)
ADDIU	R3, R2, 23
LHU	R2, Offset(_fireball+2)(GP)
SRL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, Offset(_fireball+6)(GP)
;minisub_main.c,1457 :: 		if( fireball.x <=0)
LH	R2, Offset(_fireball+4)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__RenderScreen522
NOP	
J	L_RenderScreen192
NOP	
L__RenderScreen522:
;minisub_main.c,1458 :: 		fireball.x=0;
SH	R0, Offset(_fireball+4)(GP)
L_RenderScreen192:
;minisub_main.c,1460 :: 		if( fireball.y <= STATUS_TEXT_CELL_HEIGHT)
LH	R2, Offset(_fireball+6)(GP)
SLTI	R2, R2, 26
BNE	R2, R0, L__RenderScreen523
NOP	
J	L_RenderScreen193
NOP	
L__RenderScreen523:
;minisub_main.c,1461 :: 		fireball.y = STATUS_TEXT_CELL_HEIGHT;
ORI	R2, R0, 25
SH	R2, Offset(_fireball+6)(GP)
L_RenderScreen193:
;minisub_main.c,1464 :: 		TFT_Image(fireball.x, fireball.y, fireball_bmp, 1);
LUI	R2, #hi_addr(_fireball_bmp+0)
ORI	R2, R2, #lo_addr(_fireball_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_fireball+6)(GP)
LH	R25, Offset(_fireball+4)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1467 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,1469 :: 		}
L_RenderScreen191:
;minisub_main.c,1474 :: 		if(mineExplode){
LH	R2, Offset(_mineExplode+0)(GP)
BNE	R2, R0, L__RenderScreen525
NOP	
J	L_RenderScreen194
NOP	
L__RenderScreen525:
;minisub_main.c,1482 :: 		ClearTorpedo();
JAL	_ClearTorpedo+0
NOP	
;minisub_main.c,1485 :: 		explode.x = (mine[destroyed_mine_id].x + (mine[destroyed_mine_id].width/2) ) - (explode.width/2) ;
LH	R3, Offset(_destroyed_mine_id+0)(GP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 4
LH	R3, 0(R2)
LHU	R2, 0(R4)
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R3, R2
LHU	R2, Offset(_explode+0)(GP)
SRL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, Offset(_explode+4)(GP)
;minisub_main.c,1486 :: 		explode.y = (mine[destroyed_mine_id].y + (mine[destroyed_mine_id].height/2) ) - (explode.height/2);
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 2
LHU	R2, 0(R2)
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R3, R2
LHU	R2, Offset(_explode+2)(GP)
SRL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, Offset(_explode+6)(GP)
;minisub_main.c,1489 :: 		if( explode.x <=0 ){
LH	R2, Offset(_explode+4)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__RenderScreen526
NOP	
J	L_RenderScreen195
NOP	
L__RenderScreen526:
;minisub_main.c,1490 :: 		explode.x=0;
SH	R0, Offset(_explode+4)(GP)
;minisub_main.c,1491 :: 		}
L_RenderScreen195:
;minisub_main.c,1493 :: 		if( explode.y <= STATUS_TEXT_CELL_HEIGHT){
LH	R2, Offset(_explode+6)(GP)
SLTI	R2, R2, 26
BNE	R2, R0, L__RenderScreen527
NOP	
J	L_RenderScreen196
NOP	
L__RenderScreen527:
;minisub_main.c,1494 :: 		explode.y = STATUS_TEXT_CELL_HEIGHT;
ORI	R2, R0, 25
SH	R2, Offset(_explode+6)(GP)
;minisub_main.c,1495 :: 		}
L_RenderScreen196:
;minisub_main.c,1498 :: 		TFT_Image(explode.x, explode.y, explode_bmp, 1);
LUI	R2, #hi_addr(_explode_bmp+0)
ORI	R2, R2, #lo_addr(_explode_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
LH	R26, Offset(_explode+6)(GP)
LH	R25, Offset(_explode+4)(GP)
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1499 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_RenderScreen197:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RenderScreen197
NOP	
;minisub_main.c,1502 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,1506 :: 		mineExplode = 0;
SH	R0, Offset(_mineExplode+0)(GP)
;minisub_main.c,1509 :: 		fire_torpedo_flag = 0;
SH	R0, Offset(_fire_torpedo_flag+0)(GP)
;minisub_main.c,1512 :: 		torpedo.x = 0;
SH	R0, Offset(_torpedo+4)(GP)
;minisub_main.c,1513 :: 		torpedo.y = 0;
SH	R0, Offset(_torpedo+6)(GP)
;minisub_main.c,1514 :: 		torpedo.prev_x = 0;
SH	R0, Offset(_torpedo+8)(GP)
;minisub_main.c,1515 :: 		torpedo.prev_y = 0;
SH	R0, Offset(_torpedo+10)(GP)
;minisub_main.c,1519 :: 		ResetSeaMine(destroyed_mine_id);
LH	R25, Offset(_destroyed_mine_id+0)(GP)
JAL	_ResetSeaMine+0
NOP	
;minisub_main.c,1520 :: 		mine[destroyed_mine_id].prev_x = mine[destroyed_mine_id].x;
LH	R3, Offset(_destroyed_mine_id+0)(GP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SH	R2, 0(R3)
;minisub_main.c,1523 :: 		if(mine[destroyed_mine_id].type == 0){
LH	R3, Offset(_destroyed_mine_id+0)(GP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__RenderScreen528
NOP	
J	L_RenderScreen199
NOP	
L__RenderScreen528:
;minisub_main.c,1524 :: 		score += 50;
LH	R2, Offset(_score+0)(GP)
ADDIU	R2, R2, 50
SH	R2, Offset(_score+0)(GP)
;minisub_main.c,1525 :: 		}
J	L_RenderScreen200
NOP	
L_RenderScreen199:
;minisub_main.c,1526 :: 		else if(mine[destroyed_mine_id].type == 1){
LH	R3, Offset(_destroyed_mine_id+0)(GP)
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__RenderScreen529
NOP	
J	L_RenderScreen201
NOP	
L__RenderScreen529:
;minisub_main.c,1527 :: 		score += 100;
LH	R2, Offset(_score+0)(GP)
ADDIU	R2, R2, 100
SH	R2, Offset(_score+0)(GP)
;minisub_main.c,1528 :: 		}
L_RenderScreen201:
L_RenderScreen200:
;minisub_main.c,1529 :: 		}
L_RenderScreen194:
;minisub_main.c,1532 :: 		CheckGameLevel();
JAL	_CheckGameLevel+0
NOP	
;minisub_main.c,1536 :: 		RenderScore();
JAL	_RenderScore+0
NOP	
;minisub_main.c,1538 :: 		}
L_end_RenderScreen:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _RenderScreen
_CheckGameLevel:
;minisub_main.c,1541 :: 		void CheckGameLevel(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_main.c,1543 :: 		if( (level == 1) && (score > 1000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__CheckGameLevel531
NOP	
J	L__CheckGameLevel299
NOP	
L__CheckGameLevel531:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 1001
BEQ	R2, R0, L__CheckGameLevel532
NOP	
J	L__CheckGameLevel298
NOP	
L__CheckGameLevel532:
L__CheckGameLevel297:
;minisub_main.c,1544 :: 		level = 2;
ORI	R2, R0, 2
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1545 :: 		prev_level = level-1;
ORI	R2, R0, 1
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1548 :: 		mine_speed = 8;
ORI	R2, R0, 8
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1551 :: 		bonus_factor = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1554 :: 		grey_mine_rate = 5;
ORI	R2, R0, 5
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1543 :: 		if( (level == 1) && (score > 1000) ){
L__CheckGameLevel299:
L__CheckGameLevel298:
;minisub_main.c,1558 :: 		if( (level == 2) && (score > 2500) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__CheckGameLevel533
NOP	
J	L__CheckGameLevel301
NOP	
L__CheckGameLevel533:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 2501
BEQ	R2, R0, L__CheckGameLevel534
NOP	
J	L__CheckGameLevel300
NOP	
L__CheckGameLevel534:
L__CheckGameLevel296:
;minisub_main.c,1559 :: 		level = 3;
ORI	R2, R0, 3
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1560 :: 		prev_level = level-1;
ORI	R2, R0, 2
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1563 :: 		mine_speed = 8;
ORI	R2, R0, 8
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1566 :: 		bonus_factor = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1569 :: 		grey_mine_rate = 4;
ORI	R2, R0, 4
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1572 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1558 :: 		if( (level == 2) && (score > 2500) ){
L__CheckGameLevel301:
L__CheckGameLevel300:
;minisub_main.c,1575 :: 		if( (level == 3) && (score > 5000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__CheckGameLevel535
NOP	
J	L__CheckGameLevel303
NOP	
L__CheckGameLevel535:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 5001
BEQ	R2, R0, L__CheckGameLevel536
NOP	
J	L__CheckGameLevel302
NOP	
L__CheckGameLevel536:
L__CheckGameLevel295:
;minisub_main.c,1576 :: 		level = 4;
ORI	R2, R0, 4
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1577 :: 		prev_level = level-1;
ORI	R2, R0, 3
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1580 :: 		mine_speed = 8;
ORI	R2, R0, 8
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1583 :: 		bonus_factor = 2;
ORI	R2, R0, 2
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1586 :: 		grey_mine_rate = 3;
ORI	R2, R0, 3
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1589 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1575 :: 		if( (level == 3) && (score > 5000) ){
L__CheckGameLevel303:
L__CheckGameLevel302:
;minisub_main.c,1592 :: 		if( (level == 4) && (score > 8000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 4
BEQ	R3, R2, L__CheckGameLevel537
NOP	
J	L__CheckGameLevel305
NOP	
L__CheckGameLevel537:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 8001
BEQ	R2, R0, L__CheckGameLevel538
NOP	
J	L__CheckGameLevel304
NOP	
L__CheckGameLevel538:
L__CheckGameLevel294:
;minisub_main.c,1593 :: 		level = 5;
ORI	R2, R0, 5
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1594 :: 		prev_level = level-1;
ORI	R2, R0, 4
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1597 :: 		mine_speed = 9;
ORI	R2, R0, 9
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1600 :: 		bonus_factor = 3;
ORI	R2, R0, 3
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1603 :: 		grey_mine_rate = 3;
ORI	R2, R0, 3
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1606 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1592 :: 		if( (level == 4) && (score > 8000) ){
L__CheckGameLevel305:
L__CheckGameLevel304:
;minisub_main.c,1609 :: 		if( (level == 5) && (score > 10000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 5
BEQ	R3, R2, L__CheckGameLevel539
NOP	
J	L__CheckGameLevel307
NOP	
L__CheckGameLevel539:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 10001
BEQ	R2, R0, L__CheckGameLevel540
NOP	
J	L__CheckGameLevel306
NOP	
L__CheckGameLevel540:
L__CheckGameLevel293:
;minisub_main.c,1610 :: 		level = 6;
ORI	R2, R0, 6
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1611 :: 		prev_level = level-1;
ORI	R2, R0, 5
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1614 :: 		mine_speed = 10;
ORI	R2, R0, 10
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1617 :: 		bonus_factor = 3;
ORI	R2, R0, 3
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1620 :: 		grey_mine_rate = 3;
ORI	R2, R0, 3
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1623 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1609 :: 		if( (level == 5) && (score > 10000) ){
L__CheckGameLevel307:
L__CheckGameLevel306:
;minisub_main.c,1626 :: 		if( (level == 6) && (score > 12000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 6
BEQ	R3, R2, L__CheckGameLevel541
NOP	
J	L__CheckGameLevel309
NOP	
L__CheckGameLevel541:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 12001
BEQ	R2, R0, L__CheckGameLevel542
NOP	
J	L__CheckGameLevel308
NOP	
L__CheckGameLevel542:
L__CheckGameLevel292:
;minisub_main.c,1627 :: 		level = 7;
ORI	R2, R0, 7
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1628 :: 		prev_level = level-1;
ORI	R2, R0, 6
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1631 :: 		mine_speed = 10;
ORI	R2, R0, 10
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1634 :: 		bonus_factor = 3;
ORI	R2, R0, 3
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1637 :: 		grey_mine_rate = 3;
ORI	R2, R0, 3
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1640 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1626 :: 		if( (level == 6) && (score > 12000) ){
L__CheckGameLevel309:
L__CheckGameLevel308:
;minisub_main.c,1643 :: 		if( (level == 7) && (score > 15000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 7
BEQ	R3, R2, L__CheckGameLevel543
NOP	
J	L__CheckGameLevel311
NOP	
L__CheckGameLevel543:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 15001
BEQ	R2, R0, L__CheckGameLevel544
NOP	
J	L__CheckGameLevel310
NOP	
L__CheckGameLevel544:
L__CheckGameLevel291:
;minisub_main.c,1644 :: 		level = 8;
ORI	R2, R0, 8
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1645 :: 		prev_level = level-1;
ORI	R2, R0, 7
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1648 :: 		mine_speed = 10;
ORI	R2, R0, 10
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1651 :: 		bonus_factor = 4;
ORI	R2, R0, 4
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1654 :: 		grey_mine_rate = 3;
ORI	R2, R0, 3
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1657 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1643 :: 		if( (level == 7) && (score > 15000) ){
L__CheckGameLevel311:
L__CheckGameLevel310:
;minisub_main.c,1660 :: 		if( (level == 8) && (score > 15000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 8
BEQ	R3, R2, L__CheckGameLevel545
NOP	
J	L__CheckGameLevel313
NOP	
L__CheckGameLevel545:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 15001
BEQ	R2, R0, L__CheckGameLevel546
NOP	
J	L__CheckGameLevel312
NOP	
L__CheckGameLevel546:
L__CheckGameLevel290:
;minisub_main.c,1661 :: 		level = 9;
ORI	R2, R0, 9
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1662 :: 		prev_level = level-1;
ORI	R2, R0, 8
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1665 :: 		mine_speed = 10;
ORI	R2, R0, 10
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1668 :: 		bonus_factor = 3;
ORI	R2, R0, 3
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1671 :: 		grey_mine_rate = 2;
ORI	R2, R0, 2
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1674 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1660 :: 		if( (level == 8) && (score > 15000) ){
L__CheckGameLevel313:
L__CheckGameLevel312:
;minisub_main.c,1676 :: 		if( (level == 9) && (score > 20000) ){
LH	R3, Offset(_level+0)(GP)
ORI	R2, R0, 9
BEQ	R3, R2, L__CheckGameLevel547
NOP	
J	L__CheckGameLevel315
NOP	
L__CheckGameLevel547:
LH	R2, Offset(_score+0)(GP)
SLTI	R2, R2, 20001
BEQ	R2, R0, L__CheckGameLevel548
NOP	
J	L__CheckGameLevel314
NOP	
L__CheckGameLevel548:
L__CheckGameLevel289:
;minisub_main.c,1677 :: 		level = 10;
ORI	R2, R0, 10
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1678 :: 		prev_level = level-1;
ORI	R2, R0, 9
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1681 :: 		mine_speed = 10;
ORI	R2, R0, 10
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1684 :: 		bonus_factor = 4;
ORI	R2, R0, 4
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1687 :: 		grey_mine_rate = 2;
ORI	R2, R0, 2
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1690 :: 		subLives++;
LH	R2, Offset(_subLives+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1676 :: 		if( (level == 9) && (score > 20000) ){
L__CheckGameLevel315:
L__CheckGameLevel314:
;minisub_main.c,1694 :: 		if (prev_level != level){
LH	R3, Offset(_level+0)(GP)
LH	R2, Offset(_prev_level+0)(GP)
BNE	R2, R3, L__CheckGameLevel550
NOP	
J	L_CheckGameLevel229
NOP	
L__CheckGameLevel550:
;minisub_main.c,1696 :: 		ShowNextLevel();
JAL	_ShowNextLevel+0
NOP	
;minisub_main.c,1697 :: 		}
L_CheckGameLevel229:
;minisub_main.c,1701 :: 		}
L_end_CheckGameLevel:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _CheckGameLevel
_RenderScore:
;minisub_main.c,1704 :: 		void RenderScore(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,1705 :: 		int tr_inc = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,1712 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,1717 :: 		(prev_torpedo_count != torpedo_count) ||
LH	R3, Offset(_prev_score+0)(GP)
LH	R2, Offset(_score+0)(GP)
BEQ	R2, R3, L__RenderScore552
NOP	
J	L__RenderScore321
NOP	
L__RenderScore552:
LH	R3, Offset(_torpedo_count+0)(GP)
LH	R2, Offset(_prev_torpedo_count+0)(GP)
BEQ	R2, R3, L__RenderScore553
NOP	
J	L__RenderScore320
NOP	
L__RenderScore553:
;minisub_main.c,1718 :: 		(prev_subLives != subLives) ||
LH	R3, Offset(_subLives+0)(GP)
LH	R2, Offset(_prev_subLives+0)(GP)
BEQ	R2, R3, L__RenderScore554
NOP	
J	L__RenderScore319
NOP	
L__RenderScore554:
;minisub_main.c,1719 :: 		( prev_muteSound != muteSound) ||
LH	R3, Offset(_muteSound+0)(GP)
LH	R2, Offset(_prev_muteSound+0)(GP)
BEQ	R2, R3, L__RenderScore555
NOP	
J	L__RenderScore318
NOP	
L__RenderScore555:
;minisub_main.c,1720 :: 		(toggled_main_menu) ){
LH	R2, Offset(_toggled_main_menu+0)(GP)
BEQ	R2, R0, L__RenderScore556
NOP	
J	L__RenderScore317
NOP	
L__RenderScore556:
J	L_RenderScore232
NOP	
;minisub_main.c,1717 :: 		(prev_torpedo_count != torpedo_count) ||
L__RenderScore321:
L__RenderScore320:
;minisub_main.c,1718 :: 		(prev_subLives != subLives) ||
L__RenderScore319:
;minisub_main.c,1719 :: 		( prev_muteSound != muteSound) ||
L__RenderScore318:
;minisub_main.c,1720 :: 		(toggled_main_menu) ){
L__RenderScore317:
;minisub_main.c,1726 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,1729 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,1732 :: 		TFT_Rectangle( 0, 0, 319, 25);
ORI	R28, R0, 25
ORI	R27, R0, 319
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1733 :: 		}
L_RenderScore232:
;minisub_main.c,1740 :: 		for(tr_inc=0;tr_inc<torpedo_count;tr_inc++){
; tr_inc start address is: 16 (R4)
MOVZ	R4, R0, R0
; tr_inc end address is: 16 (R4)
L_RenderScore233:
; tr_inc start address is: 16 (R4)
SEH	R3, R4
LH	R2, Offset(_torpedo_count+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__RenderScore557
NOP	
J	L_RenderScore234
NOP	
L__RenderScore557:
;minisub_main.c,1741 :: 		TFT_Image(230+((TORPEDO_STATUS_ICON_WIDTH+2)*tr_inc), 2, torpedo_status_bmp, 1);
LUI	R3, #hi_addr(_torpedo_status_bmp+0)
ORI	R3, R3, #lo_addr(_torpedo_status_bmp+0)
SEH	R2, R4
SLL	R2, R2, 3
ADDIU	R2, R2, 230
SH	R4, 20(SP)
ORI	R28, R0, 1
MOVZ	R27, R3, R0
ORI	R26, R0, 2
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
LH	R4, 20(SP)
;minisub_main.c,1740 :: 		for(tr_inc=0;tr_inc<torpedo_count;tr_inc++){
ADDIU	R2, R4, 1
SEH	R4, R2
;minisub_main.c,1742 :: 		}
; tr_inc end address is: 16 (R4)
J	L_RenderScore233
NOP	
L_RenderScore234:
;minisub_main.c,1745 :: 		TFT_Image(5, 2, lives_bmp, 1);
LUI	R2, #hi_addr(_lives_bmp+0)
ORI	R2, R2, #lo_addr(_lives_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 2
ORI	R25, R0, 5
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1755 :: 		if(muteSound){
LH	R2, Offset(_muteSound+0)(GP)
BNE	R2, R0, L__RenderScore559
NOP	
J	L_RenderScore236
NOP	
L__RenderScore559:
;minisub_main.c,1757 :: 		TFT_Image(80, 2, soundMute_bmp, 1);
LUI	R2, #hi_addr(_soundMute_bmp+0)
ORI	R2, R2, #lo_addr(_soundMute_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 2
ORI	R25, R0, 80
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1758 :: 		}
J	L_RenderScore237
NOP	
L_RenderScore236:
;minisub_main.c,1759 :: 		else if(!muteSound){
LH	R2, Offset(_muteSound+0)(GP)
BEQ	R2, R0, L__RenderScore560
NOP	
J	L_RenderScore238
NOP	
L__RenderScore560:
;minisub_main.c,1761 :: 		if (sound_level > 75) {
LBU	R2, Offset(_sound_level+0)(GP)
SLTIU	R2, R2, 76
BEQ	R2, R0, L__RenderScore561
NOP	
J	L_RenderScore239
NOP	
L__RenderScore561:
;minisub_main.c,1763 :: 		TFT_Image(80, 2, sound_bmp, 1);
LUI	R2, #hi_addr(_sound_bmp+0)
ORI	R2, R2, #lo_addr(_sound_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 2
ORI	R25, R0, 80
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1764 :: 		}
J	L_RenderScore240
NOP	
L_RenderScore239:
;minisub_main.c,1765 :: 		else if (sound_level > 40){
LBU	R2, Offset(_sound_level+0)(GP)
SLTIU	R2, R2, 41
BEQ	R2, R0, L__RenderScore562
NOP	
J	L_RenderScore241
NOP	
L__RenderScore562:
;minisub_main.c,1767 :: 		TFT_Image(80, 2, sound_med_bmp, 1);
LUI	R2, #hi_addr(_sound_med_bmp+0)
ORI	R2, R2, #lo_addr(_sound_med_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 2
ORI	R25, R0, 80
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1768 :: 		}
J	L_RenderScore242
NOP	
L_RenderScore241:
;minisub_main.c,1771 :: 		TFT_Image(80, 2, sound_low_bmp, 1);
LUI	R2, #hi_addr(_sound_low_bmp+0)
ORI	R2, R2, #lo_addr(_sound_low_bmp+0)
ORI	R28, R0, 1
MOVZ	R27, R2, R0
ORI	R26, R0, 2
ORI	R25, R0, 80
JAL	_TFT_Image+0
NOP	
;minisub_main.c,1772 :: 		}
L_RenderScore242:
L_RenderScore240:
;minisub_main.c,1774 :: 		}
L_RenderScore238:
L_RenderScore237:
;minisub_main.c,1779 :: 		IntToStr(level, level_text);
LUI	R26, #hi_addr(_level_text+0)
ORI	R26, R26, #lo_addr(_level_text+0)
LH	R25, Offset(_level+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,1782 :: 		IntToStr(subLives, lives_text);
LUI	R26, #hi_addr(_lives_text+0)
ORI	R26, R26, #lo_addr(_lives_text+0)
LH	R25, Offset(_subLives+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,1785 :: 		IntToStr(torpedo_count, torpedoes_text);
LUI	R26, #hi_addr(_torpedoes_text+0)
ORI	R26, R26, #lo_addr(_torpedoes_text+0)
LH	R25, Offset(_torpedo_count+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,1788 :: 		IntToStr(score, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LH	R25, Offset(_score+0)(GP)
JAL	_IntToStr+0
NOP	
;minisub_main.c,1792 :: 		TFT_Write_Text(lives_text, (5 + 20), 2);
ORI	R27, R0, 2
ORI	R26, R0, 25
LUI	R25, #hi_addr(_lives_text+0)
ORI	R25, R25, #lo_addr(_lives_text+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,1798 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,1801 :: 		strcpy(score_display_text, "Score: ");
LUI	R26, #hi_addr(?lstr43_minisub_main+0)
ORI	R26, R26, #lo_addr(?lstr43_minisub_main+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcpy+0
NOP	
;minisub_main.c,1802 :: 		strcat(score_display_text, score_text);
LUI	R26, #hi_addr(_score_text+0)
ORI	R26, R26, #lo_addr(_score_text+0)
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_strcat+0
NOP	
;minisub_main.c,1805 :: 		TFT_Write_Text(score_display_text, 120, 2);
ORI	R27, R0, 2
ORI	R26, R0, 120
LUI	R25, #hi_addr(_score_display_text+0)
ORI	R25, R25, #lo_addr(_score_display_text+0)
JAL	_TFT_Write_Text+0
NOP	
;minisub_main.c,1806 :: 		}
L_end_RenderScore:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _RenderScore
_ClearTorpedo:
;minisub_main.c,1809 :: 		void ClearTorpedo(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_main.c,1811 :: 		clear_torpedo.left = torpedo.x;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LH	R2, Offset(_torpedo+4)(GP)
SH	R2, Offset(_clear_torpedo+2)(GP)
;minisub_main.c,1812 :: 		clear_torpedo.top =  torpedo.y;
LH	R2, Offset(_torpedo+6)(GP)
SH	R2, Offset(_clear_torpedo+0)(GP)
;minisub_main.c,1813 :: 		clear_torpedo.right =  torpedo.x+torpedo.width;
LHU	R3, Offset(_torpedo+0)(GP)
LH	R2, Offset(_torpedo+4)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_clear_torpedo+6)(GP)
;minisub_main.c,1814 :: 		clear_torpedo.bottom =  torpedo.y+torpedo.height;
LHU	R3, Offset(_torpedo+2)(GP)
LH	R2, Offset(_torpedo+6)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_clear_torpedo+4)(GP)
;minisub_main.c,1817 :: 		TFT_Rectangle( clear_torpedo.left, clear_torpedo.top, clear_torpedo.right, clear_torpedo.bottom);
SEH	R28, R2
LH	R27, Offset(_clear_torpedo+6)(GP)
LH	R26, Offset(_clear_torpedo+0)(GP)
LH	R25, Offset(_clear_torpedo+2)(GP)
JAL	_TFT_Rectangle+0
NOP	
;minisub_main.c,1818 :: 		}
L_end_ClearTorpedo:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ClearTorpedo
_ResetGame:
;minisub_main.c,1823 :: 		void ResetGame(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_main.c,1826 :: 		TFT_Fill_Screen(bgColor);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,1829 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVZ	R27, R0, R0
ORI	R26, R0, 65535
LUI	R25, #hi_addr(_TFT_defaultFont+0)
ORI	R25, R25, #lo_addr(_TFT_defaultFont+0)
JAL	_TFT_Set_Font+0
NOP	
;minisub_main.c,1831 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,1834 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, bgColor, bgColor);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
LH	R2, Offset(_bgColor+0)(GP)
ADDIU	SP, SP, -4
SH	R2, 2(SP)
LH	R2, Offset(_bgColor+0)(GP)
SH	R2, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,1838 :: 		level = 1;
ORI	R2, R0, 1
SH	R2, Offset(_level+0)(GP)
;minisub_main.c,1839 :: 		prev_level = 1;
ORI	R2, R0, 1
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,1842 :: 		score = 0;
SH	R0, Offset(_score+0)(GP)
;minisub_main.c,1851 :: 		bonus_factor = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_factor+0)(GP)
;minisub_main.c,1854 :: 		mine_speed = 6;
ORI	R2, R0, 6
SH	R2, Offset(_mine_speed+0)(GP)
;minisub_main.c,1857 :: 		torpedo_count = NUMBER_OF_TORPEDOES;
ORI	R2, R0, 8
SH	R2, Offset(_torpedo_count+0)(GP)
;minisub_main.c,1860 :: 		subLives = NUMBER_OF_SUBMARINES;
ORI	R2, R0, 5
SH	R2, Offset(_subLives+0)(GP)
;minisub_main.c,1863 :: 		bonus_counter = 0;
SH	R0, Offset(_bonus_counter+0)(GP)
;minisub_main.c,1866 :: 		grey_mine_rate = 5;
ORI	R2, R0, 5
SH	R2, Offset(_grey_mine_rate+0)(GP)
;minisub_main.c,1869 :: 		InitSprites();
JAL	_InitSprites+0
NOP	
;minisub_main.c,1870 :: 		}
L_end_ResetGame:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ResetGame
_InitSprites:
;minisub_main.c,1872 :: 		void InitSprites(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,1873 :: 		int mine_inc = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,1877 :: 		torpedo_count = NUMBER_OF_TORPEDOES;
ORI	R2, R0, 8
SH	R2, Offset(_torpedo_count+0)(GP)
;minisub_main.c,1880 :: 		fire_torpedo_flag = 0;
SH	R0, Offset(_fire_torpedo_flag+0)(GP)
;minisub_main.c,1884 :: 		sub.x = 28;
ORI	R2, R0, 28
SH	R2, Offset(_sub+0)(GP)
;minisub_main.c,1885 :: 		sub.y = 128;
ORI	R2, R0, 128
SH	R2, Offset(_sub+2)(GP)
;minisub_main.c,1886 :: 		sub.prev_x = sub.x;
ORI	R2, R0, 28
SH	R2, Offset(_sub+4)(GP)
;minisub_main.c,1887 :: 		sub.prev_y = sub.y;
ORI	R2, R0, 128
SH	R2, Offset(_sub+6)(GP)
;minisub_main.c,1891 :: 		fireball.x = 0;
SH	R0, Offset(_fireball+4)(GP)
;minisub_main.c,1892 :: 		fireball.y = 0;
SH	R0, Offset(_fireball+6)(GP)
;minisub_main.c,1893 :: 		fireball.prev_x = 0;
SH	R0, Offset(_fireball+8)(GP)
;minisub_main.c,1894 :: 		fireball.prev_y = 0;
SH	R0, Offset(_fireball+10)(GP)
;minisub_main.c,1895 :: 		fireball.width = 130;
ORI	R2, R0, 130
SH	R2, Offset(_fireball+0)(GP)
;minisub_main.c,1896 :: 		fireball.height = 134;
ORI	R2, R0, 134
SH	R2, Offset(_fireball+2)(GP)
;minisub_main.c,1900 :: 		explode.x = 0;
SH	R0, Offset(_explode+4)(GP)
;minisub_main.c,1901 :: 		explode.y = 0;
SH	R0, Offset(_explode+6)(GP)
;minisub_main.c,1902 :: 		explode.prev_x = 0;
SH	R0, Offset(_explode+8)(GP)
;minisub_main.c,1903 :: 		explode.prev_y = 0;
SH	R0, Offset(_explode+10)(GP)
;minisub_main.c,1904 :: 		explode.width = 70;
ORI	R2, R0, 70
SH	R2, Offset(_explode+0)(GP)
;minisub_main.c,1905 :: 		explode.height = 60;
ORI	R2, R0, 60
SH	R2, Offset(_explode+2)(GP)
;minisub_main.c,1908 :: 		torpedo.x = 0;
SH	R0, Offset(_torpedo+4)(GP)
;minisub_main.c,1909 :: 		torpedo.y = 0;
SH	R0, Offset(_torpedo+6)(GP)
;minisub_main.c,1910 :: 		torpedo.prev_x = 0;
SH	R0, Offset(_torpedo+8)(GP)
;minisub_main.c,1911 :: 		torpedo.prev_y = 0;
SH	R0, Offset(_torpedo+10)(GP)
;minisub_main.c,1912 :: 		torpedo.visible = 1;
ORI	R2, R0, 1
SH	R2, Offset(_torpedo+12)(GP)
;minisub_main.c,1913 :: 		torpedo.width = 35;
ORI	R2, R0, 35
SH	R2, Offset(_torpedo+0)(GP)
;minisub_main.c,1914 :: 		torpedo.height = 14;
ORI	R2, R0, 14
SH	R2, Offset(_torpedo+2)(GP)
;minisub_main.c,1917 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
; mine_inc start address is: 16 (R4)
MOVZ	R4, R0, R0
; mine_inc end address is: 16 (R4)
L_InitSprites243:
; mine_inc start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__InitSprites566
NOP	
J	L_InitSprites244
NOP	
L__InitSprites566:
;minisub_main.c,1918 :: 		mine[mine_inc].x = (mine_inc * 90) + 200;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 4
ORI	R2, R0, 90
MUL	R2, R4, R2
ADDIU	R2, R2, 200
SH	R2, 0(R3)
;minisub_main.c,1919 :: 		mine[mine_inc].y = RandomHeightY();
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 6
SW	R2, 20(SP)
JAL	_RandomHeightY+0
NOP	
LW	R3, 20(SP)
SH	R2, 0(R3)
;minisub_main.c,1921 :: 		mine[mine_inc].prev_x = mine[mine_inc].x ;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SH	R2, 0(R3)
;minisub_main.c,1922 :: 		mine[mine_inc].prev_y = mine[mine_inc].y ;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 10
ADDIU	R2, R2, 6
LH	R2, 0(R2)
SH	R2, 0(R3)
;minisub_main.c,1923 :: 		mine[mine_inc].width = 45;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R3, R2, R3
ORI	R2, R0, 45
SH	R2, 0(R3)
;minisub_main.c,1924 :: 		mine[mine_inc].height = 45;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 2
ORI	R2, R0, 45
SH	R2, 0(R3)
;minisub_main.c,1927 :: 		mine[mine_inc].type = RandomSeaMineType();
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
SW	R2, 20(SP)
JAL	_RandomSeaMineType+0
NOP	
LW	R3, 20(SP)
SH	R2, 0(R3)
;minisub_main.c,1933 :: 		mine[mine_inc].hits = 0;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 16
SH	R0, 0(R2)
;minisub_main.c,1917 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
ADDIU	R2, R4, 1
SEH	R4, R2
;minisub_main.c,1934 :: 		}
; mine_inc end address is: 16 (R4)
J	L_InitSprites243
NOP	
L_InitSprites244:
;minisub_main.c,1939 :: 		bonus_block.x = SCREEN_WIDTH*BONUS_SCREEN_SPACING;
ORI	R2, R0, 640
SH	R2, Offset(_bonus_block+4)(GP)
;minisub_main.c,1940 :: 		bonus_block.y = RandomHeightY();  //generate random block Y position
JAL	_RandomHeightY+0
NOP	
SH	R2, Offset(_bonus_block+6)(GP)
;minisub_main.c,1941 :: 		bonus_block.prev_x = 0;
SH	R0, Offset(_bonus_block+8)(GP)
;minisub_main.c,1942 :: 		bonus_block.prev_y = 0;
SH	R0, Offset(_bonus_block+10)(GP)
;minisub_main.c,1943 :: 		bonus_block.visible = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_block+12)(GP)
;minisub_main.c,1944 :: 		bonus_block.width = 45;
ORI	R2, R0, 45
SH	R2, Offset(_bonus_block+0)(GP)
;minisub_main.c,1945 :: 		bonus_block.height = 45;
ORI	R2, R0, 45
SH	R2, Offset(_bonus_block+2)(GP)
;minisub_main.c,1948 :: 		bonus_type = 1;
ORI	R2, R0, 1
SH	R2, Offset(_bonus_type+0)(GP)
;minisub_main.c,1951 :: 		TFT_Set_Pen(bgColor, 1);
ORI	R26, R0, 1
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Set_Pen+0
NOP	
;minisub_main.c,1954 :: 		TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
LH	R26, Offset(_bgColor+0)(GP)
ORI	R25, R0, 1
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_main.c,1957 :: 		TFT_Fill_Screen(bgColor);
LH	R25, Offset(_bgColor+0)(GP)
JAL	_TFT_Fill_Screen+0
NOP	
;minisub_main.c,1959 :: 		}
L_end_InitSprites:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _InitSprites
_SavePreviousVal:
;minisub_main.c,1962 :: 		void SavePreviousVal(){
;minisub_main.c,1963 :: 		int mine_inc = 0;
;minisub_main.c,1966 :: 		prev_score = score;
LH	R2, Offset(_score+0)(GP)
SH	R2, Offset(_prev_score+0)(GP)
;minisub_main.c,1969 :: 		sub.prev_x = sub.x;
LH	R2, Offset(_sub+0)(GP)
SH	R2, Offset(_sub+4)(GP)
;minisub_main.c,1970 :: 		sub.prev_y = sub.y;
LH	R2, Offset(_sub+2)(GP)
SH	R2, Offset(_sub+6)(GP)
;minisub_main.c,1973 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
; mine_inc start address is: 16 (R4)
MOVZ	R4, R0, R0
; mine_inc end address is: 16 (R4)
L_SavePreviousVal246:
; mine_inc start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__SavePreviousVal568
NOP	
J	L_SavePreviousVal247
NOP	
L__SavePreviousVal568:
;minisub_main.c,1974 :: 		mine[mine_inc].prev_x = mine[mine_inc].x;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 8
ADDIU	R2, R2, 4
LH	R2, 0(R2)
SH	R2, 0(R3)
;minisub_main.c,1975 :: 		mine[mine_inc].prev_y = mine[mine_inc].y;
SEH	R3, R4
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R3, R2, 10
ADDIU	R2, R2, 6
LH	R2, 0(R2)
SH	R2, 0(R3)
;minisub_main.c,1973 :: 		for(mine_inc = 0; mine_inc <= (NUMBER_OF_SEA_MINES-1); mine_inc++){
ADDIU	R2, R4, 1
SEH	R4, R2
;minisub_main.c,1976 :: 		}
; mine_inc end address is: 16 (R4)
J	L_SavePreviousVal246
NOP	
L_SavePreviousVal247:
;minisub_main.c,1979 :: 		torpedo.prev_x = torpedo.x;
LH	R2, Offset(_torpedo+4)(GP)
SH	R2, Offset(_torpedo+8)(GP)
;minisub_main.c,1980 :: 		torpedo.prev_y = torpedo.y;
LH	R2, Offset(_torpedo+6)(GP)
SH	R2, Offset(_torpedo+10)(GP)
;minisub_main.c,1983 :: 		bonus_block.prev_x = bonus_block.x;
LH	R2, Offset(_bonus_block+4)(GP)
SH	R2, Offset(_bonus_block+8)(GP)
;minisub_main.c,1984 :: 		bonus_block.prev_y = bonus_block.y;
LH	R2, Offset(_bonus_block+6)(GP)
SH	R2, Offset(_bonus_block+10)(GP)
;minisub_main.c,1987 :: 		prev_torpedo_count = torpedo_count;
LH	R2, Offset(_torpedo_count+0)(GP)
SH	R2, Offset(_prev_torpedo_count+0)(GP)
;minisub_main.c,1988 :: 		prev_subLives = subLives;
LH	R2, Offset(_subLives+0)(GP)
SH	R2, Offset(_prev_subLives+0)(GP)
;minisub_main.c,1991 :: 		destroyed_mine_id = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_destroyed_mine_id+0)(GP)
;minisub_main.c,1994 :: 		bonus_id = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_bonus_id+0)(GP)
;minisub_main.c,1997 :: 		prev_level = level;
LH	R2, Offset(_level+0)(GP)
SH	R2, Offset(_prev_level+0)(GP)
;minisub_main.c,2000 :: 		prev_muteSound = muteSound;
LH	R2, Offset(_muteSound+0)(GP)
SH	R2, Offset(_prev_muteSound+0)(GP)
;minisub_main.c,2002 :: 		}
L_end_SavePreviousVal:
JR	RA
NOP	
; end of _SavePreviousVal
_IsCollision:
;minisub_main.c,2007 :: 		unsigned int Bomb_Left, unsigned int Bomb_Top, unsigned int Bomb_Width, unsigned int Bomb_Height) {
;minisub_main.c,2011 :: 		if( ((Shape_X + Shape_Width) >= Bomb_Left )               &&              ((Shape_X) <= (Bomb_Left + Bomb_Width-1)) &&
; Bomb_Left start address is: 16 (R4)
LHU	R4, 0(SP)
; Bomb_Top start address is: 20 (R5)
LHU	R5, 2(SP)
; Bomb_Width start address is: 24 (R6)
LHU	R6, 4(SP)
; Bomb_Height start address is: 28 (R7)
LHU	R7, 6(SP)
ADDU	R2, R25, R27
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__IsCollision570
NOP	
J	L__IsCollision288
NOP	
L__IsCollision570:
ADDU	R2, R4, R6
; Bomb_Left end address is: 16 (R4)
; Bomb_Width end address is: 24 (R6)
ADDIU	R2, R2, -1
ANDI	R3, R25, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__IsCollision571
NOP	
J	L__IsCollision287
NOP	
L__IsCollision571:
;minisub_main.c,2016 :: 		((Shape_Y + Shape_Height) >= Bomb_Top )                   &&               ((Shape_Y) <= (Bomb_Top + Bomb_Height-1))  ) {
ADDU	R2, R26, R28
ANDI	R3, R2, 65535
ANDI	R2, R5, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__IsCollision572
NOP	
J	L__IsCollision286
NOP	
L__IsCollision572:
ADDU	R2, R5, R7
; Bomb_Top end address is: 20 (R5)
; Bomb_Height end address is: 28 (R7)
ADDIU	R2, R2, -1
ANDI	R3, R26, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L__IsCollision573
NOP	
J	L__IsCollision285
NOP	
L__IsCollision573:
L__IsCollision284:
;minisub_main.c,2023 :: 		return 1;
ORI	R2, R0, 1
J	L_end_IsCollision
NOP	
;minisub_main.c,2011 :: 		if( ((Shape_X + Shape_Width) >= Bomb_Left )               &&              ((Shape_X) <= (Bomb_Left + Bomb_Width-1)) &&
L__IsCollision288:
L__IsCollision287:
;minisub_main.c,2016 :: 		((Shape_Y + Shape_Height) >= Bomb_Top )                   &&               ((Shape_Y) <= (Bomb_Top + Bomb_Height-1))  ) {
L__IsCollision286:
L__IsCollision285:
;minisub_main.c,2029 :: 		return 0;
MOVZ	R2, R0, R0
;minisub_main.c,2032 :: 		}
L_end_IsCollision:
JR	RA
NOP	
; end of _IsCollision
_GetNextSong:
;minisub_main.c,2036 :: 		void GetNextSong(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,2037 :: 		UART1_Write_Line("Switching to the next song.");
SW	R25, 4(SP)
LUI	R25, #hi_addr(?lstr44_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr44_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,2039 :: 		Load_MP3_File("Pavese.mp3");
LUI	R25, #hi_addr(?lstr45_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr45_minisub_main+0)
JAL	_Load_MP3_File+0
NOP	
;minisub_main.c,2042 :: 		if(current_pos < 10){
LW	R2, Offset(_current_pos+0)(GP)
SLTI	R2, R2, 10
BNE	R2, R0, L__GetNextSong575
NOP	
J	L_GetNextSong253
NOP	
L__GetNextSong575:
;minisub_main.c,2043 :: 		PreRollSong();
JAL	_PreRollSong+0
NOP	
;minisub_main.c,2044 :: 		}
L_GetNextSong253:
;minisub_main.c,2046 :: 		}
L_end_GetNextSong:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetNextSong
_PreRollSong:
;minisub_main.c,2049 :: 		void PreRollSong(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,2050 :: 		int roll = 0;
;minisub_main.c,2051 :: 		int roll_max = 100;   //120
ORI	R30, R0, 100
SH	R30, 6(SP)
;minisub_main.c,2054 :: 		for(roll = 0; roll<=roll_max;roll++){
SH	R0, 4(SP)
L_PreRollSong254:
LH	R3, 6(SP)
LH	R2, 4(SP)
SLT	R2, R3, R2
BEQ	R2, R0, L__PreRollSong577
NOP	
J	L_PreRollSong255
NOP	
L__PreRollSong577:
;minisub_main.c,2055 :: 		Play_MP3_Chunk();
JAL	_Play_MP3_Chunk+0
NOP	
;minisub_main.c,2054 :: 		for(roll = 0; roll<=roll_max;roll++){
LH	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
;minisub_main.c,2056 :: 		}
J	L_PreRollSong254
NOP	
L_PreRollSong255:
;minisub_main.c,2057 :: 		}
L_end_PreRollSong:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _PreRollSong
_ToggleMute:
;minisub_main.c,2060 :: 		void ToggleMute(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_main.c,2062 :: 		if(muteSound){
SW	R25, 4(SP)
LH	R2, Offset(_muteSound+0)(GP)
BNE	R2, R0, L__ToggleMute580
NOP	
J	L_ToggleMute257
NOP	
L__ToggleMute580:
;minisub_main.c,2063 :: 		muteSound = 0;
SH	R0, Offset(_muteSound+0)(GP)
;minisub_main.c,2064 :: 		UART1_Write_Line("Sound On");
LUI	R25, #hi_addr(?lstr46_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr46_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,2065 :: 		PreRollSong();
JAL	_PreRollSong+0
NOP	
;minisub_main.c,2066 :: 		}
J	L_ToggleMute258
NOP	
L_ToggleMute257:
;minisub_main.c,2067 :: 		else if(!muteSound){
LH	R2, Offset(_muteSound+0)(GP)
BEQ	R2, R0, L__ToggleMute581
NOP	
J	L_ToggleMute259
NOP	
L__ToggleMute581:
;minisub_main.c,2069 :: 		muteSound = 1;
ORI	R2, R0, 1
SH	R2, Offset(_muteSound+0)(GP)
;minisub_main.c,2070 :: 		UART1_Write_Line("Muting Sound");
LUI	R25, #hi_addr(?lstr47_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr47_minisub_main+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_main.c,2071 :: 		}
L_ToggleMute259:
L_ToggleMute258:
;minisub_main.c,2073 :: 		}
L_end_ToggleMute:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _ToggleMute
_AnimateSeaMine:
;minisub_main.c,2079 :: 		void AnimateSeaMine(int mineNum){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_main.c,2080 :: 		unsigned long the_frame = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
;minisub_main.c,2083 :: 		the_frame = (frame_counter + mineNum) % 6;
SEH	R3, R25
LW	R2, Offset(_frame_counter+0)(GP)
ADDU	R3, R2, R3
ORI	R2, R0, 6
DIVU	R3, R2
MFHI	R2
; the_frame start address is: 16 (R4)
MOVZ	R4, R2, R0
;minisub_main.c,2087 :: 		if(mine[mineNum].type == 0) {
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 14
LH	R2, 0(R2)
SEH	R2, R2
BEQ	R2, R0, L__AnimateSeaMine583
NOP	
J	L_AnimateSeaMine260
NOP	
L__AnimateSeaMine583:
;minisub_main.c,2090 :: 		switch (the_frame) {
J	L_AnimateSeaMine261
NOP	
; the_frame end address is: 16 (R4)
;minisub_main.c,2091 :: 		case 0 :
L_AnimateSeaMine263:
;minisub_main.c,2092 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine6_bmp, 1);
LUI	R5, #hi_addr(_mine6_bmp+0)
ORI	R5, R5, #lo_addr(_mine6_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2093 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2095 :: 		case 1 :
L_AnimateSeaMine264:
;minisub_main.c,2096 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine5_bmp, 1);
LUI	R5, #hi_addr(_mine5_bmp+0)
ORI	R5, R5, #lo_addr(_mine5_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2097 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2099 :: 		case 2 :
L_AnimateSeaMine265:
;minisub_main.c,2100 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine4_bmp, 1);
LUI	R5, #hi_addr(_mine4_bmp+0)
ORI	R5, R5, #lo_addr(_mine4_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2101 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2103 :: 		case 3 :
L_AnimateSeaMine266:
;minisub_main.c,2104 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine3_bmp, 1);
LUI	R5, #hi_addr(_mine3_bmp+0)
ORI	R5, R5, #lo_addr(_mine3_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2105 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2107 :: 		case 4 :
L_AnimateSeaMine267:
;minisub_main.c,2108 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine2_bmp, 1);
LUI	R5, #hi_addr(_mine2_bmp+0)
ORI	R5, R5, #lo_addr(_mine2_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2109 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2111 :: 		case 5 :
L_AnimateSeaMine268:
;minisub_main.c,2112 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine1_bmp, 1);
LUI	R5, #hi_addr(_mine1_bmp+0)
ORI	R5, R5, #lo_addr(_mine1_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2113 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2115 :: 		default:
L_AnimateSeaMine269:
;minisub_main.c,2116 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, mine1_bmp, 1);
LUI	R5, #hi_addr(_mine1_bmp+0)
ORI	R5, R5, #lo_addr(_mine1_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2117 :: 		break;
J	L_AnimateSeaMine262
NOP	
;minisub_main.c,2118 :: 		}
L_AnimateSeaMine261:
; the_frame start address is: 16 (R4)
BNE	R4, R0, L__AnimateSeaMine585
NOP	
J	L_AnimateSeaMine263
NOP	
L__AnimateSeaMine585:
ORI	R2, R0, 1
BNE	R4, R2, L__AnimateSeaMine587
NOP	
J	L_AnimateSeaMine264
NOP	
L__AnimateSeaMine587:
ORI	R2, R0, 2
BNE	R4, R2, L__AnimateSeaMine589
NOP	
J	L_AnimateSeaMine265
NOP	
L__AnimateSeaMine589:
ORI	R2, R0, 3
BNE	R4, R2, L__AnimateSeaMine591
NOP	
J	L_AnimateSeaMine266
NOP	
L__AnimateSeaMine591:
ORI	R2, R0, 4
BNE	R4, R2, L__AnimateSeaMine593
NOP	
J	L_AnimateSeaMine267
NOP	
L__AnimateSeaMine593:
ORI	R2, R0, 5
BNE	R4, R2, L__AnimateSeaMine595
NOP	
J	L_AnimateSeaMine268
NOP	
L__AnimateSeaMine595:
; the_frame end address is: 16 (R4)
J	L_AnimateSeaMine269
NOP	
L_AnimateSeaMine262:
;minisub_main.c,2120 :: 		}
J	L_AnimateSeaMine270
NOP	
L_AnimateSeaMine260:
;minisub_main.c,2124 :: 		switch (the_frame) {
; the_frame start address is: 16 (R4)
J	L_AnimateSeaMine271
NOP	
; the_frame end address is: 16 (R4)
;minisub_main.c,2125 :: 		case 0 :
L_AnimateSeaMine273:
;minisub_main.c,2126 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine6_bmp, 1);
LUI	R5, #hi_addr(_dark_mine6_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine6_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2127 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2129 :: 		case 1 :
L_AnimateSeaMine274:
;minisub_main.c,2130 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine5_bmp, 1);
LUI	R5, #hi_addr(_dark_mine5_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine5_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2131 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2133 :: 		case 2 :
L_AnimateSeaMine275:
;minisub_main.c,2134 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine4_bmp, 1);
LUI	R5, #hi_addr(_dark_mine4_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine4_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2135 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2137 :: 		case 3 :
L_AnimateSeaMine276:
;minisub_main.c,2138 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine3_bmp, 1);
LUI	R5, #hi_addr(_dark_mine3_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine3_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2139 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2141 :: 		case 4 :
L_AnimateSeaMine277:
;minisub_main.c,2142 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine2_bmp, 1);
LUI	R5, #hi_addr(_dark_mine2_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine2_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2143 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2145 :: 		case 5 :
L_AnimateSeaMine278:
;minisub_main.c,2146 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine1_bmp, 1);
LUI	R5, #hi_addr(_dark_mine1_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine1_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2147 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2149 :: 		default:
L_AnimateSeaMine279:
;minisub_main.c,2150 :: 		TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine1_bmp, 1);
LUI	R5, #hi_addr(_dark_mine1_bmp+0)
ORI	R5, R5, #lo_addr(_dark_mine1_bmp+0)
SEH	R3, R25
ORI	R2, R0, 18
MULTU	R2, R3
MFLO	R3
LUI	R2, #hi_addr(_mine+0)
ORI	R2, R2, #lo_addr(_mine+0)
ADDU	R4, R2, R3
ADDIU	R2, R4, 6
LH	R3, 0(R2)
ADDIU	R2, R4, 4
LH	R2, 0(R2)
ORI	R28, R0, 1
MOVZ	R27, R5, R0
SEH	R26, R3
SEH	R25, R2
JAL	_TFT_Image+0
NOP	
;minisub_main.c,2151 :: 		break;
J	L_AnimateSeaMine272
NOP	
;minisub_main.c,2152 :: 		}
L_AnimateSeaMine271:
; the_frame start address is: 16 (R4)
BNE	R4, R0, L__AnimateSeaMine597
NOP	
J	L_AnimateSeaMine273
NOP	
L__AnimateSeaMine597:
ORI	R2, R0, 1
BNE	R4, R2, L__AnimateSeaMine599
NOP	
J	L_AnimateSeaMine274
NOP	
L__AnimateSeaMine599:
ORI	R2, R0, 2
BNE	R4, R2, L__AnimateSeaMine601
NOP	
J	L_AnimateSeaMine275
NOP	
L__AnimateSeaMine601:
ORI	R2, R0, 3
BNE	R4, R2, L__AnimateSeaMine603
NOP	
J	L_AnimateSeaMine276
NOP	
L__AnimateSeaMine603:
ORI	R2, R0, 4
BNE	R4, R2, L__AnimateSeaMine605
NOP	
J	L_AnimateSeaMine277
NOP	
L__AnimateSeaMine605:
ORI	R2, R0, 5
BNE	R4, R2, L__AnimateSeaMine607
NOP	
J	L_AnimateSeaMine278
NOP	
L__AnimateSeaMine607:
; the_frame end address is: 16 (R4)
J	L_AnimateSeaMine279
NOP	
L_AnimateSeaMine272:
;minisub_main.c,2154 :: 		}
L_AnimateSeaMine270:
;minisub_main.c,2158 :: 		}
L_end_AnimateSeaMine:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _AnimateSeaMine
_Startup_Volume:
;minisub_main.c,2162 :: 		void Startup_Volume( char vol){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;minisub_main.c,2163 :: 		sound_level = vol;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, Offset(_sound_level+0)(GP)
;minisub_main.c,2164 :: 		MP3_Set_Volume(100 - sound_level, 100 - sound_level);
ORI	R2, R0, 100
SUBU	R2, R2, R25
ANDI	R26, R2, 255
ANDI	R25, R2, 255
JAL	_MP3_Set_Volume+0
NOP	
;minisub_main.c,2165 :: 		UpdateVolumeBar(sound_level, old_sound_level);
LBU	R26, Offset(_old_sound_level+0)(GP)
LBU	R25, Offset(_sound_level+0)(GP)
JAL	_UpdateVolumeBar+0
NOP	
;minisub_main.c,2166 :: 		UART1_Write_Label_Var("Sound Volume:", sound_level );
LBU	R26, Offset(_sound_level+0)(GP)
LUI	R25, #hi_addr(?lstr48_minisub_main+0)
ORI	R25, R25, #lo_addr(?lstr48_minisub_main+0)
JAL	_UART1_Write_Label_Var+0
NOP	
;minisub_main.c,2167 :: 		}
L_end_Startup_Volume:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Startup_Volume
_UART1_Write_Label_Var:
;minisub_main.c,2172 :: 		void UART1_Write_Label_Var(char *uart_text, int var ) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_main.c,2175 :: 		UART1_Write_Text(uart_text);
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2176 :: 		IntToStr(var, var_txt);
ADDIU	R2, SP, 12
SEH	R25, R26
MOVZ	R26, R2, R0
JAL	_IntToStr+0
NOP	
;minisub_main.c,2177 :: 		UART1_Write_Text(var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2178 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2179 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2180 :: 		}
L_end_UART1_Write_Label_Var:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _UART1_Write_Label_Var
_UART1_Write_Label_Long_Var:
;minisub_main.c,2184 :: 		void UART1_Write_Label_Long_Var(char *uart_text, long var){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;minisub_main.c,2187 :: 		UART1_Write_Text(uart_text);
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2188 :: 		LongToStr(var, var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_LongToStr+0
NOP	
;minisub_main.c,2189 :: 		UART1_Write_Text(var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2190 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2191 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2192 :: 		}
L_end_UART1_Write_Label_Long_Var:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _UART1_Write_Label_Long_Var
_UART1_Write_Label_Float_Var:
;minisub_main.c,2195 :: 		void UART1_Write_Label_Float_Var(char *uart_text, float var){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;minisub_main.c,2198 :: 		UART1_Write_Text(uart_text);
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2199 :: 		FloatToStr(var, var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R26, R0
MOVZ	R26, R2, R0
JAL	_FloatToStr+0
NOP	
;minisub_main.c,2200 :: 		UART1_Write_Text(var_txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;minisub_main.c,2201 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2202 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;minisub_main.c,2203 :: 		}
L_end_UART1_Write_Label_Float_Var:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _UART1_Write_Label_Float_Var
