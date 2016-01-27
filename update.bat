@echo off

echo info: Start updater

set CD=%~dp0
set Zip=%CD%\data\tools\bin
set Dupd=%CD%\data\update\upd\Downloads
set Bupd=%CD%\data\update\upd
set Uupd=%CD%\data\update\upd\Unpack

mkdir %Dupd%

echo info: Download main jBart update...
powershell -executionpolicy bypass -file %Bupd%\Burgerz_jBART.ps1

echo info: Download SET for jBart...
powershell -executionpolicy bypass -file %Bupd%\I1PABIJJA_jBART_evo_tech_4.ps1

echo info: Downloading is done.

echo info: Start unpack updates.

echo info: Unpack main jBart.
%Zip%\7z.exe x -y -r %Dupd%\Burgerz_jBART_upd.zip -o%Uupd%
xcopy /Y /R /E /Q %Uupd%\jBART-master %CD%

echo info: Unpack SET for jBart.
%Zip%\7z.exe x -y -r %Dupd%\I1_jBART_SET_evo_tech_4_upd.zip -o%Uupd%
xcopy /Y /R /E /Q %Uupd%\I1_jBart_evo_tech_4_set-master %CD%

rmdir /S /Q %Uupd%
rmdir /S /Q %Dupd%

echo info: UPDATE DONE!