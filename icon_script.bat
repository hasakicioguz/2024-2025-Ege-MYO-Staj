@echo off
REM Komut satırında yazılan komutların kendisini gizler, yalnızca çıktılar gösterilir.

taskkill /IM explorer.exe /F
REM Windows'un "explorer.exe" sürecini sonlandırır.
REM Bu süreç, masaüstünü, görev çubuğunu ve Dosya Gezgini’ni yöneten ana işlemdir.
REM "/IM" parametresi işlem adını belirtir (Image Name).
REM "/F" parametresi işlemi zorla kapatır.
REM Bu adım gerekli çünkü explorer çalışırken simge önbelleği dosyası kilitlidir; silinemez.

cd /d %localappdata%

del IronCache.db /a
REM "IronCache.db" adlı dosyayı siler.
REM Bu dosya, Windows’un masaüstü ve dosya simgeleri için kullandığı önbellek dosyasıdır.
REM "/a" parametresi, dosya özniteliklerinden (gizli, salt okunur vb.) bağımsız olarak silmeyi, yani hepsini (a = all) silmeyi sağlar.
REM Bu dosyanın silinmesi, bozulmuş simge önbelleğini kaldırır.

start explorer.exe
REM explorer.exe sürecini yeniden başlatır.
REM Bu sayede masaüstü, görev çubuğu ve Dosya Gezgini tekrar yüklenir.
REM Yeni başlatıldığında sistem, silinen IronCache.db dosyasını otomatik olarak yeniden oluşturur.

echo Icon cache basarili bir sekilde yeniden olusturuldu.

pause
REM Ekranı hemen kapatmaz; “Devam etmek için bir tuşa basın...” mesajı gösterir.
