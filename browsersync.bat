@echo off 
setlocal enabledelayedexpansion

ECHO ----------------------
ECHO Killing Edge Process
ECHO ----------------------


TaskKill /im msedge.exe /f


SET APPLOCALDIR=C:%HOMEPATH%\AppData\Local

SET BRAVEUSERDIR=%APPLOCALDIR%\BraveSoftware\Brave-Browser\User Data\Default\

SET EDGEUSERDIR=%APPLOCALDIR%\Microsoft\Edge\User Data\Default\

SET CHROMEFILES[0]=Bookmarks
SET CHROMEFILES[1]=Bookmarks.bak
SET CHROMEFILES[2]=Favicons
SET CHROMEFILES[3]=Favicons-journal
SET CHROMEFILES[4]=History
SET CHROMEFILES[5]=History-journal
SET CHROMEFILES[6]=Login Data
SET CHROMEFILES[7]=Login Data-journal

ECHO ----------------------
ECHO ----------------------
ECHO ----------------------
ECHO Copying from Brave to Edge
ECHO ----------------------



SET FROMBROWSER=%BRAVEUSERDIR%
SET TOBROWSER=%EDGEUSERDIR%

for /l %%n in (0,1,7) do ( 
   SET CURRENTFILE=!CHROMEFILES[%%n]!
   del "%TOBROWSER%!CURRENTFILE!.backup"
   rename "%TOBROWSER%!CURRENTFILE!" "!CURRENTFILE!.backup"
   copy "%FROMBROWSER%!CURRENTFILE!" "%TOBROWSER%"
)



ECHO ----------------------
ECHO ----------------------
ECHO Restarting Edge
ECHO ----------------------

start msedge --restore-last-session


