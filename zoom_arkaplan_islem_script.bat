@echo off
echo Devam eden arkaplan islemleri durduruluyor...
taskkill /F /IM Zoom.exe >nul 2>&1
taskkill /F /IM ZoomLauncher.exe >nul 2>&1

echo Islemlerin durdurulmasi icin bekleniyor...
timeout /t 3 >nul

echo Zoom yeniden baslatiliyor...
start "" "C:\Users\ibrah\AppData\Roaming\Zoom\bin\Zoom.exe"

echo Zoom basarili bir sekilde yeniden baslatildi.
pause