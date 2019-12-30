@echo off
:: wmic process where name="LeapSvc64.exe" CALL setpriority "realtime"

:: tasklist /FI "IMAGENAME eq LeapSvc64.exe" 2>NUL | find /I /N "LeapSvc64.exe">NUL / if "%ERRORLEVEL%"=="0" echo Programm is running

:: tasklist /FI "IMAGENAME eq LeapSvc64.exe" /NH | find /I /N "LeapSvc64.exe" >NUL
:: if "%ERRORLEVEL%"=="0" echo Programm is running
echo You should run this script as Administrator for achive the correct purpouse
PAUSE

set EXE1=LeapSvc64.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE1%"') DO IF %%x == %EXE1% goto FOUND
echo Leap Motion Service is not running, you should run it first (C:\Program Files (x86)\Leap Motion\Core Services\LeapSvc64.exe).
goto FIN
:FOUND
wmic process where name="LeapSvc64.exe" CALL setpriority "realtime"
echo Leap Motion Service is running and it had its priority changed to realtime.
:FIN
::PAUSE

set EXE2=nw.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE2%"') DO IF %%x == %EXE2% goto FOUND
echo Leap Tremor is not running, you should run it first.
goto FIN
:FOUND
wmic process where name="nw.exe" CALL setpriority "realtime"
echo Leap tremor is running and it had its priority changed to realtime.
:FIN
PAUSE