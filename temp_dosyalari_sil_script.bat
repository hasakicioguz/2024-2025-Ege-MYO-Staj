@echo off
echo Gecici dosyalar siliniyor...
del /q /s "%temp%/*.*"
del /q /s "C:\Windows\Temp\*.*"
echo Temizlilik tamamlandi.
pause