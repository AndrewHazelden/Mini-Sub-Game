//Screen size
#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240

#define STATUS_TEXT_HEIGHT 25

//How many lives the player starts with
#define NUMBER_OF_SUBMARINES 5

//How many torpedoes the player starts with
#define NUMBER_OF_TORPEDOES 8

//How many sea mines are on screen at once
//Note - only 4 mines are setup by default in the InitSprites() function.
#define NUMBER_OF_SEA_MINES 4

//Sprite movement speed
#define SUB_SPEED 12
#define SUB_Y_SPEED 8
#define TORPEDO_SPEED 12

int mine_speed = 4;   // slow speed 4, normal speed 6, medium speed 8  high speed 10

//How many screens apart a bonus torpedo or life box is placed
#define BONUS_SCREEN_SPACING 2

//The sub's default resting X position when
#define DEFAULT_SUB_X_POS 28


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


char IsCollision (unsigned int Shape_X, unsigned int Shape_Y,  unsigned int Shape_Width, unsigned int Shape_Height,
                                  unsigned int Bomb_Left, unsigned int Bomb_Top, unsigned int Bomb_Width, unsigned int Bomb_Height);


extern void UART1_Write_Line(char *uart_text);
extern void UART1_Write_Variable(int var);
extern void UART1_Write_Long_Variable(long var);

//------------------
//    Global Variables
//------------------
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

//clear rect for old sprites
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
struct object mine[NUMBER_OF_SEA_MINES];
struct object bonus_block;


//Rectangles for clearing the old sprites between view updates
struct clear_region clear_mine[NUMBER_OF_SEA_MINES];
struct clear_region clear_sub;
struct clear_region clear_torpedo;
struct clear_region clear_bonus_block;

//Blue sea background color
int bgColor = 0x0315;

//Flag to track mine hits
int mineHit = 0;

//Flag to track mine explosions
int mineExplode = 0;

//The current frame number
unsigned long frame_counter = 0;

//How many lives the player has
int subLives = NUMBER_OF_SUBMARINES;
int prev_subLives = 0;

//How many torpedos the sub has
int torpedo_count = NUMBER_OF_TORPEDOES;
int prev_torpedo_count = 0;

//The torpedo launch check flag
int fire_torpedo_flag = 0;

//The id number of the destroyed sea mine
int destroyed_mine_id = -1;

//The id number of the bonus box
int bonus_id = -1;

//What type of bonus box is available
int bonus_type = 0;

//The bonuses displayed counter
int bonus_counter = 0;

//Track the current level number
int level = 0;

//Track the change in levels
int prev_level = 0;

//Track the user score
int score = 0;
int prev_score = 0;

//The rate from 1 to 5 of a grey seamine occuring
int grey_mine_rate = 5;

//Track the high score since power on
//Future - Update with eeprom highscore save / load
unsigned int high_score = 0;

char level_text[10];
char score_text[10];
char lives_text[10];
char torpedoes_text[10];

//The final status display string
char score_display_text[80];

//The final level display string
char level_display_text[80];

//Temp debug value printing string
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

//previous sound file size and position
int prev_sound_pos = 0;
int prev_file_size = 0;

//flag the the start button has been pressed - skip the game screens
int start_game_flag = 0;


unsigned int X_Coord, Y_Coord, Prev_X_Coord, Prev_Y_Coord;

char Pen_Down = 0;
int Starting_Pen_Down_X_Coord = 0;
int Starting_Pen_Down_Y_Coord = 0;

int X_Drag_Distance = 0;