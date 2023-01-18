@echo off
title Numpad always on by Werreo
:::Octroiement des permissions administrateur
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system".
if '%errorlevel%' NEQ '0' (
    echo Demandes des privileges administrateur..
    timeout /t 2 /nobreak 
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:::Modifications du pavé numérique dans l'edit du registre
color 02
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /f
reg add "HKEY_USERS\S-1-5-18\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /f
reg add "HKEY_USERS\S-1-5-19\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /f
reg add "HKEY_USERS\S-1-5-20\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /f
pause
