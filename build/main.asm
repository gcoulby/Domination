;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _getScoreAsCharArray
	.globl _AI
	.globl _getAIScore
	.globl _resetBoardState
	.globl _placeCardOnBoard
	.globl _resetGame
	.globl _resetNotifications
	.globl _setScore
	.globl _isGameOver
	.globl _showCardCount
	.globl _countCards
	.globl _showCards
	.globl _showPlayerIndicator
	.globl _paintTile
	.globl _flipAdjacentCardsIfEqualOrGreater
	.globl _isEqualOrHigherThanAdjacentCard
	.globl _showCursors
	.globl _swapCursors
	.globl _moveBoardCursor
	.globl _moveHandCursor
	.globl _refreshDisplay
	.globl _initialiseCursor
	.globl _initialiseTiles
	.globl _vbl_isr_handle
	.globl _gbt_update
	.globl _gbt_loop
	.globl _gbt_play
	.globl _initialise
	.globl _performantDelay
	.globl _getRand
	.globl _seedRandomStartScreen
	.globl _sprintf
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _set_interrupts
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _add_VBL
	.globl _vblCount
	.globl _boardCursorPosition
	.globl _handCursorPosition
	.globl _selectedCard
	.globl _player2Wins
	.globl _player1Wins
	.globl _board
	.globl _player2Hand
	.globl _player1Hand
	.globl _tiles
	.globl _cardSelected
	.globl _currentPlayer
	.globl _blankTile
	.globl _DominationStartScreen
	.globl _DominationMap
	.globl _DominationTiles
	.globl _INT16_MIN
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_DominationTiles::
	.ds 880
_DominationMap::
	.ds 378
_DominationStartScreen::
	.ds 380
_blankTile::
	.ds 6
_currentPlayer::
	.ds 1
_cardSelected::
	.ds 1
_tiles::
	.ds 60
_player1Hand::
	.ds 10
_player2Hand::
	.ds 10
_board::
	.ds 18
_player1Wins::
	.ds 2
_player2Wins::
	.ds 2
_selectedCard::
	.ds 1
_handCursorPosition::
	.ds 1
_boardCursorPosition::
	.ds 1
_vblCount::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\/board_tiles.c:26: unsigned char DominationTiles[] =
	ld	hl, #_DominationTiles
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0012)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0014)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0016)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x001a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x001c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x001e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0025)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0027)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x002b)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0031)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0032)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0034)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0035)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0036)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0037)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0038)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0039)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003b)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003d)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x003f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0040)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0043)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0044)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0045)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0046)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0047)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0048)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0049)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004b)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004d)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x004f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0050)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0051)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0054)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0056)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0059)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005b)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005d)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x005f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0060)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0061)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0065)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0067)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0069)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006b)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006d)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x006f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0070)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0072)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0073)
	ld	(hl), #0x30
	ld	hl, #(_DominationTiles + 0x0074)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0075)
	ld	(hl), #0x50
	ld	hl, #(_DominationTiles + 0x0076)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0077)
	ld	(hl), #0x10
	ld	hl, #(_DominationTiles + 0x0078)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0079)
	ld	(hl), #0x10
	ld	hl, #(_DominationTiles + 0x007a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x007b)
	ld	(hl), #0x10
	ld	hl, #(_DominationTiles + 0x007c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x007d)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x007e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0080)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0082)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0083)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x0084)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0085)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x0086)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0087)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x0088)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0089)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x008a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x008b)
	ld	(hl), #0x40
	ld	hl, #(_DominationTiles + 0x008c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x008d)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x008e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0090)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0092)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0093)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x0094)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0095)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x0096)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0097)
	ld	(hl), #0x1c
	ld	hl, #(_DominationTiles + 0x0098)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0099)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x009a)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x009b)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x009c)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x009d)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x009e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00a0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00a2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00a3)
	ld	(hl), #0x08
	ld	hl, #(_DominationTiles + 0x00a4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00a5)
	ld	(hl), #0x18
	ld	hl, #(_DominationTiles + 0x00a6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00a7)
	ld	(hl), #0x28
	ld	hl, #(_DominationTiles + 0x00a8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00a9)
	ld	(hl), #0x48
	ld	hl, #(_DominationTiles + 0x00aa)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00ab)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x00ac)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00ad)
	ld	(hl), #0x08
	ld	hl, #(_DominationTiles + 0x00ae)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00b0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00b2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00b3)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x00b4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00b5)
	ld	(hl), #0x40
	ld	hl, #(_DominationTiles + 0x00b6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00b7)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x00b8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00b9)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x00ba)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00bb)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00bc)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00bd)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00be)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00c0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00c2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00c3)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00c4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00c5)
	ld	(hl), #0x40
	ld	hl, #(_DominationTiles + 0x00c6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00c7)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x00c8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00c9)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00ca)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00cb)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00cc)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00cd)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00ce)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00d0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00d2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00d3)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x00d4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00d5)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x00d6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00d7)
	ld	(hl), #0x04
	ld	hl, #(_DominationTiles + 0x00d8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00d9)
	ld	(hl), #0x08
	ld	hl, #(_DominationTiles + 0x00da)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00db)
	ld	(hl), #0x10
	ld	hl, #(_DominationTiles + 0x00dc)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00dd)
	ld	(hl), #0x10
	ld	hl, #(_DominationTiles + 0x00de)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00e0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00e2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00e3)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00e4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00e5)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00e6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00e7)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00e8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00e9)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00ea)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00eb)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00ec)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00ed)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00ee)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00f0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x00f2)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00f3)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00f4)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00f5)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00f6)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00f7)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x00f8)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00f9)
	ld	(hl), #0x3e
	ld	hl, #(_DominationTiles + 0x00fa)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00fb)
	ld	(hl), #0x02
	ld	hl, #(_DominationTiles + 0x00fc)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00fd)
	ld	(hl), #0x3c
	ld	hl, #(_DominationTiles + 0x00fe)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0101)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0103)
	ld	(hl), #0xcf
	ld	hl, #(_DominationTiles + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0105)
	ld	(hl), #0xaf
	ld	hl, #(_DominationTiles + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0107)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0109)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x010b)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x010d)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x010f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0111)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0113)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0115)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0117)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0119)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x011b)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x011d)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x011f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0121)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0123)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0125)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0127)
	ld	(hl), #0xe3
	ld	hl, #(_DominationTiles + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0129)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x012b)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x012d)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x012f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0131)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0133)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0135)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0137)
	ld	(hl), #0xd7
	ld	hl, #(_DominationTiles + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0139)
	ld	(hl), #0xb7
	ld	hl, #(_DominationTiles + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x013b)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x013d)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x013f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0141)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0143)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0145)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0147)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0149)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x014b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x014d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x014f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0151)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0153)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0155)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0157)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0159)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x015b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x015d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x015f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0161)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0163)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0165)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0167)
	ld	(hl), #0xfb
	ld	hl, #(_DominationTiles + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0169)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x016b)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x016d)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x016f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0171)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0173)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0175)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0177)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0179)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x017b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x017c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x017d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x017f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0180)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0181)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0182)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0183)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0184)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0185)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0186)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0187)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0188)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0189)
	ld	(hl), #0xc1
	ld	hl, #(_DominationTiles + 0x018a)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x018b)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x018c)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x018d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x018e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x018f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0190)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0191)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0192)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0193)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0194)
	ld	(hl), #0xb9
	ld	hl, #(_DominationTiles + 0x0195)
	ld	(hl), #0xb9
	ld	hl, #(_DominationTiles + 0x0196)
	ld	(hl), #0xb5
	ld	hl, #(_DominationTiles + 0x0197)
	ld	(hl), #0xb5
	ld	hl, #(_DominationTiles + 0x0198)
	ld	(hl), #0xad
	ld	hl, #(_DominationTiles + 0x0199)
	ld	(hl), #0xad
	ld	hl, #(_DominationTiles + 0x019a)
	ld	(hl), #0x9d
	ld	hl, #(_DominationTiles + 0x019b)
	ld	(hl), #0x9d
	ld	hl, #(_DominationTiles + 0x019c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x019d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x019e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x019f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01a0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01a1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01a2)
	ld	(hl), #0xcf
	ld	hl, #(_DominationTiles + 0x01a3)
	ld	(hl), #0xcf
	ld	hl, #(_DominationTiles + 0x01a4)
	ld	(hl), #0xaf
	ld	hl, #(_DominationTiles + 0x01a5)
	ld	(hl), #0xaf
	ld	hl, #(_DominationTiles + 0x01a6)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01a7)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01a8)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01a9)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01aa)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01ab)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x01ac)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01ad)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01ae)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01af)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01b0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01b1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01b2)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01b3)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01b4)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01b5)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01b6)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01b7)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01b8)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01b9)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01ba)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01bb)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01bc)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01bd)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01be)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01bf)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01c0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01c1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01c2)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01c3)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01c4)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01c5)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01c6)
	ld	(hl), #0xe3
	ld	hl, #(_DominationTiles + 0x01c7)
	ld	(hl), #0xe3
	ld	hl, #(_DominationTiles + 0x01c8)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01c9)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01ca)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01cb)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01cc)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01cd)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01ce)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01cf)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01d0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01d1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01d2)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x01d3)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x01d4)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x01d5)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x01d6)
	ld	(hl), #0xd7
	ld	hl, #(_DominationTiles + 0x01d7)
	ld	(hl), #0xd7
	ld	hl, #(_DominationTiles + 0x01d8)
	ld	(hl), #0xb7
	ld	hl, #(_DominationTiles + 0x01d9)
	ld	(hl), #0xb7
	ld	hl, #(_DominationTiles + 0x01da)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01db)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01dc)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x01dd)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x01de)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01df)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01e0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01e1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01e2)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01e3)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x01e4)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01e5)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01e6)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01e7)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01e8)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01e9)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x01ea)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01eb)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01ec)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01ed)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01ee)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01ef)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01f0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01f1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01f2)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01f3)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01f4)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01f5)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x01f6)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01f7)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x01f8)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01f9)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01fa)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01fb)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x01fc)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01fd)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x01fe)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x01ff)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0200)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0201)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0202)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0203)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0204)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x0205)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x0206)
	ld	(hl), #0xfb
	ld	hl, #(_DominationTiles + 0x0207)
	ld	(hl), #0xfb
	ld	hl, #(_DominationTiles + 0x0208)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x0209)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x020a)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x020b)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x020c)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x020d)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x020e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x020f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0210)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0211)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0212)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0213)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0214)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0215)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0216)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0217)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0218)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0219)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x021a)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x021b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x021c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x021d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x021e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x021f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0220)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0221)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0222)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0223)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0224)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0225)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0226)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0227)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0228)
	ld	(hl), #0xc1
	ld	hl, #(_DominationTiles + 0x0229)
	ld	(hl), #0xc1
	ld	hl, #(_DominationTiles + 0x022a)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x022b)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x022c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x022d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x022e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x022f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0230)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0231)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0232)
	ld	(hl), #0x18
	ld	hl, #(_DominationTiles + 0x0233)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x0234)
	ld	(hl), #0x18
	ld	hl, #(_DominationTiles + 0x0235)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x0236)
	ld	(hl), #0x66
	ld	hl, #(_DominationTiles + 0x0237)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x0238)
	ld	(hl), #0x66
	ld	hl, #(_DominationTiles + 0x0239)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x023a)
	ld	(hl), #0x18
	ld	hl, #(_DominationTiles + 0x023b)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x023c)
	ld	(hl), #0x18
	ld	hl, #(_DominationTiles + 0x023d)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x023e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x023f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0240)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0241)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0242)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0243)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0244)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0245)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0246)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0247)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0248)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0249)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x024a)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x024b)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x024c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x024d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x024e)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x024f)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0250)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0251)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0252)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0253)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0254)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0255)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0256)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0257)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0258)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0259)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x025a)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x025b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x025c)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x025d)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x025e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x025f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0260)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0261)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0262)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0263)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0264)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0265)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0266)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0267)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0268)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0269)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x026a)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x026b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x026c)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x026d)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x026e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x026f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0270)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0271)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0272)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0273)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0274)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x0275)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x0276)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0277)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0278)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x0279)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x027a)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x027b)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x027c)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x027d)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x027e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x027f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0280)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0281)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0282)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0283)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x0284)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0285)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0286)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0287)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0288)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0289)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x028a)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x028b)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x028c)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x028d)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x028e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x028f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0290)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0291)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0292)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0293)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0294)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x0295)
	ld	(hl), #0x99
	ld	hl, #(_DominationTiles + 0x0296)
	ld	(hl), #0xa5
	ld	hl, #(_DominationTiles + 0x0297)
	ld	(hl), #0xa5
	ld	hl, #(_DominationTiles + 0x0298)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0299)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x029a)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x029b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x029c)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x029d)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x029e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x029f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02a0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02a1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02a2)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02a3)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02a4)
	ld	(hl), #0x9d
	ld	hl, #(_DominationTiles + 0x02a5)
	ld	(hl), #0x9d
	ld	hl, #(_DominationTiles + 0x02a6)
	ld	(hl), #0xad
	ld	hl, #(_DominationTiles + 0x02a7)
	ld	(hl), #0xad
	ld	hl, #(_DominationTiles + 0x02a8)
	ld	(hl), #0xb5
	ld	hl, #(_DominationTiles + 0x02a9)
	ld	(hl), #0xb5
	ld	hl, #(_DominationTiles + 0x02aa)
	ld	(hl), #0xb9
	ld	hl, #(_DominationTiles + 0x02ab)
	ld	(hl), #0xb9
	ld	hl, #(_DominationTiles + 0x02ac)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02ad)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02ae)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02af)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02b0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02b1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02b2)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02b3)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02b4)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02b5)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02b6)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02b7)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02b8)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02b9)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02ba)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02bb)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02bc)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02bd)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02be)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02bf)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02c0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02c1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02c2)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02c3)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02c4)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02c5)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02c6)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02c7)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02c8)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02c9)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02ca)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02cb)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02cc)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02cd)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02ce)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02cf)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02d0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02d1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02d2)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02d3)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02d4)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02d5)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02d6)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02d7)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02d8)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02d9)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02da)
	ld	(hl), #0xbb
	ld	hl, #(_DominationTiles + 0x02db)
	ld	(hl), #0xbb
	ld	hl, #(_DominationTiles + 0x02dc)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02dd)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02de)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02df)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02e0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02e1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02e2)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02e3)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02e4)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02e5)
	ld	(hl), #0xbf
	ld	hl, #(_DominationTiles + 0x02e6)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02e7)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02e8)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x02e9)
	ld	(hl), #0xfd
	ld	hl, #(_DominationTiles + 0x02ea)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02eb)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x02ec)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02ed)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x02ee)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02ef)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02f0)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02f1)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02f2)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02f3)
	ld	(hl), #0x83
	ld	hl, #(_DominationTiles + 0x02f4)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02f5)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02f6)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02f7)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02f8)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02f9)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02fa)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02fb)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02fc)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02fd)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x02fe)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x02ff)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0300)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0301)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0302)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0303)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0304)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x0305)
	ld	(hl), #0x42
	ld	hl, #(_DominationTiles + 0x0306)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0307)
	ld	(hl), #0x81
	ld	hl, #(_DominationTiles + 0x0308)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x0309)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x030a)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x030b)
	ld	(hl), #0xe7
	ld	hl, #(_DominationTiles + 0x030c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x030d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x030e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x030f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0310)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0311)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0312)
	ld	(hl), #0x7d
	ld	hl, #(_DominationTiles + 0x0313)
	ld	(hl), #0x7d
	ld	hl, #(_DominationTiles + 0x0314)
	ld	(hl), #0xbb
	ld	hl, #(_DominationTiles + 0x0315)
	ld	(hl), #0xbb
	ld	hl, #(_DominationTiles + 0x0316)
	ld	(hl), #0xd7
	ld	hl, #(_DominationTiles + 0x0317)
	ld	(hl), #0xd7
	ld	hl, #(_DominationTiles + 0x0318)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x0319)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x031a)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x031b)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x031c)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x031d)
	ld	(hl), #0xef
	ld	hl, #(_DominationTiles + 0x031e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x031f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0320)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0321)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0322)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0323)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0324)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0325)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0326)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0327)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0328)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0329)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x032a)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x032b)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x032c)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x032d)
	ld	(hl), #0xc3
	ld	hl, #(_DominationTiles + 0x032e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x032f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0330)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0331)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0332)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0333)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0334)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0335)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0336)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0337)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0338)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x0339)
	ld	(hl), #0xbd
	ld	hl, #(_DominationTiles + 0x033a)
	ld	(hl), #0xa5
	ld	hl, #(_DominationTiles + 0x033b)
	ld	(hl), #0xa5
	ld	hl, #(_DominationTiles + 0x033c)
	ld	(hl), #0xdb
	ld	hl, #(_DominationTiles + 0x033d)
	ld	(hl), #0xdb
	ld	hl, #(_DominationTiles + 0x033e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x033f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0340)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0341)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0342)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0343)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0344)
	ld	(hl), #0xdd
	ld	hl, #(_DominationTiles + 0x0345)
	ld	(hl), #0xdd
	ld	hl, #(_DominationTiles + 0x0346)
	ld	(hl), #0xeb
	ld	hl, #(_DominationTiles + 0x0347)
	ld	(hl), #0xeb
	ld	hl, #(_DominationTiles + 0x0348)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x0349)
	ld	(hl), #0xf7
	ld	hl, #(_DominationTiles + 0x034a)
	ld	(hl), #0xeb
	ld	hl, #(_DominationTiles + 0x034b)
	ld	(hl), #0xeb
	ld	hl, #(_DominationTiles + 0x034c)
	ld	(hl), #0xdd
	ld	hl, #(_DominationTiles + 0x034d)
	ld	(hl), #0xdd
	ld	hl, #(_DominationTiles + 0x034e)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x034f)
	ld	(hl), #0xff
	ld	hl, #(_DominationTiles + 0x0350)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0351)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0352)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0353)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0354)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0355)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0356)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0357)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0358)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0359)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x035a)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x035b)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x035c)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x035d)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x035e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x035f)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0360)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0361)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x0362)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0363)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x0364)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x0365)
	ld	(hl), #0x7c
	ld	hl, #(_DominationTiles + 0x0366)
	ld	(hl), #0x7a
	ld	hl, #(_DominationTiles + 0x0367)
	ld	(hl), #0x7a
	ld	hl, #(_DominationTiles + 0x0368)
	ld	(hl), #0x56
	ld	hl, #(_DominationTiles + 0x0369)
	ld	(hl), #0x56
	ld	hl, #(_DominationTiles + 0x036a)
	ld	(hl), #0x6e
	ld	hl, #(_DominationTiles + 0x036b)
	ld	(hl), #0x6e
	ld	hl, #(_DominationTiles + 0x036c)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x036d)
	ld	(hl), #0x7e
	ld	hl, #(_DominationTiles + 0x036e)
	ld	(hl), #0x00
	ld	hl, #(_DominationTiles + 0x036f)
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\/board_map.c:25: unsigned char DominationMap[] =
	ld	hl, #_DominationMap
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0001)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0002)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0003)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0004)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0005)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0006)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0007)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0008)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0009)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x000f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0010)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0011)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0012)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0013)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0014)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0015)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0016)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0017)
	ld	(hl), #0x23
	ld	hl, #(_DominationMap + 0x0018)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0019)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x001d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0021)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0025)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0026)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0027)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0028)
	ld	(hl), #0x23
	ld	hl, #(_DominationMap + 0x0029)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x002a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x002b)
	ld	(hl), #0x24
	ld	hl, #(_DominationMap + 0x002c)
	ld	(hl), #0x24
	ld	hl, #(_DominationMap + 0x002d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x002e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0032)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0036)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x003a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x003b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x003c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x003d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x003e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x003f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0040)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0041)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0042)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0043)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0047)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x004b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x004f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0050)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0051)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0052)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0053)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0054)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0055)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0056)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0057)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0058)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0059)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x005f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0060)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0061)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0062)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0063)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0064)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0065)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0066)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0067)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0068)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0069)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x006a)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x006b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x006c)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x006d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0071)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0075)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0079)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x007a)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x007b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x007c)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x007d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x007e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x007f)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0080)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0081)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0082)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0086)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x008a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x008e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x008f)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0090)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0091)
	ld	(hl), #0x19
	ld	hl, #(_DominationMap + 0x0092)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0093)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0094)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x0095)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0096)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x0097)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x009b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x009f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00a3)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00a4)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x00a5)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00a6)
	ld	(hl), #0x30
	ld	hl, #(_DominationMap + 0x00a7)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00a8)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00a9)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00aa)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ab)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ac)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ad)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ae)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00af)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b0)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b1)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b2)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b3)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b4)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b5)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b6)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b7)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b8)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00b9)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ba)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00bb)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00bc)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00bd)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00be)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00bf)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00c0)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00c1)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c5)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00c9)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00cd)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ce)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00cf)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d0)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d1)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d2)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d3)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d4)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d5)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d6)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00da)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00de)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00e2)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e3)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e4)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e5)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e6)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e7)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e8)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00e9)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ea)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00eb)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00ef)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f3)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x00f7)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00f8)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00f9)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00fa)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00fb)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00fc)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00fd)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00fe)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x00ff)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0100)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0101)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0102)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0103)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0104)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0105)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0106)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0107)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0108)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0109)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x010f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0110)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0111)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0112)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0113)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0114)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0115)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0116)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0117)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0118)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0119)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011a)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011b)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011c)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011d)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011e)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x011f)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0120)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0121)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0122)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0123)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0124)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0125)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0126)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x012a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x012e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0132)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0136)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x013a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x013b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x013f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0143)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0147)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x014b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x014f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0150)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0154)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0158)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x015c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0160)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_DominationMap + 0x0164)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0165)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0166)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0167)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0168)
	ld	(hl), #0x04
	ld	hl, #(_DominationMap + 0x0169)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016a)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016b)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016c)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016d)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016e)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x016f)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0170)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0171)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0172)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0173)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0174)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0175)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0176)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0177)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0178)
	ld	(hl), #0x03
	ld	hl, #(_DominationMap + 0x0179)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\/start_screen.c:25: unsigned char DominationStartScreen[] =
	ld	hl, #_DominationStartScreen
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0001)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0002)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0003)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0004)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0005)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0006)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0007)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0008)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0009)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x000f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0010)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0011)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0012)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0013)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0014)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0015)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0016)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0017)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0018)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0019)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x001f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0020)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0021)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0022)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0023)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0024)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0025)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0026)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0027)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0028)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0029)
	ld	(hl), #0x23
	ld	hl, #(_DominationStartScreen + 0x002a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x002b)
	ld	(hl), #0x30
	ld	hl, #(_DominationStartScreen + 0x002c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x002d)
	ld	(hl), #0x26
	ld	hl, #(_DominationStartScreen + 0x002e)
	ld	(hl), #0x2b
	ld	hl, #(_DominationStartScreen + 0x002f)
	ld	(hl), #0x29
	ld	hl, #(_DominationStartScreen + 0x0030)
	ld	(hl), #0x28
	ld	hl, #(_DominationStartScreen + 0x0031)
	ld	(hl), #0x2a
	ld	hl, #(_DominationStartScreen + 0x0032)
	ld	(hl), #0x25
	ld	hl, #(_DominationStartScreen + 0x0033)
	ld	(hl), #0x2f
	ld	hl, #(_DominationStartScreen + 0x0034)
	ld	(hl), #0x28
	ld	hl, #(_DominationStartScreen + 0x0035)
	ld	(hl), #0x2b
	ld	hl, #(_DominationStartScreen + 0x0036)
	ld	(hl), #0x2a
	ld	hl, #(_DominationStartScreen + 0x0037)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0038)
	ld	(hl), #0x30
	ld	hl, #(_DominationStartScreen + 0x0039)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x003a)
	ld	(hl), #0x23
	ld	hl, #(_DominationStartScreen + 0x003b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x003c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x003d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x003e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x003f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0040)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0041)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0042)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0043)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0044)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0045)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0046)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0047)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0048)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0049)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x004f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0050)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0051)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0052)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0053)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0054)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0055)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0056)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0057)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0058)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0059)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x005a)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x005b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x005c)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x005d)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x005e)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x005f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0060)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0061)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0062)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0063)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0064)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0065)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0066)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0067)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0068)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0069)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x006a)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x006b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x006c)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x006d)
	ld	(hl), #0x12
	ld	hl, #(_DominationStartScreen + 0x006e)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x006f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0070)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0071)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0072)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0073)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0074)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0075)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0076)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0077)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0078)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0079)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x007a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x007b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x007c)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x007d)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x007e)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x007f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0080)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0081)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0082)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0083)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0084)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0085)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0086)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0087)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0088)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0089)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x008f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0090)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0091)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0092)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0093)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0094)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0095)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0096)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0097)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0098)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0099)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x009f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a0)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a1)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a2)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a4)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00a5)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00a6)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00a7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00a8)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00a9)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00aa)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00ab)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ac)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00ad)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00ae)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00af)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b0)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b1)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b2)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b4)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b5)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b6)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00b8)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00b9)
	ld	(hl), #0x13
	ld	hl, #(_DominationStartScreen + 0x00ba)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00bb)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00bc)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00bd)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00be)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00bf)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c0)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00c1)
	ld	(hl), #0x15
	ld	hl, #(_DominationStartScreen + 0x00c2)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00c3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c4)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c5)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c6)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c8)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00c9)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ca)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00cb)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00cc)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00cd)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00ce)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00cf)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00d0)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00d1)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00d2)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00d3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00d4)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00d5)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00d6)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00d7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00d8)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00d9)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00da)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00db)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00dc)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00dd)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00de)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00df)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e0)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e1)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e2)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e4)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e5)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e6)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e8)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00e9)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ea)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00eb)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ec)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ed)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ee)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00ef)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f0)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f1)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f2)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f3)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f4)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00f5)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00f6)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00f7)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00f8)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00f9)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00fa)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x00fb)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x00fc)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00fd)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00fe)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x00ff)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0100)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0101)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0102)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0103)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0104)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0105)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0106)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0107)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0108)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0109)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x010a)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x010b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x010c)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x010d)
	ld	(hl), #0x14
	ld	hl, #(_DominationStartScreen + 0x010e)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x010f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0110)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0111)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0112)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0113)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0114)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0115)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0116)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0117)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0118)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0119)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x011a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x011b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x011c)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x011d)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x011e)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x011f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0120)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0121)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0122)
	ld	(hl), #0x02
	ld	hl, #(_DominationStartScreen + 0x0123)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0124)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0125)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0126)
	ld	(hl), #0x01
	ld	hl, #(_DominationStartScreen + 0x0127)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0128)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0129)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x012f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0130)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0131)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0132)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0133)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0134)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0135)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0136)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0137)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0138)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0139)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x013f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0140)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0141)
	ld	(hl), #0x35
	ld	hl, #(_DominationStartScreen + 0x0142)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0143)
	ld	(hl), #0x2c
	ld	hl, #(_DominationStartScreen + 0x0144)
	ld	(hl), #0x2d
	ld	hl, #(_DominationStartScreen + 0x0145)
	ld	(hl), #0x27
	ld	hl, #(_DominationStartScreen + 0x0146)
	ld	(hl), #0x2e
	ld	hl, #(_DominationStartScreen + 0x0147)
	ld	(hl), #0x2e
	ld	hl, #(_DominationStartScreen + 0x0148)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0149)
	ld	(hl), #0x2e
	ld	hl, #(_DominationStartScreen + 0x014a)
	ld	(hl), #0x2f
	ld	hl, #(_DominationStartScreen + 0x014b)
	ld	(hl), #0x25
	ld	hl, #(_DominationStartScreen + 0x014c)
	ld	(hl), #0x2d
	ld	hl, #(_DominationStartScreen + 0x014d)
	ld	(hl), #0x2f
	ld	hl, #(_DominationStartScreen + 0x014e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x014f)
	ld	(hl), #0x34
	ld	hl, #(_DominationStartScreen + 0x0150)
	ld	(hl), #0x1b
	ld	hl, #(_DominationStartScreen + 0x0151)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0152)
	ld	(hl), #0x35
	ld	hl, #(_DominationStartScreen + 0x0153)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0154)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0155)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0156)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0157)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0158)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0159)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x015f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0160)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0161)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0162)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0163)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0164)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0165)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0166)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0167)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0168)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0169)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016b)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016c)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016d)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016e)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x016f)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0170)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0171)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0172)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0173)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0174)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0175)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0176)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0177)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0178)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x0179)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x017a)
	ld	(hl), #0x03
	ld	hl, #(_DominationStartScreen + 0x017b)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:17: UBYTE currentPlayer = 0;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:18: BOOLEAN cardSelected = FALSE;
	ld	hl, #_cardSelected
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:23: UINT16 player1Wins = 0;
	ld	hl, #_player1Wins
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:24: UINT16 player2Wins = 0;
	ld	hl, #_player2Wins
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:25: INT8 selectedCard = -1;
	ld	hl, #_selectedCard
	ld	(hl), #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:26: UINT8 handCursorPosition = 0;
	ld	hl, #_handCursorPosition
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:27: UINT8 boardCursorPosition = 0;
	ld	hl, #_boardCursorPosition
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:30: UINT8 vblCount = 0;
	ld	hl, #_vblCount
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:38: void vbl_isr_handle(){
;	---------------------------------
; Function vbl_isr_handle
; ---------------------------------
_vbl_isr_handle::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:39: gbt_update();
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:40: }
	jp  _gbt_update
_INT16_MIN:
	.dw #0x8000
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:42: void initialiseTiles(){
;	---------------------------------
; Function initialiseTiles
; ---------------------------------
_initialiseTiles::
	add	sp, #-26
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:44: for (UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00121$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:46: blankTile.isBlank = TRUE;
	ld	hl, #_blankTile
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:47: blankTile.color = 0;
	ld	hl, #(_blankTile + 0x0005)
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:48: blankTile.values[i] = 0;
	ld	hl, #(_blankTile + 0x0001)
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:44: for (UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00121$
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:51: for (UINT8 tileId = 0; tileId < 10; tileId++)
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#6
	ld	(hl+), a
;c
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#14
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#16
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#18
	ld	(hl+), a
	ld	(hl), e
	xor	a, a
	ldhl	sp,	#24
	ld	(hl), a
00127$:
	ldhl	sp,	#24
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:54: for (UINT8 i = 0; i < 4; i++)
	ld	a,(hl)
	cp	a,#0x0a
	jp	NC,00118$
	sub	a, #0x05
	ld	a, #0x00
	rla
	ldhl	sp,	#20
	ld	(hl), a
	xor	a, #0x01
	inc	hl
	ld	(hl), a
	xor	a, a
	ldhl	sp,	#25
	ld	(hl), a
00124$:
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00114$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:56: tile.isBlank = FALSE;
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:57: tile.color = tileId >= 5;
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:58: UINT8 d100 = getRand(1,100);
	ld	de, #0x6401
	push	de
	call	_getRand
	add	sp, #2
	ldhl	sp,	#23
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:59: if(d100 < 5){
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00112$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:60: tile.values[i] = 1;    
;c
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#25
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x01
	jr	00125$
00112$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:62: else if(d100 < 15){
	ldhl	sp,	#23
	ld	a, (hl)
	sub	a, #0x0f
	jr	NC, 00109$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:63: tile.values[i] = 2;    
;c
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#25
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	jr	00125$
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:65: else if (d100 > 95)
	ld	a, #0x5f
	ldhl	sp,	#23
	sub	a, (hl)
	jr	NC, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:67: tile.values[i] = 9;
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#25
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x09
	jr	00125$
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:69: else if (d100 > 85)
	ld	a, #0x55
	ldhl	sp,	#23
	sub	a, (hl)
	jr	NC, 00103$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:71: tile.values[i] = 8;
;c
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#25
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x08
	jr	00125$
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:74: tile.values[i] = getRand(3,7);
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#25
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	de, #0x0703
	push	de
	call	_getRand
	add	sp, #2
	ld	a, e
	pop	bc
	ld	(bc), a
00125$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:54: for (UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#25
	inc	(hl)
	jp	00124$
00114$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:77: tiles[tileId] = tile;
	ldhl	sp,#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#24
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	a, l
	add	a, #<(_tiles)
	ld	e, a
	ld	a, h
	adc	a, #>(_tiles)
	ld	d, a
	ld	l, e
	ld	h, d
	push	de
	xor	a, a
	ld	d,a
	ld	e,#0x06
	push	de
	push	bc
	push	hl
	call	___memcpy
	add	sp, #6
	pop	de
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:78: if(tileId < 5){
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:79: player1Hand[tileId] = &tiles[tileId]; 
	ldhl	sp,	#24
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	bc, #_player1Hand
	add	hl, bc
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00128$
00116$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:82: player2Hand[tileId - 5] = &tiles[tileId];
	ldhl	sp,	#24
	ld	a, (hl)
	add	a, #0xfb
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	bc, #_player2Hand
	add	hl, bc
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00128$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:51: for (UINT8 tileId = 0; tileId < 10; tileId++)
	ldhl	sp,	#24
	inc	(hl)
	jp	00127$
00118$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:86: for (UINT8 i = 0; i < 9; i++)
	ld	bc, #_board+0
	ld	e, #0x00
00130$:
	ld	a, e
	sub	a, #0x09
	jr	NC, 00132$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:88: board[i] = &blankTile;
	ldhl	sp,	#24
	ld	(hl), e
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	l, a
	ld	h, d
	add	hl, bc
	ld	(hl), #<(_blankTile)
	inc	hl
	ld	(hl), #>(_blankTile)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:86: for (UINT8 i = 0; i < 9; i++)
	inc	e
	jr	00130$
00132$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:91: }
	add	sp, #26
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:93: void initialiseCursor(enum PlayArea playArea){
;	---------------------------------
; Function initialiseCursor
; ---------------------------------
_initialiseCursor::
	add	sp, #-4
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:94: UINT8 offsetX = playArea == Hand ? 12 : 44;
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
	ld	bc, #0x000c
	jr	00110$
00109$:
	ld	bc, #0x002c
00110$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:95: INT8 offsetY = playArea == Hand ? 152 : 48;
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00111$
	ld	b, #0x98
	jr	00112$
00111$:
	ld	b, #0x30
00112$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:96: UINT8 tile = playArea == Hand ? 5 : 6; 
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
	ld	de, #0x0005
	jr	00114$
00113$:
	ld	de, #0x0006
00114$:
	ldhl	sp,	#0
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:97: set_sprite_data(0,7, DominationTiles);
	ld	hl, #_DominationTiles
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:98: set_sprite_tile((playArea * 3) + 0, tile);
	ldhl	sp,	#6
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	ldhl	sp,	#1
	ld	(hl), a
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:99: set_sprite_tile((playArea * 3) + 1, tile);
	inc	hl
	ld	a, (hl)
	inc	a
	inc	hl
	ld	(hl), a
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:100: set_sprite_tile((playArea * 3) + 2, tile);
	inc	hl
	ld	a, (hl)
	add	a, #0x02
	inc	hl
	inc	hl
	ld	(hl), a
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:102: move_sprite((playArea * 3) + 0, offsetX + 0, offsetY);
	inc	hl
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:103: move_sprite((playArea * 3) + 1, offsetX + 8, offsetY);
	ldhl	sp,	#1
	ld	(hl), c
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	inc	hl
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:104: move_sprite((playArea * 3) + 2, offsetX + 16, offsetY);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x10
	ld	c, a
	inc	hl
	inc	hl
	ld	e, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:105: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:106: }
	add	sp, #4
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:108: void refreshDisplay(){
;	---------------------------------
; Function refreshDisplay
; ---------------------------------
_refreshDisplay::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:109: set_bkg_tiles(0,0,21,18,DominationMap);
	ld	hl, #_DominationMap
	push	hl
	ld	de, #0x1215
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:110: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:112: void moveHandCursor(UINT8 pos)
;	---------------------------------
; Function moveHandCursor
; ---------------------------------
_moveHandCursor::
	dec	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:114: handCursorPosition = pos;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(#_handCursorPosition),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:115: UINT8 offsetX = selectedCard < 0 ? 12 : 44;
	ld	a, (#_selectedCard)
	bit	7, a
	jr	Z, 00108$
	ld	bc, #0x000c
	jr	00109$
00108$:
	ld	bc, #0x002c
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:116: for (UINT8 i = 0; i < 3; i++)
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x03
	jr	NC, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:118: move_sprite(i, (pos * 32) + offsetX + (i * 8), 152);
	ldhl	sp,	#3
	ld	l, (hl)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	add	a, l
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	a, l
	ldhl	sp,	#0
	ld	(hl), a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, b
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	e, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	d, a
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x98
	ld	(de), a
	inc	de
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:116: for (UINT8 i = 0; i < 3; i++)
	inc	b
	jr	00104$
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:120: }
	inc	sp
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:122: void moveBoardCursor(UINT8 pos)
;	---------------------------------
; Function moveBoardCursor
; ---------------------------------
_moveBoardCursor::
	add	sp, #-5
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:124: boardCursorPosition = pos;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_boardCursorPosition),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:125: UINT8 offsetX = selectedCard < 0 ? 12 : 44;
	ld	a, (#_selectedCard)
	bit	7, a
	jr	Z, 00116$
	ld	de, #0x000c
	jr	00117$
00116$:
	ld	de, #0x002c
00117$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:126: for (UINT8 i = 0; i < 3; i++)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x00
	rla
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x06
	ld	a, #0x00
	rla
	ldhl	sp,	#1
	ld	(hl), a
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x03
	jp	NC, 00114$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:129: move_sprite(3 + i, (pos * 32) + offsetX + (i * 8), 48);
	ldhl	sp,	#2
	ld	(hl), e
	ld	a, c
	ld	b, c
	add	a, a
	add	a, a
	add	a, a
	inc	hl
	ld	(hl), a
	ld	a, b
	add	a, #0x03
	inc	hl
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:128: if(pos < 3){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:129: move_sprite(3 + i, (pos * 32) + offsetX + (i * 8), 48);
	ldhl	sp,	#7
	ld	a, (hl)
	swap	a
	rlca
	and	a, #0xe0
	ldhl	sp,	#2
	add	a, (hl)
	inc	hl
	add	a, (hl)
	ld	b, a
	inc	hl
	ld	d, (hl)
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, d
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	d, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	l, d
	ld	h, a
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:129: move_sprite(3 + i, (pos * 32) + offsetX + (i * 8), 48);
	jr	00113$
00105$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:133: move_sprite(3 + i, ((pos - 3) * 32) + offsetX + (i * 8), 80);
	ldhl	sp,	#7
	ld	b, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:131: else if (pos < 6)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:133: move_sprite(3 + i, ((pos - 3) * 32) + offsetX + (i * 8), 80);
	ld	a, b
	add	a, #0xfd
	swap	a
	rlca
	and	a, #0xe0
	inc	hl
	add	a, (hl)
	inc	hl
	add	a, (hl)
	ld	b, a
	inc	hl
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	d, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	l, d
	ld	h, a
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:133: move_sprite(3 + i, ((pos - 3) * 32) + offsetX + (i * 8), 80);
	jr	00113$
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:137: move_sprite(3 + i, ((pos - 6) * 32) + offsetX + (i * 8), 112);
	ld	a, b
	add	a, #0xfa
	swap	a
	rlca
	and	a, #0xe0
	ldhl	sp,	#2
	add	a, (hl)
	inc	hl
	add	a, (hl)
	ld	b, a
	inc	hl
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	d, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	l, d
	ld	h, a
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x70
	ld	(hl+), a
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:137: move_sprite(3 + i, ((pos - 6) * 32) + offsetX + (i * 8), 112);
00113$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:126: for (UINT8 i = 0; i < 3; i++)
	inc	c
	jp	00112$
00114$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:141: }
	add	sp, #5
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:143: void swapCursors(){
;	---------------------------------
; Function swapCursors
; ---------------------------------
_swapCursors::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:144: for (UINT8 i = 0; i < 6; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x06
	ret	NC
;P:/_lib/gbdk/include/gb/gb.h:1156: return shadow_OAM[nb].tile;
	ld	de, #_shadow_OAM+0
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:146: set_sprite_tile(i, get_sprite_tile(i) == 5 ? 6 : 5);
	sub	a, #0x05
	jr	NZ, 00109$
	ld	b, #0x06
	jr	00110$
00109$:
	ld	b, #0x05
00110$:
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:144: for (UINT8 i = 0; i < 6; i++)
	inc	c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:148: }
	jr	00105$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:150: void showCursors(BOOLEAN show){
;	---------------------------------
; Function showCursors
; ---------------------------------
_showCursors::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:151: for (UINT8 i = 0; i < 6; i++)
	ld	e, #0x00
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:153: if(i < 3){
	ld	a,e
	cp	a,#0x06
	ret	NC
	sub	a, #0x03
	jr	NC, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:154: set_sprite_tile(i, show ? 5 : 4);    
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
	ld	bc, #0x0005
	jr	00113$
00112$:
	ld	bc, #0x0004
00113$:
	ld	d, c
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), d
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:154: set_sprite_tile(i, show ? 5 : 4);    
	jr	00109$
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:157: set_sprite_tile(i, show ? 6 : 4);
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
	ld	bc, #0x0006
	jr	00115$
00114$:
	ld	bc, #0x0004
00115$:
	ld	d, c
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	a, e
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), d
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:157: set_sprite_tile(i, show ? 6 : 4);
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:151: for (UINT8 i = 0; i < 6; i++)
	inc	e
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:160: }
	jr	00108$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:162: BOOLEAN isEqualOrHigherThanAdjacentCard(UINT8 challengerPos, UINT8 challengedPos, UINT8 challengerValId, UINT8 challengedValId, BOOLEAN ForceGreaterThan)
;	---------------------------------
; Function isEqualOrHigherThanAdjacentCard
; ---------------------------------
_isEqualOrHigherThanAdjacentCard::
	add	sp, #-2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:164: if(board[challengedPos]->isBlank) return FALSE;
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	or	a, a
	jr	Z, 00102$
	ld	e, #0x00
	jr	00108$
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:165: if(board[challengerPos]->color == board[challengedPos]->color) return FALSE;
	ldhl	sp,	#4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	a, e
	sub	a,d
	jr	NZ, 00104$
	ld	e,a
	jr	00108$
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:167: return (board[challengerPos]->values[challengerValId] > board[challengedPos]->values[challengedValId]);
	pop	de
	push	de
	inc	de
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	inc	bc
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
;c
	ld	(hl-), a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (de)
	ld	e, a
	ld	a, (bc)
	ld	c, a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:166: if(ForceGreaterThan)
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:167: return (board[challengerPos]->values[challengerValId] > board[challengedPos]->values[challengedValId]);
	ld	a, c
	sub	a, e
	ld	a, #0x00
	rla
	ld	e, a
	jr	00108$
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:169: return (board[challengerPos]->values[challengerValId] >= board[challengedPos]->values[challengedValId]);
	ld	a, e
	sub	a, c
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:170: }
	add	sp, #2
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:172: void flipAdjacentCardsIfEqualOrGreater(UINT8 boardPos, BOOLEAN cascade)
;	---------------------------------
; Function flipAdjacentCardsIfEqualOrGreater
; ---------------------------------
_flipAdjacentCardsIfEqualOrGreater::
	add	sp, #-10
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:174: if(!cascade)
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:175: performantDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:176: BOOLEAN checkUp = boardPos >= 3;
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#9
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:177: BOOLEAN checkDown = boardPos < 6;
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x06
	ld	a, #0x00
	rla
	ldhl	sp,	#0
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:178: BOOLEAN checkLeft = !(boardPos % 3 == 0);
	ldhl	sp,	#12
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	hl, #0x0003
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#1
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:179: BOOLEAN checkRight = !((boardPos + 1) % 3 == 0);
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#2
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:181: if(checkUp && isEqualOrHigherThanAdjacentCard(boardPos, boardPos - 3, 0, 3, !cascade)){
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	e, a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:182: board[boardPos - 3]->color = board[boardPos]->color;
	sla	c
	rl	b
	inc	hl
	ld	a, c
	ld	(hl+), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:181: if(checkUp && isEqualOrHigherThanAdjacentCard(boardPos, boardPos - 3, 0, 3, !cascade)){
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0xfd
	ldhl	sp,	#7
	ld	(hl-), a
	ld	d, (hl)
	ld	e,#0x03
	push	de
	xor	a, a
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_isEqualOrHigherThanAdjacentCard
	add	sp, #5
	ld	a, e
	or	a, a
	jr	Z, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:182: board[boardPos - 3]->color = board[boardPos]->color;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;c
	ld	de, #_board
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:183: if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos - 3, FALSE);
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:185: if(checkDown && isEqualOrHigherThanAdjacentCard(boardPos, boardPos + 3, 3, 0, !cascade)){
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, #0x03
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl)
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x03
	push	de
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_isEqualOrHigherThanAdjacentCard
	add	sp, #5
	ld	a, e
	or	a, a
	jr	Z, 00111$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:186: board[boardPos + 3]->color = board[boardPos]->color;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;c
	ld	de, #_board
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:187: if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos + 3, FALSE);
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
00111$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:189: if(checkLeft && isEqualOrHigherThanAdjacentCard(boardPos, boardPos - 1, 1, 2, !cascade)){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, #0xff
	ldhl	sp,	#7
	ld	(hl-), a
	ld	d, (hl)
	ld	e,#0x02
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	inc	hl
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_isEqualOrHigherThanAdjacentCard
	add	sp, #5
	ld	a, e
	or	a, a
	jr	Z, 00116$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:190: board[boardPos - 1]->color = board[boardPos]->color;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;c
	ld	de, #_board
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:191: if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos - 1, FALSE);
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
00116$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:193: if(checkRight && isEqualOrHigherThanAdjacentCard(boardPos, boardPos + 1, 2, 1, !cascade)){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
	inc	hl
	ld	a, (hl)
	inc	a
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
	ld	d, (hl)
	ld	e,#0x01
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_isEqualOrHigherThanAdjacentCard
	add	sp, #5
	ld	a, e
	or	a, a
	jr	Z, 00123$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:194: board[boardPos + 1]->color = board[boardPos]->color;
	ldhl	sp,	#9
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;c
	ld	de, #_board
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:195: if(cascade) flipAdjacentCardsIfEqualOrGreater(boardPos + 1, FALSE);
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
00123$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:197: }
	add	sp, #10
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:199: void paintTile(enum PlayArea playArea, UINT8 tileNumber, Tile * tile, BOOLEAN isBlank){
;	---------------------------------
; Function paintTile
; ---------------------------------
_paintTile::
	add	sp, #-17
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:200: INT16 offset = 295 + (4 * tileNumber);
	ldhl	sp,	#20
	ld	e, (hl)
	ld	d, #0x00
	ld	c, e
	ld	b, d
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #0x0127
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:201: if(playArea == Board){
	ldhl	sp,	#19
	ld	a, (hl)
	dec	a
	jr	NZ, 00110$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:202: if(tileNumber < 3){
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00107$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:203: offset = 26 + (4 * tileNumber);
	ld	hl, #0x001a
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	jr	00110$
00107$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:205: else if(tileNumber < 6){
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00104$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:206: offset = 110 + (4 * (tileNumber - 3));
	ld	a, e
	add	a, #0xfd
	ld	l, a
	ld	a, d
	adc	a, #0xff
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc,#0x006e
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
	jr	00110$
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:208: else if(tileNumber < 9)
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00110$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:210: offset = 194 + (4 * (tileNumber - 6));
	ld	a, e
	add	a, #0xfa
	ld	l, a
	ld	a, d
	adc	a, #0xff
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc,#0x00c2
	add	hl,bc
	inc	sp
	inc	sp
	push	hl
00110$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:214: if(isBlank)
	ldhl	sp,	#23
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:216: for (UINT8 i = 0; i < 9; i++)
	ld	c, #0x00
00129$:
	ld	a, c
	sub	a, #0x09
	jp	NC, 00134$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:220: DominationMap[offset + i] = 0x00;
	ldhl	sp,	#15
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:218: if(i < 3)
	ld	a, c
	sub	a, #0x03
	jr	NC, 00115$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:220: DominationMap[offset + i] = 0x00;
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_DominationMap
	add	hl, de
	ld	(hl), #0x00
	jr	00130$
00115$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:222: else if (i < 6)
	ld	a, c
	sub	a, #0x06
	jr	NC, 00112$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:224: DominationMap[offset + (i + 21 - 3)] = 0x00;      
;c
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	e, l
	ld	d, h
;c
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_DominationMap
	add	hl, de
	ld	(hl), #0x00
	jr	00130$
00112$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:228: DominationMap[offset + (i + 42 - 6)] = 0x00;      
;c
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0024
	add	hl, de
	ld	e, l
	ld	d, h
;c
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_DominationMap
	add	hl, de
	ld	(hl), #0x00
00130$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:216: for (UINT8 i = 0; i < 9; i++)
	inc	c
	jr	00129$
00126$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:234: INT8 blankTile = tile->color == Player1 ? 0x01 : 0x02;    
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#15
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	or	a, a
	jr	NZ, 00136$
	ld	bc, #0x0001
	jr	00137$
00136$:
	ld	bc, #0x0002
00137$:
	ldhl	sp,	#2
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:235: INT8 valueOffset = tile->color == Player1 ? 0x06 : 0x0F;
	ld	a, e
	or	a, a
	jr	NZ, 00138$
	ld	bc, #0x0006
	jr	00139$
00138$:
	ld	bc, #0x000f
00139$:
	ldhl	sp,	#3
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:237: UINT8 valueCount = 0;
	xor	a, a
	inc	hl
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:238: for (UINT8 i = 0; i < 9; i++)
;c
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	(hl+), a
	ld	(hl), e
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	(hl), e
	xor	a, a
	ldhl	sp,	#16
	ld	(hl), a
00132$:
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, #0x09
	jp	NC, 00134$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:242: DominationMap[offset + i] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	inc	a
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	and	a, #0x01
	dec	hl
	dec	hl
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:240: if(i < 3)
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00122$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:242: DominationMap[offset + i] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
;c
	pop	de
	push	de
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	bc,#_DominationMap
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00140$
	ldhl	sp,	#2
	ld	a, (hl)
	jr	00141$
00140$:
	ldhl	sp,	#4
	ld	e, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;b
	ld	d, #0x00
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	add	a, (hl)
00141$:
	ld	(bc), a
	jp	00133$
00122$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:244: else if (i < 6)
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00119$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:246: DominationMap[offset + (i + 21 - 3)] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	bc,#_DominationMap
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00142$
	ldhl	sp,	#2
	ld	c, (hl)
	jr	00143$
00142$:
	ldhl	sp,	#4
	ld	e, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;b
	ld	d, #0x00
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	add	a, (hl)
	ld	c, a
00143$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00133$
00119$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:250: DominationMap[offset + (i + 42 - 6)] = i % 2 == 0 ? blankTile : valueOffset + tile->values[valueCount++];      
;c
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0024
	add	hl, de
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
	ld	bc,#_DominationMap
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00144$
	ldhl	sp,	#2
	ld	a, (hl)
	jr	00145$
00144$:
	ldhl	sp,	#4
	ld	e, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;b
	ld	d, #0x00
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	add	a, (hl)
00145$:
	ld	(bc), a
00133$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:238: for (UINT8 i = 0; i < 9; i++)
	ldhl	sp,	#16
	inc	(hl)
	jp	00132$
00134$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:255: }
	add	sp, #17
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:257: void showPlayerIndicator()
;	---------------------------------
; Function showPlayerIndicator
; ---------------------------------
_showPlayerIndicator::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:259: DominationMap[43] = currentPlayer == 0 ? 0x24 : 0x03;
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00103$
	ld	bc, #0x0024
	jr	00104$
00103$:
	ld	bc, #0x0003
00104$:
	ld	hl, #(_DominationMap + 0x002b)
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:260: DominationMap[44] = currentPlayer == 0 ? 0x24 : 0x03;
	ld	a, (#_currentPlayer)
	or	a, a
	jr	NZ, 00105$
	ld	bc, #0x0024
	jr	00106$
00105$:
	ld	bc, #0x0003
00106$:
	ld	hl, #(_DominationMap + 0x002c)
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:261: DominationMap[60] = currentPlayer == 1 ? 0x24 : 0x03;
	ld	a, (#_currentPlayer)
	dec	a
	jr	NZ, 00107$
	ld	bc, #0x0024
	jr	00108$
00107$:
	ld	bc, #0x0003
00108$:
	ld	hl, #(_DominationMap + 0x003c)
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:262: DominationMap[61] = currentPlayer == 1 ? 0x24 : 0x03;
	ld	a, (#_currentPlayer)
	dec	a
	jr	NZ, 00109$
	ld	bc, #0x0024
	jr	00110$
00109$:
	ld	bc, #0x0003
00110$:
	ld	hl, #(_DominationMap + 0x003d)
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:263: refreshDisplay();
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:264: }
	jp  _refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:266: void showCards(){
;	---------------------------------
; Function showCards
; ---------------------------------
_showCards::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:268: for (UINT8 i = 0; i < 5; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x05
	jr	NC, 00101$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:270: paintTile(Hand, i, player1Hand[i], player1Hand[i]->isBlank);        
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	ld	de, #_player1Hand
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	push	hl
	ld	a, c
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_paintTile
	add	sp, #5
	pop	bc
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:268: for (UINT8 i = 0; i < 5; i++)
	inc	c
	jr	00104$
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:273: for (UINT8 i = 0; i < 9; i++)
	ld	b, #0x00
00107$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:275: paintTile(Board, i, board[i], board[i]->isBlank);        
	ld	a,b
	cp	a,#0x09
	jr	NC, 00102$
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	push	hl
	ld	c, #0x01
	push	bc
	call	_paintTile
	add	sp, #5
	pop	bc
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:273: for (UINT8 i = 0; i < 9; i++)
	inc	b
	jr	00107$
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:277: refreshDisplay();
	call	_refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:279: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:280: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:282: UINT8 countCards(enum Player player){
;	---------------------------------
; Function countCards
; ---------------------------------
_countCards::
	dec	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:284: for (UINT8 i = 0; i < 9; i++)
	xor	a, a
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, #0x00
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:286: if(board[i]->isBlank) continue;
	ld	a,c
	cp	a,#0x09
	jr	NC, 00106$
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:287: if(board[i]->color == player ) playerCards++;
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00105$
	ldhl	sp,	#0
	inc	(hl)
00105$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:284: for (UINT8 i = 0; i < 9; i++)
	inc	c
	jr	00108$
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:289: return playerCards;
	ldhl	sp,	#0
	ld	e, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:290: }
	inc	sp
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:292: void showCardCount()
;	---------------------------------
; Function showCardCount
; ---------------------------------
_showCardCount::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:294: DominationMap[22] = 0x19 + countCards(Player1);
	xor	a, a
	push	af
	inc	sp
	call	_countCards
	inc	sp
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0016)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:295: DominationMap[39] = 0x19 + countCards(Player2);
	ld	a, #0x01
	push	af
	inc	sp
	call	_countCards
	inc	sp
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0027)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:296: refreshDisplay();
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:297: }
	jp  _refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:299: BOOLEAN isGameOver()
;	---------------------------------
; Function isGameOver
; ---------------------------------
_isGameOver::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:302: for (UINT8 i = 0; i < 9; i++)
	ld	bc, #0x0009
00105$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:304: if(!board[i]->isBlank)
	ld	a,b
	cp	a,#0x09
	jr	NC, 00103$
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:305: emptyTiles--;
	dec	c
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:302: for (UINT8 i = 0; i < 9; i++)
	inc	b
	jr	00105$
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:307: return emptyTiles == 0; 
	ld	a, c
	or	a, a
	ld	a, #0x01
	jr	Z, 00126$
	xor	a, a
00126$:
	ld	e, a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:308: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:310: void setScore(enum Player player){
;	---------------------------------
; Function setScore
; ---------------------------------
_setScore::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:311: switch (player)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:313: case Player1:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:314: player1Wins++;
	ld	hl, #_player1Wins
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:315: break;
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:316: case Player2:
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:317: player2Wins++;
	ld	hl, #_player2Wins
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:319: }
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:320: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:322: void resetNotifications(){
;	---------------------------------
; Function resetNotifications
; ---------------------------------
_resetNotifications::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:324: DominationMap[190] = black;
	ld	hl, #(_DominationMap + 0x00be)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:325: DominationMap[191] = black;
	ld	hl, #(_DominationMap + 0x00bf)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:326: DominationMap[192] = black;
	ld	hl, #(_DominationMap + 0x00c0)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:327: DominationMap[211] = black;
	ld	hl, #(_DominationMap + 0x00d3)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:328: DominationMap[212] = black;
	ld	hl, #(_DominationMap + 0x00d4)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:329: DominationMap[213] = black;
	ld	hl, #(_DominationMap + 0x00d5)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:330: DominationMap[206] = black;
	ld	hl, #(_DominationMap + 0x00ce)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:331: DominationMap[207] = black;
	ld	hl, #(_DominationMap + 0x00cf)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:332: DominationMap[227] = black;
	ld	hl, #(_DominationMap + 0x00e3)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:333: DominationMap[228] = black;
	ld	hl, #(_DominationMap + 0x00e4)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:334: DominationMap[229] = black;
	ld	hl, #(_DominationMap + 0x00e5)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:335: refreshDisplay();
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:336: }
	jp  _refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:338: void resetGame(){
;	---------------------------------
; Function resetGame
; ---------------------------------
_resetGame::
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:339: if(countCards(Player1) > countCards(Player2)){
	xor	a, a
	push	af
	inc	sp
	call	_countCards
	inc	sp
	ld	c, e
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_countCards
	inc	sp
	pop	bc
	ld	a, e
	sub	a, c
	jp	NC, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:340: setScore(Player1);
	xor	a, a
	push	af
	inc	sp
	call	_setScore
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:342: DominationMap[127] = 0x19 + ((player1Wins / 100) % 10); 
	ld	hl, #0x0064
	push	hl
	ld	hl, #_player1Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x007f)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:343: DominationMap[128] = 0x19 + ((player1Wins / 10) % 10); 
	ld	hl, #0x000a
	push	hl
	ld	hl, #_player1Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0080)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:344: DominationMap[129] = 0x19 + (player1Wins % 10); 
	ld	hl, #0x000a
	push	hl
	ld	hl, #_player1Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0081)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:347: DominationMap[190] = 0x31;
	ld	hl, #(_DominationMap + 0x00be)
	ld	(hl), #0x31
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:348: DominationMap[191] = 0x2B;
	ld	hl, #(_DominationMap + 0x00bf)
	ld	(hl), #0x2b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:349: DominationMap[192] = 0x32;
	ld	hl, #(_DominationMap + 0x00c0)
	ld	(hl), #0x32
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:350: DominationMap[211] = 0x33;
	ld	hl, #(_DominationMap + 0x00d3)
	ld	(hl), #0x33
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:351: DominationMap[212] = 0x2B;
	ld	hl, #(_DominationMap + 0x00d4)
	ld	(hl), #0x2b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:352: DominationMap[213] = 0x2A;
	ld	hl, #(_DominationMap + 0x00d5)
	ld	(hl), #0x2a
	jr	00103$
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:355: setScore(Player2);
	ld	a, #0x01
	push	af
	inc	sp
	call	_setScore
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:357: DominationMap[143] = 0x19 + ((player2Wins / 100) % 10); 
	ld	hl, #0x0064
	push	hl
	ld	hl, #_player2Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x008f)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:358: DominationMap[144] = 0x19 + ((player2Wins / 10) % 10); 
	ld	hl, #0x000a
	push	hl
	ld	hl, #_player2Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0090)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:359: DominationMap[145] = 0x19 + (player2Wins % 10); 
	ld	hl, #0x000a
	push	hl
	ld	hl, #_player2Wins
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__moduint
	add	sp, #4
	ld	a, e
	add	a, #0x19
	ld	(#(_DominationMap + 0x0091)),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:362: DominationMap[206] = 0x25;
	ld	hl, #(_DominationMap + 0x00ce)
	ld	(hl), #0x25
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:363: DominationMap[207] = 0x28;
	ld	hl, #(_DominationMap + 0x00cf)
	ld	(hl), #0x28
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:364: DominationMap[227] = 0x33;
	ld	hl, #(_DominationMap + 0x00e3)
	ld	(hl), #0x33
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:365: DominationMap[228] = 0x2B;
	ld	hl, #(_DominationMap + 0x00e4)
	ld	(hl), #0x2b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:366: DominationMap[229] = 0x2A;
	ld	hl, #(_DominationMap + 0x00e5)
	ld	(hl), #0x2a
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:368: refreshDisplay();
	call	_refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:369: performantDelay(150);
	ld	a, #0x96
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:370: resetNotifications();
	call	_resetNotifications
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:372: initialiseTiles();
	call	_initialiseTiles
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:373: initialiseCursor(Hand);
	xor	a, a
	push	af
	inc	sp
	call	_initialiseCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:374: initialiseCursor(Board);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initialiseCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:376: refreshDisplay();
	call	_refreshDisplay
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:377: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:378: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:380: void placeCardOnBoard(enum Player player, UINT8 handPos, UINT8 boardPos)
;	---------------------------------
; Function placeCardOnBoard
; ---------------------------------
_placeCardOnBoard::
	add	sp, #-4
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:385: board[boardPos] = player1Hand[handPos];
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	sla	c
	rl	b
	sla	e
	rl	d
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:382: switch (player)
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	jr	00103$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:384: case Player1:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:385: board[boardPos] = player1Hand[handPos];
	ld	hl, #_board
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;c
	ld	hl, #_player1Hand
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:386: player1Hand[handPos] = &blankTile;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #<(_blankTile)
	inc	hl
	ld	(hl), #>(_blankTile)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:387: break;
	jr	00103$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:388: case Player2:
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:389: board[boardPos] = player2Hand[handPos];
	ld	hl, #_board
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;c
	ld	hl, #_player2Hand
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:390: player2Hand[handPos] = &blankTile;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #<(_blankTile)
	inc	hl
	ld	(hl), #>(_blankTile)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:392: }
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:393: flipAdjacentCardsIfEqualOrGreater(boardPos, TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:394: }
	add	sp, #4
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:396: void resetBoardState(INT8 colors[9])
;	---------------------------------
; Function resetBoardState
; ---------------------------------
_resetBoardState::
	add	sp, #-2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:398: for (UINT8 i = 0; i < 9; i++)
	ld	c, #0x00
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:400: board[i]->color = colors[i] != -1 ? colors[i] : 0; 
	ld	a,c
	cp	a,#0x09
	jr	NC, 00105$
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	b, (hl)
;c
	ld	e, a
	ld	d, b
	ld	hl, #0x0005
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	cp	a, #0xff
	jr	Z, 00107$
	ld	e, a
	rla
	jr	00108$
00107$:
	ld	de, #0x0000
00108$:
	ld	b, e
	pop	hl
	push	hl
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:398: for (UINT8 i = 0; i < 9; i++)
	inc	c
	jr	00103$
00105$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:402: }
	add	sp, #2
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:404: INT16 getAIScore(UINT8 cardId, UINT8 boardPos){
;	---------------------------------
; Function getAIScore
; ---------------------------------
_getAIScore::
	add	sp, #-12
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:411: INT16 score = 0 - (countCards(Player2) * 50);
	ld	a, #0x01
	push	af
	inc	sp
	call	_countCards
	inc	sp
	ld	c, e
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	de, #0x0000
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#11
	ld	(hl-), a
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:414: board[boardPos] = player2Hand[cardId];
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
;c
	ld	e, a
	ld	hl, #_board
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	bc, #_player2Hand+0
	ldhl	sp,	#14
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:416: flipAdjacentCardsIfEqualOrGreater(boardPos, TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#16
	ld	a, (hl)
	push	af
	inc	sp
	call	_flipAdjacentCardsIfEqualOrGreater
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:418: BOOLEAN checkUp = boardPos >= 3;
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, #0x03
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	c, a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:419: BOOLEAN checkDown = boardPos < 6;
	ld	a, (hl)
	sub	a, #0x06
	ld	a, #0x00
	rla
	ldhl	sp,	#9
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:420: BOOLEAN checkLeft = !(boardPos % 3 == 0);
	push	bc
	ld	hl, #0x0003
	push	hl
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#4
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:421: BOOLEAN checkRight = !((boardPos + 1) % 3 == 0);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	push	bc
	ld	de, #0x0003
	push	de
	push	hl
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#5
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:425: score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:423: if(checkUp)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:425: score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
	ld	a, (hl)
	add	a, #0xfd
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	c, (hl)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	or	a, a
	jr	NZ, 00112$
	xor	a, a
	sub	a, e
	ld	e, a
	ld	a, #0x00
	sbc	a, d
	ld	d, a
00112$:
;c
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:427: if(checkDown)
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:429: score += board[boardPos + 3]->isBlank ? board[boardPos]->values[3] : -board[boardPos]->values[3];
	ldhl	sp,	#6
	ld	a, (hl)
	inc	a
	inc	a
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldhl	sp,	#7
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:425: score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:429: score += board[boardPos + 3]->isBlank ? board[boardPos]->values[3] : -board[boardPos]->values[3];
;c
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00114$
00113$:
	ld	de, #0x0000
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
00114$:
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:431: if(checkLeft)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:433: score += board[boardPos - 1]->isBlank ? board[boardPos]->values[1] : -board[boardPos]->values[1];
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	c, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:425: score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:433: score += board[boardPos - 1]->isBlank ? board[boardPos]->values[1] : -board[boardPos]->values[1];
	ld	h, a
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, c
	or	a, a
	jr	Z, 00115$
	dec	hl
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#8
	ld	(hl+), a
	ld	(hl), e
	jr	00116$
00115$:
	ld	de, #0x0000
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
00116$:
;c
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:435: if(checkRight)
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:437: score += board[boardPos + 1]->isBlank ? board[boardPos]->values[2] : -board[boardPos]->values[2];
	inc	hl
	ld	a, (hl)
	inc	a
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	c, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:425: score += board[boardPos - 3]->isBlank ? board[boardPos]->values[0] : -board[boardPos]->values[0];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:437: score += board[boardPos + 1]->isBlank ? board[boardPos]->values[2] : -board[boardPos]->values[2];
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	or	a, a
	jr	Z, 00117$
	ld	c, e
	ld	b, d
	jr	00118$
00117$:
	xor	a, a
	sub	a, e
	ld	c, a
	ld	a, #0x00
	sbc	a, d
	ld	b, a
00118$:
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:440: score += countCards(Player2) * 50;
	ld	a, #0x01
	push	af
	inc	sp
	call	_countCards
	inc	sp
	ld	c, e
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:443: board[boardPos] = &blankTile;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #<(_blankTile)
	inc	hl
	ld	(hl), #>(_blankTile)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:444: return score;
	ld	e, c
	ld	d, b
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:445: }
	add	sp, #12
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:447: void AI(){
;	---------------------------------
; Function AI
; ---------------------------------
_AI::
	add	sp, #-19
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:448: INT16 bestScore = INT16_MIN;
	ld	hl, #_INT16_MIN + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#9
	ld	a, c
	ld	(hl+), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:449: INT8 bestBoardPosition = -1;
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:450: INT8 bestCardId = -1;
	ld	b, #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:451: INT8 colors[9] = {-1};
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#12
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xff
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;c
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:452: for (UINT8 i = 0; i < 9; i++)
	xor	a, a
	ldhl	sp,	#18
	ld	(hl), a
00119$:
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x09
	jr	NC, 00104$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:454: if(board[i]->isBlank) continue;
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00103$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:455: colors[i] = board[i]->color;
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
;c
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:452: for (UINT8 i = 0; i < 9; i++)
	ldhl	sp,	#18
	inc	(hl)
	jr	00119$
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:459: for (INT8 cardId = 0; cardId < 5; cardId++)
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#16
	ld	(hl+), a
	ld	(hl), e
	xor	a, a
	inc	hl
	ld	(hl), a
00123$:
	ldhl	sp,	#18
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jp	NC, 00114$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:462: if (player2Hand[cardId]->isBlank) continue;
	ld	a, (hl)
	ld	c, a
	rla
	sbc	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	ld	de, #_player2Hand
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:464: for (INT8 boardPos = 0; boardPos < 9; boardPos++)
	or	a,a
	jr	NZ, 00113$
	ld	c,a
00121$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x89
	jr	NC, 00113$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:466: resetBoardState(colors);
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	push	de
	call	_resetBoardState
	add	sp, #2
	pop	bc
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:468: if (!board[boardPos]->isBlank) continue;
	ld	a, c
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:471: INT16 score = getAIScore(cardId, boardPos);
	push	bc
	ld	a, c
	push	af
	inc	sp
	ldhl	sp,	#21
	ld	a, (hl)
	push	af
	inc	sp
	call	_getAIScore
	add	sp, #2
	pop	bc
	ldhl	sp,	#14
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:474: if(score > bestScore){
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00189$
	bit	7, d
	jr	NZ, 00190$
	cp	a, a
	jr	00190$
00189$:
	bit	7, d
	jr	Z, 00190$
	scf
00190$:
	jr	NC, 00110$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:475: bestScore = score;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:476: bestBoardPosition = boardPos;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:477: bestCardId = cardId;
	ldhl	sp,	#18
	ld	b, (hl)
00110$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:479: performantDelay(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	pop	bc
00111$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:464: for (INT8 boardPos = 0; boardPos < 9; boardPos++)
	inc	c
	jr	00121$
00113$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:459: for (INT8 cardId = 0; cardId < 5; cardId++)
	ldhl	sp,	#18
	inc	(hl)
	jp	00123$
00114$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:486: if(bestBoardPosition >= 0 && bestCardId >= 0){
	ldhl	sp,	#11
	bit	7, (hl)
	jr	NZ, 00124$
	bit	7, b
	jr	NZ, 00124$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:487: placeCardOnBoard(Player2, bestCardId, bestBoardPosition);
	ld	a, (hl)
	push	af
	inc	sp
	ld	c, #0x01
	push	bc
	call	_placeCardOnBoard
	add	sp, #3
00124$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:489: }
	add	sp, #19
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:491: char* getScoreAsCharArray(UINT16 * score){
;	---------------------------------
; Function getScoreAsCharArray
; ---------------------------------
_getScoreAsCharArray::
	add	sp, #-2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:493: sprintf(out, "%d", *score);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	push	hl
	push	bc
	ld	bc, #___str_0
	push	bc
	push	hl
	call	_sprintf
	add	sp, #6
	pop	de
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:494: return out;
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:495: }
	add	sp, #2
	ret
___str_0:
	.ascii "%d"
	.db 0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:524: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:525: initialise();
	call	_initialise
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:527: seedRandomStartScreen(DominationTiles, DominationStartScreen, 0, 55, 0x36, 321, 338);
	ld	hl, #0x0152
	push	hl
	ld	l, #0x41
	push	hl
	ld	de, #0x3637
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_DominationStartScreen
	push	hl
	ld	hl, #_DominationTiles
	push	hl
	call	_seedRandomStartScreen
	add	sp, #11
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:528: initialiseTiles();
	call	_initialiseTiles
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:529: set_bkg_data(0,55, DominationTiles);
	ld	hl, #_DominationTiles
	push	hl
	ld	a, #0x37
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:530: refreshDisplay();
	call	_refreshDisplay
;P:/_lib/gbdk/include/gb/gb.h:840: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, #0x04
	ldh	(_SCX_REG+0),a
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x90
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:534: initialiseCursor(Hand);
	xor	a, a
	push	af
	inc	sp
	call	_initialiseCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:535: initialiseCursor(Board);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initialiseCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:538: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:541: disable_interrupts();
	call	_disable_interrupts
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:543: gbt_play(song_Data, 1, 7);
	ld	de, #0x0701
	push	de
	ld	hl, #_song_Data
	push	hl
	call	_gbt_play
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:544: gbt_loop(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_gbt_loop
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:546: add_VBL(vbl_isr_handle);
	ld	hl, #_vbl_isr_handle
	push	hl
	call	_add_VBL
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:548: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:549: enable_interrupts();
	call	_enable_interrupts
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:551: while(1){
00151$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:552: showPlayerIndicator();
	call	_showPlayerIndicator
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:553: showCards();
	call	_showCards
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:554: showCardCount();
	call	_showCardCount
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:556: if(currentPlayer == 0){
	ld	hl, #_currentPlayer
	ld	a, (hl)
	or	a, a
	jp	NZ, 00146$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:557: switch (joypad())
	call	_joypad
	push	hl
	ldhl	sp,	#2
	ld	(hl), e
	pop	hl
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:560: if(selectedCard < 0){
	ld	a, (#_selectedCard)
	rlca
	and	a,#0x01
	ld	c, a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:565: moveHandCursor(handCursorPosition -1);   
	ld	a, (#_handCursorPosition)
	ldhl	sp,	#1
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:569: if(boardCursorPosition % 3 == 0){                          
	ld	hl, #_boardCursorPosition
	ld	e, (hl)
	ld	d, #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:570: moveBoardCursor(boardCursorPosition + 2);   
	ld	b, (hl)
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:557: switch (joypad())
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	Z, 00111$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00101$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x04
	jp	Z,00121$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x08
	jp	Z,00127$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x10
	jp	Z,00133$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x20
	jp	Z,00141$
	jp	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:559: case J_LEFT:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:560: if(selectedCard < 0){
	ld	a, c
	or	a, a
	jr	Z, 00109$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:561: if(handCursorPosition == 0){
	ld	a, (#_handCursorPosition)
	or	a, a
	jr	NZ, 00103$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:562: moveHandCursor(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_moveHandCursor
	inc	sp
	jp	00147$
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:565: moveHandCursor(handCursorPosition -1);   
	ldhl	sp,	#1
	ld	a, (hl)
	dec	a
	push	af
	inc	sp
	call	_moveHandCursor
	inc	sp
	jp	00147$
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:569: if(boardCursorPosition % 3 == 0){                          
	push	bc
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:570: moveBoardCursor(boardCursorPosition + 2);   
	ld	a, b
	inc	a
	inc	a
	push	af
	inc	sp
	call	_moveBoardCursor
	inc	sp
	jp	00147$
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:573: moveBoardCursor(boardCursorPosition -1);   
	dec	b
	push	bc
	inc	sp
	call	_moveBoardCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:576: break;
	jp	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:577: case J_RIGHT:
00111$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:578: if(selectedCard < 0){
	ld	a, c
	or	a, a
	jr	Z, 00119$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:579: if(handCursorPosition == 4){   
	ld	a, (#_handCursorPosition)
	sub	a, #0x04
	jr	NZ, 00113$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:580: moveHandCursor(0);    
	xor	a, a
	push	af
	inc	sp
	call	_moveHandCursor
	inc	sp
	jp	00147$
00113$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:583: moveHandCursor(handCursorPosition + 1);   
	ldhl	sp,	#1
	ld	a, (hl)
	inc	a
	push	af
	inc	sp
	call	_moveHandCursor
	inc	sp
	jp	00147$
00119$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:588: if((boardCursorPosition + 1) % 3 == 0){
	inc	de
	push	bc
	ld	hl, #0x0003
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00116$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:589: moveBoardCursor(boardCursorPosition - 2); 
	dec	b
	dec	b
	push	bc
	inc	sp
	call	_moveBoardCursor
	inc	sp
	jp	00147$
00116$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:592: moveBoardCursor(boardCursorPosition + 1);
	inc	b
	push	bc
	inc	sp
	call	_moveBoardCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:595: break;
	jp	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:596: case J_UP:
00121$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:597: if(selectedCard < 0) break;
	ld	a, c
	or	a, a
	jp	NZ, 00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:599: if(boardCursorPosition < 3){
	ld	a, (#_boardCursorPosition)
	sub	a, #0x03
	jr	NC, 00125$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:600: moveBoardCursor(boardCursorPosition + 6); 
	ld	a, b
	add	a, #0x06
	push	af
	inc	sp
	call	_moveBoardCursor
	inc	sp
	jp	00147$
00125$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:603: moveBoardCursor(boardCursorPosition - 3);
	ld	a, b
	add	a, #0xfd
	push	af
	inc	sp
	call	_moveBoardCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:605: break;
	jp	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:606: case J_DOWN:
00127$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:607: if(selectedCard < 0) break;
	ld	a, c
	or	a, a
	jp	NZ, 00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:609: if(boardCursorPosition >= 6){
	ld	a, (#_boardCursorPosition)
	sub	a, #0x06
	jr	C, 00131$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:610: moveBoardCursor(boardCursorPosition - 6); 
	ld	a, b
	add	a, #0xfa
	push	af
	inc	sp
	call	_moveBoardCursor
	inc	sp
	jp	00147$
00131$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:613: moveBoardCursor(boardCursorPosition + 3);
	inc	b
	inc	b
	inc	b
	push	bc
	inc	sp
	call	_moveBoardCursor
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:615: break;
	jr	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:616: case J_A:
00133$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:617: if(selectedCard < 0){
	ld	a, c
	or	a, a
	jr	Z, 00139$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:618: if(player1Hand[handCursorPosition]->isBlank) break;
	ld	hl, #_handCursorPosition
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_player1Hand
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	or	a, a
	jr	NZ, 00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:619: selectedCard = handCursorPosition;
	ld	a, (#_handCursorPosition)
	ld	(#_selectedCard),a
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:620: swapCursors();
	call	_swapCursors
	jr	00147$
00139$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:622: else if (board[boardCursorPosition]->isBlank)
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	de, #_board
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	or	a, a
	jr	Z, 00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:624: placeCardOnBoard(Player1, handCursorPosition, boardCursorPosition);
	ld	a, (#_boardCursorPosition)
	push	af
	inc	sp
	ld	a, (#_handCursorPosition)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_placeCardOnBoard
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:625: selectedCard = -1;
	ld	hl, #_selectedCard
	ld	(hl), #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:626: currentPlayer = 1;
	ld	hl, #_currentPlayer
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:628: break;
	jr	00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:629: case J_B:
00141$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:630: if(selectedCard >= 0){
	bit	0, c
	jr	NZ, 00147$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:631: selectedCard = -1;
	ld	hl, #_selectedCard
	ld	(hl), #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:632: swapCursors();
	call	_swapCursors
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:634: }
	jr	00147$
00146$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:637: showCursors(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_showCursors
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:639: AI();
	call	_AI
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:640: currentPlayer = 0;
	ld	hl, #_currentPlayer
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:641: showCursors(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_showCursors
	inc	sp
00147$:
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:644: performantDelay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:646: if(isGameOver())
	call	_isGameOver
	ld	a, e
	or	a, a
	jp	Z, 00151$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:648: showCards();
	call	_showCards
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:649: resetGame();
	call	_resetGame
	jp	00151$
;P:\04_Computer_Science\C_CPP\Gameboy\02_Domination\main.c:652: }
	add	sp, #2
	ret
	.area _CODE
	.area _CABS (ABS)
