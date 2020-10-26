@echo off

:choice
echo Warning: Please do not delete or move this batch file.
echo Tis batch file must be placed in the same folder as TinyNvidiaUpdateChecker.exe
echo Make sure this batch file is in the directory you would like to keep it in.
echo.
set /P c=Would you like to check for updates once a week? [Y/N] 
if /I "%c%" EQU "y" goto :schedule
if /I "%c%" EQU "n" goto :no_schedule
goto :choice


:schedule
SCHTASKS /CREATE /SC WEEKLY /TN "TinyNvidiaUpdateChecker" /TR "%~f0 --quiet" /ST 11:00
echo.
pause
exit

:no_schedule
echo Warning: Please do not delete or move this batch file.