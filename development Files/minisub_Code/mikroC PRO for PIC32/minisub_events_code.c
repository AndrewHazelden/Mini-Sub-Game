#include "minisub_objects.h"
#include "minisub_resources.h"

//--------------------- User code ---------------------//
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

//from mp3_player.c
extern void MP3_Set_Volume(char left, char right);

//from minisub_main.c
extern void UART1_Write_Label_Var(char *uart_text, int var );
extern void UART1_Write_Line(char *uart_text);

void HideTftMenu();
void RefreshMenu();

void RefreshMenu(){

  //Hide the resume button if the game hasn't started (no score)
  if(score){
    //Since there is a score the game has started
    ResumeButton.Visible =1;
  }
  else
  {
   //There is no score so hide the resume button
    ResumeButton.Visible =0;
  }

  //Redraw the screen
  DrawScreen(&MenuScreen);
}

void HideTftMenu(){
  show_main_menu=0;
  toggled_main_menu=1;
}

void UpdateVolumeBar(char vol, char old_vol){

  //Use the progressbar element to show the volume
  ProgressBar1.Position = vol;
  DrawProgressBar(&ProgressBar1);
  
}



//----------------- End of User code ------------------//

// Event Handlers

void NewGameButtonOnUp() {
  HideTftMenu();
  //Reset the game
  ResetGame();
}

void HelpButtonOnUp() {
  start_game_flag=0;
  ShowHelp();
  DrawScreen(&MenuScreen);
}

//void VolumeButtonOnUp() {
  //Adjust the sound level
  //ToggleMute();
//}

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
  
  //Mute the audio if the sound is lower than 10% volume
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