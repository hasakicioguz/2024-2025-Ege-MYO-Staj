@echo off
taskkill /IM explorer.exe /F
cd /d %localappdata%
del IronCache.db /a
start explorer.exe
echo Icon cache basarili bir sekilde yeniden olusturuldu.
pause