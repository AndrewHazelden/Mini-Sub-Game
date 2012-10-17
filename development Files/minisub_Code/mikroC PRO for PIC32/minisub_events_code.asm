_RefreshMenu:
;minisub_events_code.c,30 :: 		void RefreshMenu(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_events_code.c,33 :: 		if(score){
SW	R25, 4(SP)
LH	R2, Offset(_score+0)(GP)
BNE	R2, R0, L__RefreshMenu10
NOP	
J	L_RefreshMenu0
NOP	
L__RefreshMenu10:
;minisub_events_code.c,35 :: 		ResumeButton.Visible =1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+18)(GP)
;minisub_events_code.c,36 :: 		}
J	L_RefreshMenu1
NOP	
L_RefreshMenu0:
;minisub_events_code.c,40 :: 		ResumeButton.Visible =0;
SB	R0, Offset(_ResumeButton+18)(GP)
;minisub_events_code.c,41 :: 		}
L_RefreshMenu1:
;minisub_events_code.c,44 :: 		DrawScreen(&MenuScreen);
LUI	R25, #hi_addr(_MenuScreen+0)
ORI	R25, R25, #lo_addr(_MenuScreen+0)
JAL	_DrawScreen+0
NOP	
;minisub_events_code.c,45 :: 		}
L_end_RefreshMenu:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _RefreshMenu
_HideTftMenu:
;minisub_events_code.c,47 :: 		void HideTftMenu(){
;minisub_events_code.c,48 :: 		show_main_menu=0;
SH	R0, Offset(_show_main_menu+0)(GP)
;minisub_events_code.c,49 :: 		toggled_main_menu=1;
ORI	R2, R0, 1
SH	R2, Offset(_toggled_main_menu+0)(GP)
;minisub_events_code.c,50 :: 		}
L_end_HideTftMenu:
JR	RA
NOP	
; end of _HideTftMenu
_UpdateVolumeBar:
;minisub_events_code.c,52 :: 		void UpdateVolumeBar(char vol, char old_vol){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_events_code.c,55 :: 		ProgressBar1.Position = vol;
SW	R25, 4(SP)
ANDI	R2, R25, 255
SH	R2, Offset(_ProgressBar1+48)(GP)
;minisub_events_code.c,56 :: 		DrawProgressBar(&ProgressBar1);
LUI	R25, #hi_addr(_ProgressBar1+0)
ORI	R25, R25, #lo_addr(_ProgressBar1+0)
JAL	_DrawProgressBar+0
NOP	
;minisub_events_code.c,58 :: 		}
L_end_UpdateVolumeBar:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _UpdateVolumeBar
_NewGameButtonOnUp:
;minisub_events_code.c,66 :: 		void NewGameButtonOnUp() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_events_code.c,67 :: 		HideTftMenu();
JAL	_HideTftMenu+0
NOP	
;minisub_events_code.c,69 :: 		ResetGame();
JAL	_ResetGame+0
NOP	
;minisub_events_code.c,70 :: 		}
L_end_NewGameButtonOnUp:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NewGameButtonOnUp
_HelpButtonOnUp:
;minisub_events_code.c,72 :: 		void HelpButtonOnUp() {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_events_code.c,73 :: 		start_game_flag=0;
SW	R25, 4(SP)
SH	R0, Offset(_start_game_flag+0)(GP)
;minisub_events_code.c,74 :: 		ShowHelp();
JAL	_ShowHelp+0
NOP	
;minisub_events_code.c,75 :: 		DrawScreen(&MenuScreen);
LUI	R25, #hi_addr(_MenuScreen+0)
ORI	R25, R25, #lo_addr(_MenuScreen+0)
JAL	_DrawScreen+0
NOP	
;minisub_events_code.c,76 :: 		}
L_end_HelpButtonOnUp:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _HelpButtonOnUp
_ResumeButtonOnUp:
;minisub_events_code.c,83 :: 		void ResumeButtonOnUp() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_events_code.c,84 :: 		HideTftMenu();
JAL	_HideTftMenu+0
NOP	
;minisub_events_code.c,85 :: 		Delay_ms(300);
LUI	R24, 122
ORI	R24, R24, 4607
L_ResumeButtonOnUp2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ResumeButtonOnUp2
NOP	
NOP	
;minisub_events_code.c,86 :: 		}
L_end_ResumeButtonOnUp:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ResumeButtonOnUp
_VolumeBoxOnPress:
;minisub_events_code.c,88 :: 		void VolumeBoxOnPress() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;minisub_events_code.c,91 :: 		temp = Xcoord - VolumeBox.Left;
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R3, Offset(_VolumeBox+6)(GP)
LHU	R2, Offset(_Xcoord+0)(GP)
SUBU	R3, R2, R3
;minisub_events_code.c,92 :: 		temp = temp * 100;
ORI	R2, R0, 100
MULTU	R3, R2
MFLO	R3
;minisub_events_code.c,93 :: 		sound_level = temp / VolumeBox.Width;
LHU	R2, Offset(_VolumeBox+10)(GP)
DIVU	R3, R2
MFLO	R3
SB	R3, Offset(_sound_level+0)(GP)
;minisub_events_code.c,94 :: 		MP3_Set_Volume(100 - sound_level, 100 - sound_level);
ORI	R2, R0, 100
SUBU	R2, R2, R3
ANDI	R26, R2, 255
ANDI	R25, R2, 255
JAL	_MP3_Set_Volume+0
NOP	
;minisub_events_code.c,96 :: 		UpdateVolumeBar(sound_level, old_sound_level);
LBU	R26, Offset(_old_sound_level+0)(GP)
LBU	R25, Offset(_sound_level+0)(GP)
JAL	_UpdateVolumeBar+0
NOP	
;minisub_events_code.c,97 :: 		UART1_Write_Label_Var("Sound Volume:", sound_level );
LBU	R26, Offset(_sound_level+0)(GP)
LUI	R25, #hi_addr(?lstr1_minisub_events_code+0)
ORI	R25, R25, #lo_addr(?lstr1_minisub_events_code+0)
JAL	_UART1_Write_Label_Var+0
NOP	
;minisub_events_code.c,98 :: 		old_sound_level = sound_level;
LBU	R2, Offset(_sound_level+0)(GP)
SB	R2, Offset(_old_sound_level+0)(GP)
;minisub_events_code.c,101 :: 		if (sound_level <= 10){
LBU	R2, Offset(_sound_level+0)(GP)
SLTIU	R2, R2, 11
BNE	R2, R0, L__VolumeBoxOnPress17
NOP	
J	L_VolumeBoxOnPress4
NOP	
L__VolumeBoxOnPress17:
;minisub_events_code.c,102 :: 		muteSound = 1;
ORI	R2, R0, 1
SH	R2, Offset(_muteSound+0)(GP)
;minisub_events_code.c,103 :: 		if(prev_muteSound == 0){
LH	R2, Offset(_prev_muteSound+0)(GP)
BEQ	R2, R0, L__VolumeBoxOnPress18
NOP	
J	L_VolumeBoxOnPress5
NOP	
L__VolumeBoxOnPress18:
;minisub_events_code.c,104 :: 		UART1_Write_Line("Muting Sound.");
LUI	R25, #hi_addr(?lstr2_minisub_events_code+0)
ORI	R25, R25, #lo_addr(?lstr2_minisub_events_code+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_events_code.c,105 :: 		}
L_VolumeBoxOnPress5:
;minisub_events_code.c,106 :: 		}
J	L_VolumeBoxOnPress6
NOP	
L_VolumeBoxOnPress4:
;minisub_events_code.c,108 :: 		muteSound = 0;
SH	R0, Offset(_muteSound+0)(GP)
;minisub_events_code.c,109 :: 		if(prev_muteSound == 1){
LH	R3, Offset(_prev_muteSound+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__VolumeBoxOnPress19
NOP	
J	L_VolumeBoxOnPress7
NOP	
L__VolumeBoxOnPress19:
;minisub_events_code.c,110 :: 		UART1_Write_Line("Sound On.");
LUI	R25, #hi_addr(?lstr3_minisub_events_code+0)
ORI	R25, R25, #lo_addr(?lstr3_minisub_events_code+0)
JAL	_UART1_Write_Line+0
NOP	
;minisub_events_code.c,111 :: 		}
L_VolumeBoxOnPress7:
;minisub_events_code.c,112 :: 		}
L_VolumeBoxOnPress6:
;minisub_events_code.c,113 :: 		}
L_end_VolumeBoxOnPress:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _VolumeBoxOnPress
