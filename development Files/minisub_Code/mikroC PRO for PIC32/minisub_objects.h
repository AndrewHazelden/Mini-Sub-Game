typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

typedef struct ProgressBar {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  unsigned int  Background_Color;
  unsigned int  Min;
  unsigned int  Max;
  unsigned int  Position;
  char          Show_Position;
  char          Show_Percentage;
  char          Smooth;
  char          Rounded;
  char          Corner_Radius;
} TProgressBar;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned short         ObjectsCount;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
  unsigned int           ProgressBarsCount;
  TProgressBar              * const code *ProgressBars;
};

extern   TScreen                MenuScreen;
extern   TButton_Round          ResumeButton;
extern   TButton_Round          HelpButton;
extern   TButton_Round          NewGameButton;
extern   TLabel                 Label1;
extern   TProgressBar                 ProgressBar1;
extern   TBox                   VolumeBox;
extern   TButton_Round          * const code Screen1_Buttons_Round[3];
extern   TLabel                 * const code Screen1_Labels[1];
extern   TBox                   * const code Screen1_Boxes[1];
extern   TProgressBar               * const code Screen1_ProgressBars[1];


extern   TScreen                Screen1;



/////////////////////////
// Events Code Declarations
void HelpButtonOnUp();
void NewGameButtonOnUp();
void ResumeButtonOnUp();
void VolumeBoxOnPress();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char ResumeButton_Caption[];
extern char HelpButton_Caption[];
extern char NewGameButton_Caption[];
extern char Label1_Caption[];
extern char ProgressBar1_Caption[];
extern char VolumeBox_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawBox(TBox *ABox);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
