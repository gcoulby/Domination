#include <gb/gb.h>
#include <stdio.h>
#include <rand.h>
#include "ionic_limb_lib/IonicLimb.h"
#include "tile_location.c"
#include "tile.c"
#include "board_tiles.c"
#include "board_map.c"
#include "start_screen.c"
#include "play_area.c"
#include "Player.c"
#include "gbt_player.h"

extern const unsigned char * song_Data[];

Tile blankTile;
UBYTE currentPlayer = 0;
BOOLEAN cardSelected = FALSE;
Tile tiles[10];
Tile* player1Hand[5];
Tile* player2Hand[5];
Tile* board[9];
UINT16 player1Wins = 0;
UINT16 player2Wins = 0;
INT8 selectedCard = -1;
UINT8 handCursorPosition = 0;
UINT8 boardCursorPosition = 0;
const INT16 INT16_MIN = -32768;
// const INT16 INT16_MAX = 32767;
UINT8 vblCount = 0;


// UINT8 getRand(UINT8 min, UINT8 max){
//     return (((UINT8)rand()) % ((UINT8)max + (UINT8) 1 - min)) + min;
// }


void vbl_isr_handle(){
    gbt_update();
}

void initialiseTiles(){
    //Create a BlankTile that can be pointed to
    for (UINT8 i = 0; i < 4; i++)
    {
        blankTile.isBlank = TRUE;
        blankTile.color = 0;
        blankTile.values[i] = 0;
    }

    for (UINT8 tileId = 0; tileId < 10; tileId++)
    {
        Tile tile;
        for (UINT8 i = 0; i < 4; i++)
        {
            tile.isBlank = FALSE;
            tile.color = tileId >= 5;
            UINT8 d100 = getRand(1,100);
            if(d100 < 5){
                tile.values[i] = 1;    
            }
            else if(d100 < 15){
                tile.values[i] = 2;    
            }
            else if (d100 > 95)
            {
                tile.values[i] = 9;
            }
            else if (d100 > 85)
            {
                tile.values[i] = 8;
            }
            else{
                tile.values[i] = getRand(3,7);
            }            
        }
        tiles[tileId] = tile;
        if(tileId < 5){
            player1Hand[tileId] = &tiles[tileId]; 
        }
        else{
            player2Hand[tileId - 5] = &tiles[tileId];
        }
    }

    for (UINT8 i = 0; i < 9; i++)
    {
        board[i] = &blankTile;
    }
    
}

void initialiseCursor(enum PlayArea playArea){
    UINT8 offsetX = playArea == Hand ? 12 : 44;
    INT8 offsetY = playArea == Hand ? 152 : 48;
    UINT8 tile = playArea == Hand ? 5 : 6; 
    set_sprite_data(0,7, DominationTiles);
    set_sprite_tile((playArea * 3) + 0, tile);
    set_sprite_tile((playArea * 3) + 1, tile);
    set_sprite_tile((playArea * 3) + 2, tile);

    move_sprite((playArea * 3) + 0, offsetX + 0, offsetY);
    move_sprite((playArea * 3) + 1, offsetX + 8, offsetY);
    move_sprite((playArea * 3) + 2, offsetX + 16, offsetY);
    SHOW_SPRITES;
}

void refreshDisplay(){
    set_bkg_tiles(0,0,21,18,DominationMap);
}

void moveHandCursor(UINT8 pos)
{
    handCursorPosition = pos;
    UINT8 offsetX = selectedCard < 0 ? 12 : 44;
    for (UINT8 i = 0; i < 3; i++)
    {
        move_sprite(i, (pos * 32) + offsetX + (i * 8), 152);
    }
}

void moveBoardCursor(UINT8 pos)
{
    boardCursorPosition = pos;
    UINT8 offsetX = selectedCard < 0 ? 12 : 44;
    for (UINT8 i = 0; i < 3; i++)
    {
        if(pos < 3){
            move_sprite(3 + i, (pos * 32) + offsetX + (i * 8), 48);
        }
        else if (pos < 6)
        {
            move_sprite(3 + i, ((pos - 3) * 32) + offsetX + (i * 8), 80);
        }
        else
        {
            move_sprite(3 + i, ((pos - 6) * 32) + offsetX + (i * 8), 112);
        }
        
    }
}

void swapCursors(){
    for (UINT8 i = 0; i < 6; i++)
    {
        set_sprite_tile(i, get_sprite_tile(i) == 5 ? 6 : 5);
    }
}

void showCursors(BOOLEAN show){
    for (UINT8 i = 0; i < 6; i++)
    {
        if(i < 3){
            set_sprite_tile(i, show ? 5 : 4);    
        }
        else{
            set_sprite_tile(i, show ? 6 : 4);
        }
    }
}

BOOLEAN isEqualOrHigherThanAdjacentCard(UINT8 challengerPos, UINT8 challengedPos, UINT8 challengerValId, UINT8 challengedValId, BOOLEAN ForceGreaterThan)
{
    if(board[challengedPos]->isBlank) return FALSE;
    if(board[challengerPos]->color == board[challengedPos]->color) return FALSE;
    if(ForceGreaterThan)
        return (board[challengerPos]->values[challengerValId] > board[challengedPos]->values[challengedValId]);
    else
        return (board[challengerPos]->values[challengerValId] >= board[challengedPos]->values[challengedValId]);
}

void flipAdjacentCardsIfEqualOrGreater(UINT8 boardPos, BOOLEAN cascade)
{   
    if(!cascade)
        performantDelay(5);
    BOOLEAN checkUp = boardPos >= 3;
    BOOLEAN checkDown = boardPos < 6;
    BOOLEAN checkLeft = !(boardPos % 3 == 0);
    BOOLEAN checkRight = !((boardPos + 1) % 3 == 0);

    if(checkUp && isEqualOrHigherThanAdjacentCard(boardPos, boardPos - 3, 0, 3, !cascade)){
        board[boardPos - 3]->color = board[boardPos]->color;
        if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos - 3, FALSE);
    }
    if(checkDown && isEqualOrHigherThanAdjacentCard(boardPos, boardPos + 3, 3, 0, !cascade)){
        board[boardPos + 3]->color = board[boardPos]->color;
        if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos + 3, FALSE);
    }
    if(checkLeft && isEqualOrHigherThanAdjacentCard(boardPos, boardPos - 1, 1, 2, !cascade)){
        board[boardPos - 1]->color = board[boardPos]->color;
        if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos - 1, FALSE);
    }
    if(checkRight && isEqualOrHigherThanAdjacentCard(boardPos, boardPos + 1, 2, 1, !cascade)){
        board[boardPos + 1]->color = board[boardPos]->color;
        if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos + 1, FALSE);
    } 
}

void paintTile(enum PlayArea playArea, UINT8 tileNumber, Tile * tile, BOOLEAN isBlank){
    INT16 offset = 295 + (4 * tileNumber);
    if(playArea == Board){
        if(tileNumber < 3){
            offset = 26 + (4 * tileNumber);
        }
        else if(tileNumber < 6){
            offset = 110 + (4 * (tileNumber - 3));
        }
        else if(tileNumber < 9)
        {
            offset = 194 + (4 * (tileNumber - 6));
        }
    }

    if(isBlank)
    {
        for (UINT8 i = 0; i < 9; i++)
        {
            if(i < 3)
            {        
                DominationMap[offset + i] = 0x00;
            }
            else if (i < 6)
            {
                DominationMap[offset + (i + 21 - 3)] = 0x00;      
            }
            else
            {
                DominationMap[offset + (i + 42 - 6)] = 0x00;      
            }
        } 
    }
    else
    {
        INT8 blankTile = tile->color == Player1 ? 0x01 : 0x02;    
        INT8 valueOffset = tile->color == Player1 ? 0x06 : 0x0F;

        UINT8 valueCount = 0;
        for (UINT8 i = 0; i < 9; i++)
        {
            if(i < 3)
            {        
                DominationMap[offset + i] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
            }
            else if (i < 6)
            {
                DominationMap[offset + (i + 21 - 3)] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
            }
            else
            {
                DominationMap[offset + (i + 42 - 6)] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
            }
        }  
    }

}

void showPlayerIndicator()
{
    DominationMap[43] = currentPlayer == 0 ? 0x24 : 0x03;
    DominationMap[44] = currentPlayer == 0 ? 0x24 : 0x03;
    DominationMap[60] = currentPlayer == 1 ? 0x24 : 0x03;
    DominationMap[61] = currentPlayer == 1 ? 0x24 : 0x03;
    refreshDisplay();
}

void showCards(){
    //Paint Hand Tiles
    for (UINT8 i = 0; i < 5; i++)
    {
        paintTile(Hand, i, player1Hand[i], player1Hand[i]->isBlank);        
    }
    //Paint Board Tiles
    for (UINT8 i = 0; i < 9; i++)
    {
        paintTile(Board, i, board[i], board[i]->isBlank);        
    }
    refreshDisplay();
    
    SHOW_BKG;
}

UINT8 countCards(enum Player player){
    UINT8 playerCards = 0;
    for (UINT8 i = 0; i < 9; i++)
    {
        if(board[i]->isBlank) continue;
        if(board[i]->color == player ) playerCards++;
    }
    return playerCards;
}

void showCardCount()
{
    DominationMap[22] = 0x19 + countCards(Player1);
    DominationMap[39] = 0x19 + countCards(Player2);
    refreshDisplay();
}

BOOLEAN isGameOver()
{
    UINT8 emptyTiles = 9;
    for (UINT8 i = 0; i < 9; i++)
    {
        if(!board[i]->isBlank)
            emptyTiles--;
    }
    return emptyTiles == 0; 
}

void setScore(enum Player player){
    switch (player)
    {
    case Player1:
        player1Wins++;
        break;
    case Player2:
        player2Wins++;
        break;
    }
}

void resetNotifications(){
    char black = 0x03;
    DominationMap[190] = black;
    DominationMap[191] = black;
    DominationMap[192] = black;
    DominationMap[211] = black;
    DominationMap[212] = black;
    DominationMap[213] = black;
    DominationMap[206] = black;
    DominationMap[207] = black;
    DominationMap[227] = black;
    DominationMap[228] = black;
    DominationMap[229] = black;
    refreshDisplay();
}

void resetGame(){
    if(countCards(Player1) > countCards(Player2)){
        setScore(Player1);
        //Display Score
        DominationMap[127] = 0x19 + ((player1Wins / 100) % 10); 
        DominationMap[128] = 0x19 + ((player1Wins / 10) % 10); 
        DominationMap[129] = 0x19 + (player1Wins % 10); 

        //Display YOU WON
        DominationMap[190] = 0x31;
        DominationMap[191] = 0x2B;
        DominationMap[192] = 0x32;
        DominationMap[211] = 0x33;
        DominationMap[212] = 0x2B;
        DominationMap[213] = 0x2A;
    }
    else {
        setScore(Player2);
        //Display score
        DominationMap[143] = 0x19 + ((player2Wins / 100) % 10); 
        DominationMap[144] = 0x19 + ((player2Wins / 10) % 10); 
        DominationMap[145] = 0x19 + (player2Wins % 10); 

        //Display AI WON
        DominationMap[206] = 0x25;
        DominationMap[207] = 0x28;
        DominationMap[227] = 0x33;
        DominationMap[228] = 0x2B;
        DominationMap[229] = 0x2A;
    }
    refreshDisplay();
    performantDelay(150);
    resetNotifications();

    initialiseTiles();
    initialiseCursor(Hand);
    initialiseCursor(Board);
    // set_bkg_data(0,52, DominationTiles);
    refreshDisplay();
    SHOW_BKG;
}

void placeCardOnBoard(enum Player player, UINT8 handPos, UINT8 boardPos)
{
    switch (player)
    {
        case Player1:
            board[boardPos] = player1Hand[handPos];
            player1Hand[handPos] = &blankTile;
            break;
        case Player2:
            board[boardPos] = player2Hand[handPos];
            player2Hand[handPos] = &blankTile;
            break;
    }
    flipAdjacentCardsIfEqualOrGreater(boardPos, TRUE);
}

void resetBoardState(INT8 colors[9])
{
    for (UINT8 i = 0; i < 9; i++)
    {
        board[i]->color = colors[i] != -1 ? colors[i] : 0; 
    }   
}

INT16 getAIScore(UINT8 cardId, UINT8 boardPos){
    /*
        Scoring:
        +50: for each card taken ✔
        -1: for each value shielded eg: 9 = -9
        +1: for each value exposed eg: 9 = +9
    */    
    INT16 score = 0 - (countCards(Player2) * 50);

    //place the AI's card in the board position
    board[boardPos] = player2Hand[cardId];

    flipAdjacentCardsIfEqualOrGreater(boardPos, TRUE);

    BOOLEAN checkUp = boardPos >= 3;
    BOOLEAN checkDown = boardPos < 6;
    BOOLEAN checkLeft = !(boardPos % 3 == 0);
    BOOLEAN checkRight = !((boardPos + 1) % 3 == 0);

    if(checkUp)
    {
        score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
    }
    if(checkDown)
    {
        score += board[boardPos + 3]->isBlank ? board[boardPos]->values[3] : -board[boardPos]->values[3];
    }
    if(checkLeft)
    {
        score += board[boardPos - 1]->isBlank ? board[boardPos]->values[1] : -board[boardPos]->values[1];
    }
    if(checkRight)
    {
        score += board[boardPos + 1]->isBlank ? board[boardPos]->values[2] : -board[boardPos]->values[2];
    } 
    
    score += countCards(Player2) * 50;

    //return the board position to its previous state
    board[boardPos] = &blankTile;
    return score;
}

void AI(){
    INT16 bestScore = INT16_MIN;
    INT8 bestBoardPosition = -1;
    INT8 bestCardId = -1;
    INT8 colors[9] = {-1};
    for (UINT8 i = 0; i < 9; i++)
    {
        if(board[i]->isBlank) continue;
        colors[i] = board[i]->color;
    }
    
    //loop through each card in AI hand
    for (INT8 cardId = 0; cardId < 5; cardId++)
    {    
        //check card is not blank
        if (player2Hand[cardId]->isBlank) continue;

        for (INT8 boardPos = 0; boardPos < 9; boardPos++)
        {
            resetBoardState(colors);
            //check boardPosition is not blank
            if (!board[boardPos]->isBlank) continue;

            //find best move
            INT16 score = getAIScore(cardId, boardPos);

            //check if the score beats previous best
            if(score > bestScore){
                bestScore = score;
                bestBoardPosition = boardPos;
                bestCardId = cardId;
            }
            performantDelay(1);
            // gbt_update();
        }
    
    }

    //place AI card in best position
    if(bestBoardPosition >= 0 && bestCardId >= 0){
        placeCardOnBoard(Player2, bestCardId, bestBoardPosition);
    }
}

char* getScoreAsCharArray(UINT16 * score){
    char out[sizeof(*score)];
    sprintf(out, "%d", *score);
    return out;
}

// void seedRandomStartScreen(unsigned char tiles[], unsigned char map[], UINT8 first_tile, UINT8 nb_tiles, char confirmationChar, UINT16 pos1, UINT16 pos2){
//     UWORD seed;

//     set_win_data(first_tile, nb_tiles, tiles);
//     set_win_tiles(0, 0, 20, 18, map);

//     performantDelay(10);
//     SHOW_WIN;
//     // SHOW_BKG;
//     // DISPLAY_ON;
//     move_win(7, 0);
    
//     waitpad(0xFF);
//     waitpadup();
//     // map[pos1] = confirmationChar;
//     // set_win_tiles(0, 0, 20, 18, map);
//     // seed = DIV_REG;
//     // // puts("Push any key (2)");
//     waitpad(0xFF);
//     waitpadup();
//     map[pos2] = confirmationChar;
//     set_win_tiles(0, 0, 20, 18, map);
//     seed |= (UWORD)DIV_REG << 8;
//     // performantDelay(10);
//     initrand(seed);
// }

void main(){
    initialise();
    // showStartScreen(DominationTiles, DominationStartScreen, 0, 55);
    seedRandomStartScreen(DominationTiles, DominationStartScreen, 0, 55, 0x36, 321, 338);
    initialiseTiles();
    set_bkg_data(0,55, DominationTiles);
    refreshDisplay();
    scroll_bkg(4,0);
    move_win(7,144);

    initialiseCursor(Hand);
    initialiseCursor(Board);

    // SHOW_BKG;
    DISPLAY_ON;
    // SHOW_WIN;

    disable_interrupts();

    gbt_play(song_Data, 1, 7);
    gbt_loop(1);

    add_VBL(vbl_isr_handle);
    
    set_interrupts(VBL_IFLAG);
    enable_interrupts();
    
    while(1){
        showPlayerIndicator();
        showCards();
        showCardCount();
        
        if(currentPlayer == 0){
            switch (joypad())
            {
                case J_LEFT:
                    if(selectedCard < 0){
                        if(handCursorPosition == 0){
                            moveHandCursor(4);
                        }
                        else{   
                            moveHandCursor(handCursorPosition -1);   
                        }
                    }
                    else{
                        if(boardCursorPosition % 3 == 0){                          
                            moveBoardCursor(boardCursorPosition + 2);   
                        }
                        else{      
                            moveBoardCursor(boardCursorPosition -1);   
                        }
                    }
                    break;
                case J_RIGHT:
                    if(selectedCard < 0){
                        if(handCursorPosition == 4){   
                            moveHandCursor(0);    
                        }
                        else{    
                            moveHandCursor(handCursorPosition + 1);   
                        }
                    }
                    else
                    {
                        if((boardCursorPosition + 1) % 3 == 0){
                            moveBoardCursor(boardCursorPosition - 2); 
                        }
                        else{      
                            moveBoardCursor(boardCursorPosition + 1);
                        }
                    }
                    break;
                case J_UP:
                    if(selectedCard < 0) break;

                    if(boardCursorPosition < 3){
                        moveBoardCursor(boardCursorPosition + 6); 
                    }
                    else{      
                        moveBoardCursor(boardCursorPosition - 3);
                    }
                    break;
                case J_DOWN:
                    if(selectedCard < 0) break;

                    if(boardCursorPosition >= 6){
                        moveBoardCursor(boardCursorPosition - 6); 
                    }
                    else{      
                        moveBoardCursor(boardCursorPosition + 3);
                    }
                    break;
                case J_A:
                    if(selectedCard < 0){
                        if(player1Hand[handCursorPosition]->isBlank) break;
                        selectedCard = handCursorPosition;
                        swapCursors();
                    }
                    else if (board[boardCursorPosition]->isBlank)
                    {
                        placeCardOnBoard(Player1, handCursorPosition, boardCursorPosition);
                        selectedCard = -1;
                        currentPlayer = 1;
                    }
                    break;
                case J_B:
                    if(selectedCard >= 0){
                        selectedCard = -1;
                        swapCursors();
                    }
            }
        }
        else{
            showCursors(FALSE);
            //check board positions before initiating AI
            AI();
            currentPlayer = 0;
            showCursors(TRUE);
        }
        // gbt_update();
        performantDelay(10);
        // gbt_update();
        if(isGameOver())
        {
            showCards();
            resetGame();
        }
    }
}