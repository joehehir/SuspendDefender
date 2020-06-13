@ECHO OFF
MODE 80, 8
CHOICE /M "Enable SuspendDefender"
IF %ERRORLEVEL% EQU 1 GOTO SD_RUN
IF %ERRORLEVEL% EQU 2 GOTO SD_EXIT

:SD_RUN
SET ScriptDirectory=%~dp0
SET ScriptPath=%ScriptDirectory%SuspendDefender.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command^
    "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%ScriptPath%""' -Verb RunAs}"

:SD_EXIT
EXIT
