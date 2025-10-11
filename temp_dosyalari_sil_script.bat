@echo off
REM Komut satırında yazılan komutların kendisini gizler.
REM Ekranda sadece bilgi mesajları görünür, komutların kendisi gösterilmez.

echo Gecici dosyalar siliniyor...

del /q /s "%temp%/*.*"
REM “del” komutu dosya silmek için kullanılır.
REM /q → Sessiz mod (onay istemeden silme yapar).
REM /s → Alt klasörlerdeki dosyaları da siler.
REM kullanıcıya özel geçici dosyalar buradan (AppData\Local\Temp) silinir.
REM *.* → Tüm dosyaları temsil eder (her isim ve uzantı).

del /q /s "C:\Windows\Temp\*.*"
REM Bu satır, sistem genelindeki geçici dosyaları siler.
REM Yine /q (sessiz) ve /s (alt klasörlerle birlikte) parametreleri kullanılır.

echo Temizlilik tamamlandi.

pause
REM Komut penceresini hemen kapatmaz. Ekranda “Devam etmek için bir tuşa basın...” mesajı gösterilir.
