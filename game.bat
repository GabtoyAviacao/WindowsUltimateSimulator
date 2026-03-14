ECHO OFF
setlocal ENABLEDELAYEDEXPANSION
CLS
title PhoneSimulator
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo 1 = ON/OFF
echo 2 = volume up(useless)
echo 3 = volume down(useless)
echo 4 = Informations
set /p Option1=
if "%Option1%"=="1" (
set "ErrorCode=0x00000001"
set "ErrorText=ATTEMPTED_CALL_UNKNOWN_FUNCTION"
goto crash
)
ECHO %date%Gabtoy12%computername%
if /i "%Option1%"=="A" (
echo hey! how you got here???
echo ...
echo whatever, now u can execute any command u want, while u in here.
echo type exit  to return to the script. however it is not guaranteed that it won't break.
cmd
pause
set "ErrorCode=0x00000002"
set /a "RANDOM1=%random% %% 2 + 1"
if "!RANDOM1!"=="1" (
set "ErrorText=ATTEMPTED_RETURN_IN_NON_RETURNABLE_AREA"
goto crash
)
if "!RANDOM1!"=="2" (
set "ErrorText=HIGH_PERMISSION_LEVEL_IN_LOW_PERMISSION_LEVEL_AREA"
goto crash
)
)
echo "ERROR! code got skipped."
pause
set /a "RANDOM1=%random% %% 2 + 1"
set "ErrorCode=0x00000003"
if "!RANDOM1!"=="1" (
set "ErrorText=SKIP_CODE"
goto crash
)
if "!RANDOM1!"=="2" (
set "ErrorText=EMPTY_ESSENCIALS"
goto crash
)


:crash
color 1f
cls
echo An error has occurred and %0 stopped all of its operations to debug it
echo error: %errorCode%
echo we're creating a error log in your desktop with error information, do not close the app.
cd %userprofile%\Desktop
if exist Logs.txt del Logs.txt
for /f "tokens=1" %%i in ('tasklist.exe') do (
if /i "%%i"=="notepad.exe" (
echo "can not create log file because NOTEPAD.EXE is currently open, close all instances and try again."
echo "it is recommended to close it to prevent corruption  like missing information, etc."
pause
)
)
echo "ERROR INFORMATION FROM: %date%, %time%" > Logs.txt
echo "Hexadecimal Error Code: !ErrorCode!" >> Logs.txt
echo "Text Error Code: "!ErrorText!"" >> Logs.txt
if /i "!ErrorCode!"=="0x00000001" (
echo "error: this error can occur in all of the following reasons:" >> Logs.txt
echo "1. The script attempted to call a function that doesn't exist." >> Logs.txt
echo "2. There is no secondary reason, this is the only reason lol" >> Logs.txt
)

if /i "!ErrorCode!"=="0x00000002" (
echo "Explaining error: This error can occur in all of the following reasons:" >> Logs.txt
echo "1. The script attempted to return to an area with a higher permission level." >> Logs.txt
echo "2. The script attempted to return to an area that doesn't exist." >> Logs.txt
echo "3. The script attempted to return to an area that is corrupted." >> Logs.txt
echo "4. The script attempted to modify an area while returning." >> Logs.txt
echo "5. Client attempted to modify script(SUSPICIOUS CLIENT BEHAVIOR)" >> Logs.txt
)

if /i "!ErrorCode!"=="0x00000003" (
Echo "Explaining error: this error can occur in all of the following reasons:" >> Logs.txt
echo "1. Code was skipped." >> Logs.txt
echo "2. Client Script Modifier failure(you aren't modifying the script, are you...?)" >> Logs.txt
)


echo Those errors will probably appear with less frequency in future versions, cuz they'll be fixed.
echo saved sucessfully.  the app will close as soon as you click any key
pause>nul
exit