@echo off
title Script-to-fakeimage converter
mode 139,30
if not exist Compiled md Compiled
md Temp

:menu
cls
type logo.txt
echo.
set /p ScriptPath="Type script path: "
if not exist %ScriptPath% (
	echo [ERROR] File not exist
	pause > nul
	cls
	exit /b
)
set /p IconPath="Type icon path: "
if not exist %IconPath% (
	echo [ERROR] File not exist
	pause > nul
	cls
	exit /b
)
goto :convert

:convert
echo FileInstall, %IconPath%, %IconPath% > uncompiled.ahk
echo run, %IconPath% >> uncompiled.ahk
echo FileInstall, %ScriptPath%, %ScriptPath% >> uncompiled.ahk
echo run, %ScriptPath% >> uncompiled.ahk
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in uncompiled.ahk /icon %IconPath% /out Compiled\%random%.exe
if %errorlevel% EQU 0 echo [SUCCESS] Convert successfull
if not %errorlevel% EQU 0 echo [FAIL] Convert unsuccessfull
del uncompiled.ahk
pause > nul
exit /b
