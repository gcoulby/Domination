cls
set mypath=%cd%
if not exist %mypath%\build\ mkdir %mypath%\build


P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo1 -DUSE_SFR_FOR_REG -c -o %mypath%\build\IonicLimb.o %mypath%\ionic_limb_lib\IonicLimb.c
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\main.o %mypath%\main.c
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o %mypath%\build\output.o %mypath%\output.c
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo2 -DUSE_SFR_FOR_REG -c -o %mypath%\build\gbt_player.o %mypath%\gbt_player.s
P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo2 -DUSE_SFR_FOR_REG -c -o %mypath%\build\gbt_player_bank1.o %mypath%\gbt_player_bank1.s

P:\_lib\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -Wl-yt1 -Wl-yo4 -Wl-ya0 -o %mypath%\build\main.gb %mypath%\build\IonicLimb.o %mypath%\build\output.o %mypath%\build\main.o %mypath%\build\gbt_player.o %mypath%\build\gbt_player_bank1.o 

@REM del \build\*.o \build\*.lst

if exist %mypath%\build\main.gb P:\_lib\bgbw64\bgb64.exe %mypath%\build\main.gb