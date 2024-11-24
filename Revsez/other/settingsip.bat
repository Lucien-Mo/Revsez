@echo off
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
    set IPAddress=%%A
    set IPAddress=!IPAddress: =!
)

:: Désactiver toute sortie à l'écran
setlocal enabledelayedexpansion
>nul 2>&1 (
    for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /i "IPv4"') do (
        set IPAddress=%%A
        set IPAddress=!IPAddress: =!
    )
)
echo %IPAddress%
pause