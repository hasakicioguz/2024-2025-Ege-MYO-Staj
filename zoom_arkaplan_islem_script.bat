@echo off
REM Komut satırında yazılan komutların görünmesini engeller.

echo Devam eden arkaplan islemleri durduruluyor...

taskkill /F /IM Zoom.exe
REM "taskkill" komutu belirtilen program veya işlemi kapatır.
REM /IM → Kapatılacak işlemin (Image Name) adını belirtir.
REM /F → İşlemi zorla kapatır (Force).

taskkill /F /IM ZoomLauncher.exe
REM “ZoomLauncher.exe” de aynı şekilde kapatılır.
REM Bu, bazen Zoom arayüzü kapansa bile arka planda çalışan bir işlemdir.
REM Böylece Zoom tamamen kapatılmış olur.

echo Islemlerin durdurulmasi icin bekleniyor...

timeout /t 5
REM 5 saniye bekler.
REM /t 5 → 5 saniyelik zaman aşımı süresi.
REM Bu bekleme, sistemin işlem kapatma sürecini tamamlaması içindir.

echo Zoom yeniden baslatiliyor...

start "" "C:\Users\ibrah\AppData\Roaming\Zoom\bin\Zoom.exe"
REM "start" komutu yeni bir süreç başlatır.
REM İlk tırnak (“”) penceresiz başlatma için gereklidir.
REM Ardından Zoom.exe’nin tam dosya yolu verilmiştir.
REM Bu satır, Zoom uygulamasını yeniden başlatır.

echo Zoom basarili bir sekilde yeniden baslatildi.

pause
REM Komut penceresini hemen kapatmaz.
REM “Devam etmek için bir tuşa basın...” mesajı çıkar.
REM Böylece kullanıcı sonucu okuyabilir.
