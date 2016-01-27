@echo off
chcp 1251 >nul

set CD=%~dp0
pushd "%~dp0"
for /d %%I in ("*.zip.bzprj") do (
    set Mi="%%~I"
)
popd
set Miui=%CD%\%Mi%\baseROM
set Tools=%CD%\data\tools
set Repo=%CD%\repositories\patches\main\boot

ren %Miui%\boot.img boot_MIUI.img

move /Y %Miui%\boot_MIUI.img %Tools%\boot_MIUI.img

call %Tools%\MTK_unpack.bat boot_MIUI.img 

copy /Y %Repo%\kernel* %Tools%\boot_MIUI\
copy /Y %Repo%\init.ssd.rc %Tools%\boot_MIUI\rmdisk\

call %Tools%\MTK_pack.bat boot_MIUI

move /Y %Tools%\new_image.img %Miui%\boot.img

del %Tools%\*.img
rmdir /S /Q %Tools%\boot_MIUI

echo Repacking Boot.img finished...