#line 1 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
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
#line 1 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/minisub_setup.h"
#line 22 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/minisub_setup.h"
int mine_speed = 4;








extern void Set_Index(unsigned short index);
extern void Write_Command(unsigned short cmd);
extern void Write_Data(unsigned int _data);
extern void Init_MCU();

void InitSprites();
void GetInput();
void RenderScreen();
void RenderScore();
void SavePreviousVal();
void ShowTitles();
void ShowHelp();
void ShowGameOver();
void ResetSeaMine(int mineNumber);
void ResetBonusBlock();
void ResetGame();
int RandomHeightY();
void ShowNextLevel();
void AnimateSeaMine(int mineNum);
void ClearTorpedo();
void CheckGameLevel();
void ToggleMute();


char IsCollision (unsigned int Shape_X, unsigned int Shape_Y, unsigned int Shape_Width, unsigned int Shape_Height,
 unsigned int Bomb_Left, unsigned int Bomb_Top, unsigned int Bomb_Width, unsigned int Bomb_Height);


extern void UART1_Write_Line(char *uart_text);
extern void UART1_Write_Variable(int var);
extern void UART1_Write_Long_Variable(long var);




typedef struct player {
 int x;
 int y;
 int prev_x;
 int prev_y;
};

typedef struct object {
 unsigned int width;
 unsigned int height;
 int x;
 int y;
 int prev_x;
 int prev_y;
 int visible;
 int type;
 int hits;
};


typedef struct clear_region{
 int top;
 int left;
 int bottom;
 int right;
};

struct object fireball;
struct object explode;
struct object torpedo;
struct player sub;
struct object mine[ 4 ];
struct object bonus_block;



struct clear_region clear_mine[ 4 ];
struct clear_region clear_sub;
struct clear_region clear_torpedo;
struct clear_region clear_bonus_block;


int bgColor = 0x0315;


int mineHit = 0;


int mineExplode = 0;


unsigned long frame_counter = 0;


int subLives =  5 ;
int prev_subLives = 0;


int torpedo_count =  8 ;
int prev_torpedo_count = 0;


int fire_torpedo_flag = 0;


int destroyed_mine_id = -1;


int bonus_id = -1;


int bonus_type = 0;


int bonus_counter = 0;


int level = 0;


int prev_level = 0;


int score = 0;
int prev_score = 0;


int grey_mine_rate = 5;



unsigned int high_score = 0;

char level_text[10];
char score_text[10];
char lives_text[10];
char torpedoes_text[10];


char score_display_text[80];


char level_display_text[80];


char temp_txt[12];

extern void MP3_Start();
extern void Play_MP3();
extern void Play_MP3_Chunk();
extern void Load_MP3_File(char *filename);
extern void Set_Volume(char left,char right);


void GetNextSong();
void PreRollSong();
void CheckVolume();


extern char file_loaded;
extern long current_pos;
extern unsigned long file_size;


int prev_sound_pos = 0;
int prev_file_size = 0;


int start_game_flag = 0;


unsigned int X_Coord, Y_Coord, Prev_X_Coord, Prev_Y_Coord;

char Pen_Down = 0;
int Starting_Pen_Down_X_Coord = 0;
int Starting_Pen_Down_Y_Coord = 0;

int X_Drag_Distance = 0;
#line 1 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/gaming-shield.h"
#line 189 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/gaming-shield.h"
sbit upButton at PORTA.B6;
sbit downButton at PORTA.B7;
sbit rightButton at PORTD.B10;
sbit leftButton at PORTA.B5;
sbit triangleButton at PORTD.B14;
sbit xButton at PORTD.B15;
sbit circleButton at PORTF.B4;
sbit squareButton at PORTD.B11;
sbit startButton at PORTF.B5;


sbit upButtonDirection at TRISA.B6;
sbit downButtonDirection at TRISA.B7;
sbit rightButtonDirection at TRISD.B10;
sbit leftButtonDirection at TRISA.B5;
sbit triangleButtonDirection at TRISD.B14;
sbit xButtonDirection at TRISD.B15;
sbit circleButtonDirection at TRISF.B4;
sbit squareButtonDirection at TRISD.B11;
sbit startButtonDirection at TRISF.B5;



bit upButtonOld;
bit downButtonOld;
bit rightButtonOld;
bit leftButtonOld;
bit triangleButtonOld;
bit xButtonOld;
bit circleButtonOld;
bit squareButtonOld;
bit startButtonOld;


sbit LED1 at LATE.B8;
sbit LED2 at LATE.B9;
sbit LED3 at LATA.B14;
sbit LED4 at LATA.B15;

sbit LED1_Direction at TRISE.B8;
sbit LED2_Direction at TRISE.B9;
sbit LED3_Direction at TRISA.B14;
sbit LED4_Direction at TRISA.B15;
#line 246 "c:/users/dsi/desktop/mini-sub game/development files/minisub_code/mikroc pro for pic32/gaming-shield.h"
void InitGameShield(){





 upButtonDirection = 1;
 downButtonDirection = 1;
 rightButtonDirection = 1;
 leftButtonDirection = 1;
 triangleButtonDirection = 1;
 xButtonDirection = 1;
 circleButtonDirection = 1;
 squareButtonDirection = 1;
 startButtonDirection = 1;




 LED1_Direction = 0;
 LED2_Direction = 0;
 LED3_Direction = 0;
 LED4_Direction = 0;

 Delay_ms(100);

 LED1 = 0;
 LED2 = 0;
 LED3 = 0;
 LED4 = 0;
}
#line 75 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 extern void InitGameShield();
#line 97 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
int torpedoButton=0;

int muteButton=0;



void Start_WS();
void UART1_Write_Line(char *uart_text);
void UART1_Write_Variable(int var);
void UART1_Write_Long_Variable(long var);

void UART1_Write_Label_Var(char *uart_text, int var );
void UART1_Write_Label_Long_Var(char *uart_text, long var);
void UART1_Write_Label_Float_Var(char *uart_text, float var);


extern void RefreshMenu();




void Startup_Volume( char vol);

extern char sound_level, old_sound_level;
extern void MP3_Set_Volume(char left, char right);
void UpdateVolumeBar(char vol, char old_vol);


extern int song_count;


extern int play_next_song;


int muteSound = 0;
int prev_muteSound = 0;


int bonus_factor = 1;

int show_main_menu = 0;
int toggled_main_menu = 0;

void main() {

 Start_TP();


 TFT_Fill_Screen(CL_BLACK);

 Start_WS();


 InitGameShield();



 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);


 file_loaded = 0;
 MP3_Start();

 Startup_Volume(80);


 TFT_Fill_Screen(bgColor);

 UART1_Write_Line("Mini-Sub Game Started");

 while (1) {


 ResetGame();


 ShowTitles();




 show_main_menu=1;
 start_game_flag=1;

 RefreshMenu();

 while(show_main_menu==1)
 {
 if(toggled_main_menu){
 RefreshMenu();
 toggled_main_menu=0;
 }

 Check_TP();

 UART1_Write_Line(".");
 Play_MP3_Chunk();

 }


 while(subLives){


 InitSprites();


 while (mineHit == 0) {


 if(play_next_song){

 GetNextSong();
 }
 else if( (frame_counter % 2) == 0){

 Play_MP3_Chunk();
 }


 if(show_main_menu==1)
 {
 if(toggled_main_menu){
 RefreshMenu();
 toggled_main_menu=0;
 }

 Check_TP();
 }
 else
 {

 if(toggled_main_menu){

 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 TFT_Fill_Screen(bgColor);

 toggled_main_menu=0;
 }


 GetInput();


 RenderScreen();


 SavePreviousVal();


 frame_counter++;
 }



 }


 mineHit = 0;


 mineExplode = 0;


 subLives--;
 }


 ShowGameOver();
 }

}



void Start_WS(){

 WS_Init();

 WS_UART_Init(256000);
 Delay_ms(100);
}


void UART1_Write_Line(char *uart_text) {
 UART1_Write_Text(uart_text);
 UART1_Write(13);
 UART1_Write(10);
}


void UART1_Write_Variable(int var) {
 char var_txt[12];
 IntToStr(var, var_txt);
 UART1_Write_Text(var_txt);
 UART1_Write(13);
 UART1_Write(10);
}


void UART1_Write_Long_Variable(long var){
 char var_txt[20];
 LongWordToStr(var, var_txt);
 UART1_Write_Text(var_txt);
 UART1_Write(13);
 UART1_Write(10);
}



void ShowTitles(){
 int step_value = 15;


 TFT_Fill_Screen(bgColor);


 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);

 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, bgColor, bgColor);


 TFT_Image(35, ( 240 /2)-47, title_bmp, 1);





 TFT_Write_Text("Loading the game...", 100, 220);


 sub.y = 160;


 sub.x = step_value+1;
 TFT_Image(sub.x, sub.y, sub_bmp, 1);


 GetNextSong();


 for(sub.x = step_value+1;(sub.x <= ( 320 +1)) && (!startButton);sub.x+=step_value){


 TFT_Image(sub.x, sub.y, sub_bmp, 1);


 Play_MP3_Chunk();


 TFT_Rectangle(sub.x-step_value, sub.y, sub.x+step_value, sub.y +  47  );


 frame_counter++;


 if(TP_TFT_Press_Detect()){
 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
 start_game_flag = 1;
 }
 }


 if(startButton){
 start_game_flag = 1;
 }
#line 380 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(muteButton){

 ToggleMute();
 }

 if(start_game_flag){
 break;
 }

 }


 TFT_Fill_Screen(bgColor);
}



void ShowHelp(){
 int loop = 0;
 UART1_Write_Line("Help Screens");


 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 TFT_Fill_Screen(bgColor);



 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);


 if(!start_game_flag){


 TFT_Write_Text("Overview", 132, 8);


 TFT_Image(8, 46, sub_bmp, 1);

 TFT_Write_Text("Navigate  your  sub  through  an", 86, 48);
 TFT_Write_Text("ocean  filled  with  dangerous  sea", 86, 64);
 TFT_Write_Text("mines  while  collecting  points.", 86, 80);


 TFT_Write_Text("Pickup  bonus  items  as  you  go:", 17, 115);


 TFT_Image(18, 137, torpedo_pack_bmp, 1);
 TFT_Write_Text("Pickup  3  extra  torpedoes.", 86, 151);


 TFT_Image(17, 188, heart_pack_bmp, 1);
 TFT_Write_Text("Pickup  an  extra  life.", 86, 202);


 for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
 Play_MP3_Chunk();
 Delay_ms(50);


 if(TP_TFT_Press_Detect()){
 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
 start_game_flag = 1;
 }
 }



 if(startButton){
 start_game_flag = 1;
 }
#line 466 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(muteButton){

 ToggleMute();


 Delay_ms(250);
 }

 }

 }

 if(!start_game_flag){



 TFT_Fill_Screen(bgColor);

 TFT_Write_Text("Overview", 132, 8);




 TFT_Write_Text("Use  the arrow keys to  move  the  sub.", 50, 24);




 TFT_Image(24, 116, sub_bmp, 1);


 TFT_Image(102, 132, torpedo_bmp, 1);


 TFT_Image(187, 117, mine1_bmp, 1);
 TFT_Image(248, 56, mine2_bmp, 1);

 TFT_Image(118, 54, dark_mine1_bmp, 1);




 TFT_Write_Text("Press  the  square  button  to  fire your torpedoes.", 5, 175);


 TFT_Write_Text("Red  sea  mines  take  1  torpedo  hit.", 40, 200);
 TFT_Write_Text("Grey  sea  mines  take  2  torpedo  hits.", 40, 216);


 for(loop = 0; (loop<=100) && (!start_game_flag);loop++){
 Play_MP3_Chunk();
 Delay_ms(50);


 if(TP_TFT_Press_Detect()){
 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
 start_game_flag = 1;
 }
 }


 if(startButton){
 start_game_flag = 1;
 }
#line 540 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(muteButton){

 ToggleMute();



 }

 }

 }


 if(!start_game_flag){



 TFT_Fill_Screen(bgColor);



 RenderScore();

 TFT_Write_Text("Icons  Explained", 122, 50);

 TFT_Write_Text("This  icon  shows  how  many  lives  remain.", 50, 80);
 TFT_Image(20, 80, lives_bmp, 1);

 TFT_Write_Text("This  icon   shows  your  torpedo  count.", 50, 110);
 TFT_Image(22, 110, torpedo_status_bmp, 1);
 TFT_Image(28, 110, torpedo_status_bmp, 1);
 TFT_Image(34, 110, torpedo_status_bmp, 1);

 TFT_Write_Text("This  icon  shows  the  sound  volume.", 50, 145);
 TFT_Image(20, 145, sound_bmp, 1);

 TFT_Write_Text("Tip:  While   playing   the   game   tap   the   screen", 25, 200);
 TFT_Write_Text("to   load   the   main   menu.", 60, 216);


 for(loop = 0; (loop<=80) && (!start_game_flag);loop++){
 Play_MP3_Chunk();
 Delay_ms(50);


 if(TP_TFT_Press_Detect()){
 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
 start_game_flag = 1;
 }
 }


 if(startButton){
 start_game_flag = 1;
 }
#line 604 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(muteButton){

 ToggleMute();



 }

 }

 TFT_Fill_Screen(bgColor);

 }

 if(!start_game_flag){



 TFT_Fill_Screen(bgColor);

 TFT_Write_Text("Credits", 132, 8);


 TFT_Image(28, 36, andrew_bmp, 1);
 TFT_Image(28, 109, tonyB_bmp, 1);
 TFT_Image(28, 178, mikroe_bmp, 1);




 TFT_Write_Text("Game   by   Andrew   Hazelden", 82, 44);

 TFT_Write_Text("Music   by   Tony   B   Machine", 82, 117);

 TFT_Write_Text("Developed   using   MikroElektronika's", 82, 178);
 TFT_Write_Text("MikroC   Pro   for   PIC32   compiler.", 82, 194);



 for(loop = 0; (loop<=60) && (!start_game_flag);loop++){
 Play_MP3_Chunk();
 Delay_ms(50);



 if(TP_TFT_Press_Detect()){
 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {
 start_game_flag = 1;
 }
 }


 if(startButton){
 start_game_flag = 1;
 }
#line 670 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(muteButton){

 ToggleMute();



 }

 }

 TFT_Fill_Screen(bgColor);

 }


}


void ShowNextLevel(){
 int loop = 0;


 if (prev_level != level){


 UART1_Write_Line("Next Level: ");
 UART1_Write_Variable(level);
 UART1_Write(13);
 UART1_Write(10);


 UART1_Write_Line("Score: ");
 UART1_Write_Variable(score);
 UART1_Write(13);
 UART1_Write(10);


 UART1_Write_Line("Mine Speed: ");
 UART1_Write_Variable(mine_speed);
 UART1_Write(13);
 UART1_Write(10);


 UART1_Write_Line("Bonus distance factor: ");
 UART1_Write_Variable(bonus_factor);
 UART1_Write(13);
 UART1_Write(10);


 TFT_Fill_Screen(bgColor);


 TFT_Image(35, ( 240 /2)-47, title_bmp, 1);


 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);


 IntToStr(level, level_text);
 strcpy(level_display_text, "Level: ");
 strcat(level_display_text, level_text);


 TFT_Write_Text(level_display_text, 140, 150);


 TFT_Write_Text("You  Earned  an  Extra  Life!", 80, 180);



 for(loop = 0; loop<=50;loop++){
 Play_MP3_Chunk();
 Delay_ms(50);
 }



 TFT_Fill_Screen(bgColor);


 InitSprites();
 }


}








void ShowGameOver(){
 int loop = 0;

 UART1_Write_Line("Game Over");


 TFT_Fill_Screen(bgColor);


 TFT_Image(0, ( 240 /2)-47, GameOver_bmp, 1);


 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);



 if(score > high_score){

 high_score = score;
 TFT_Write_Text("You  set  a  High  Score!", 95, 140);
 }
 else{



 IntToStr(high_score, score_text);
 strcpy(score_display_text, "High  Score: ");
 strcat(score_display_text, score_text);


 TFT_Write_Text(score_display_text, 110, 140);
 }


 IntToStr(score, score_text);
 strcpy(score_display_text, "Your  Score: ");
 strcat(score_display_text, score_text);


 TFT_Write_Text(score_display_text, 110, 170);


 for(loop = 0; loop<=60;loop++){
 Play_MP3_Chunk();
 Delay_ms(50);
 }



 TFT_Fill_Screen(bgColor);
}




void GetInput() {
 int mine_inc = 0;
 int edge_border = 3;





 torpedoButton = squareButton;
#line 881 "C:/Users/dsi/Desktop/Mini-Sub Game/Development Files/minisub_Code/mikroC PRO for PIC32/minisub_main.c"
 if(TP_TFT_Press_Detect()){

 if (TP_TFT_Get_Coordinates(&X_Coord, &Y_Coord) == 0) {


 if(Pen_Down == 0){
 Starting_Pen_Down_X_Coord = X_Coord;
 Starting_Pen_Down_Y_Coord = Y_Coord;


 }

 X_Drag_Distance = Starting_Pen_Down_X_Coord - X_Coord;


 Pen_Down = 1;

 }

 }
 else{

 Pen_Down = 0;
 }


 if( (Pen_Down == 1 )) {


 toggled_main_menu=1;

 if(show_main_menu){
 show_main_menu=0;
 }
 else{
 show_main_menu=1;
 }


 while(!TP_TFT_Press_Detect()){
 Delay_ms(50);
 }

 }




 if(muteButton){

 ToggleMute();


 Delay_ms(250);
 }


 if(startButton){




 }

 if(upButton) {
 sub.y -=  8 ;




 }
 else if(downButton){
 sub.y +=  8 ;




 }
 else if(leftButton) {
 sub.x -=  12 ;




 }
 else if(rightButton){
 sub.x +=  12 ;




 }
 else{


 if( (frame_counter % 2) == 0){

 if(sub.x >  28 ){
 sub.x -= 1;
 }
 }


 if( (frame_counter % 4) == 0){

 if(sub.x <  28 ){
 sub.x += 1;
 }
 }

 }



 if( sub.y <=  25  ){
 sub.y =  25 ;
 }


 if( sub.x <= 0 ){
 sub.x = 0;
 }


 if( sub.y >= ( 240 - 47 )){
 sub.y =  240 - 47 ;
 }


 if( sub.x >= ( 320 - 63 )){
 sub.x =  320 - 63 ;
 }


 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){


 if( mine[mine_inc].x <= edge_border){


 ResetSeaMine(mine_inc);


 TFT_Rectangle( mine[mine_inc].prev_x-1, mine[mine_inc].prev_y-1, mine[mine_inc].prev_x + mine[mine_inc].width + 1, mine[mine_inc].prev_y + mine[mine_inc].height + 1);


 score += 25;
 }
 else{

 mine[mine_inc].x -= mine_speed;
 }

 }


 if(bonus_block.x<=edge_border){


 TFT_Rectangle( bonus_block.prev_x-1, bonus_block.prev_y-1, bonus_block.prev_x + bonus_block.width + 1, bonus_block.prev_y + bonus_block.height + 1);


 ResetBonusBlock();
 }



 bonus_block.x -= mine_speed;



 if(torpedoButton){






 if(torpedo_count>=1) {

 if( fire_torpedo_flag == 0 ) {

 torpedo.x = sub.x +  63  + 1;


 torpedo.y = sub.y + ( 47 /2);


 torpedo.visible = 1;


 fire_torpedo_flag = 1;


 torpedo_count--;

 }
 }

 }



 if( fire_torpedo_flag == 1 ){
 torpedo.x +=  12 ;


 if( torpedo.x > ( 320 + 12 +1) ){

 torpedo.visible = 0;

 fire_torpedo_flag = 0;
 }

 }



}


int RandomHeightY(){
 return (rand() % 6) * (( 240 - 25 )/6) +  25 ;
}

int RandomSeaMineType(){
 int mine_type = 0;




 mine_type = rand() % grey_mine_rate;


 if(mine_type == 0){
 return 1;
 }
 else{

 return 0;
 }

 return 0;
}

void ResetBonusBlock(){



 bonus_block.x =  320 *( 2 *bonus_factor);


 bonus_block.y = RandomHeightY();


 bonus_counter += 1;




 if( (rand() % 3) == 0){

 bonus_type = 2;
 }
 else {

 bonus_type = 1;
 }
}

void ResetSeaMine(int mineNumber){


 mine[mineNumber].x +=  320 ;
 mine[mineNumber].y = RandomHeightY();


 mine[mineNumber].type = RandomSeaMineType();


 mine[mineNumber].hits = 0;
}



void RenderScreen(){
 int mine_inc = 0;


 int redraw_border = 3;


 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){

 clear_mine[mine_inc].top = mine[mine_inc].prev_y;
 if(clear_mine[mine_inc].top < 0)
 clear_mine[mine_inc].top = 0;

 clear_mine[mine_inc].left = mine[mine_inc].x + mine[mine_inc].width;
 if(clear_mine[mine_inc].left < 0)
 clear_mine[mine_inc].left = 0;

 clear_mine[mine_inc].right = mine[mine_inc].prev_x + mine[mine_inc].width;
 if(clear_mine[mine_inc].right < 0)
 clear_mine[mine_inc].right = 0;

 clear_mine[mine_inc].bottom = mine[mine_inc].prev_y + mine[mine_inc].height;
 if(clear_mine[mine_inc].bottom < 0)
 clear_mine[mine_inc].bottom = 0;

 }


 if(sub.x > sub.prev_x){
 clear_sub.left = sub.prev_x;
 clear_sub.right = sub.x;
 clear_sub.top = sub.y;
 clear_sub.bottom = sub.y +  47 ;
 }


 if(sub.x < sub.prev_x){
 clear_sub.left = sub.x+ 63 ;
 clear_sub.right = sub.prev_x+ 63 ;
 clear_sub.top = sub.y;
 clear_sub.bottom = sub.y +  47 ;
 }



 if(sub.y > sub.prev_y){
 clear_sub.left = sub.x;
 clear_sub.right = sub.x+ 63 ;
 clear_sub.top = sub.prev_y;
 clear_sub.bottom = sub.y;
 }


 if(sub.y < sub.prev_y){
 clear_sub.left = sub.x;
 clear_sub.right = sub.x+ 63 ;
 clear_sub.top = sub.y +  47 ;
 clear_sub.bottom = sub.prev_y +  47 ;
 }



 if (clear_sub.left <=0)
 clear_sub.left = 0;


 if (clear_sub.top <=  25 )
 clear_sub.top =  25 ;


 clear_torpedo.left = torpedo.prev_x-1;
 clear_torpedo.top = torpedo.prev_y-1;
 clear_torpedo.right = torpedo.x;
 clear_torpedo.bottom = torpedo.y+torpedo.height+1;



 if (clear_torpedo.left <=0)
 clear_torpedo.left = 0;

 if (clear_torpedo.top <=0)
 clear_torpedo.top = 0;



 clear_bonus_block.top = bonus_block.prev_y;
 if(clear_bonus_block.top < 0)
 clear_bonus_block.top = 0;

 clear_bonus_block.left = bonus_block.x + bonus_block.width;
 if(clear_bonus_block.left < 0)
 clear_bonus_block.left = 0;

 clear_bonus_block.right = bonus_block.prev_x + bonus_block.width;
 if(clear_bonus_block.right < 0)
 clear_bonus_block.right = 0;

 clear_bonus_block.bottom = bonus_block.prev_y + bonus_block.height;
 if(clear_bonus_block.bottom < 0)
 clear_bonus_block.bottom = 0;



 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 if( (sub.prev_x != sub.x)|| (sub.prev_y != sub.y) || (sub.x < (0)) || (sub.y < ( 25 )) ){

 TFT_Rectangle(clear_sub.left, clear_sub.top, clear_sub.right, clear_sub.bottom);
 }


 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){
 TFT_Rectangle( clear_mine[mine_inc].left, clear_mine[mine_inc].top, clear_mine[mine_inc].right, clear_mine[mine_inc].bottom);
 }


 if(bonus_block.x <=  320 ){

 TFT_Rectangle( clear_bonus_block.left, clear_bonus_block.top, clear_bonus_block.right, clear_bonus_block.bottom);
 }



 if(fire_torpedo_flag){



 TFT_Rectangle( clear_torpedo.left, clear_torpedo.top, clear_torpedo.right, clear_torpedo.bottom);
 }


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);








 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){

 AnimateSeaMine(mine_inc);
 }


 if(bonus_block.x <=  320 ){


 if(bonus_type == 2) {

 TFT_Image(bonus_block.x, bonus_block.y, heart_pack_bmp, 1);
 }
 else{

 TFT_Image(bonus_block.x, bonus_block.y, torpedo_pack_bmp, 1);
 }
 }


 if(fire_torpedo_flag){
 TFT_Image(torpedo.x, torpedo.y, torpedo_bmp, 1);
 }



 TFT_Image(sub.x, sub.y, sub_bmp, 1);






 if( (sub.prev_x != sub.x)|| (sub.prev_y != sub.y) || (sub.x < (0)) || (sub.y < ( 25 )) ){

 TFT_Rectangle(clear_sub.left, clear_sub.top, clear_sub.right, clear_sub.bottom);
 }



 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){

 if(IsCollision(sub.x, sub.y,  63 ,  47 , mine[mine_inc].x, mine[mine_inc].y, mine[mine_inc].width, mine[mine_inc].height)) {

 mineHit = 1;


 destroyed_mine_id = mine_inc;


 UART1_Write_Line("You hit a sea mine!");


 }

 if(fire_torpedo_flag){

 if(IsCollision(torpedo.x, torpedo.y, torpedo.width, torpedo.height, mine[mine_inc].x, mine[mine_inc].y, mine[mine_inc].width, mine[mine_inc].height)) {


 mine[mine_inc].hits++;


 if(mine[mine_inc].type == 0){

 mineExplode = 1;


 destroyed_mine_id = mine_inc;


 UART1_Write_Line("Your torpedo destroyed a red sea mine!");
 }
 else if( (mine[mine_inc].type == 1) && (mine[mine_inc].hits >= 2) ){

 mineExplode = 1;


 destroyed_mine_id = mine_inc;


 UART1_Write_Line("Your torpedo destroyed a grey sea mine!");
 }
 else{



 fire_torpedo_flag = 0;


 ClearTorpedo();


 torpedo.x = 0;
 torpedo.y = 0;
 torpedo.prev_x = 0;
 torpedo.prev_y = 0;

 }


 }
 }



 }



 if(IsCollision(sub.x, sub.y,  63 ,  47 , bonus_block.x, bonus_block.y, bonus_block.width, bonus_block.height)) {


 bonus_id = 1;


 if(bonus_type == 2){

 subLives += 1;


 UART1_Write_Line("You picked up an extra life bonus!");
 }
 else{

 torpedo_count += 3;


 UART1_Write_Line("You picked up a torpedo 3 pack bonus!");
 }



 ResetBonusBlock();


 TFT_Fill_Screen(bgColor);
 }




 if(mineHit){



 fireball.x = (sub.x + ( 63 /2) ) - (fireball.width/2) ;
 fireball.y = (sub.y + ( 47 /2) ) - (fireball.height/2) ;


 if( fireball.x <=0)
 fireball.x=0;

 if( fireball.y <=  25 )
 fireball.y =  25 ;


 TFT_Image(fireball.x, fireball.y, fireball_bmp, 1);


 TFT_Fill_Screen(bgColor);

 }




 if(mineExplode){







 ClearTorpedo();


 explode.x = (mine[destroyed_mine_id].x + (mine[destroyed_mine_id].width/2) ) - (explode.width/2) ;
 explode.y = (mine[destroyed_mine_id].y + (mine[destroyed_mine_id].height/2) ) - (explode.height/2);


 if( explode.x <=0 ){
 explode.x=0;
 }

 if( explode.y <=  25 ){
 explode.y =  25 ;
 }


 TFT_Image(explode.x, explode.y, explode_bmp, 1);
 Delay_ms(100);


 TFT_Fill_Screen(bgColor);



 mineExplode = 0;


 fire_torpedo_flag = 0;


 torpedo.x = 0;
 torpedo.y = 0;
 torpedo.prev_x = 0;
 torpedo.prev_y = 0;



 ResetSeaMine(destroyed_mine_id);
 mine[destroyed_mine_id].prev_x = mine[destroyed_mine_id].x;


 if(mine[destroyed_mine_id].type == 0){
 score += 50;
 }
 else if(mine[destroyed_mine_id].type == 1){
 score += 100;
 }
 }


 CheckGameLevel();



 RenderScore();

}


void CheckGameLevel(){

 if( (level == 1) && (score > 1000) ){
 level = 2;
 prev_level = level-1;


 mine_speed = 8;


 bonus_factor = 1;


 grey_mine_rate = 5;

 }

 if( (level == 2) && (score > 2500) ){
 level = 3;
 prev_level = level-1;


 mine_speed = 8;


 bonus_factor = 1;


 grey_mine_rate = 4;


 subLives++;
 }

 if( (level == 3) && (score > 5000) ){
 level = 4;
 prev_level = level-1;


 mine_speed = 8;


 bonus_factor = 2;


 grey_mine_rate = 3;


 subLives++;
 }

 if( (level == 4) && (score > 8000) ){
 level = 5;
 prev_level = level-1;


 mine_speed = 9;


 bonus_factor = 3;


 grey_mine_rate = 3;


 subLives++;
 }

 if( (level == 5) && (score > 10000) ){
 level = 6;
 prev_level = level-1;


 mine_speed = 10;


 bonus_factor = 3;


 grey_mine_rate = 3;


 subLives++;
 }

 if( (level == 6) && (score > 12000) ){
 level = 7;
 prev_level = level-1;


 mine_speed = 10;


 bonus_factor = 3;


 grey_mine_rate = 3;


 subLives++;
 }

 if( (level == 7) && (score > 15000) ){
 level = 8;
 prev_level = level-1;


 mine_speed = 10;


 bonus_factor = 4;


 grey_mine_rate = 3;


 subLives++;
 }

 if( (level == 8) && (score > 15000) ){
 level = 9;
 prev_level = level-1;


 mine_speed = 10;


 bonus_factor = 3;


 grey_mine_rate = 2;


 subLives++;
 }
 if( (level == 9) && (score > 20000) ){
 level = 10;
 prev_level = level-1;


 mine_speed = 10;


 bonus_factor = 4;


 grey_mine_rate = 2;


 subLives++;
 }


 if (prev_level != level){

 ShowNextLevel();
 }



}


void RenderScore(){
 int tr_inc = 0;






 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);



 if( (score != prev_score) ||
 (prev_torpedo_count != torpedo_count) ||
 (prev_subLives != subLives) ||
 ( prev_muteSound != muteSound) ||
 (toggled_main_menu) ){





 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 TFT_Rectangle( 0, 0, 319, 25);
 }






 for(tr_inc=0;tr_inc<torpedo_count;tr_inc++){
 TFT_Image(230+(( 6 +2)*tr_inc), 2, torpedo_status_bmp, 1);
 }


 TFT_Image(5, 2, lives_bmp, 1);









 if(muteSound){

 TFT_Image(80, 2, soundMute_bmp, 1);
 }
 else if(!muteSound){

 if (sound_level > 75) {

 TFT_Image(80, 2, sound_bmp, 1);
 }
 else if (sound_level > 40){

 TFT_Image(80, 2, sound_med_bmp, 1);
 }
 else{

 TFT_Image(80, 2, sound_low_bmp, 1);
 }

 }




 IntToStr(level, level_text);


 IntToStr(subLives, lives_text);


 IntToStr(torpedo_count, torpedoes_text);


 IntToStr(score, score_text);



 TFT_Write_Text(lives_text, (5 + 20), 2);





 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);


 strcpy(score_display_text, "Score: ");
 strcat(score_display_text, score_text);


 TFT_Write_Text(score_display_text, 120, 2);
}


void ClearTorpedo(){

 clear_torpedo.left = torpedo.x;
 clear_torpedo.top = torpedo.y;
 clear_torpedo.right = torpedo.x+torpedo.width;
 clear_torpedo.bottom = torpedo.y+torpedo.height;


 TFT_Rectangle( clear_torpedo.left, clear_torpedo.top, clear_torpedo.right, clear_torpedo.bottom);
}




void ResetGame(){


 TFT_Fill_Screen(bgColor);


 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);

 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, bgColor, bgColor);



 level = 1;
 prev_level = 1;


 score = 0;








 bonus_factor = 1;


 mine_speed = 6;


 torpedo_count =  8 ;


 subLives =  5 ;


 bonus_counter = 0;


 grey_mine_rate = 5;


 InitSprites();
}

void InitSprites(){
 int mine_inc = 0;



 torpedo_count =  8 ;


 fire_torpedo_flag = 0;



 sub.x = 28;
 sub.y = 128;
 sub.prev_x = sub.x;
 sub.prev_y = sub.y;



 fireball.x = 0;
 fireball.y = 0;
 fireball.prev_x = 0;
 fireball.prev_y = 0;
 fireball.width = 130;
 fireball.height = 134;



 explode.x = 0;
 explode.y = 0;
 explode.prev_x = 0;
 explode.prev_y = 0;
 explode.width = 70;
 explode.height = 60;


 torpedo.x = 0;
 torpedo.y = 0;
 torpedo.prev_x = 0;
 torpedo.prev_y = 0;
 torpedo.visible = 1;
 torpedo.width = 35;
 torpedo.height = 14;


 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){
 mine[mine_inc].x = (mine_inc * 90) + 200;
 mine[mine_inc].y = RandomHeightY();

 mine[mine_inc].prev_x = mine[mine_inc].x ;
 mine[mine_inc].prev_y = mine[mine_inc].y ;
 mine[mine_inc].width = 45;
 mine[mine_inc].height = 45;


 mine[mine_inc].type = RandomSeaMineType();





 mine[mine_inc].hits = 0;
 }




 bonus_block.x =  320 * 2 ;
 bonus_block.y = RandomHeightY();
 bonus_block.prev_x = 0;
 bonus_block.prev_y = 0;
 bonus_block.visible = 1;
 bonus_block.width = 45;
 bonus_block.height = 45;


 bonus_type = 1;


 TFT_Set_Pen(bgColor, 1);


 TFT_Set_Brush(1, bgColor, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 TFT_Fill_Screen(bgColor);

}


void SavePreviousVal(){
 int mine_inc = 0;


 prev_score = score;


 sub.prev_x = sub.x;
 sub.prev_y = sub.y;


 for(mine_inc = 0; mine_inc <= ( 4 -1); mine_inc++){
 mine[mine_inc].prev_x = mine[mine_inc].x;
 mine[mine_inc].prev_y = mine[mine_inc].y;
 }


 torpedo.prev_x = torpedo.x;
 torpedo.prev_y = torpedo.y;


 bonus_block.prev_x = bonus_block.x;
 bonus_block.prev_y = bonus_block.y;


 prev_torpedo_count = torpedo_count;
 prev_subLives = subLives;


 destroyed_mine_id = -1;


 bonus_id = -1;


 prev_level = level;


 prev_muteSound = muteSound;

}



char IsCollision (unsigned int Shape_X, unsigned int Shape_Y, unsigned int Shape_Width, unsigned int Shape_Height,
unsigned int Bomb_Left, unsigned int Bomb_Top, unsigned int Bomb_Width, unsigned int Bomb_Height) {



 if( ((Shape_X + Shape_Width) >= Bomb_Left ) && ((Shape_X) <= (Bomb_Left + Bomb_Width-1)) &&




 ((Shape_Y + Shape_Height) >= Bomb_Top ) && ((Shape_Y) <= (Bomb_Top + Bomb_Height-1)) ) {






 return 1;
 }
 else
 {


 return 0;
 }

}



void GetNextSong(){
 UART1_Write_Line("Switching to the next song.");

 Load_MP3_File("Pavese.mp3");


 if(current_pos < 10){
 PreRollSong();
 }

}


void PreRollSong(){
 int roll = 0;
 int roll_max = 100;


 for(roll = 0; roll<=roll_max;roll++){
 Play_MP3_Chunk();
 }
}


void ToggleMute(){

 if(muteSound){
 muteSound = 0;
 UART1_Write_Line("Sound On");
 PreRollSong();
 }
 else if(!muteSound){

 muteSound = 1;
 UART1_Write_Line("Muting Sound");
 }

}





void AnimateSeaMine(int mineNum){
 unsigned long the_frame = 0;


 the_frame = (frame_counter + mineNum) % 6;



 if(mine[mineNum].type == 0) {


 switch (the_frame) {
 case 0 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine6_bmp, 1);
 break;

 case 1 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine5_bmp, 1);
 break;

 case 2 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine4_bmp, 1);
 break;

 case 3 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine3_bmp, 1);
 break;

 case 4 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine2_bmp, 1);
 break;

 case 5 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine1_bmp, 1);
 break;

 default:
 TFT_Image(mine[mineNum].x, mine[mineNum].y, mine1_bmp, 1);
 break;
 }

 }
 else{


 switch (the_frame) {
 case 0 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine6_bmp, 1);
 break;

 case 1 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine5_bmp, 1);
 break;

 case 2 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine4_bmp, 1);
 break;

 case 3 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine3_bmp, 1);
 break;

 case 4 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine2_bmp, 1);
 break;

 case 5 :
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine1_bmp, 1);
 break;

 default:
 TFT_Image(mine[mineNum].x, mine[mineNum].y, dark_mine1_bmp, 1);
 break;
 }

 }



}



void Startup_Volume( char vol){
sound_level = vol;
MP3_Set_Volume(100 - sound_level, 100 - sound_level);
UpdateVolumeBar(sound_level, old_sound_level);
UART1_Write_Label_Var("Sound Volume:", sound_level );
}




void UART1_Write_Label_Var(char *uart_text, int var ) {
 char var_txt[12];

 UART1_Write_Text(uart_text);
 IntToStr(var, var_txt);
 UART1_Write_Text(var_txt);
 UART1_Write(13);
 UART1_Write(10);
}



void UART1_Write_Label_Long_Var(char *uart_text, long var){
char var_txt[20];

UART1_Write_Text(uart_text);
LongToStr(var, var_txt);
UART1_Write_Text(var_txt);
UART1_Write(13);
UART1_Write(10);
}


void UART1_Write_Label_Float_Var(char *uart_text, float var){
char var_txt[20];

UART1_Write_Text(uart_text);
FloatToStr(var, var_txt);
UART1_Write_Text(var_txt);
UART1_Write(13);
UART1_Write(10);
}
