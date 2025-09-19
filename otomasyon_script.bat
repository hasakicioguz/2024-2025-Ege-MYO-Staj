@echo off
taskkill /F /IM Bluestacks.exe
cd "C:\ProgramData\blueStacks_nxt"
if exist bluestacks.conf {ren bluestacks.conf bluestacks.conf.yedek}
echo [General]>bluestacks.conf
echo Engine=Pie64>>bluestacks.conf
echo DisplayWidth=1280>>bluestacks.conf
echo DisplayHeight=720>>bluestacks.conf
echo BlueStacks'i yeniden baslat!
pause