#line 1 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_events_code.c"
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
#line 5 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_events_code.c"
extern int start_game_flag;
extern int show_main_menu;
extern int toggled_main_menu;
extern int bgColor;
extern int subLives;
extern void ShowHelp();
extern void ResetGame();
extern void ToggleMute();
extern int score;
extern int muteSound;
extern int prev_muteSound;

extern unsigned int Xcoord, Ycoord;
char sound_level, old_sound_level;


extern void MP3_Set_Volume(char left, char right);


extern void UART1_Write_Label_Var(char *uart_text, int var );
extern void UART1_Write_Line(char *uart_text);

void HideTftMenu();
void RefreshMenu();

void RefreshMenu(){


 if(score){

 ResumeButton.Visible =1;
 }
 else
 {

 ResumeButton.Visible =0;
 }


 DrawScreen(&MenuScreen);
}

void HideTftMenu(){
 show_main_menu=0;
 toggled_main_menu=1;
}

void UpdateVolumeBar(char vol, char old_vol){


 ProgressBar1.Position = vol;
 DrawProgressBar(&ProgressBar1);

}







void NewGameButtonOnUp() {
 HideTftMenu();

 ResetGame();
}

void HelpButtonOnUp() {
 start_game_flag=0;
 ShowHelp();
 DrawScreen(&MenuScreen);
}






void ResumeButtonOnUp() {
 HideTftMenu();
 Delay_ms(300);
}

void VolumeBoxOnPress() {
 unsigned int temp;

 temp = Xcoord - VolumeBox.Left;
 temp = temp * 100;
 sound_level = temp / VolumeBox.Width;
 MP3_Set_Volume(100 - sound_level, 100 - sound_level);

 UpdateVolumeBar(sound_level, old_sound_level);
 UART1_Write_Label_Var("Sound Volume:", sound_level );
 old_sound_level = sound_level;


 if (sound_level <= 10){
 muteSound = 1;
 if(prev_muteSound == 0){
 UART1_Write_Line("Muting Sound.");
 }
 }
 else{
 muteSound = 0;
 if(prev_muteSound == 1){
 UART1_Write_Line("Sound On.");
 }
 }
}
