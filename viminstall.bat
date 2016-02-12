@echo off
SET homedir=%HOMEDRIVE%%HOMEPATH%
echo %homedir%
xcopy win\vimfiles\* %homedir%\vimfiles\* /S /I
xcopy .vimrc %homedir%\_vimrc /I
