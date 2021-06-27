#include <gb/gb.h>
#include <stdio.h>

/* Bank of tiles. */
#define IonicLimbTilesBank 0
#define IonicLimbMapWidth 20
#define IonicLimbMapHeight 18
#define IonicLimbMapBank 0

/* Start of tile array. */
extern unsigned char IonicLimbTiles[];
extern unsigned char IonicLimbMap[];

// extern enum Direction;

extern void seedRandomStartScreen(unsigned char tiles[], unsigned char map[], UINT8 first_tile, UINT8 nb_tiles, char confirmationChar, UINT16 pos1, UINT16 pos2);
// extern void seedRandom();
extern UINT8 getRand(UINT8 min, UINT8 max);
extern void showLogo();
extern void performantDelay(UINT8 numloops);
extern void initSound();
extern void initialise();
// extern void showStartScreen(unsigned char tiles[], unsigned char map[], UINT8 first_tile, UINT8 nb_tiles);
