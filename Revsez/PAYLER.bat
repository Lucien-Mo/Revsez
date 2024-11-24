@echo off
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
    set IPAddress=%%A
    set IPAddress=!IPAddress: =!
)

setlocal enabledelayedexpansion
>nul 2>&1 (
    for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
        set IPAddress=%%A
        set IPAddress=!IPAddress: =!
    )
)
:menu
cls
color 4
echo ::::::::::. :::.  .-:.     ::-.:::    .,:::::: :::::::..   
echo  `;;;```.;;;;;`;;  ';;.   ;;;;';;;    ;;;;'''' ;;;;``;;;;  
echo   `]]nnn]]',[[ '[[,  '[[,[[['  [[[     [[cccc   [[[,/[[['  
echo    $$$""  c$$$cc$$$c   c$$"    $$'     $$""""   $$$$$$c    
echo    888o    888   888,,8P"`    o88oo,.__888oo,__ 888b "88bo,
echo    YMMMb   YMM   ""`mM"       """"YUMMM""""YUMMMMMMM   "W"
echo =============================================================
  setlocal enabledelayedexpansion

echo Enter the path of your txt file (ex: C:\path\to\files.txt):
set /p file=

if not exist "%file%" (
    echo The files doesn't exist.
    exit /b
)


(for /f "delims=" %%a in ('type "%file%"') do (
    set "ligne=%%a"

    call set "ligne=%%ligne: IPAddress = %IPAddress% %%"
    echo !ligne!
)) > "%file%.modifie"

move /y "%file%.modifie" "%file%"

echo IPAddress has been successfuly replaced by your ip.
timeout /t 2 >nul
cls
echo What port want you to host ?
set /p port="> "
(for /f "delims=" %%a in ('type "%file%"') do (
    set "ligne=%%a"

    call set "ligne=%%ligne: 86 = %port% %%"
    echo !ligne!
)) > "%file%.modifie"

move /y "%port%.modifie" "%port%"

echo 82 has been successfuly replaced by your port.
pause