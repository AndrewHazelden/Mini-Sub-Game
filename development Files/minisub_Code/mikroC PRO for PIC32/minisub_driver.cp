#line 1 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_driver.c"
#line 1 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/minisub_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned short ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen MenuScreen;
extern TButton_Round ResumeButton;
extern TButton_Round HelpButton;
extern TButton_Round NewGameButton;
extern TLabel Label1;
extern TProgressBar ProgressBar1;
extern TBox VolumeBox;
extern TButton_Round * const code Screen1_Buttons_Round[3];
extern TLabel * const code Screen1_Labels[1];
extern TBox * const code Screen1_Boxes[1];
extern TProgressBar * const code Screen1_ProgressBars[1];


extern TScreen Screen1;





void HelpButtonOnUp();
void NewGameButtonOnUp();
void ResumeButtonOnUp();
void VolumeBoxOnPress();




extern char ResumeButton_Caption[];
extern char HelpButton_Caption[];
extern char NewGameButton_Caption[];
extern char Label1_Caption[];
extern char ProgressBar1_Caption[];
extern char VolumeBox_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawBox(TBox *ABox);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
#line 1 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/minisub_resources.h"
const code char Tahoma16x19_Regular[];
const code char Tahoma23x29_Regular[];
const code char Tahoma11x13_Regular[];
const code char andrew_bmp[1542];
const code char dark_mine1_bmp[2543];
const code char dark_mine2_bmp[2543];
const code char dark_mine3_bmp[2543];
const code char dark_mine4_bmp[2543];
const code char dark_mine5_bmp[2543];
const code char dark_mine6_bmp[2543];
const code char explode_bmp[4718];
const code char fireball_bmp[17938];
const code char gameover_bmp[15558];
const code char heart_pack_bmp[2543];
const code char lives_bmp[878];
const code char mikroC_bmp[1542];
const code char mikroe_bmp[1542];
const code char mine1_bmp[2543];
const code char mine2_bmp[2543];
const code char mine3_bmp[2543];
const code char mine4_bmp[2543];
const code char mine5_bmp[2543];
const code char mine6_bmp[2543];
const code char sound_bmp[878];
const code char soundMute_bmp[878];
const code char sub_bmp[3479];
const code char title_bmp[12503];
const code char tonyB_bmp[1542];
const code char torpedo_bmp[1008];
const code char torpedo_pack_bmp[2543];
const code char torpedo_status_bmp[626];
const code char sound_low_bmp[878];
const code char sound_med_bmp[878];
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 7 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_driver.c"
char TFT_DataPort at LATE;
sbit TFT_RST at LATC1_bit;
sbit TFT_BLED at LATA9_bit;
sbit TFT_RS at LATB15_bit;
sbit TFT_CS at LATF12_bit;
sbit TFT_RD at LATD5_bit;
sbit TFT_WR at LATD4_bit;
char TFT_DataPort_Direction at TRISE;
sbit TFT_RST_Direction at TRISC1_bit;
sbit TFT_BLED_Direction at TRISA9_bit;
sbit TFT_RS_Direction at TRISB15_bit;
sbit TFT_CS_Direction at TRISF12_bit;
sbit TFT_RD_Direction at TRISD5_bit;
sbit TFT_WR_Direction at TRISD4_bit;



sbit DRIVEX_LEFT at LATB13_bit;
sbit DRIVEX_RIGHT at LATB11_bit;
sbit DRIVEY_UP at LATB12_bit;
sbit DRIVEY_DOWN at LATB10_bit;
sbit DRIVEX_LEFT_DIRECTION at TRISB13_bit;
sbit DRIVEX_RIGHT_DIRECTION at TRISB11_bit;
sbit DRIVEY_UP_DIRECTION at TRISB12_bit;
sbit DRIVEY_DOWN_DIRECTION at TRISB10_bit;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 1000;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TBox *local_box;
TBox *exec_box;
int box_order;
TProgressBar *local_progress_bar;
TProgressBar *exec_progress_bar;
int progress_bar_order;

void PMPWaitBusy() {
 while(PMMODEbits.BUSY);
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 PMDIN = index;
 PMPWaitBusy();
}

void Write_Command( unsigned short cmd ) {
 TFT_RS = 1;
 PMDIN = cmd;
 PMPWaitBusy();
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 PMDIN = _data;
 PMPWaitBusy();
}


void Init_ADC() {
 AD1PCFG = 0xFFFF;
 PCFG12_bit = 0;
 PCFG13_bit = 0;

 ADC1_Init();
}
static void InitializeTouchPanel() {
 Init_ADC();
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init(320, 240);

 TP_TFT_Init(320, 240, 13, 12);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen MenuScreen;
 TButton_Round ResumeButton;
char ResumeButton_Caption[14] = "Resume   Game";

 TButton_Round HelpButton;
char HelpButton_Caption[16] = "Mini-Sub   Help";

 TButton_Round NewGameButton;
char NewGameButton_Caption[11] = "New   Game";

 TLabel Label1;
char Label1_Caption[8] = "Volume:";

 TProgressBar ProgressBar1;
char ProgressBar1_Caption[8] = "100\%";

 TBox VolumeBox;
 TButton_Round * const code Screen1_Buttons_Round[3]=
 {
 &ResumeButton,
 &HelpButton,
 &NewGameButton
 };
 TLabel * const code Screen1_Labels[1]=
 {
 &Label1
 };
 TBox * const code Screen1_Boxes[1]=
 {
 &VolumeBox
 };
 TProgressBar * const code Screen1_ProgressBars[1]=
 {
 &ProgressBar1
 };


 TScreen Screen1;




static void InitializeObjects() {
 MenuScreen.Color = 0x0315;
 MenuScreen.Width = 320;
 MenuScreen.Height = 240;
 MenuScreen.Buttons_RoundCount = 3;
 MenuScreen.Buttons_Round = Screen1_Buttons_Round;
 MenuScreen.LabelsCount = 1;
 MenuScreen.Labels = Screen1_Labels;
 MenuScreen.BoxesCount = 1;
 MenuScreen.Boxes = Screen1_Boxes;
 MenuScreen.ProgressBarsCount = 1;
 MenuScreen.ProgressBars = Screen1_ProgressBars;
 MenuScreen.ObjectsCount = 6;

 Screen1.Color = 0x0315;
 Screen1.Width = 320;
 Screen1.Height = 240;
 Screen1.Buttons_RoundCount = 0;
 Screen1.LabelsCount = 0;
 Screen1.BoxesCount = 0;
 Screen1.ProgressBarsCount = 0;
 Screen1.ObjectsCount = 0;


 ResumeButton.OwnerScreen = &MenuScreen;
 ResumeButton.Order = 0;
 ResumeButton.Left = 22;
 ResumeButton.Top = 186;
 ResumeButton.Width = 276;
 ResumeButton.Height = 48;
 ResumeButton.Pen_Width = 4;
 ResumeButton.Pen_Color = 0x0000;
 ResumeButton.Visible = 1;
 ResumeButton.Active = 1;
 ResumeButton.Transparent = 1;
 ResumeButton.Caption = ResumeButton_Caption;
 ResumeButton.TextAlign = _taCenter;
 ResumeButton.FontName = Tahoma23x29_Regular;
 ResumeButton.PressColEnabled = 1;
 ResumeButton.Font_Color = 0x0000;
 ResumeButton.Gradient = 1;
 ResumeButton.Gradient_Orientation = 0;
 ResumeButton.Gradient_Start_Color = 0xFFFF;
 ResumeButton.Gradient_End_Color = 0xC618;
 ResumeButton.Color = 0xC618;
 ResumeButton.Press_Color = 0x8410;
 ResumeButton.Corner_Radius = 3;
 ResumeButton.OnUpPtr = ResumeButtonOnUp;
 ResumeButton.OnDownPtr = 0;
 ResumeButton.OnClickPtr = 0;
 ResumeButton.OnPressPtr = 0;

 HelpButton.OwnerScreen = &MenuScreen;
 HelpButton.Order = 1;
 HelpButton.Left = 22;
 HelpButton.Top = 125;
 HelpButton.Width = 276;
 HelpButton.Height = 48;
 HelpButton.Pen_Width = 1;
 HelpButton.Pen_Color = 0x0000;
 HelpButton.Visible = 1;
 HelpButton.Active = 1;
 HelpButton.Transparent = 1;
 HelpButton.Caption = HelpButton_Caption;
 HelpButton.TextAlign = _taCenter;
 HelpButton.FontName = Tahoma23x29_Regular;
 HelpButton.PressColEnabled = 1;
 HelpButton.Font_Color = 0x0000;
 HelpButton.Gradient = 1;
 HelpButton.Gradient_Orientation = 0;
 HelpButton.Gradient_Start_Color = 0xFFFF;
 HelpButton.Gradient_End_Color = 0xC618;
 HelpButton.Color = 0xC618;
 HelpButton.Press_Color = 0x8410;
 HelpButton.Corner_Radius = 3;
 HelpButton.OnUpPtr = HelpButtonOnUp;
 HelpButton.OnDownPtr = 0;
 HelpButton.OnClickPtr = 0;
 HelpButton.OnPressPtr = 0;

 NewGameButton.OwnerScreen = &MenuScreen;
 NewGameButton.Order = 2;
 NewGameButton.Left = 22;
 NewGameButton.Top = 64;
 NewGameButton.Width = 276;
 NewGameButton.Height = 48;
 NewGameButton.Pen_Width = 1;
 NewGameButton.Pen_Color = 0x0000;
 NewGameButton.Visible = 1;
 NewGameButton.Active = 1;
 NewGameButton.Transparent = 1;
 NewGameButton.Caption = NewGameButton_Caption;
 NewGameButton.TextAlign = _taCenter;
 NewGameButton.FontName = Tahoma23x29_Regular;
 NewGameButton.PressColEnabled = 1;
 NewGameButton.Font_Color = 0x0000;
 NewGameButton.Gradient = 1;
 NewGameButton.Gradient_Orientation = 0;
 NewGameButton.Gradient_Start_Color = 0xFFFF;
 NewGameButton.Gradient_End_Color = 0xC618;
 NewGameButton.Color = 0xC618;
 NewGameButton.Press_Color = 0x8410;
 NewGameButton.Corner_Radius = 3;
 NewGameButton.OnUpPtr = NewGameButtonOnUp;
 NewGameButton.OnDownPtr = 0;
 NewGameButton.OnClickPtr = 0;
 NewGameButton.OnPressPtr = 0;

 Label1.OwnerScreen = &MenuScreen;
 Label1.Order = 3;
 Label1.Left = 23;
 Label1.Top = 17;
 Label1.Width = 60;
 Label1.Height = 21;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName = Tahoma16x19_Regular;
 Label1.Font_Color = 0xFFFF;
 Label1.OnUpPtr = 0;
 Label1.OnDownPtr = 0;
 Label1.OnClickPtr = 0;
 Label1.OnPressPtr = 0;

 ProgressBar1.OwnerScreen = &MenuScreen;
 ProgressBar1.Order = 4;
 ProgressBar1.Left = 96;
 ProgressBar1.Top = 10;
 ProgressBar1.Width = 200;
 ProgressBar1.Height = 36;
 ProgressBar1.Pen_Width = 1;
 ProgressBar1.Pen_Color = 0x0000;
 ProgressBar1.Visible = 1;
 ProgressBar1.Active = 1;
 ProgressBar1.Transparent = 1;
 ProgressBar1.Caption = ProgressBar1_Caption;
 ProgressBar1.FontName = Tahoma11x13_Regular;
 ProgressBar1.Font_Color = 0x0000;
 ProgressBar1.Gradient = 1;
 ProgressBar1.Gradient_Orientation = 0;
 ProgressBar1.Gradient_Start_Color = 0xF800;
 ProgressBar1.Gradient_End_Color = 0x8000;
 ProgressBar1.Color = 0xA65E;
 ProgressBar1.Background_Color = 0x8410;
 ProgressBar1.Min = 0;
 ProgressBar1.Max = 100;
 ProgressBar1.Position = 100;
 ProgressBar1.Show_Position = 1;
 ProgressBar1.Show_Percentage = 1;
 ProgressBar1.Smooth = 1;
 ProgressBar1.Rounded = 1;
 ProgressBar1.Corner_Radius = 3;

 VolumeBox.OwnerScreen = &MenuScreen;
 VolumeBox.Order = 5;
 VolumeBox.Left = 96;
 VolumeBox.Top = 0;
 VolumeBox.Width = 200;
 VolumeBox.Height = 56;
 VolumeBox.Pen_Width = 1;
 VolumeBox.Pen_Color = 0x0000;
 VolumeBox.Visible = 0;
 VolumeBox.Active = 1;
 VolumeBox.Transparent = 0;
 VolumeBox.Gradient = 0;
 VolumeBox.Gradient_Orientation = 0;
 VolumeBox.Gradient_Start_Color = 0xFFFF;
 VolumeBox.Gradient_End_Color = 0xC618;
 VolumeBox.Color = 0xC618;
 VolumeBox.PressColEnabled = 1;
 VolumeBox.Press_Color = 0x8410;
 VolumeBox.OnUpPtr = 0;
 VolumeBox.OnDownPtr = 0;
 VolumeBox.OnClickPtr = 0;
 VolumeBox.OnPressPtr = VolumeBoxOnPress;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}







 void DeleteTrailingSpaces(char* str){
 char i;
 i = 0;
 while(1) {
 if(str[0] == ' ') {
 for(i = 0; i < strlen(str); i++) {
 str[i] = str[i+1];
 }
 }
 else
 break;
 }
 }

void DrawRoundButton(TButton_Round *Around_button) {
 if (Around_button->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
 Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
 }
 TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
 if (Around_button->Height > Around_button->Width) {
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 }
 else
 {
 TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
 }
 TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 TFT_Write_Text(Around_button->Caption, Around_button->Left + 4, (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
 else if (Around_button->TextAlign == _taCenter)
 TFT_Write_Text(Around_button->Caption, (Around_button->Left + (Around_button->Width - caption_length) / 2), (Around_button->Top + ((Around_button->Height - caption_height) / 2)));
 else if (Around_button->TextAlign == _taRight)
 TFT_Write_Text(Around_button->Caption, Around_button->Left + (Around_button->Width - caption_length - 4), (Around_button->Top + (Around_button->Height - caption_height) / 2));
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible == 1) {
 TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawBox(TBox *ABox) {
 if (ABox->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
 }
 TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
 }
}

void UpdatePBPosition(TProgressBar *AProgressBar) {
 int move_offset;
 unsigned int locPosition = 0;
 unsigned cnt = 0;
 char tmpStr[8];
 unsigned int tmpWidth = 0;
 unsigned int tmpRound = 0;
 move_offset = 10;
 locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
 if (AProgressBar->Visible == 1) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Background_Color, AProgressBar->Pen_Width);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 if (caption_height > AProgressBar->Height)
 caption_height = AProgressBar->Height;
 if (caption_length > AProgressBar->Width)
 caption_length = AProgressBar->Width;
 if (AProgressBar->Position < (AProgressBar->Left + (AProgressBar->Width - caption_length) / 2)) {
 TFT_Rectangle(AProgressBar->Left + (AProgressBar->Width - caption_length) / 2,
 AProgressBar->Top +(AProgressBar->Height - caption_height) / 2,
 AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length,
 AProgressBar->Top +(AProgressBar->Height - caption_height) / 2 + caption_height);
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 if (AProgressBar->Rounded == 1) {
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top, AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100 , AProgressBar->Top + AProgressBar->Height);
 }
 }
 else {
 if (locPosition > 0) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }

 if (AProgressBar->Smooth != 1) {
 if(AProgressBar->Rounded == 1) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }

 if (AProgressBar->Show_Position == 1){
 if (AProgressBar->Show_Percentage == 1) {
 IntToStr(locPosition , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 }
 else {
 IntToStr(AProgressBar->Position , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
 }
}

void DrawProgressBar(TProgressBar *AProgressBar) {
 int move_offset = 0;
 unsigned int locPosition = 0;
 unsigned cnt = 0;
 char tmpStr[8];
 unsigned int tmpWidth = 0;
 unsigned int tmpRound = 0;
 move_offset = 10;
 locPosition = (float)(AProgressBar->Position - AProgressBar->Min) / (float)(AProgressBar->Max - AProgressBar->Min) * 100;
 if (AProgressBar->Visible == 1) {
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
 if (AProgressBar->Rounded == 1) {

 TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top, AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }
 else {

 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width, AProgressBar->Top + AProgressBar->Height);
 if (locPosition > 0) {

 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
 TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + (locPosition * AProgressBar->Width) / 100, AProgressBar->Top + AProgressBar->Height);
 }
 }

 if (AProgressBar->Smooth != 1) {
 if(AProgressBar->Rounded == 1) {
 tmpRound = AProgressBar->Corner_Radius;
 cnt = move_offset + tmpRound;
 tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
 }
 else {
 tmpRound = 0;
 cnt = move_offset;
 tmpWidth = AProgressBar->Width;
 }
 TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
 while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
 if (cnt - tmpRound + 3 >= tmpWidth * locPosition)
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
 else
 TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
 cnt = cnt + move_offset + 3;
 }
 }

 if (AProgressBar->Show_Position == 1){
 if (AProgressBar->Show_Percentage == 1) {
 IntToStr(locPosition , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 strcat(AProgressBar->Caption, "\%");
 }
 else {
 IntToStr(AProgressBar->Position , tmpStr);
 DeleteTrailingSpaces(tmpStr);
 strcpy(AProgressBar->Caption, tmpStr);
 }
 TFT_Set_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
 TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
 }
 }
}

void DrawScreen(TScreen *aScreen) {
 int order;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short box_idx;
 TBox *local_box;
 unsigned short progress_bar_idx;
 TProgressBar *local_progress_bar;
 char save_bled, save_bled_direction;

 object_pressed = 0;
 order = 0;
 round_button_idx = 0;
 label_idx = 0;
 box_idx = 0;
 progress_bar_idx = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 save_bled_direction = TFT_BLED_Direction;
 TFT_BLED_Direction = 0;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
 TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 13, 12);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 TFT_BLED_Direction = save_bled_direction;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 order++;
 round_button_idx++;
 DrawRoundButton(local_round_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
 local_progress_bar =  CurrentScreen->ProgressBars[progress_bar_idx] ;
 if (order == local_progress_bar->Order) {
 progress_bar_idx++;
 order++;
 DrawProgressBar(local_progress_bar);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 round_button_order = -1;
 label_order = -1;
 box_order = -1;
 progress_bar_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active == 1) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active == 1) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active == 1) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ProgressBarsCount ; _object_count++ ) {
 local_progress_bar =  CurrentScreen->ProgressBars[_object_count] ;
 if (local_progress_bar->Active == 1) {
 if (IsInsideObject(X, Y, local_progress_bar->Left, local_progress_bar->Top,
 local_progress_bar->Width, local_progress_bar->Height) == 1) {
 progress_bar_order = local_progress_bar->Order;
 exec_progress_bar = local_progress_bar;
 }
 }
 }

 _object_count = -1;
 if (round_button_order > _object_count)
 _object_count = round_button_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (box_order > _object_count )
 _object_count = box_order;
 if (progress_bar_order > _object_count )
 _object_count = progress_bar_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_round_button = 0;
 exec_label = 0;
 exec_box = 0;
 exec_progress_bar = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 if (exec_box->OnPressPtr != 0) {
 exec_box->OnPressPtr();
 return;
 }
 }
 }

 }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 6: {
 if (PressedObject != 0) {
 exec_box = (TBox*)PressedObject;
 if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
 DrawBox(exec_box);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (void *)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (void *)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 if (exec_box->OnUpPtr != 0)
 exec_box->OnUpPtr();
 if (PressedObject == (void *)exec_box)
 if (exec_box->OnClickPtr != 0)
 exec_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_round_button = 0;
 exec_label = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->PressColEnabled == 1) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (void *)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 PressedObject = (void *)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 if (exec_box->PressColEnabled == 1) {
 object_pressed = 1;
 DrawBox(exec_box);
 }
 PressedObject = (void *)exec_box;
 PressedObjectType = 6;
 if (exec_box->OnDownPtr != 0) {
 exec_box->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (TP_TFT_Press_Detect()) {

 if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU() {
 PMMODE = 0;
 PMAEN = 0;
 PMCON = 0;
 PMMODEbits.MODE = 2;
 PMMODEbits.WAITB = 0;
 PMMODEbits.WAITM = 1;
 PMMODEbits.WAITE = 0;
 PMMODEbits.MODE16 = 1;
 PMCONbits.CSF = 0;
 PMCONbits.PTRDEN = 1;
 PMCONbits.PTWREN = 1;
 PMCONbits.PMPEN = 1;
 TP_TFT_Rotate_180(0);
 TFT_Set_Active(Set_Index,Write_Command,Write_Data);
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();


 TP_TFT_Set_Calibration_Consts(76, 907, 77, 915);

 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
