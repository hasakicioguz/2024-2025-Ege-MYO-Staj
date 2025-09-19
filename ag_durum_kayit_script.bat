@echo off
set dosya=D:\ag_durum_kayit_script_klasor\ag_durum_kayit_dokum.txt
echo Ag bilgileri raporu > %dosya%
ipconfig /all >> %dosya%
echo --- Ping testi --- >> %dosya%
ping 8.8.8.8 -n 4 >> %dosya%
echo Rapor olusturuldu: %dosya%
pause