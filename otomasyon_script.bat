@echo off
REM Komut satırında yazılan komutların görüntülenmesini kapatır.
REM Böylece yalnızca çıktılar gösterilir, komut satırları görünmez.

taskkill /F /IM Bluestacks.exe
REM "Bluestacks.exe" işlemini (yani BlueStacks emülatörünü) kapatır.
REM "/IM" → Kapatılacak işlemin adını belirtir.
REM "/F" → İşlemi zorla kapatır (force).
REM Bu adım gereklidir, çünkü yapılandırma dosyasına erişim için BlueStacks’in tamamen kapalı olması gerekir.

cd "C:\ProgramData\blueStacks_nxt"

if exist bluestacks.conf ren bluestacks.conf bluestacks.conf.yedek
REM Eğer “bluestacks.conf” adlı bir dosya mevcutsa, onu yeniden adlandırır.
REM “ren” komutu = rename (yeniden adlandırma).
REM Dosya “bluestacks.conf.yedek” ismine çevrilir.
REM Böylece orijinal dosya yedeklenmiş olur.

echo [General]>bluestacks.conf
REM Yeni bir “bluestacks.conf” dosyası oluşturur.
REM “>” operatörü, dosya yoksa oluşturur; varsa içeriğini tamamen sıfırlar.
REM “[General]” satırı, konfigürasyon dosyasının bölüm başlığıdır.

echo Engine=Pie64>>bluestacks.conf
REM Yeni yapılandırma dosyasına “Engine=Pie64” satırını ekler.
REM “>>” operatörü, dosyanın sonuna ekleme yapar (üzerine yazmaz).
REM Bu satır BlueStacks motorunun hangi sürümde çalışacağını belirtir.
REM “Pie64” = Android Pie 64 bit motorunu temsil eder.

echo DisplayWidth=1280>>bluestacks.conf
REM Ekran genişliğini 1280 piksel olarak ayarlar.

echo DisplayHeight=720>>bluestacks.conf
REM Ekran yüksekliğini 720 piksel olarak ayarlar.
REM Yani 1280x720 çözünürlüklü bir ekran (HD) oluşturur.

echo BlueStacks'i yeniden baslat!

pause
REM Komut penceresini açık tutar ve “Devam etmek için bir tuşa basın...” mesajı gösterir.
