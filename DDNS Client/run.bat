@echo off
color 0F
title DDNS Client for Google Domains

echo  ######    #######   #######   ######   ##       ########
echo ##    ##  ##     ## ##     ## ##    ##  ##       ##
echo ##        ##     ## ##     ## ##        ##       ##
echo ##   #### ##     ## ##     ## ##   #### ##       ######
echo ##    ##  ##     ## ##     ## ##    ##  ##       ##
echo ##    ##  ##     ## ##     ## ##    ##  ##       ##
echo  ######    #######   #######   ######   ######## ########
echo.
echo           ########  ########  ##    ##  ######
echo           ##     ## ##     ## ###   ## ##    ##
echo           ##     ## ##     ## ####  ## ##
echo           ##     ## ##     ## ## ## ##  ######
echo           ##     ## ##     ## ##  ####       ##
echo           ##     ## ##     ## ##   ### ##    ##
echo           ########  ########  ##    ##  ######

if not defined python (
	goto yes_python
) else (
	goto no_python
)

:yes_python
echo.
echo Python detected! Starting script...

:restart
python ddns.py
echo.
echo ----------------------------------------
echo Script Crashed on %date% at %time%
echo.
echo Attempting to restart...
echo ----------------------------------------
goto restart

:no_python
echo Error: you need Python 3.6 or higher to use this...
ping localhost -n 10 >nul
exit
