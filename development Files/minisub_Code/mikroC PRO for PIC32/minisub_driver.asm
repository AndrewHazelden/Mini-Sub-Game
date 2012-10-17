_PMPWaitBusy:
;minisub_driver.c,58 :: 		void PMPWaitBusy() {
;minisub_driver.c,59 :: 		while(PMMODEbits.BUSY);
L_PMPWaitBusy0:
LBU	R2, Offset(PMMODEbits+1)(GP)
EXT	R2, R2, 7, 1
BNE	R2, R0, L__PMPWaitBusy169
NOP	
J	L_PMPWaitBusy1
NOP	
L__PMPWaitBusy169:
J	L_PMPWaitBusy0
NOP	
L_PMPWaitBusy1:
;minisub_driver.c,60 :: 		}
L_end_PMPWaitBusy:
JR	RA
NOP	
; end of _PMPWaitBusy
_Set_Index:
;minisub_driver.c,62 :: 		void Set_Index(unsigned short index) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,63 :: 		TFT_RS = 0;
LBU	R2, Offset(LATB15_bit+1)(GP)
INS	R2, R0, 7, 1
SB	R2, Offset(LATB15_bit+1)(GP)
;minisub_driver.c,64 :: 		PMDIN = index;
ANDI	R2, R25, 255
SW	R2, Offset(PMDIN+0)(GP)
;minisub_driver.c,65 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;minisub_driver.c,66 :: 		}
L_end_Set_Index:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Set_Index
_Write_Command:
;minisub_driver.c,68 :: 		void Write_Command( unsigned short cmd ) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,69 :: 		TFT_RS = 1;
LBU	R2, Offset(LATB15_bit+1)(GP)
ORI	R2, R2, 128
SB	R2, Offset(LATB15_bit+1)(GP)
;minisub_driver.c,70 :: 		PMDIN = cmd;
ANDI	R2, R25, 255
SW	R2, Offset(PMDIN+0)(GP)
;minisub_driver.c,71 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;minisub_driver.c,72 :: 		}
L_end_Write_Command:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Write_Command
_Write_Data:
;minisub_driver.c,74 :: 		void Write_Data(unsigned int _data) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,75 :: 		TFT_RS = 1;
LBU	R2, Offset(LATB15_bit+1)(GP)
ORI	R2, R2, 128
SB	R2, Offset(LATB15_bit+1)(GP)
;minisub_driver.c,76 :: 		PMDIN = _data;
ANDI	R2, R25, 65535
SW	R2, Offset(PMDIN+0)(GP)
;minisub_driver.c,77 :: 		PMPWaitBusy();
JAL	_PMPWaitBusy+0
NOP	
;minisub_driver.c,78 :: 		}
L_end_Write_Data:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Write_Data
_Init_ADC:
;minisub_driver.c,81 :: 		void Init_ADC() {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,82 :: 		AD1PCFG = 0xFFFF;
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;minisub_driver.c,83 :: 		PCFG12_bit = 0;
LBU	R2, Offset(PCFG12_bit+1)(GP)
INS	R2, R0, 4, 1
SB	R2, Offset(PCFG12_bit+1)(GP)
;minisub_driver.c,84 :: 		PCFG13_bit = 0;
LBU	R2, Offset(PCFG13_bit+1)(GP)
INS	R2, R0, 5, 1
SB	R2, Offset(PCFG13_bit+1)(GP)
;minisub_driver.c,86 :: 		ADC1_Init();
JAL	_ADC1_Init+0
NOP	
;minisub_driver.c,87 :: 		}
L_end_Init_ADC:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_ADC
minisub_driver_InitializeTouchPanel:
;minisub_driver.c,88 :: 		static void InitializeTouchPanel() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_driver.c,89 :: 		Init_ADC();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Init_ADC+0
NOP	
;minisub_driver.c,90 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
LUI	R27, #hi_addr(_Write_Data+0)
ORI	R27, R27, #lo_addr(_Write_Data+0)
LUI	R26, #hi_addr(_Write_Command+0)
ORI	R26, R26, #lo_addr(_Write_Command+0)
LUI	R25, #hi_addr(_Set_Index+0)
ORI	R25, R25, #lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
;minisub_driver.c,91 :: 		TFT_Init(320, 240);
ORI	R26, R0, 240
ORI	R25, R0, 320
JAL	_TFT_Init+0
NOP	
;minisub_driver.c,93 :: 		TP_TFT_Init(320, 240, 13, 12);                                  // Initialize touch panel
ORI	R28, R0, 12
ORI	R27, R0, 13
ORI	R26, R0, 240
ORI	R25, R0, 320
JAL	_TP_TFT_Init+0
NOP	
;minisub_driver.c,94 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
ORI	R25, R0, 1000
JAL	_TP_TFT_Set_ADC_Threshold+0
NOP	
;minisub_driver.c,96 :: 		PenDown = 0;
SB	R0, Offset(_PenDown+0)(GP)
;minisub_driver.c,97 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;minisub_driver.c,98 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,99 :: 		}
L_end_InitializeTouchPanel:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of minisub_driver_InitializeTouchPanel
minisub_driver_InitializeObjects:
;minisub_driver.c,147 :: 		static void InitializeObjects() {
;minisub_driver.c,148 :: 		MenuScreen.Color                     = 0x0315;
ORI	R2, R0, 789
SH	R2, Offset(_MenuScreen+0)(GP)
;minisub_driver.c,149 :: 		MenuScreen.Width                     = 320;
ORI	R2, R0, 320
SH	R2, Offset(_MenuScreen+2)(GP)
;minisub_driver.c,150 :: 		MenuScreen.Height                    = 240;
ORI	R2, R0, 240
SH	R2, Offset(_MenuScreen+4)(GP)
;minisub_driver.c,151 :: 		MenuScreen.Buttons_RoundCount        = 3;
ORI	R2, R0, 3
SH	R2, Offset(_MenuScreen+8)(GP)
;minisub_driver.c,152 :: 		MenuScreen.Buttons_Round             = Screen1_Buttons_Round;
LUI	R2, #hi_addr(_Screen1_Buttons_Round+0)
ORI	R2, R2, #lo_addr(_Screen1_Buttons_Round+0)
SW	R2, Offset(_MenuScreen+12)(GP)
;minisub_driver.c,153 :: 		MenuScreen.LabelsCount               = 1;
ORI	R2, R0, 1
SH	R2, Offset(_MenuScreen+16)(GP)
;minisub_driver.c,154 :: 		MenuScreen.Labels                    = Screen1_Labels;
LUI	R2, #hi_addr(_Screen1_Labels+0)
ORI	R2, R2, #lo_addr(_Screen1_Labels+0)
SW	R2, Offset(_MenuScreen+20)(GP)
;minisub_driver.c,155 :: 		MenuScreen.BoxesCount                = 1;
ORI	R2, R0, 1
SH	R2, Offset(_MenuScreen+24)(GP)
;minisub_driver.c,156 :: 		MenuScreen.Boxes                     = Screen1_Boxes;
LUI	R2, #hi_addr(_Screen1_Boxes+0)
ORI	R2, R2, #lo_addr(_Screen1_Boxes+0)
SW	R2, Offset(_MenuScreen+28)(GP)
;minisub_driver.c,157 :: 		MenuScreen.ProgressBarsCount           = 1;
ORI	R2, R0, 1
SH	R2, Offset(_MenuScreen+32)(GP)
;minisub_driver.c,158 :: 		MenuScreen.ProgressBars                = Screen1_ProgressBars;
LUI	R2, #hi_addr(_Screen1_ProgressBars+0)
ORI	R2, R2, #lo_addr(_Screen1_ProgressBars+0)
SW	R2, Offset(_MenuScreen+36)(GP)
;minisub_driver.c,159 :: 		MenuScreen.ObjectsCount              = 6;
ORI	R2, R0, 6
SB	R2, Offset(_MenuScreen+6)(GP)
;minisub_driver.c,161 :: 		Screen1.Color                     = 0x0315;
ORI	R2, R0, 789
SH	R2, Offset(_Screen1+0)(GP)
;minisub_driver.c,162 :: 		Screen1.Width                     = 320;
ORI	R2, R0, 320
SH	R2, Offset(_Screen1+2)(GP)
;minisub_driver.c,163 :: 		Screen1.Height                    = 240;
ORI	R2, R0, 240
SH	R2, Offset(_Screen1+4)(GP)
;minisub_driver.c,164 :: 		Screen1.Buttons_RoundCount        = 0;
SH	R0, Offset(_Screen1+8)(GP)
;minisub_driver.c,165 :: 		Screen1.LabelsCount               = 0;
SH	R0, Offset(_Screen1+16)(GP)
;minisub_driver.c,166 :: 		Screen1.BoxesCount                = 0;
SH	R0, Offset(_Screen1+24)(GP)
;minisub_driver.c,167 :: 		Screen1.ProgressBarsCount           = 0;
SH	R0, Offset(_Screen1+32)(GP)
;minisub_driver.c,168 :: 		Screen1.ObjectsCount              = 0;
SB	R0, Offset(_Screen1+6)(GP)
;minisub_driver.c,171 :: 		ResumeButton.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_ResumeButton+0)(GP)
;minisub_driver.c,172 :: 		ResumeButton.Order           = 0;
SB	R0, Offset(_ResumeButton+4)(GP)
;minisub_driver.c,173 :: 		ResumeButton.Left            = 22;
ORI	R2, R0, 22
SH	R2, Offset(_ResumeButton+6)(GP)
;minisub_driver.c,174 :: 		ResumeButton.Top             = 186;
ORI	R2, R0, 186
SH	R2, Offset(_ResumeButton+8)(GP)
;minisub_driver.c,175 :: 		ResumeButton.Width           = 276;
ORI	R2, R0, 276
SH	R2, Offset(_ResumeButton+10)(GP)
;minisub_driver.c,176 :: 		ResumeButton.Height          = 48;
ORI	R2, R0, 48
SH	R2, Offset(_ResumeButton+12)(GP)
;minisub_driver.c,177 :: 		ResumeButton.Pen_Width       = 4;
ORI	R2, R0, 4
SB	R2, Offset(_ResumeButton+14)(GP)
;minisub_driver.c,178 :: 		ResumeButton.Pen_Color       = 0x0000;
SH	R0, Offset(_ResumeButton+16)(GP)
;minisub_driver.c,179 :: 		ResumeButton.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+18)(GP)
;minisub_driver.c,180 :: 		ResumeButton.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+19)(GP)
;minisub_driver.c,181 :: 		ResumeButton.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+20)(GP)
;minisub_driver.c,182 :: 		ResumeButton.Caption         = ResumeButton_Caption;
LUI	R2, #hi_addr(_ResumeButton_Caption+0)
ORI	R2, R2, #lo_addr(_ResumeButton_Caption+0)
SW	R2, Offset(_ResumeButton+24)(GP)
;minisub_driver.c,183 :: 		ResumeButton.TextAlign             = _taCenter;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+28)(GP)
;minisub_driver.c,184 :: 		ResumeButton.FontName        = Tahoma23x29_Regular;
LUI	R3, #hi_addr(_Tahoma23x29_Regular+0)
ORI	R3, R3, #lo_addr(_Tahoma23x29_Regular+0)
SW	R3, Offset(_ResumeButton+32)(GP)
;minisub_driver.c,185 :: 		ResumeButton.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+47)(GP)
;minisub_driver.c,186 :: 		ResumeButton.Font_Color      = 0x0000;
SH	R0, Offset(_ResumeButton+36)(GP)
;minisub_driver.c,187 :: 		ResumeButton.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ResumeButton+38)(GP)
;minisub_driver.c,188 :: 		ResumeButton.Gradient_Orientation    = 0;
SB	R0, Offset(_ResumeButton+39)(GP)
;minisub_driver.c,189 :: 		ResumeButton.Gradient_Start_Color    = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_ResumeButton+40)(GP)
;minisub_driver.c,190 :: 		ResumeButton.Gradient_End_Color      = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ResumeButton+42)(GP)
;minisub_driver.c,191 :: 		ResumeButton.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_ResumeButton+44)(GP)
;minisub_driver.c,192 :: 		ResumeButton.Press_Color     = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_ResumeButton+48)(GP)
;minisub_driver.c,193 :: 		ResumeButton.Corner_Radius      = 3;
ORI	R2, R0, 3
SB	R2, Offset(_ResumeButton+46)(GP)
;minisub_driver.c,194 :: 		ResumeButton.OnUpPtr         = ResumeButtonOnUp;
LUI	R2, #hi_addr(_ResumeButtonOnUp+0)
ORI	R2, R2, #lo_addr(_ResumeButtonOnUp+0)
SW	R2, Offset(_ResumeButton+52)(GP)
;minisub_driver.c,195 :: 		ResumeButton.OnDownPtr       = 0;
SW	R0, Offset(_ResumeButton+56)(GP)
;minisub_driver.c,196 :: 		ResumeButton.OnClickPtr      = 0;
SW	R0, Offset(_ResumeButton+60)(GP)
;minisub_driver.c,197 :: 		ResumeButton.OnPressPtr      = 0;
SW	R0, Offset(_ResumeButton+64)(GP)
;minisub_driver.c,199 :: 		HelpButton.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_HelpButton+0)(GP)
;minisub_driver.c,200 :: 		HelpButton.Order           = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+4)(GP)
;minisub_driver.c,201 :: 		HelpButton.Left            = 22;
ORI	R2, R0, 22
SH	R2, Offset(_HelpButton+6)(GP)
;minisub_driver.c,202 :: 		HelpButton.Top             = 125;
ORI	R2, R0, 125
SH	R2, Offset(_HelpButton+8)(GP)
;minisub_driver.c,203 :: 		HelpButton.Width           = 276;
ORI	R2, R0, 276
SH	R2, Offset(_HelpButton+10)(GP)
;minisub_driver.c,204 :: 		HelpButton.Height          = 48;
ORI	R2, R0, 48
SH	R2, Offset(_HelpButton+12)(GP)
;minisub_driver.c,205 :: 		HelpButton.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+14)(GP)
;minisub_driver.c,206 :: 		HelpButton.Pen_Color       = 0x0000;
SH	R0, Offset(_HelpButton+16)(GP)
;minisub_driver.c,207 :: 		HelpButton.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+18)(GP)
;minisub_driver.c,208 :: 		HelpButton.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+19)(GP)
;minisub_driver.c,209 :: 		HelpButton.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+20)(GP)
;minisub_driver.c,210 :: 		HelpButton.Caption         = HelpButton_Caption;
LUI	R2, #hi_addr(_HelpButton_Caption+0)
ORI	R2, R2, #lo_addr(_HelpButton_Caption+0)
SW	R2, Offset(_HelpButton+24)(GP)
;minisub_driver.c,211 :: 		HelpButton.TextAlign             = _taCenter;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+28)(GP)
;minisub_driver.c,212 :: 		HelpButton.FontName        = Tahoma23x29_Regular;
SW	R3, Offset(_HelpButton+32)(GP)
;minisub_driver.c,213 :: 		HelpButton.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+47)(GP)
;minisub_driver.c,214 :: 		HelpButton.Font_Color      = 0x0000;
SH	R0, Offset(_HelpButton+36)(GP)
;minisub_driver.c,215 :: 		HelpButton.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_HelpButton+38)(GP)
;minisub_driver.c,216 :: 		HelpButton.Gradient_Orientation    = 0;
SB	R0, Offset(_HelpButton+39)(GP)
;minisub_driver.c,217 :: 		HelpButton.Gradient_Start_Color    = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_HelpButton+40)(GP)
;minisub_driver.c,218 :: 		HelpButton.Gradient_End_Color      = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_HelpButton+42)(GP)
;minisub_driver.c,219 :: 		HelpButton.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_HelpButton+44)(GP)
;minisub_driver.c,220 :: 		HelpButton.Press_Color     = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_HelpButton+48)(GP)
;minisub_driver.c,221 :: 		HelpButton.Corner_Radius      = 3;
ORI	R2, R0, 3
SB	R2, Offset(_HelpButton+46)(GP)
;minisub_driver.c,222 :: 		HelpButton.OnUpPtr         = HelpButtonOnUp;
LUI	R2, #hi_addr(_HelpButtonOnUp+0)
ORI	R2, R2, #lo_addr(_HelpButtonOnUp+0)
SW	R2, Offset(_HelpButton+52)(GP)
;minisub_driver.c,223 :: 		HelpButton.OnDownPtr       = 0;
SW	R0, Offset(_HelpButton+56)(GP)
;minisub_driver.c,224 :: 		HelpButton.OnClickPtr      = 0;
SW	R0, Offset(_HelpButton+60)(GP)
;minisub_driver.c,225 :: 		HelpButton.OnPressPtr      = 0;
SW	R0, Offset(_HelpButton+64)(GP)
;minisub_driver.c,227 :: 		NewGameButton.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_NewGameButton+0)(GP)
;minisub_driver.c,228 :: 		NewGameButton.Order           = 2;
ORI	R2, R0, 2
SB	R2, Offset(_NewGameButton+4)(GP)
;minisub_driver.c,229 :: 		NewGameButton.Left            = 22;
ORI	R2, R0, 22
SH	R2, Offset(_NewGameButton+6)(GP)
;minisub_driver.c,230 :: 		NewGameButton.Top             = 64;
ORI	R2, R0, 64
SH	R2, Offset(_NewGameButton+8)(GP)
;minisub_driver.c,231 :: 		NewGameButton.Width           = 276;
ORI	R2, R0, 276
SH	R2, Offset(_NewGameButton+10)(GP)
;minisub_driver.c,232 :: 		NewGameButton.Height          = 48;
ORI	R2, R0, 48
SH	R2, Offset(_NewGameButton+12)(GP)
;minisub_driver.c,233 :: 		NewGameButton.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+14)(GP)
;minisub_driver.c,234 :: 		NewGameButton.Pen_Color       = 0x0000;
SH	R0, Offset(_NewGameButton+16)(GP)
;minisub_driver.c,235 :: 		NewGameButton.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+18)(GP)
;minisub_driver.c,236 :: 		NewGameButton.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+19)(GP)
;minisub_driver.c,237 :: 		NewGameButton.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+20)(GP)
;minisub_driver.c,238 :: 		NewGameButton.Caption         = NewGameButton_Caption;
LUI	R2, #hi_addr(_NewGameButton_Caption+0)
ORI	R2, R2, #lo_addr(_NewGameButton_Caption+0)
SW	R2, Offset(_NewGameButton+24)(GP)
;minisub_driver.c,239 :: 		NewGameButton.TextAlign             = _taCenter;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+28)(GP)
;minisub_driver.c,240 :: 		NewGameButton.FontName        = Tahoma23x29_Regular;
SW	R3, Offset(_NewGameButton+32)(GP)
;minisub_driver.c,241 :: 		NewGameButton.PressColEnabled = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+47)(GP)
;minisub_driver.c,242 :: 		NewGameButton.Font_Color      = 0x0000;
SH	R0, Offset(_NewGameButton+36)(GP)
;minisub_driver.c,243 :: 		NewGameButton.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_NewGameButton+38)(GP)
;minisub_driver.c,244 :: 		NewGameButton.Gradient_Orientation    = 0;
SB	R0, Offset(_NewGameButton+39)(GP)
;minisub_driver.c,245 :: 		NewGameButton.Gradient_Start_Color    = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_NewGameButton+40)(GP)
;minisub_driver.c,246 :: 		NewGameButton.Gradient_End_Color      = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_NewGameButton+42)(GP)
;minisub_driver.c,247 :: 		NewGameButton.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_NewGameButton+44)(GP)
;minisub_driver.c,248 :: 		NewGameButton.Press_Color     = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_NewGameButton+48)(GP)
;minisub_driver.c,249 :: 		NewGameButton.Corner_Radius      = 3;
ORI	R2, R0, 3
SB	R2, Offset(_NewGameButton+46)(GP)
;minisub_driver.c,250 :: 		NewGameButton.OnUpPtr         = NewGameButtonOnUp;
LUI	R2, #hi_addr(_NewGameButtonOnUp+0)
ORI	R2, R2, #lo_addr(_NewGameButtonOnUp+0)
SW	R2, Offset(_NewGameButton+52)(GP)
;minisub_driver.c,251 :: 		NewGameButton.OnDownPtr       = 0;
SW	R0, Offset(_NewGameButton+56)(GP)
;minisub_driver.c,252 :: 		NewGameButton.OnClickPtr      = 0;
SW	R0, Offset(_NewGameButton+60)(GP)
;minisub_driver.c,253 :: 		NewGameButton.OnPressPtr      = 0;
SW	R0, Offset(_NewGameButton+64)(GP)
;minisub_driver.c,255 :: 		Label1.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_Label1+0)(GP)
;minisub_driver.c,256 :: 		Label1.Order          = 3;
ORI	R2, R0, 3
SB	R2, Offset(_Label1+4)(GP)
;minisub_driver.c,257 :: 		Label1.Left           = 23;
ORI	R2, R0, 23
SH	R2, Offset(_Label1+6)(GP)
;minisub_driver.c,258 :: 		Label1.Top            = 17;
ORI	R2, R0, 17
SH	R2, Offset(_Label1+8)(GP)
;minisub_driver.c,259 :: 		Label1.Width          = 60;
ORI	R2, R0, 60
SH	R2, Offset(_Label1+10)(GP)
;minisub_driver.c,260 :: 		Label1.Height         = 21;
ORI	R2, R0, 21
SH	R2, Offset(_Label1+12)(GP)
;minisub_driver.c,261 :: 		Label1.Visible        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label1+26)(GP)
;minisub_driver.c,262 :: 		Label1.Active         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_Label1+27)(GP)
;minisub_driver.c,263 :: 		Label1.Caption        = Label1_Caption;
LUI	R2, #hi_addr(_Label1_Caption+0)
ORI	R2, R2, #lo_addr(_Label1_Caption+0)
SW	R2, Offset(_Label1+16)(GP)
;minisub_driver.c,264 :: 		Label1.FontName       = Tahoma16x19_Regular;
LUI	R2, #hi_addr(_Tahoma16x19_Regular+0)
ORI	R2, R2, #lo_addr(_Tahoma16x19_Regular+0)
SW	R2, Offset(_Label1+20)(GP)
;minisub_driver.c,265 :: 		Label1.Font_Color     = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_Label1+24)(GP)
;minisub_driver.c,266 :: 		Label1.OnUpPtr         = 0;
SW	R0, Offset(_Label1+28)(GP)
;minisub_driver.c,267 :: 		Label1.OnDownPtr       = 0;
SW	R0, Offset(_Label1+32)(GP)
;minisub_driver.c,268 :: 		Label1.OnClickPtr      = 0;
SW	R0, Offset(_Label1+36)(GP)
;minisub_driver.c,269 :: 		Label1.OnPressPtr      = 0;
SW	R0, Offset(_Label1+40)(GP)
;minisub_driver.c,271 :: 		ProgressBar1.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_ProgressBar1+0)(GP)
;minisub_driver.c,272 :: 		ProgressBar1.Order           = 4;
ORI	R2, R0, 4
SB	R2, Offset(_ProgressBar1+4)(GP)
;minisub_driver.c,273 :: 		ProgressBar1.Left            = 96;
ORI	R2, R0, 96
SH	R2, Offset(_ProgressBar1+6)(GP)
;minisub_driver.c,274 :: 		ProgressBar1.Top             = 10;
ORI	R2, R0, 10
SH	R2, Offset(_ProgressBar1+8)(GP)
;minisub_driver.c,275 :: 		ProgressBar1.Width           = 200;
ORI	R2, R0, 200
SH	R2, Offset(_ProgressBar1+10)(GP)
;minisub_driver.c,276 :: 		ProgressBar1.Height          = 36;
ORI	R2, R0, 36
SH	R2, Offset(_ProgressBar1+12)(GP)
;minisub_driver.c,277 :: 		ProgressBar1.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+14)(GP)
;minisub_driver.c,278 :: 		ProgressBar1.Pen_Color       = 0x0000;
SH	R0, Offset(_ProgressBar1+16)(GP)
;minisub_driver.c,279 :: 		ProgressBar1.Visible         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+18)(GP)
;minisub_driver.c,280 :: 		ProgressBar1.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+19)(GP)
;minisub_driver.c,281 :: 		ProgressBar1.Transparent     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+20)(GP)
;minisub_driver.c,282 :: 		ProgressBar1.Caption         = ProgressBar1_Caption;
LUI	R2, #hi_addr(_ProgressBar1_Caption+0)
ORI	R2, R2, #lo_addr(_ProgressBar1_Caption+0)
SW	R2, Offset(_ProgressBar1+24)(GP)
;minisub_driver.c,283 :: 		ProgressBar1.FontName        = Tahoma11x13_Regular;
LUI	R2, #hi_addr(_Tahoma11x13_Regular+0)
ORI	R2, R2, #lo_addr(_Tahoma11x13_Regular+0)
SW	R2, Offset(_ProgressBar1+28)(GP)
;minisub_driver.c,284 :: 		ProgressBar1.Font_Color      = 0x0000;
SH	R0, Offset(_ProgressBar1+32)(GP)
;minisub_driver.c,285 :: 		ProgressBar1.Gradient        = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+34)(GP)
;minisub_driver.c,286 :: 		ProgressBar1.Gradient_Orientation    = 0;
SB	R0, Offset(_ProgressBar1+35)(GP)
;minisub_driver.c,287 :: 		ProgressBar1.Gradient_Start_Color    = 0xF800;
ORI	R2, R0, 63488
SH	R2, Offset(_ProgressBar1+36)(GP)
;minisub_driver.c,288 :: 		ProgressBar1.Gradient_End_Color      = 0x8000;
ORI	R2, R0, 32768
SH	R2, Offset(_ProgressBar1+38)(GP)
;minisub_driver.c,289 :: 		ProgressBar1.Color           = 0xA65E;
ORI	R2, R0, 42590
SH	R2, Offset(_ProgressBar1+40)(GP)
;minisub_driver.c,290 :: 		ProgressBar1.Background_Color = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_ProgressBar1+42)(GP)
;minisub_driver.c,291 :: 		ProgressBar1.Min             = 0;
SH	R0, Offset(_ProgressBar1+44)(GP)
;minisub_driver.c,292 :: 		ProgressBar1.Max             = 100;
ORI	R2, R0, 100
SH	R2, Offset(_ProgressBar1+46)(GP)
;minisub_driver.c,293 :: 		ProgressBar1.Position        = 100;
ORI	R2, R0, 100
SH	R2, Offset(_ProgressBar1+48)(GP)
;minisub_driver.c,294 :: 		ProgressBar1.Show_Position   = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+50)(GP)
;minisub_driver.c,295 :: 		ProgressBar1.Show_Percentage = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+51)(GP)
;minisub_driver.c,296 :: 		ProgressBar1.Smooth          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+52)(GP)
;minisub_driver.c,297 :: 		ProgressBar1.Rounded         = 1;
ORI	R2, R0, 1
SB	R2, Offset(_ProgressBar1+53)(GP)
;minisub_driver.c,298 :: 		ProgressBar1.Corner_Radius      = 3;
ORI	R2, R0, 3
SB	R2, Offset(_ProgressBar1+54)(GP)
;minisub_driver.c,300 :: 		VolumeBox.OwnerScreen     = &MenuScreen;
LUI	R2, #hi_addr(_MenuScreen+0)
ORI	R2, R2, #lo_addr(_MenuScreen+0)
SW	R2, Offset(_VolumeBox+0)(GP)
;minisub_driver.c,301 :: 		VolumeBox.Order           = 5;
ORI	R2, R0, 5
SB	R2, Offset(_VolumeBox+4)(GP)
;minisub_driver.c,302 :: 		VolumeBox.Left            = 96;
ORI	R2, R0, 96
SH	R2, Offset(_VolumeBox+6)(GP)
;minisub_driver.c,303 :: 		VolumeBox.Top             = 0;
SH	R0, Offset(_VolumeBox+8)(GP)
;minisub_driver.c,304 :: 		VolumeBox.Width           = 200;
ORI	R2, R0, 200
SH	R2, Offset(_VolumeBox+10)(GP)
;minisub_driver.c,305 :: 		VolumeBox.Height          = 56;
ORI	R2, R0, 56
SH	R2, Offset(_VolumeBox+12)(GP)
;minisub_driver.c,306 :: 		VolumeBox.Pen_Width       = 1;
ORI	R2, R0, 1
SB	R2, Offset(_VolumeBox+14)(GP)
;minisub_driver.c,307 :: 		VolumeBox.Pen_Color       = 0x0000;
SH	R0, Offset(_VolumeBox+16)(GP)
;minisub_driver.c,308 :: 		VolumeBox.Visible         = 0;
SB	R0, Offset(_VolumeBox+18)(GP)
;minisub_driver.c,309 :: 		VolumeBox.Active          = 1;
ORI	R2, R0, 1
SB	R2, Offset(_VolumeBox+19)(GP)
;minisub_driver.c,310 :: 		VolumeBox.Transparent     = 0;
SB	R0, Offset(_VolumeBox+20)(GP)
;minisub_driver.c,311 :: 		VolumeBox.Gradient        = 0;
SB	R0, Offset(_VolumeBox+21)(GP)
;minisub_driver.c,312 :: 		VolumeBox.Gradient_Orientation    = 0;
SB	R0, Offset(_VolumeBox+22)(GP)
;minisub_driver.c,313 :: 		VolumeBox.Gradient_Start_Color    = 0xFFFF;
ORI	R2, R0, 65535
SH	R2, Offset(_VolumeBox+24)(GP)
;minisub_driver.c,314 :: 		VolumeBox.Gradient_End_Color      = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_VolumeBox+26)(GP)
;minisub_driver.c,315 :: 		VolumeBox.Color           = 0xC618;
ORI	R2, R0, 50712
SH	R2, Offset(_VolumeBox+28)(GP)
;minisub_driver.c,316 :: 		VolumeBox.PressColEnabled     = 1;
ORI	R2, R0, 1
SB	R2, Offset(_VolumeBox+30)(GP)
;minisub_driver.c,317 :: 		VolumeBox.Press_Color     = 0x8410;
ORI	R2, R0, 33808
SH	R2, Offset(_VolumeBox+32)(GP)
;minisub_driver.c,318 :: 		VolumeBox.OnUpPtr         = 0;
SW	R0, Offset(_VolumeBox+36)(GP)
;minisub_driver.c,319 :: 		VolumeBox.OnDownPtr       = 0;
SW	R0, Offset(_VolumeBox+40)(GP)
;minisub_driver.c,320 :: 		VolumeBox.OnClickPtr      = 0;
SW	R0, Offset(_VolumeBox+44)(GP)
;minisub_driver.c,321 :: 		VolumeBox.OnPressPtr      = VolumeBoxOnPress;
LUI	R2, #hi_addr(_VolumeBoxOnPress+0)
ORI	R2, R2, #lo_addr(_VolumeBoxOnPress+0)
SW	R2, Offset(_VolumeBox+48)(GP)
;minisub_driver.c,322 :: 		}
L_end_InitializeObjects:
JR	RA
NOP	
; end of minisub_driver_InitializeObjects
minisub_driver_IsInsideObject:
;minisub_driver.c,324 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
;minisub_driver.c,325 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
; Width start address is: 16 (R4)
LHU	R4, 0(SP)
; Height start address is: 20 (R5)
LHU	R5, 2(SP)
ANDI	R3, R27, 65535
ANDI	R2, R25, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L_minisub_driver_IsInsideObject177
NOP	
J	L_minisub_driver_IsInsideObject157
NOP	
L_minisub_driver_IsInsideObject177:
ADDU	R2, R27, R4
; Width end address is: 16 (R4)
ADDIU	R2, R2, -1
ANDI	R3, R2, 65535
ANDI	R2, R25, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L_minisub_driver_IsInsideObject178
NOP	
J	L_minisub_driver_IsInsideObject156
NOP	
L_minisub_driver_IsInsideObject178:
;minisub_driver.c,326 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
ANDI	R3, R28, 65535
ANDI	R2, R26, 65535
SLTU	R2, R2, R3
BEQ	R2, R0, L_minisub_driver_IsInsideObject179
NOP	
J	L_minisub_driver_IsInsideObject155
NOP	
L_minisub_driver_IsInsideObject179:
ADDU	R2, R28, R5
; Height end address is: 20 (R5)
ADDIU	R2, R2, -1
ANDI	R3, R2, 65535
ANDI	R2, R26, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L_minisub_driver_IsInsideObject180
NOP	
J	L_minisub_driver_IsInsideObject154
NOP	
L_minisub_driver_IsInsideObject180:
L_minisub_driver_IsInsideObject153:
;minisub_driver.c,327 :: 		return 1;
ORI	R2, R0, 1
J	L_end_IsInsideObject
NOP	
;minisub_driver.c,325 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_minisub_driver_IsInsideObject157:
L_minisub_driver_IsInsideObject156:
;minisub_driver.c,326 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_minisub_driver_IsInsideObject155:
L_minisub_driver_IsInsideObject154:
;minisub_driver.c,329 :: 		return 0;
MOVZ	R2, R0, R0
;minisub_driver.c,330 :: 		}
L_end_IsInsideObject:
JR	RA
NOP	
; end of minisub_driver_IsInsideObject
_DeleteTrailingSpaces:
;minisub_driver.c,338 :: 		void DeleteTrailingSpaces(char* str){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,341 :: 		while(1) {
L_DeleteTrailingSpaces6:
;minisub_driver.c,342 :: 		if(str[0] == ' ') {
LBU	R2, 0(R25)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BEQ	R3, R2, L__DeleteTrailingSpaces182
NOP	
J	L_DeleteTrailingSpaces8
NOP	
L__DeleteTrailingSpaces182:
;minisub_driver.c,343 :: 		for(i = 0; i < strlen(str); i++) {
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_DeleteTrailingSpaces9:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
ANDI	R3, R5, 255
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__DeleteTrailingSpaces183
NOP	
J	L_DeleteTrailingSpaces10
NOP	
L__DeleteTrailingSpaces183:
;minisub_driver.c,344 :: 		str[i] = str[i+1];
ANDI	R2, R5, 255
ADDU	R3, R25, R2
ANDI	R2, R5, 255
ADDIU	R2, R2, 1
SEH	R2, R2
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;minisub_driver.c,343 :: 		for(i = 0; i < strlen(str); i++) {
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;minisub_driver.c,345 :: 		}
; i end address is: 20 (R5)
J	L_DeleteTrailingSpaces9
NOP	
L_DeleteTrailingSpaces10:
;minisub_driver.c,346 :: 		}
J	L_DeleteTrailingSpaces12
NOP	
L_DeleteTrailingSpaces8:
;minisub_driver.c,348 :: 		break;
J	L_DeleteTrailingSpaces7
NOP	
L_DeleteTrailingSpaces12:
;minisub_driver.c,349 :: 		}
J	L_DeleteTrailingSpaces6
NOP	
L_DeleteTrailingSpaces7:
;minisub_driver.c,350 :: 		}
L_end_DeleteTrailingSpaces:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _DeleteTrailingSpaces
_DrawRoundButton:
;minisub_driver.c,352 :: 		void DrawRoundButton(TButton_Round *Around_button) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_driver.c,353 :: 		if (Around_button->Visible == 1) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton185
NOP	
J	L_DrawRoundButton13
NOP	
L__DrawRoundButton185:
;minisub_driver.c,354 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton186
NOP	
J	L_DrawRoundButton14
NOP	
L__DrawRoundButton186:
;minisub_driver.c,355 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;minisub_driver.c,357 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	R2, R25, 40
LHU	R7, 0(R2)
ADDIU	R2, R25, 42
LHU	R6, 0(R2)
;minisub_driver.c,356 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 39
LBU	R5, 0(R2)
ADDIU	R2, R25, 38
LBU	R4, 0(R2)
ADDIU	R2, R25, 48
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;minisub_driver.c,357 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_driver.c,356 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;minisub_driver.c,358 :: 		}
J	L_DrawRoundButton15
NOP	
L_DrawRoundButton14:
;minisub_driver.c,361 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	R2, R25, 42
LHU	R7, 0(R2)
ADDIU	R2, R25, 40
LHU	R6, 0(R2)
;minisub_driver.c,360 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDIU	R2, R25, 39
LBU	R5, 0(R2)
ADDIU	R2, R25, 38
LBU	R4, 0(R2)
ADDIU	R2, R25, 44
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
;minisub_driver.c,361 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
;minisub_driver.c,360 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LW	R25, 20(SP)
;minisub_driver.c,362 :: 		}
L_DrawRoundButton15:
;minisub_driver.c,363 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,364 :: 		if (Around_button->Height > Around_button->Width) {
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawRoundButton187
NOP	
J	L_DrawRoundButton16
NOP	
L__DrawRoundButton187:
;minisub_driver.c,367 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDIU	R2, R25, 46
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, -2
;minisub_driver.c,366 :: 		Around_button->Left + Around_button->Width - 2,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -2
;minisub_driver.c,365 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDIU	R3, R3, 1
ADDIU	R2, R5, 1
;minisub_driver.c,367 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;minisub_driver.c,366 :: 		Around_button->Left + Around_button->Width - 2,
ANDI	R27, R4, 65535
;minisub_driver.c,365 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;minisub_driver.c,367 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;minisub_driver.c,368 :: 		}
J	L_DrawRoundButton17
NOP	
L_DrawRoundButton16:
;minisub_driver.c,373 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDIU	R2, R25, 46
LBU	R7, 0(R2)
ADDIU	R2, R25, 8
LHU	R3, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R6, R2, -2
;minisub_driver.c,372 :: 		Around_button->Left + Around_button->Width - 2,
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -2
;minisub_driver.c,371 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDIU	R3, R3, 1
ADDIU	R2, R5, 1
;minisub_driver.c,373 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
SW	R25, 20(SP)
ANDI	R28, R6, 65535
;minisub_driver.c,372 :: 		Around_button->Left + Around_button->Width - 2,
ANDI	R27, R4, 65535
;minisub_driver.c,371 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
;minisub_driver.c,373 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ANDI	R2, R7, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;minisub_driver.c,374 :: 		}
L_DrawRoundButton17:
;minisub_driver.c,375 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 36
LHU	R3, 0(R2)
ADDIU	R2, R25, 32
LW	R2, 0(R2)
SW	R25, 20(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,376 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,377 :: 		if (Around_button->TextAlign == _taLeft)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__DrawRoundButton188
NOP	
J	L_DrawRoundButton18
NOP	
L__DrawRoundButton188:
;minisub_driver.c,378 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R4, R4, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, R2, 4
ADDIU	R2, R25, 24
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
J	L_DrawRoundButton19
NOP	
L_DrawRoundButton18:
;minisub_driver.c,379 :: 		else if (Around_button->TextAlign == _taCenter)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawRoundButton189
NOP	
J	L_DrawRoundButton20
NOP	
L__DrawRoundButton189:
;minisub_driver.c,380 :: 		TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R5, R4, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
ADDIU	R2, R25, 24
LW	R2, 0(R2)
ANDI	R27, R5, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
J	L_DrawRoundButton21
NOP	
L_DrawRoundButton20:
;minisub_driver.c,381 :: 		else if (Around_button->TextAlign == _taRight)
ADDIU	R2, R25, 28
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 2
BEQ	R3, R2, L__DrawRoundButton190
NOP	
J	L_DrawRoundButton22
NOP	
L__DrawRoundButton190:
;minisub_driver.c,382 :: 		TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R5, R4, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ADDIU	R2, R2, -4
ADDU	R3, R4, R2
ADDIU	R2, R25, 24
LW	R2, 0(R2)
ANDI	R27, R5, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
L_DrawRoundButton22:
L_DrawRoundButton21:
L_DrawRoundButton19:
;minisub_driver.c,383 :: 		}
L_DrawRoundButton13:
;minisub_driver.c,384 :: 		}
L_end_DrawRoundButton:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawRoundButton
_DrawLabel:
;minisub_driver.c,386 :: 		void DrawLabel(TLabel *ALabel) {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_driver.c,387 :: 		if (ALabel->Visible == 1) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, R25, 26
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawLabel192
NOP	
J	L_DrawLabel23
NOP	
L__DrawLabel192:
;minisub_driver.c,388 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 24
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,389 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 16
LW	R2, 0(R2)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
;minisub_driver.c,390 :: 		}
L_DrawLabel23:
;minisub_driver.c,391 :: 		}
L_end_DrawLabel:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _DrawLabel
_DrawBox:
;minisub_driver.c,393 :: 		void DrawBox(TBox *ABox) {
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;minisub_driver.c,394 :: 		if (ABox->Visible == 1) {
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawBox194
NOP	
J	L_DrawBox24
NOP	
L__DrawBox194:
;minisub_driver.c,395 :: 		if (object_pressed == 1) {
LBU	R3, Offset(_object_pressed+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawBox195
NOP	
J	L_DrawBox25
NOP	
L__DrawBox195:
;minisub_driver.c,396 :: 		object_pressed = 0;
SB	R0, Offset(_object_pressed+0)(GP)
;minisub_driver.c,397 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDIU	R2, R25, 24
LHU	R7, 0(R2)
ADDIU	R2, R25, 26
LHU	R6, 0(R2)
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 32
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;minisub_driver.c,398 :: 		}
J	L_DrawBox26
NOP	
L_DrawBox25:
;minisub_driver.c,400 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDIU	R2, R25, 26
LHU	R7, 0(R2)
ADDIU	R2, R25, 24
LHU	R6, 0(R2)
ADDIU	R2, R25, 22
LBU	R5, 0(R2)
ADDIU	R2, R25, 21
LBU	R4, 0(R2)
ADDIU	R2, R25, 28
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 20(SP)
;minisub_driver.c,401 :: 		}
L_DrawBox26:
;minisub_driver.c,402 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 20(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,403 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R2, R5, R2
ADDIU	R4, R2, -1
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
ADDIU	R2, R2, -1
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
;minisub_driver.c,404 :: 		}
L_DrawBox24:
;minisub_driver.c,405 :: 		}
L_end_DrawBox:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _DrawBox
_UpdatePBPosition:
;minisub_driver.c,407 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
ADDIU	SP, SP, -56
SW	RA, 0(SP)
;minisub_driver.c,409 :: 		unsigned int locPosition = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;minisub_driver.c,410 :: 		unsigned cnt = 0;
;minisub_driver.c,412 :: 		unsigned int tmpWidth = 0;
;minisub_driver.c,413 :: 		unsigned int tmpRound = 0;
;minisub_driver.c,414 :: 		move_offset = 10;
ORI	R2, R0, 10
SH	R2, 24(SP)
;minisub_driver.c,415 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
ADDIU	R2, R25, 48
LHU	R3, 0(R2)
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SH	R2, 52(SP)
SUBU	R2, R3, R2
ANDI	R4, R2, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 48(SP)
ADDIU	R2, R25, 46
LHU	R3, 0(R2)
LHU	R2, 52(SP)
SUBU	R2, R3, R2
ANDI	R4, R2, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
LW	R4, 48(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 17096
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
MOVZ	R4, R2, R0
JAL	__FloatToUnsignedIntegral+0
NOP	
SH	R2, 34(SP)
;minisub_driver.c,416 :: 		if (AProgressBar->Visible == 1) {
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__UpdatePBPosition197
NOP	
J	L_UpdatePBPosition27
NOP	
L__UpdatePBPosition197:
;minisub_driver.c,417 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 42
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,418 :: 		TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 42
LHU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,419 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,420 :: 		if (caption_height >  AProgressBar->Height)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_caption_height+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition198
NOP	
J	L_UpdatePBPosition28
NOP	
L__UpdatePBPosition198:
;minisub_driver.c,421 :: 		caption_height =  AProgressBar->Height;
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
SH	R2, Offset(_caption_height+0)(GP)
L_UpdatePBPosition28:
;minisub_driver.c,422 :: 		if (caption_length >  AProgressBar->Width)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_caption_length+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition199
NOP	
J	L_UpdatePBPosition29
NOP	
L__UpdatePBPosition199:
;minisub_driver.c,423 :: 		caption_length =  AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
SH	R2, Offset(_caption_length+0)(GP)
L_UpdatePBPosition29:
;minisub_driver.c,424 :: 		if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
ADDIU	R2, R25, 48
LHU	R5, 0(R2)
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R2, R4, R2
ANDI	R3, R5, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition200
NOP	
J	L_UpdatePBPosition30
NOP	
L__UpdatePBPosition200:
;minisub_driver.c,428 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R6, R4, R2
LHU	R2, Offset(_caption_height+0)(GP)
ADDU	R5, R6, R2
;minisub_driver.c,427 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
LHU	R2, Offset(_caption_length+0)(GP)
ADDU	R2, R3, R2
;minisub_driver.c,428 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
SW	R25, 16(SP)
ANDI	R28, R5, 65535
;minisub_driver.c,427 :: 		AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
ANDI	R27, R2, 65535
;minisub_driver.c,426 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
ANDI	R26, R6, 65535
;minisub_driver.c,425 :: 		TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
ANDI	R25, R3, 65535
;minisub_driver.c,428 :: 		AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,429 :: 		}
L_UpdatePBPosition30:
;minisub_driver.c,430 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 38
LHU	R7, 0(R2)
ADDIU	R2, R25, 36
LHU	R6, 0(R2)
ADDIU	R2, R25, 35
LBU	R5, 0(R2)
ADDIU	R2, R25, 34
LBU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,431 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,432 :: 		if (AProgressBar->Rounded == 1) {
ADDIU	R2, R25, 53
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__UpdatePBPosition201
NOP	
J	L_UpdatePBPosition31
NOP	
L__UpdatePBPosition201:
;minisub_driver.c,433 :: 		if (locPosition > 0) {
LHU	R2, 34(SP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__UpdatePBPosition202
NOP	
J	L_UpdatePBPosition32
NOP	
L__UpdatePBPosition202:
;minisub_driver.c,435 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 38
LHU	R7, 0(R2)
ADDIU	R2, R25, 36
LHU	R6, 0(R2)
ADDIU	R2, R25, 35
LBU	R5, 0(R2)
ADDIU	R2, R25, 34
LBU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,436 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius  + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 54
LBU	R5, 0(R2)
ANDI	R2, R5, 255
ADDU	R4, R3, R2
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R5, 255
SLL	R2, R2, 1
SUBU	R3, R3, R2
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
SW	R25, 16(SP)
ANDI	R28, R6, 65535
ANDI	R27, R2, 65535
ANDI	R26, R7, 65535
ANDI	R25, R4, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,437 :: 		}
L_UpdatePBPosition32:
;minisub_driver.c,438 :: 		}
J	L_UpdatePBPosition33
NOP	
L_UpdatePBPosition31:
;minisub_driver.c,440 :: 		if (locPosition > 0) {
LHU	R2, 34(SP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__UpdatePBPosition203
NOP	
J	L_UpdatePBPosition34
NOP	
L__UpdatePBPosition203:
;minisub_driver.c,441 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 38
LHU	R7, 0(R2)
ADDIU	R2, R25, 36
LHU	R6, 0(R2)
ADDIU	R2, R25, 35
LBU	R5, 0(R2)
ADDIU	R2, R25, 34
LBU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,442 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R5, R6, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
SW	R25, 16(SP)
ANDI	R28, R5, 65535
ANDI	R27, R2, 65535
ANDI	R26, R6, 65535
ANDI	R25, R4, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,443 :: 		}
L_UpdatePBPosition34:
;minisub_driver.c,444 :: 		}
L_UpdatePBPosition33:
;minisub_driver.c,446 :: 		if (AProgressBar->Smooth != 1) {
ADDIU	R2, R25, 52
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__UpdatePBPosition205
NOP	
J	L_UpdatePBPosition35
NOP	
L__UpdatePBPosition205:
;minisub_driver.c,447 :: 		if(AProgressBar->Rounded == 1) {
ADDIU	R2, R25, 53
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__UpdatePBPosition206
NOP	
J	L_UpdatePBPosition36
NOP	
L__UpdatePBPosition206:
;minisub_driver.c,448 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDIU	R2, R25, 54
LBU	R4, 0(R2)
ANDI	R2, R4, 255
SH	R2, 38(SP)
;minisub_driver.c,449 :: 		cnt = move_offset + tmpRound;
LHU	R3, 38(SP)
LH	R2, 24(SP)
ADDU	R2, R2, R3
; cnt start address is: 40 (R10)
ANDI	R10, R2, 65535
;minisub_driver.c,450 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R4, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, 36(SP)
;minisub_driver.c,451 :: 		}
; cnt end address is: 40 (R10)
J	L_UpdatePBPosition37
NOP	
L_UpdatePBPosition36:
;minisub_driver.c,453 :: 		tmpRound = 0;
SH	R0, 38(SP)
;minisub_driver.c,454 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LH	R10, 24(SP)
;minisub_driver.c,455 :: 		tmpWidth = AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
SH	R2, 36(SP)
; cnt end address is: 40 (R10)
;minisub_driver.c,456 :: 		}
L_UpdatePBPosition37:
;minisub_driver.c,457 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; cnt start address is: 40 (R10)
ADDIU	R2, R25, 42
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
; cnt end address is: 40 (R10)
LW	R25, 16(SP)
ANDI	R8, R10, 65535
;minisub_driver.c,458 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_UpdatePBPosition38:
; cnt start address is: 32 (R8)
LHU	R2, 38(SP)
SUBU	R4, R8, R2
LHU	R3, 36(SP)
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ANDI	R3, R4, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__UpdatePBPosition207
NOP	
J	L_UpdatePBPosition39
NOP	
L__UpdatePBPosition207:
;minisub_driver.c,459 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LHU	R2, 38(SP)
SUBU	R2, R8, R2
ADDIU	R4, R2, 3
LHU	R3, 34(SP)
LHU	R2, 36(SP)
MULTU	R2, R3
MFLO	R2
ANDI	R3, R4, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__UpdatePBPosition208
NOP	
J	L_UpdatePBPosition40
NOP	
L__UpdatePBPosition208:
;minisub_driver.c,460 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
LHU	R2, 38(SP)
ADDU	R4, R5, R2
LHU	R3, 34(SP)
LHU	R2, 36(SP)
MULTU	R2, R3
MFLO	R2
ADDU	R3, R4, R2
ADDU	R2, R5, R8
SH	R8, 16(SP)
SW	R25, 20(SP)
ANDI	R28, R6, 65535
ANDI	R27, R3, 65535
ANDI	R26, R7, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
LHU	R8, 16(SP)
J	L_UpdatePBPosition41
NOP	
L_UpdatePBPosition40:
;minisub_driver.c,462 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R2, R8
ADDIU	R2, R3, 3
SH	R8, 16(SP)
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
LHU	R8, 16(SP)
L_UpdatePBPosition41:
;minisub_driver.c,463 :: 		cnt = cnt + move_offset + 3;
LH	R2, 24(SP)
ADDU	R2, R8, R2
; cnt end address is: 32 (R8)
ADDIU	R2, R2, 3
; cnt start address is: 40 (R10)
ANDI	R10, R2, 65535
;minisub_driver.c,464 :: 		}
ANDI	R8, R10, 65535
; cnt end address is: 40 (R10)
J	L_UpdatePBPosition38
NOP	
L_UpdatePBPosition39:
;minisub_driver.c,465 :: 		}
L_UpdatePBPosition35:
;minisub_driver.c,467 :: 		if (AProgressBar->Show_Position == 1){
ADDIU	R2, R25, 50
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__UpdatePBPosition209
NOP	
J	L_UpdatePBPosition42
NOP	
L__UpdatePBPosition209:
;minisub_driver.c,468 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__UpdatePBPosition210
NOP	
J	L_UpdatePBPosition43
NOP	
L__UpdatePBPosition210:
;minisub_driver.c,469 :: 		IntToStr(locPosition , tmpStr);
ADDIU	R2, SP, 26
SW	R25, 16(SP)
MOVZ	R26, R2, R0
LHU	R25, 34(SP)
JAL	_IntToStr+0
NOP	
;minisub_driver.c,470 :: 		DeleteTrailingSpaces(tmpStr);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_DeleteTrailingSpaces+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,471 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 26
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,472 :: 		strcat(AProgressBar->Caption, "\%");
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
LUI	R26, #hi_addr(?lstr1_minisub_driver+0)
ORI	R26, R26, #lo_addr(?lstr1_minisub_driver+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,473 :: 		}
J	L_UpdatePBPosition44
NOP	
L_UpdatePBPosition43:
;minisub_driver.c,475 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADDIU	R3, SP, 26
ADDIU	R2, R25, 48
LHU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
ANDI	R25, R2, 65535
JAL	_IntToStr+0
NOP	
;minisub_driver.c,476 :: 		DeleteTrailingSpaces(tmpStr);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_DeleteTrailingSpaces+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,477 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 26
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,478 :: 		}
L_UpdatePBPosition44:
;minisub_driver.c,479 :: 		TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 32
LHU	R3, 0(R2)
ADDIU	R2, R25, 28
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,480 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,481 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R5, R4, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R5, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,482 :: 		}
L_UpdatePBPosition42:
;minisub_driver.c,483 :: 		}
L_UpdatePBPosition27:
;minisub_driver.c,484 :: 		}
L_end_UpdatePBPosition:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 56
JR	RA
NOP	
; end of _UpdatePBPosition
_DrawProgressBar:
;minisub_driver.c,486 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
ADDIU	SP, SP, -56
SW	RA, 0(SP)
;minisub_driver.c,487 :: 		int move_offset = 0;
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R28, 12(SP)
;minisub_driver.c,488 :: 		unsigned int locPosition = 0;
;minisub_driver.c,489 :: 		unsigned cnt = 0;
;minisub_driver.c,491 :: 		unsigned int tmpWidth = 0;
;minisub_driver.c,492 :: 		unsigned int tmpRound = 0;
;minisub_driver.c,493 :: 		move_offset = 10;
ORI	R2, R0, 10
SH	R2, 32(SP)
;minisub_driver.c,494 :: 		locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
ADDIU	R2, R25, 48
LHU	R3, 0(R2)
ADDIU	R2, R25, 44
LHU	R2, 0(R2)
SH	R2, 52(SP)
SUBU	R2, R3, R2
ANDI	R4, R2, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 48(SP)
ADDIU	R2, R25, 46
LHU	R3, 0(R2)
LHU	R2, 52(SP)
SUBU	R2, R3, R2
ANDI	R4, R2, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
LW	R4, 48(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 17096
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
MOVZ	R4, R2, R0
JAL	__FloatToUnsignedIntegral+0
NOP	
SH	R2, 34(SP)
;minisub_driver.c,495 :: 		if (AProgressBar->Visible == 1) {
ADDIU	R2, R25, 18
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawProgressBar212
NOP	
J	L_DrawProgressBar45
NOP	
L__DrawProgressBar212:
;minisub_driver.c,496 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
ADDIU	R2, R25, 42
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,497 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDIU	R2, R25, 14
LBU	R3, 0(R2)
ADDIU	R2, R25, 16
LHU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R26, R3, 255
ANDI	R25, R2, 65535
JAL	_TFT_Set_Pen+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,498 :: 		if (AProgressBar->Rounded == 1) {
ADDIU	R2, R25, 53
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawProgressBar213
NOP	
J	L_DrawProgressBar46
NOP	
L__DrawProgressBar213:
;minisub_driver.c,500 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ADDIU	R2, R25, 54
LBU	R6, 0(R2)
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
SW	R25, 16(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
ANDI	R2, R6, 255
ADDIU	SP, SP, -4
SH	R2, 0(SP)
JAL	_TFT_Rectangle_Round_Edges+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,501 :: 		if (locPosition > 0) {
LHU	R2, 34(SP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DrawProgressBar214
NOP	
J	L_DrawProgressBar47
NOP	
L__DrawProgressBar214:
;minisub_driver.c,503 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 38
LHU	R7, 0(R2)
ADDIU	R2, R25, 36
LHU	R6, 0(R2)
ADDIU	R2, R25, 35
LBU	R5, 0(R2)
ADDIU	R2, R25, 34
LBU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,504 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,  AProgressBar->Left + AProgressBar->Corner_Radius   + locPosition *  (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 54
LBU	R5, 0(R2)
ANDI	R2, R5, 255
ADDU	R4, R3, R2
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R5, 255
SLL	R2, R2, 1
SUBU	R3, R3, R2
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
SW	R25, 16(SP)
ANDI	R28, R6, 65535
ANDI	R27, R2, 65535
ANDI	R26, R7, 65535
ANDI	R25, R4, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,505 :: 		}
L_DrawProgressBar47:
;minisub_driver.c,506 :: 		}
J	L_DrawProgressBar48
NOP	
L_DrawProgressBar46:
;minisub_driver.c,509 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
ADDU	R2, R3, R2
SW	R25, 16(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,510 :: 		if (locPosition > 0) {
LHU	R2, 34(SP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DrawProgressBar215
NOP	
J	L_DrawProgressBar49
NOP	
L__DrawProgressBar215:
;minisub_driver.c,512 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDIU	R2, R25, 38
LHU	R7, 0(R2)
ADDIU	R2, R25, 36
LHU	R6, 0(R2)
ADDIU	R2, R25, 35
LBU	R5, 0(R2)
ADDIU	R2, R25, 34
LBU	R4, 0(R2)
ADDIU	R2, R25, 40
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R28, R5, 255
ANDI	R27, R4, 255
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R7, 2(SP)
SH	R6, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
LW	R25, 16(SP)
;minisub_driver.c,513 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R6, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R5, R6, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ADDU	R2, R4, R2
SW	R25, 16(SP)
ANDI	R28, R5, 65535
ANDI	R27, R2, 65535
ANDI	R26, R6, 65535
ANDI	R25, R4, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,514 :: 		}
L_DrawProgressBar49:
;minisub_driver.c,515 :: 		}
L_DrawProgressBar48:
;minisub_driver.c,517 :: 		if (AProgressBar->Smooth != 1) {
ADDIU	R2, R25, 52
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BNE	R3, R2, L__DrawProgressBar217
NOP	
J	L_DrawProgressBar50
NOP	
L__DrawProgressBar217:
;minisub_driver.c,518 :: 		if(AProgressBar->Rounded == 1) {
ADDIU	R2, R25, 53
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawProgressBar218
NOP	
J	L_DrawProgressBar51
NOP	
L__DrawProgressBar218:
;minisub_driver.c,519 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDIU	R2, R25, 54
LBU	R4, 0(R2)
ANDI	R2, R4, 255
SH	R2, 38(SP)
;minisub_driver.c,520 :: 		cnt = move_offset + tmpRound;
LHU	R3, 38(SP)
LH	R2, 32(SP)
ADDU	R2, R2, R3
; cnt start address is: 40 (R10)
ANDI	R10, R2, 65535
;minisub_driver.c,521 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
ANDI	R2, R4, 255
SLL	R2, R2, 1
SUBU	R2, R3, R2
SH	R2, 36(SP)
;minisub_driver.c,522 :: 		}
; cnt end address is: 40 (R10)
J	L_DrawProgressBar52
NOP	
L_DrawProgressBar51:
;minisub_driver.c,524 :: 		tmpRound = 0;
SH	R0, 38(SP)
;minisub_driver.c,525 :: 		cnt = move_offset;
; cnt start address is: 40 (R10)
LH	R10, 32(SP)
;minisub_driver.c,526 :: 		tmpWidth = AProgressBar->Width;
ADDIU	R2, R25, 10
LHU	R2, 0(R2)
SH	R2, 36(SP)
; cnt end address is: 40 (R10)
;minisub_driver.c,527 :: 		}
L_DrawProgressBar52:
;minisub_driver.c,528 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
; cnt start address is: 40 (R10)
ADDIU	R2, R25, 42
LHU	R3, 0(R2)
ADDIU	R2, R25, 20
LBU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
ANDI	R25, R2, 255
ADDIU	SP, SP, -4
SH	R0, 2(SP)
SH	R0, 0(SP)
JAL	_TFT_Set_Brush+0
NOP	
ADDIU	SP, SP, 4
; cnt end address is: 40 (R10)
LW	R25, 16(SP)
ANDI	R8, R10, 65535
;minisub_driver.c,529 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar53:
; cnt start address is: 32 (R8)
LHU	R2, 38(SP)
SUBU	R4, R8, R2
LHU	R3, 36(SP)
LHU	R2, 34(SP)
MULTU	R2, R3
MFLO	R3
ORI	R2, R0, 100
DIVU	R3, R2
MFLO	R2
ANDI	R3, R4, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BNE	R2, R0, L__DrawProgressBar219
NOP	
J	L_DrawProgressBar54
NOP	
L__DrawProgressBar219:
;minisub_driver.c,530 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LHU	R2, 38(SP)
SUBU	R2, R8, R2
ADDIU	R4, R2, 3
LHU	R3, 34(SP)
LHU	R2, 36(SP)
MULTU	R2, R3
MFLO	R2
ANDI	R3, R4, 65535
ANDI	R2, R2, 65535
SLTU	R2, R3, R2
BEQ	R2, R0, L__DrawProgressBar220
NOP	
J	L_DrawProgressBar55
NOP	
L__DrawProgressBar220:
;minisub_driver.c,531 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R7, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R6, R7, R2
ADDIU	R2, R25, 6
LHU	R5, 0(R2)
LHU	R2, 38(SP)
ADDU	R4, R5, R2
LHU	R3, 34(SP)
LHU	R2, 36(SP)
MULTU	R2, R3
MFLO	R2
ADDU	R3, R4, R2
ADDU	R2, R5, R8
SH	R8, 16(SP)
SW	R25, 20(SP)
ANDI	R28, R6, 65535
ANDI	R27, R3, 65535
ANDI	R26, R7, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
LHU	R8, 16(SP)
J	L_DrawProgressBar56
NOP	
L_DrawProgressBar55:
;minisub_driver.c,533 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDIU	R2, R25, 8
LHU	R5, 0(R2)
ADDIU	R2, R25, 12
LHU	R2, 0(R2)
ADDU	R4, R5, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R2, R8
ADDIU	R2, R3, 3
SH	R8, 16(SP)
SW	R25, 20(SP)
ANDI	R28, R4, 65535
ANDI	R27, R2, 65535
ANDI	R26, R5, 65535
ANDI	R25, R3, 65535
JAL	_TFT_Rectangle+0
NOP	
LW	R25, 20(SP)
LHU	R8, 16(SP)
L_DrawProgressBar56:
;minisub_driver.c,534 :: 		cnt = cnt + move_offset + 3;
LH	R2, 32(SP)
ADDU	R2, R8, R2
; cnt end address is: 32 (R8)
ADDIU	R2, R2, 3
; cnt start address is: 40 (R10)
ANDI	R10, R2, 65535
;minisub_driver.c,535 :: 		}
ANDI	R8, R10, 65535
; cnt end address is: 40 (R10)
J	L_DrawProgressBar53
NOP	
L_DrawProgressBar54:
;minisub_driver.c,536 :: 		}
L_DrawProgressBar50:
;minisub_driver.c,538 :: 		if (AProgressBar->Show_Position == 1){
ADDIU	R2, R25, 50
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawProgressBar221
NOP	
J	L_DrawProgressBar57
NOP	
L__DrawProgressBar221:
;minisub_driver.c,539 :: 		if (AProgressBar->Show_Percentage == 1) {
ADDIU	R2, R25, 51
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__DrawProgressBar222
NOP	
J	L_DrawProgressBar58
NOP	
L__DrawProgressBar222:
;minisub_driver.c,540 :: 		IntToStr(locPosition , tmpStr);
ADDIU	R2, SP, 24
SW	R25, 16(SP)
MOVZ	R26, R2, R0
LHU	R25, 34(SP)
JAL	_IntToStr+0
NOP	
;minisub_driver.c,541 :: 		DeleteTrailingSpaces(tmpStr);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_DeleteTrailingSpaces+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,542 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 24
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,543 :: 		strcat(AProgressBar->Caption, "\%");
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
LUI	R26, #hi_addr(?lstr2_minisub_driver+0)
ORI	R26, R26, #lo_addr(?lstr2_minisub_driver+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,544 :: 		}
J	L_DrawProgressBar59
NOP	
L_DrawProgressBar58:
;minisub_driver.c,546 :: 		IntToStr(AProgressBar->Position , tmpStr);
ADDIU	R3, SP, 24
ADDIU	R2, R25, 48
LHU	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
ANDI	R25, R2, 65535
JAL	_IntToStr+0
NOP	
;minisub_driver.c,547 :: 		DeleteTrailingSpaces(tmpStr);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_DeleteTrailingSpaces+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,548 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADDIU	R3, SP, 24
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,549 :: 		}
L_DrawProgressBar59:
;minisub_driver.c,550 :: 		TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDIU	R2, R25, 32
LHU	R3, 0(R2)
ADDIU	R2, R25, 28
LW	R2, 0(R2)
SW	R25, 16(SP)
MOVZ	R27, R0, R0
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Set_Font+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,551 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 6
LHU	R3, 0(R2)
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R4, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text_Return_Pos+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,552 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDIU	R2, R25, 8
LHU	R4, 0(R2)
ADDIU	R2, R25, 12
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_height+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R5, R4, R2
ADDIU	R2, R25, 6
LHU	R4, 0(R2)
ADDIU	R2, R25, 10
LHU	R3, 0(R2)
LHU	R2, Offset(_caption_length+0)(GP)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
ADDU	R3, R4, R2
ADDIU	R2, R25, 24
LW	R2, 0(R2)
SW	R25, 16(SP)
ANDI	R27, R5, 65535
ANDI	R26, R3, 65535
MOVZ	R25, R2, R0
JAL	_TFT_Write_Text+0
NOP	
LW	R25, 16(SP)
;minisub_driver.c,553 :: 		}
L_DrawProgressBar57:
;minisub_driver.c,554 :: 		}
L_DrawProgressBar45:
;minisub_driver.c,555 :: 		}
L_end_DrawProgressBar:
LW	R28, 12(SP)
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 56
JR	RA
NOP	
; end of _DrawProgressBar
_DrawScreen:
;minisub_driver.c,557 :: 		void DrawScreen(TScreen *aScreen) {
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;minisub_driver.c,569 :: 		object_pressed = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
SB	R0, Offset(_object_pressed+0)(GP)
;minisub_driver.c,570 :: 		order = 0;
SH	R0, 28(SP)
;minisub_driver.c,571 :: 		round_button_idx = 0;
SB	R0, 30(SP)
;minisub_driver.c,572 :: 		label_idx = 0;
SB	R0, 36(SP)
;minisub_driver.c,573 :: 		box_idx = 0;
SB	R0, 44(SP)
;minisub_driver.c,574 :: 		progress_bar_idx = 0;
SB	R0, 52(SP)
;minisub_driver.c,575 :: 		CurrentScreen = aScreen;
SW	R25, Offset(_CurrentScreen+0)(GP)
;minisub_driver.c,577 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_display_width+0)(GP)
BEQ	R2, R3, L__DrawScreen224
NOP	
J	L__DrawScreen160
NOP	
L__DrawScreen224:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LHU	R2, Offset(_display_height+0)(GP)
BEQ	R2, R3, L__DrawScreen225
NOP	
J	L__DrawScreen159
NOP	
L__DrawScreen225:
J	L_DrawScreen62
NOP	
L__DrawScreen160:
L__DrawScreen159:
;minisub_driver.c,578 :: 		save_bled = TFT_BLED;
LBU	R2, Offset(LATA9_bit+1)(GP)
EXT	R2, R2, 1, 1
; save_bled start address is: 16 (R4)
ANDI	R4, R2, 255
;minisub_driver.c,579 :: 		save_bled_direction = TFT_BLED_Direction;
LBU	R2, Offset(TRISA9_bit+1)(GP)
EXT	R2, R2, 1, 1
; save_bled_direction start address is: 20 (R5)
ANDI	R5, R2, 255
;minisub_driver.c,580 :: 		TFT_BLED_Direction = 0;
LBU	R2, Offset(TRISA9_bit+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(TRISA9_bit+1)(GP)
;minisub_driver.c,581 :: 		TFT_BLED           = 0;
LBU	R2, Offset(LATA9_bit+1)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(LATA9_bit+1)(GP)
;minisub_driver.c,582 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
SW	R25, 20(SP)
LUI	R27, #hi_addr(_Write_Data+0)
ORI	R27, R27, #lo_addr(_Write_Data+0)
LUI	R26, #hi_addr(_Write_Command+0)
ORI	R26, R26, #lo_addr(_Write_Command+0)
LUI	R25, #hi_addr(_Set_Index+0)
ORI	R25, R25, #lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,583 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SB	R5, 20(SP)
SB	R4, 21(SP)
SW	R25, 24(SP)
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TFT_Init+0
NOP	
LW	R25, 24(SP)
LBU	R4, 21(SP)
LBU	R5, 20(SP)
;minisub_driver.c,584 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 13, 12);                                  // Initialize touch panel
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SW	R25, 20(SP)
ORI	R28, R0, 12
ORI	R27, R0, 13
ANDI	R26, R3, 65535
ANDI	R25, R2, 65535
JAL	_TP_TFT_Init+0
NOP	
;minisub_driver.c,585 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
ORI	R25, R0, 1000
JAL	_TP_TFT_Set_ADC_Threshold+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,586 :: 		TFT_Fill_Screen(CurrentScreen->Color);
LW	R2, Offset(_CurrentScreen+0)(GP)
SB	R5, 20(SP)
SB	R4, 21(SP)
SW	R25, 24(SP)
LHU	R25, 0(R2)
JAL	_TFT_Fill_Screen+0
NOP	
LW	R25, 24(SP)
LBU	R4, 21(SP)
LBU	R5, 20(SP)
;minisub_driver.c,587 :: 		display_width = CurrentScreen->Width;
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
SH	R2, Offset(_display_width+0)(GP)
;minisub_driver.c,588 :: 		display_height = CurrentScreen->Height;
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
SH	R2, Offset(_display_height+0)(GP)
;minisub_driver.c,589 :: 		TFT_BLED           = save_bled;
LBU	R2, Offset(LATA9_bit+1)(GP)
INS	R2, R4, 1, 1
; save_bled end address is: 16 (R4)
SB	R2, Offset(LATA9_bit+1)(GP)
;minisub_driver.c,590 :: 		TFT_BLED_Direction = save_bled_direction;
LBU	R2, Offset(TRISA9_bit+1)(GP)
INS	R2, R5, 1, 1
; save_bled_direction end address is: 20 (R5)
SB	R2, Offset(TRISA9_bit+1)(GP)
;minisub_driver.c,591 :: 		}
J	L_DrawScreen63
NOP	
L_DrawScreen62:
;minisub_driver.c,593 :: 		TFT_Fill_Screen(CurrentScreen->Color);
LW	R2, Offset(_CurrentScreen+0)(GP)
LHU	R25, 0(R2)
JAL	_TFT_Fill_Screen+0
NOP	
L_DrawScreen63:
;minisub_driver.c,596 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen64:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 6
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LH	R2, 28(SP)
SLT	R2, R2, R3
BNE	R2, R0, L__DrawScreen226
NOP	
J	L_DrawScreen65
NOP	
L__DrawScreen226:
;minisub_driver.c,597 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 30(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen227
NOP	
J	L_DrawScreen66
NOP	
L__DrawScreen227:
;minisub_driver.c,598 :: 		local_round_button = GetRoundButton(round_button_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 12
LW	R3, 0(R2)
LBU	R2, 30(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 32(SP)
;minisub_driver.c,599 :: 		if (order == local_round_button->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LH	R2, 28(SP)
BEQ	R2, R3, L__DrawScreen228
NOP	
J	L_DrawScreen67
NOP	
L__DrawScreen228:
;minisub_driver.c,600 :: 		order++;
LH	R2, 28(SP)
ADDIU	R2, R2, 1
SH	R2, 28(SP)
;minisub_driver.c,601 :: 		round_button_idx++;
LBU	R2, 30(SP)
ADDIU	R2, R2, 1
SB	R2, 30(SP)
;minisub_driver.c,602 :: 		DrawRoundButton(local_round_button);
SW	R25, 20(SP)
LW	R25, 32(SP)
JAL	_DrawRoundButton+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,603 :: 		}
L_DrawScreen67:
;minisub_driver.c,604 :: 		}
L_DrawScreen66:
;minisub_driver.c,606 :: 		if (label_idx < CurrentScreen->LabelsCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 16
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 36(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen229
NOP	
J	L_DrawScreen68
NOP	
L__DrawScreen229:
;minisub_driver.c,607 :: 		local_label = GetLabel(label_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 20
LW	R3, 0(R2)
LBU	R2, 36(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 40(SP)
;minisub_driver.c,608 :: 		if (order == local_label->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LH	R2, 28(SP)
BEQ	R2, R3, L__DrawScreen230
NOP	
J	L_DrawScreen69
NOP	
L__DrawScreen230:
;minisub_driver.c,609 :: 		label_idx++;
LBU	R2, 36(SP)
ADDIU	R2, R2, 1
SB	R2, 36(SP)
;minisub_driver.c,610 :: 		order++;
LH	R2, 28(SP)
ADDIU	R2, R2, 1
SH	R2, 28(SP)
;minisub_driver.c,611 :: 		DrawLabel(local_label);
SW	R25, 20(SP)
LW	R25, 40(SP)
JAL	_DrawLabel+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,612 :: 		}
L_DrawScreen69:
;minisub_driver.c,613 :: 		}
L_DrawScreen68:
;minisub_driver.c,615 :: 		if (box_idx < CurrentScreen->BoxesCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 24
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 44(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen231
NOP	
J	L_DrawScreen70
NOP	
L__DrawScreen231:
;minisub_driver.c,616 :: 		local_box = GetBox(box_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 28
LW	R3, 0(R2)
LBU	R2, 44(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 48(SP)
;minisub_driver.c,617 :: 		if (order == local_box->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LH	R2, 28(SP)
BEQ	R2, R3, L__DrawScreen232
NOP	
J	L_DrawScreen71
NOP	
L__DrawScreen232:
;minisub_driver.c,618 :: 		box_idx++;
LBU	R2, 44(SP)
ADDIU	R2, R2, 1
SB	R2, 44(SP)
;minisub_driver.c,619 :: 		order++;
LH	R2, 28(SP)
ADDIU	R2, R2, 1
SH	R2, 28(SP)
;minisub_driver.c,620 :: 		DrawBox(local_box);
SW	R25, 20(SP)
LW	R25, 48(SP)
JAL	_DrawBox+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,621 :: 		}
L_DrawScreen71:
;minisub_driver.c,622 :: 		}
L_DrawScreen70:
;minisub_driver.c,624 :: 		if (progress_bar_idx  < CurrentScreen->ProgressBarsCount) {
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 32
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LBU	R2, 52(SP)
SLTU	R2, R2, R3
BNE	R2, R0, L__DrawScreen233
NOP	
J	L_DrawScreen72
NOP	
L__DrawScreen233:
;minisub_driver.c,625 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 36
LW	R3, 0(R2)
LBU	R2, 52(SP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, 56(SP)
;minisub_driver.c,626 :: 		if (order == local_progress_bar->Order) {
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R3, R2, 255
LH	R2, 28(SP)
BEQ	R2, R3, L__DrawScreen234
NOP	
J	L_DrawScreen73
NOP	
L__DrawScreen234:
;minisub_driver.c,627 :: 		progress_bar_idx++;
LBU	R2, 52(SP)
ADDIU	R2, R2, 1
SB	R2, 52(SP)
;minisub_driver.c,628 :: 		order++;
LH	R2, 28(SP)
ADDIU	R2, R2, 1
SH	R2, 28(SP)
;minisub_driver.c,629 :: 		DrawProgressBar(local_progress_bar);
SW	R25, 20(SP)
LW	R25, 56(SP)
JAL	_DrawProgressBar+0
NOP	
LW	R25, 20(SP)
;minisub_driver.c,630 :: 		}
L_DrawScreen73:
;minisub_driver.c,631 :: 		}
L_DrawScreen72:
;minisub_driver.c,633 :: 		}
J	L_DrawScreen64
NOP	
L_DrawScreen65:
;minisub_driver.c,634 :: 		}
L_end_DrawScreen:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _DrawScreen
_Get_Object:
;minisub_driver.c,636 :: 		void Get_Object(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;minisub_driver.c,637 :: 		round_button_order  = -1;
SW	R27, 4(SP)
SW	R28, 8(SP)
ORI	R2, R0, 65535
SH	R2, Offset(_round_button_order+0)(GP)
;minisub_driver.c,638 :: 		label_order         = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_label_order+0)(GP)
;minisub_driver.c,639 :: 		box_order           = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_box_order+0)(GP)
;minisub_driver.c,640 :: 		progress_bar_order    = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_progress_bar_order+0)(GP)
;minisub_driver.c,642 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object74:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 8
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object236
NOP	
J	L_Get_Object75
NOP	
L__Get_Object236:
;minisub_driver.c,643 :: 		local_round_button = GetRoundButton(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 12
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_round_button+0)(GP)
;minisub_driver.c,644 :: 		if (local_round_button->Active == 1) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object237
NOP	
J	L_Get_Object77
NOP	
L__Get_Object237:
;minisub_driver.c,646 :: 		local_round_button->Width, local_round_button->Height) == 1) {
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;minisub_driver.c,645 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;minisub_driver.c,646 :: 		local_round_button->Width, local_round_button->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	minisub_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object238
NOP	
J	L_Get_Object78
NOP	
L__Get_Object238:
;minisub_driver.c,647 :: 		round_button_order = local_round_button->Order;
LW	R2, Offset(_local_round_button+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_round_button_order+0)(GP)
;minisub_driver.c,648 :: 		exec_round_button = local_round_button;
LW	R2, Offset(_local_round_button+0)(GP)
SW	R2, Offset(_exec_round_button+0)(GP)
;minisub_driver.c,649 :: 		}
L_Get_Object78:
;minisub_driver.c,650 :: 		}
L_Get_Object77:
;minisub_driver.c,642 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;minisub_driver.c,651 :: 		}
J	L_Get_Object74
NOP	
L_Get_Object75:
;minisub_driver.c,654 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object79:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 16
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object239
NOP	
J	L_Get_Object80
NOP	
L__Get_Object239:
;minisub_driver.c,655 :: 		local_label = GetLabel(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 20
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_label+0)(GP)
;minisub_driver.c,656 :: 		if (local_label->Active == 1) {
ADDIU	R2, R2, 27
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object240
NOP	
J	L_Get_Object82
NOP	
L__Get_Object240:
;minisub_driver.c,658 :: 		local_label->Width, local_label->Height) == 1) {
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;minisub_driver.c,657 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;minisub_driver.c,658 :: 		local_label->Width, local_label->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	minisub_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object241
NOP	
J	L_Get_Object83
NOP	
L__Get_Object241:
;minisub_driver.c,659 :: 		label_order = local_label->Order;
LW	R2, Offset(_local_label+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_label_order+0)(GP)
;minisub_driver.c,660 :: 		exec_label = local_label;
LW	R2, Offset(_local_label+0)(GP)
SW	R2, Offset(_exec_label+0)(GP)
;minisub_driver.c,661 :: 		}
L_Get_Object83:
;minisub_driver.c,662 :: 		}
L_Get_Object82:
;minisub_driver.c,654 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;minisub_driver.c,663 :: 		}
J	L_Get_Object79
NOP	
L_Get_Object80:
;minisub_driver.c,666 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object84:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 24
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object242
NOP	
J	L_Get_Object85
NOP	
L__Get_Object242:
;minisub_driver.c,667 :: 		local_box = GetBox(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 28
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_box+0)(GP)
;minisub_driver.c,668 :: 		if (local_box->Active == 1) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object243
NOP	
J	L_Get_Object87
NOP	
L__Get_Object243:
;minisub_driver.c,670 :: 		local_box->Width, local_box->Height) == 1) {
LW	R2, Offset(_local_box+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_box+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;minisub_driver.c,669 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
LW	R2, Offset(_local_box+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_box+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;minisub_driver.c,670 :: 		local_box->Width, local_box->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	minisub_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object244
NOP	
J	L_Get_Object88
NOP	
L__Get_Object244:
;minisub_driver.c,671 :: 		box_order = local_box->Order;
LW	R2, Offset(_local_box+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_box_order+0)(GP)
;minisub_driver.c,672 :: 		exec_box = local_box;
LW	R2, Offset(_local_box+0)(GP)
SW	R2, Offset(_exec_box+0)(GP)
;minisub_driver.c,673 :: 		}
L_Get_Object88:
;minisub_driver.c,674 :: 		}
L_Get_Object87:
;minisub_driver.c,666 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;minisub_driver.c,675 :: 		}
J	L_Get_Object84
NOP	
L_Get_Object85:
;minisub_driver.c,678 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
SH	R0, Offset(__object_count+0)(GP)
L_Get_Object89:
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 32
LHU	R2, 0(R2)
ANDI	R3, R2, 65535
LH	R2, Offset(__object_count+0)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Get_Object245
NOP	
J	L_Get_Object90
NOP	
L__Get_Object245:
;minisub_driver.c,679 :: 		local_progress_bar = GetProgressBar(_object_count);
LW	R2, Offset(_CurrentScreen+0)(GP)
ADDIU	R2, R2, 36
LW	R3, 0(R2)
LH	R2, Offset(__object_count+0)(GP)
SLL	R2, R2, 2
ADDU	R2, R3, R2
LW	R2, 0(R2)
SW	R2, Offset(_local_progress_bar+0)(GP)
;minisub_driver.c,680 :: 		if (local_progress_bar->Active == 1) {
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object246
NOP	
J	L_Get_Object92
NOP	
L__Get_Object246:
;minisub_driver.c,682 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
LW	R2, Offset(_local_progress_bar+0)(GP)
ADDIU	R2, R2, 12
LHU	R5, 0(R2)
LW	R2, Offset(_local_progress_bar+0)(GP)
ADDIU	R2, R2, 10
LHU	R4, 0(R2)
;minisub_driver.c,681 :: 		if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
LW	R2, Offset(_local_progress_bar+0)(GP)
ADDIU	R2, R2, 8
LHU	R3, 0(R2)
LW	R2, Offset(_local_progress_bar+0)(GP)
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ANDI	R28, R3, 65535
ANDI	R27, R2, 65535
;minisub_driver.c,682 :: 		local_progress_bar->Width, local_progress_bar->Height) == 1) {
ADDIU	SP, SP, -4
SH	R5, 2(SP)
SH	R4, 0(SP)
JAL	minisub_driver_IsInsideObject+0
NOP	
ADDIU	SP, SP, 4
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__Get_Object247
NOP	
J	L_Get_Object93
NOP	
L__Get_Object247:
;minisub_driver.c,683 :: 		progress_bar_order = local_progress_bar->Order;
LW	R2, Offset(_local_progress_bar+0)(GP)
ADDIU	R2, R2, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SH	R2, Offset(_progress_bar_order+0)(GP)
;minisub_driver.c,684 :: 		exec_progress_bar = local_progress_bar;
LW	R2, Offset(_local_progress_bar+0)(GP)
SW	R2, Offset(_exec_progress_bar+0)(GP)
;minisub_driver.c,685 :: 		}
L_Get_Object93:
;minisub_driver.c,686 :: 		}
L_Get_Object92:
;minisub_driver.c,678 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
LH	R2, Offset(__object_count+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(__object_count+0)(GP)
;minisub_driver.c,687 :: 		}
J	L_Get_Object89
NOP	
L_Get_Object90:
;minisub_driver.c,689 :: 		_object_count = -1;
ORI	R2, R0, 65535
SH	R2, Offset(__object_count+0)(GP)
;minisub_driver.c,690 :: 		if (round_button_order > _object_count)
LH	R2, Offset(_round_button_order+0)(GP)
SLTI	R2, R2, 0
BEQ	R2, R0, L__Get_Object248
NOP	
J	L_Get_Object94
NOP	
L__Get_Object248:
;minisub_driver.c,691 :: 		_object_count = round_button_order;
LH	R2, Offset(_round_button_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object94:
;minisub_driver.c,692 :: 		if (label_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_label_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object249
NOP	
J	L_Get_Object95
NOP	
L__Get_Object249:
;minisub_driver.c,693 :: 		_object_count = label_order;
LH	R2, Offset(_label_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object95:
;minisub_driver.c,694 :: 		if (box_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_box_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object250
NOP	
J	L_Get_Object96
NOP	
L__Get_Object250:
;minisub_driver.c,695 :: 		_object_count = box_order;
LH	R2, Offset(_box_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object96:
;minisub_driver.c,696 :: 		if (progress_bar_order >  _object_count )
LH	R3, Offset(__object_count+0)(GP)
LH	R2, Offset(_progress_bar_order+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__Get_Object251
NOP	
J	L_Get_Object97
NOP	
L__Get_Object251:
;minisub_driver.c,697 :: 		_object_count = progress_bar_order;
LH	R2, Offset(_progress_bar_order+0)(GP)
SH	R2, Offset(__object_count+0)(GP)
L_Get_Object97:
;minisub_driver.c,698 :: 		}
L_end_Get_Object:
LW	R28, 8(SP)
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Get_Object
minisub_driver_Process_TP_Press:
;minisub_driver.c,701 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;minisub_driver.c,702 :: 		exec_round_button   = 0;
SW	R0, Offset(_exec_round_button+0)(GP)
;minisub_driver.c,703 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;minisub_driver.c,704 :: 		exec_box            = 0;
SW	R0, Offset(_exec_box+0)(GP)
;minisub_driver.c,705 :: 		exec_progress_bar     = 0;
SW	R0, Offset(_exec_progress_bar+0)(GP)
;minisub_driver.c,707 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;minisub_driver.c,710 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L_minisub_driver_Process_TP_Press254
NOP	
J	L_minisub_driver_Process_TP_Press98
NOP	
L_minisub_driver_Process_TP_Press254:
;minisub_driver.c,711 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Press255
NOP	
J	L_minisub_driver_Process_TP_Press99
NOP	
L_minisub_driver_Process_TP_Press255:
;minisub_driver.c,712 :: 		if (exec_round_button->Active == 1) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Press256
NOP	
J	L_minisub_driver_Process_TP_Press100
NOP	
L_minisub_driver_Process_TP_Press256:
;minisub_driver.c,713 :: 		if (exec_round_button->OnPressPtr != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Press258
NOP	
J	L_minisub_driver_Process_TP_Press101
NOP	
L_minisub_driver_Process_TP_Press258:
;minisub_driver.c,714 :: 		exec_round_button->OnPressPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 64
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,715 :: 		return;
J	L_end_Process_TP_Press
NOP	
;minisub_driver.c,716 :: 		}
L_minisub_driver_Process_TP_Press101:
;minisub_driver.c,717 :: 		}
L_minisub_driver_Process_TP_Press100:
;minisub_driver.c,718 :: 		}
L_minisub_driver_Process_TP_Press99:
;minisub_driver.c,720 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Press259
NOP	
J	L_minisub_driver_Process_TP_Press102
NOP	
L_minisub_driver_Process_TP_Press259:
;minisub_driver.c,721 :: 		if (exec_label->Active == 1) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 27
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Press260
NOP	
J	L_minisub_driver_Process_TP_Press103
NOP	
L_minisub_driver_Process_TP_Press260:
;minisub_driver.c,722 :: 		if (exec_label->OnPressPtr != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Press262
NOP	
J	L_minisub_driver_Process_TP_Press104
NOP	
L_minisub_driver_Process_TP_Press262:
;minisub_driver.c,723 :: 		exec_label->OnPressPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,724 :: 		return;
J	L_end_Process_TP_Press
NOP	
;minisub_driver.c,725 :: 		}
L_minisub_driver_Process_TP_Press104:
;minisub_driver.c,726 :: 		}
L_minisub_driver_Process_TP_Press103:
;minisub_driver.c,727 :: 		}
L_minisub_driver_Process_TP_Press102:
;minisub_driver.c,729 :: 		if (_object_count == box_order) {
LH	R3, Offset(_box_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Press263
NOP	
J	L_minisub_driver_Process_TP_Press105
NOP	
L_minisub_driver_Process_TP_Press263:
;minisub_driver.c,730 :: 		if (exec_box->Active == 1) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Press264
NOP	
J	L_minisub_driver_Process_TP_Press106
NOP	
L_minisub_driver_Process_TP_Press264:
;minisub_driver.c,731 :: 		if (exec_box->OnPressPtr != 0) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Press266
NOP	
J	L_minisub_driver_Process_TP_Press107
NOP	
L_minisub_driver_Process_TP_Press266:
;minisub_driver.c,732 :: 		exec_box->OnPressPtr();
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 48
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,733 :: 		return;
J	L_end_Process_TP_Press
NOP	
;minisub_driver.c,734 :: 		}
L_minisub_driver_Process_TP_Press107:
;minisub_driver.c,735 :: 		}
L_minisub_driver_Process_TP_Press106:
;minisub_driver.c,736 :: 		}
L_minisub_driver_Process_TP_Press105:
;minisub_driver.c,738 :: 		}
L_minisub_driver_Process_TP_Press98:
;minisub_driver.c,739 :: 		}
L_end_Process_TP_Press:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of minisub_driver_Process_TP_Press
minisub_driver_Process_TP_Up:
;minisub_driver.c,741 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_driver.c,743 :: 		switch (PressedObjectType) {
J	L_minisub_driver_Process_TP_Up108
NOP	
;minisub_driver.c,745 :: 		case 1: {
L_minisub_driver_Process_TP_Up110:
;minisub_driver.c,746 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L_minisub_driver_Process_TP_Up269
NOP	
J	L_minisub_driver_Process_TP_Up111
NOP	
L_minisub_driver_Process_TP_Up269:
;minisub_driver.c,747 :: 		exec_round_button = (TButton_Round*)PressedObject;
LW	R2, Offset(_PressedObject+0)(GP)
SW	R2, Offset(_exec_round_button+0)(GP)
;minisub_driver.c,748 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
LW	R2, Offset(_PressedObject+0)(GP)
ADDIU	R2, R2, 47
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Up270
NOP	
J	L_minisub_driver_Process_TP_Up164
NOP	
L_minisub_driver_Process_TP_Up270:
LW	R2, Offset(_exec_round_button+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L_minisub_driver_Process_TP_Up271
NOP	
J	L_minisub_driver_Process_TP_Up163
NOP	
L_minisub_driver_Process_TP_Up271:
L_minisub_driver_Process_TP_Up162:
;minisub_driver.c,749 :: 		DrawRoundButton(exec_round_button);
SH	R26, 4(SP)
SH	R25, 6(SP)
LW	R25, Offset(_exec_round_button+0)(GP)
JAL	_DrawRoundButton+0
NOP	
LHU	R25, 6(SP)
LHU	R26, 4(SP)
;minisub_driver.c,748 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L_minisub_driver_Process_TP_Up164:
L_minisub_driver_Process_TP_Up163:
;minisub_driver.c,751 :: 		break;
J	L_minisub_driver_Process_TP_Up109
NOP	
;minisub_driver.c,752 :: 		}
L_minisub_driver_Process_TP_Up111:
;minisub_driver.c,753 :: 		break;
J	L_minisub_driver_Process_TP_Up109
NOP	
;minisub_driver.c,756 :: 		case 6: {
L_minisub_driver_Process_TP_Up115:
;minisub_driver.c,757 :: 		if (PressedObject != 0) {
LW	R2, Offset(_PressedObject+0)(GP)
BNE	R2, R0, L_minisub_driver_Process_TP_Up273
NOP	
J	L_minisub_driver_Process_TP_Up116
NOP	
L_minisub_driver_Process_TP_Up273:
;minisub_driver.c,758 :: 		exec_box = (TBox*)PressedObject;
LW	R2, Offset(_PressedObject+0)(GP)
SW	R2, Offset(_exec_box+0)(GP)
;minisub_driver.c,759 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
LW	R2, Offset(_PressedObject+0)(GP)
ADDIU	R2, R2, 30
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Up274
NOP	
J	L_minisub_driver_Process_TP_Up166
NOP	
L_minisub_driver_Process_TP_Up274:
LW	R2, Offset(_exec_box+0)(GP)
LW	R3, 0(R2)
LW	R2, Offset(_CurrentScreen+0)(GP)
BEQ	R3, R2, L_minisub_driver_Process_TP_Up275
NOP	
J	L_minisub_driver_Process_TP_Up165
NOP	
L_minisub_driver_Process_TP_Up275:
L_minisub_driver_Process_TP_Up161:
;minisub_driver.c,760 :: 		DrawBox(exec_box);
SH	R26, 4(SP)
SH	R25, 6(SP)
LW	R25, Offset(_exec_box+0)(GP)
JAL	_DrawBox+0
NOP	
LHU	R25, 6(SP)
LHU	R26, 4(SP)
;minisub_driver.c,759 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L_minisub_driver_Process_TP_Up166:
L_minisub_driver_Process_TP_Up165:
;minisub_driver.c,762 :: 		break;
J	L_minisub_driver_Process_TP_Up109
NOP	
;minisub_driver.c,763 :: 		}
L_minisub_driver_Process_TP_Up116:
;minisub_driver.c,764 :: 		break;
J	L_minisub_driver_Process_TP_Up109
NOP	
;minisub_driver.c,766 :: 		}
L_minisub_driver_Process_TP_Up108:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L_minisub_driver_Process_TP_Up277
NOP	
J	L_minisub_driver_Process_TP_Up110
NOP	
L_minisub_driver_Process_TP_Up277:
LH	R3, Offset(_PressedObjectType+0)(GP)
ORI	R2, R0, 6
BNE	R3, R2, L_minisub_driver_Process_TP_Up279
NOP	
J	L_minisub_driver_Process_TP_Up115
NOP	
L_minisub_driver_Process_TP_Up279:
L_minisub_driver_Process_TP_Up109:
;minisub_driver.c,768 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;minisub_driver.c,770 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;minisub_driver.c,773 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L_minisub_driver_Process_TP_Up281
NOP	
J	L_minisub_driver_Process_TP_Up120
NOP	
L_minisub_driver_Process_TP_Up281:
;minisub_driver.c,775 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up282
NOP	
J	L_minisub_driver_Process_TP_Up121
NOP	
L_minisub_driver_Process_TP_Up282:
;minisub_driver.c,776 :: 		if (exec_round_button->Active == 1) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Up283
NOP	
J	L_minisub_driver_Process_TP_Up122
NOP	
L_minisub_driver_Process_TP_Up283:
;minisub_driver.c,777 :: 		if (exec_round_button->OnUpPtr != 0)
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up285
NOP	
J	L_minisub_driver_Process_TP_Up123
NOP	
L_minisub_driver_Process_TP_Up285:
;minisub_driver.c,778 :: 		exec_round_button->OnUpPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 52
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up123:
;minisub_driver.c,779 :: 		if (PressedObject == (void *)exec_round_button)
LW	R3, Offset(_exec_round_button+0)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up286
NOP	
J	L_minisub_driver_Process_TP_Up124
NOP	
L_minisub_driver_Process_TP_Up286:
;minisub_driver.c,780 :: 		if (exec_round_button->OnClickPtr != 0)
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up288
NOP	
J	L_minisub_driver_Process_TP_Up125
NOP	
L_minisub_driver_Process_TP_Up288:
;minisub_driver.c,781 :: 		exec_round_button->OnClickPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 60
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up125:
L_minisub_driver_Process_TP_Up124:
;minisub_driver.c,782 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;minisub_driver.c,783 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,784 :: 		return;
J	L_end_Process_TP_Up
NOP	
;minisub_driver.c,785 :: 		}
L_minisub_driver_Process_TP_Up122:
;minisub_driver.c,786 :: 		}
L_minisub_driver_Process_TP_Up121:
;minisub_driver.c,789 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up289
NOP	
J	L_minisub_driver_Process_TP_Up126
NOP	
L_minisub_driver_Process_TP_Up289:
;minisub_driver.c,790 :: 		if (exec_label->Active == 1) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 27
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Up290
NOP	
J	L_minisub_driver_Process_TP_Up127
NOP	
L_minisub_driver_Process_TP_Up290:
;minisub_driver.c,791 :: 		if (exec_label->OnUpPtr != 0)
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 28
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up292
NOP	
J	L_minisub_driver_Process_TP_Up128
NOP	
L_minisub_driver_Process_TP_Up292:
;minisub_driver.c,792 :: 		exec_label->OnUpPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 28
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up128:
;minisub_driver.c,793 :: 		if (PressedObject == (void *)exec_label)
LW	R3, Offset(_exec_label+0)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up293
NOP	
J	L_minisub_driver_Process_TP_Up129
NOP	
L_minisub_driver_Process_TP_Up293:
;minisub_driver.c,794 :: 		if (exec_label->OnClickPtr != 0)
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up295
NOP	
J	L_minisub_driver_Process_TP_Up130
NOP	
L_minisub_driver_Process_TP_Up295:
;minisub_driver.c,795 :: 		exec_label->OnClickPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up130:
L_minisub_driver_Process_TP_Up129:
;minisub_driver.c,796 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;minisub_driver.c,797 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,798 :: 		return;
J	L_end_Process_TP_Up
NOP	
;minisub_driver.c,799 :: 		}
L_minisub_driver_Process_TP_Up127:
;minisub_driver.c,800 :: 		}
L_minisub_driver_Process_TP_Up126:
;minisub_driver.c,803 :: 		if (_object_count == box_order) {
LH	R3, Offset(_box_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up296
NOP	
J	L_minisub_driver_Process_TP_Up131
NOP	
L_minisub_driver_Process_TP_Up296:
;minisub_driver.c,804 :: 		if (exec_box->Active == 1) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Up297
NOP	
J	L_minisub_driver_Process_TP_Up132
NOP	
L_minisub_driver_Process_TP_Up297:
;minisub_driver.c,805 :: 		if (exec_box->OnUpPtr != 0)
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up299
NOP	
J	L_minisub_driver_Process_TP_Up133
NOP	
L_minisub_driver_Process_TP_Up299:
;minisub_driver.c,806 :: 		exec_box->OnUpPtr();
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 36
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up133:
;minisub_driver.c,807 :: 		if (PressedObject == (void *)exec_box)
LW	R3, Offset(_exec_box+0)(GP)
LW	R2, Offset(_PressedObject+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Up300
NOP	
J	L_minisub_driver_Process_TP_Up134
NOP	
L_minisub_driver_Process_TP_Up300:
;minisub_driver.c,808 :: 		if (exec_box->OnClickPtr != 0)
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Up302
NOP	
J	L_minisub_driver_Process_TP_Up135
NOP	
L_minisub_driver_Process_TP_Up302:
;minisub_driver.c,809 :: 		exec_box->OnClickPtr();
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 44
LW	R2, 0(R2)
JALR	RA, R2
NOP	
L_minisub_driver_Process_TP_Up135:
L_minisub_driver_Process_TP_Up134:
;minisub_driver.c,810 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;minisub_driver.c,811 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,812 :: 		return;
J	L_end_Process_TP_Up
NOP	
;minisub_driver.c,813 :: 		}
L_minisub_driver_Process_TP_Up132:
;minisub_driver.c,814 :: 		}
L_minisub_driver_Process_TP_Up131:
;minisub_driver.c,816 :: 		}
L_minisub_driver_Process_TP_Up120:
;minisub_driver.c,817 :: 		PressedObject = 0;
SW	R0, Offset(_PressedObject+0)(GP)
;minisub_driver.c,818 :: 		PressedObjectType = -1;
ORI	R2, R0, 65535
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,819 :: 		}
L_end_Process_TP_Up:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of minisub_driver_Process_TP_Up
minisub_driver_Process_TP_Down:
;minisub_driver.c,821 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;minisub_driver.c,823 :: 		object_pressed      = 0;
SW	R25, 4(SP)
SB	R0, Offset(_object_pressed+0)(GP)
;minisub_driver.c,824 :: 		exec_round_button   = 0;
SW	R0, Offset(_exec_round_button+0)(GP)
;minisub_driver.c,825 :: 		exec_label          = 0;
SW	R0, Offset(_exec_label+0)(GP)
;minisub_driver.c,826 :: 		exec_box            = 0;
SW	R0, Offset(_exec_box+0)(GP)
;minisub_driver.c,828 :: 		Get_Object(X, Y);
JAL	_Get_Object+0
NOP	
;minisub_driver.c,830 :: 		if (_object_count != -1) {
LH	R3, Offset(__object_count+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BNE	R3, R2, L_minisub_driver_Process_TP_Down305
NOP	
J	L_minisub_driver_Process_TP_Down136
NOP	
L_minisub_driver_Process_TP_Down305:
;minisub_driver.c,831 :: 		if (_object_count == round_button_order) {
LH	R3, Offset(_round_button_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Down306
NOP	
J	L_minisub_driver_Process_TP_Down137
NOP	
L_minisub_driver_Process_TP_Down306:
;minisub_driver.c,832 :: 		if (exec_round_button->Active == 1) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Down307
NOP	
J	L_minisub_driver_Process_TP_Down138
NOP	
L_minisub_driver_Process_TP_Down307:
;minisub_driver.c,833 :: 		if (exec_round_button->PressColEnabled == 1) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 47
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Down308
NOP	
J	L_minisub_driver_Process_TP_Down139
NOP	
L_minisub_driver_Process_TP_Down308:
;minisub_driver.c,834 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;minisub_driver.c,835 :: 		DrawRoundButton(exec_round_button);
LW	R25, Offset(_exec_round_button+0)(GP)
JAL	_DrawRoundButton+0
NOP	
;minisub_driver.c,836 :: 		}
L_minisub_driver_Process_TP_Down139:
;minisub_driver.c,837 :: 		PressedObject = (void *)exec_round_button;
LW	R2, Offset(_exec_round_button+0)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;minisub_driver.c,838 :: 		PressedObjectType = 1;
ORI	R2, R0, 1
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,839 :: 		if (exec_round_button->OnDownPtr != 0) {
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Down310
NOP	
J	L_minisub_driver_Process_TP_Down140
NOP	
L_minisub_driver_Process_TP_Down310:
;minisub_driver.c,840 :: 		exec_round_button->OnDownPtr();
LW	R2, Offset(_exec_round_button+0)(GP)
ADDIU	R2, R2, 56
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,841 :: 		return;
J	L_end_Process_TP_Down
NOP	
;minisub_driver.c,842 :: 		}
L_minisub_driver_Process_TP_Down140:
;minisub_driver.c,843 :: 		}
L_minisub_driver_Process_TP_Down138:
;minisub_driver.c,844 :: 		}
L_minisub_driver_Process_TP_Down137:
;minisub_driver.c,846 :: 		if (_object_count == label_order) {
LH	R3, Offset(_label_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Down311
NOP	
J	L_minisub_driver_Process_TP_Down141
NOP	
L_minisub_driver_Process_TP_Down311:
;minisub_driver.c,847 :: 		if (exec_label->Active == 1) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 27
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Down312
NOP	
J	L_minisub_driver_Process_TP_Down142
NOP	
L_minisub_driver_Process_TP_Down312:
;minisub_driver.c,848 :: 		PressedObject = (void *)exec_label;
LW	R2, Offset(_exec_label+0)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;minisub_driver.c,849 :: 		PressedObjectType = 2;
ORI	R2, R0, 2
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,850 :: 		if (exec_label->OnDownPtr != 0) {
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Down314
NOP	
J	L_minisub_driver_Process_TP_Down143
NOP	
L_minisub_driver_Process_TP_Down314:
;minisub_driver.c,851 :: 		exec_label->OnDownPtr();
LW	R2, Offset(_exec_label+0)(GP)
ADDIU	R2, R2, 32
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,852 :: 		return;
J	L_end_Process_TP_Down
NOP	
;minisub_driver.c,853 :: 		}
L_minisub_driver_Process_TP_Down143:
;minisub_driver.c,854 :: 		}
L_minisub_driver_Process_TP_Down142:
;minisub_driver.c,855 :: 		}
L_minisub_driver_Process_TP_Down141:
;minisub_driver.c,857 :: 		if (_object_count == box_order) {
LH	R3, Offset(_box_order+0)(GP)
LH	R2, Offset(__object_count+0)(GP)
BEQ	R2, R3, L_minisub_driver_Process_TP_Down315
NOP	
J	L_minisub_driver_Process_TP_Down144
NOP	
L_minisub_driver_Process_TP_Down315:
;minisub_driver.c,858 :: 		if (exec_box->Active == 1) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 19
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Down316
NOP	
J	L_minisub_driver_Process_TP_Down145
NOP	
L_minisub_driver_Process_TP_Down316:
;minisub_driver.c,859 :: 		if (exec_box->PressColEnabled == 1) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 30
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 1
BEQ	R3, R2, L_minisub_driver_Process_TP_Down317
NOP	
J	L_minisub_driver_Process_TP_Down146
NOP	
L_minisub_driver_Process_TP_Down317:
;minisub_driver.c,860 :: 		object_pressed = 1;
ORI	R2, R0, 1
SB	R2, Offset(_object_pressed+0)(GP)
;minisub_driver.c,861 :: 		DrawBox(exec_box);
LW	R25, Offset(_exec_box+0)(GP)
JAL	_DrawBox+0
NOP	
;minisub_driver.c,862 :: 		}
L_minisub_driver_Process_TP_Down146:
;minisub_driver.c,863 :: 		PressedObject = (void *)exec_box;
LW	R2, Offset(_exec_box+0)(GP)
SW	R2, Offset(_PressedObject+0)(GP)
;minisub_driver.c,864 :: 		PressedObjectType = 6;
ORI	R2, R0, 6
SH	R2, Offset(_PressedObjectType+0)(GP)
;minisub_driver.c,865 :: 		if (exec_box->OnDownPtr != 0) {
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
BNE	R2, R0, L_minisub_driver_Process_TP_Down319
NOP	
J	L_minisub_driver_Process_TP_Down147
NOP	
L_minisub_driver_Process_TP_Down319:
;minisub_driver.c,866 :: 		exec_box->OnDownPtr();
LW	R2, Offset(_exec_box+0)(GP)
ADDIU	R2, R2, 40
LW	R2, 0(R2)
JALR	RA, R2
NOP	
;minisub_driver.c,867 :: 		return;
J	L_end_Process_TP_Down
NOP	
;minisub_driver.c,868 :: 		}
L_minisub_driver_Process_TP_Down147:
;minisub_driver.c,869 :: 		}
L_minisub_driver_Process_TP_Down145:
;minisub_driver.c,870 :: 		}
L_minisub_driver_Process_TP_Down144:
;minisub_driver.c,872 :: 		}
L_minisub_driver_Process_TP_Down136:
;minisub_driver.c,873 :: 		}
L_end_Process_TP_Down:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of minisub_driver_Process_TP_Down
_Check_TP:
;minisub_driver.c,875 :: 		void Check_TP() {
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;minisub_driver.c,876 :: 		if (TP_TFT_Press_Detect()) {
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_TP_TFT_Press_Detect+0
NOP	
BNE	R2, R0, L__Check_TP322
NOP	
J	L_Check_TP148
NOP	
L__Check_TP322:
;minisub_driver.c,878 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
LUI	R26, #hi_addr(_Ycoord+0)
ORI	R26, R26, #lo_addr(_Ycoord+0)
LUI	R25, #hi_addr(_Xcoord+0)
ORI	R25, R25, #lo_addr(_Xcoord+0)
JAL	_TP_TFT_Get_Coordinates+0
NOP	
ANDI	R2, R2, 255
BEQ	R2, R0, L__Check_TP323
NOP	
J	L_Check_TP149
NOP	
L__Check_TP323:
;minisub_driver.c,879 :: 		Process_TP_Press(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	minisub_driver_Process_TP_Press+0
NOP	
;minisub_driver.c,880 :: 		if (PenDown == 0) {
LBU	R2, Offset(_PenDown+0)(GP)
BEQ	R2, R0, L__Check_TP324
NOP	
J	L_Check_TP150
NOP	
L__Check_TP324:
;minisub_driver.c,881 :: 		PenDown = 1;
ORI	R2, R0, 1
SB	R2, Offset(_PenDown+0)(GP)
;minisub_driver.c,882 :: 		Process_TP_Down(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	minisub_driver_Process_TP_Down+0
NOP	
;minisub_driver.c,883 :: 		}
L_Check_TP150:
;minisub_driver.c,884 :: 		}
L_Check_TP149:
;minisub_driver.c,885 :: 		}
J	L_Check_TP151
NOP	
L_Check_TP148:
;minisub_driver.c,886 :: 		else if (PenDown == 1) {
LBU	R3, Offset(_PenDown+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__Check_TP325
NOP	
J	L_Check_TP152
NOP	
L__Check_TP325:
;minisub_driver.c,887 :: 		PenDown = 0;
SB	R0, Offset(_PenDown+0)(GP)
;minisub_driver.c,888 :: 		Process_TP_Up(Xcoord, Ycoord);
LHU	R26, Offset(_Ycoord+0)(GP)
LHU	R25, Offset(_Xcoord+0)(GP)
JAL	minisub_driver_Process_TP_Up+0
NOP	
;minisub_driver.c,889 :: 		}
L_Check_TP152:
L_Check_TP151:
;minisub_driver.c,890 :: 		}
L_end_Check_TP:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Check_TP
_Init_MCU:
;minisub_driver.c,892 :: 		void Init_MCU() {
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;minisub_driver.c,893 :: 		PMMODE = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R0, Offset(PMMODE+0)(GP)
;minisub_driver.c,894 :: 		PMAEN  = 0;
SW	R0, Offset(PMAEN+0)(GP)
;minisub_driver.c,895 :: 		PMCON  = 0;  // WRSP: Write Strobe Polarity bit
SW	R0, Offset(PMCON+0)(GP)
;minisub_driver.c,896 :: 		PMMODEbits.MODE = 2;     // Master 2
ORI	R3, R0, 2
LHU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R3, 8, 2
SH	R2, Offset(PMMODEbits+0)(GP)
;minisub_driver.c,897 :: 		PMMODEbits.WAITB = 0;
LBU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R0, 6, 2
SB	R2, Offset(PMMODEbits+0)(GP)
;minisub_driver.c,898 :: 		PMMODEbits.WAITM = 1;
ORI	R3, R0, 1
LBU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R3, 2, 4
SB	R2, Offset(PMMODEbits+0)(GP)
;minisub_driver.c,899 :: 		PMMODEbits.WAITE = 0;
LBU	R2, Offset(PMMODEbits+0)(GP)
INS	R2, R0, 0, 2
SB	R2, Offset(PMMODEbits+0)(GP)
;minisub_driver.c,900 :: 		PMMODEbits.MODE16 = 1;   // 16 bit mode
LBU	R2, Offset(PMMODEbits+1)(GP)
ORI	R2, R2, 4
SB	R2, Offset(PMMODEbits+1)(GP)
;minisub_driver.c,901 :: 		PMCONbits.CSF = 0;
LBU	R2, Offset(PMCONbits+0)(GP)
INS	R2, R0, 6, 2
SB	R2, Offset(PMCONbits+0)(GP)
;minisub_driver.c,902 :: 		PMCONbits.PTRDEN = 1;
LBU	R2, Offset(PMCONbits+1)(GP)
ORI	R2, R2, 1
SB	R2, Offset(PMCONbits+1)(GP)
;minisub_driver.c,903 :: 		PMCONbits.PTWREN = 1;
LBU	R2, Offset(PMCONbits+1)(GP)
ORI	R2, R2, 2
SB	R2, Offset(PMCONbits+1)(GP)
;minisub_driver.c,904 :: 		PMCONbits.PMPEN = 1;
LBU	R2, Offset(PMCONbits+1)(GP)
ORI	R2, R2, 128
SB	R2, Offset(PMCONbits+1)(GP)
;minisub_driver.c,905 :: 		TP_TFT_Rotate_180(0);
MOVZ	R25, R0, R0
JAL	_TP_TFT_Rotate_180+0
NOP	
;minisub_driver.c,906 :: 		TFT_Set_Active(Set_Index,Write_Command,Write_Data);
LUI	R27, #hi_addr(_Write_Data+0)
ORI	R27, R27, #lo_addr(_Write_Data+0)
LUI	R26, #hi_addr(_Write_Command+0)
ORI	R26, R26, #lo_addr(_Write_Command+0)
LUI	R25, #hi_addr(_Set_Index+0)
ORI	R25, R25, #lo_addr(_Set_Index+0)
JAL	_TFT_Set_Active+0
NOP	
;minisub_driver.c,907 :: 		}
L_end_Init_MCU:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Init_MCU
_Start_TP:
;minisub_driver.c,909 :: 		void Start_TP() {
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;minisub_driver.c,910 :: 		Init_MCU();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
JAL	_Init_MCU+0
NOP	
;minisub_driver.c,912 :: 		InitializeTouchPanel();
JAL	minisub_driver_InitializeTouchPanel+0
NOP	
;minisub_driver.c,915 :: 		TP_TFT_Set_Calibration_Consts(76, 907, 77, 915);    // Set calibration constants
ORI	R28, R0, 915
ORI	R27, R0, 77
ORI	R26, R0, 907
ORI	R25, R0, 76
JAL	_TP_TFT_Set_Calibration_Consts+0
NOP	
;minisub_driver.c,917 :: 		InitializeObjects();
JAL	minisub_driver_InitializeObjects+0
NOP	
;minisub_driver.c,918 :: 		display_width = Screen1.Width;
LHU	R2, Offset(_Screen1+2)(GP)
SH	R2, Offset(_display_width+0)(GP)
;minisub_driver.c,919 :: 		display_height = Screen1.Height;
LHU	R2, Offset(_Screen1+4)(GP)
SH	R2, Offset(_display_height+0)(GP)
;minisub_driver.c,920 :: 		DrawScreen(&Screen1);
LUI	R25, #hi_addr(_Screen1+0)
ORI	R25, R25, #lo_addr(_Screen1+0)
JAL	_DrawScreen+0
NOP	
;minisub_driver.c,921 :: 		}
L_end_Start_TP:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Start_TP
minisub_driver____?ag:
L_end_minisub_driver___?ag:
JR	RA
NOP	
; end of minisub_driver____?ag
