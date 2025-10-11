@echo off
REM Komut satırında yazılan komutların görüntülenmesini kapatır.
REM Ekranda yalnızca bilgi mesajları görünür, komutların kendisi gösterilmez.

setlocal enabledelayedexpansion
REM "setlocal" değişken kapsamını sınırlar
REM "enabledelayedexpansion" komutu, döngüler (for) içindeki değişkenlerin dinamik olarak güncellenmesine izin verir.
REM Bu, özellikle for döngülerinde gerekli bir özelliktir.

REM ----------------------------------------------------------------------
REM AppData altında Firefox profil klasörünün konumunu tespit et.
REM ----------------------------------------------------------------------

set "degisken1=%APPDATA%\Mozilla\Firefox\Profiles"
REM Firefox’un kullanıcı profilleri burada “Profiles” klasöründe bulunur.
REM Bu satırla o klasörün yolu degisken1 değişkenine atanır.

REM ----------------------------------------------------------------------
REM degisken1 klasörü var mı diye kontrol et.
REM ----------------------------------------------------------------------

if not exist "%degisken1%" (
    echo ❌ Firefox profil klasoru %degisken1%'da bulunamadi.
    echo Firefox'un yuklu oldugundan emin ol ve bu script'i tekrar baslat.
    pause
    exit /b
)
REM Eğer “Profiles” klasörü mevcut değilse, kullanıcıya uyarı verilir ve script sonlandırılır.
REM exit /b → script’i kapatır ama komut penceresini değil.

REM ----------------------------------------------------------------------
REM Profillerin üzerinden döngü kur.
REM ----------------------------------------------------------------------

for /d %%D in ("%degisken1%\*") do (
    if exist "%%D\prefs.js" (
        set "profilKlasor=%%~fD"
        goto :bulundu
    )
)
REM “for /d” → yalnızca klasörler üzerinde döner.
REM %%D → her bir alt klasörü temsil eder.
REM Eğer o klasörün içinde “prefs.js” dosyası varsa:
REM     → profilKlasor değişkenine o klasörün tam yolu atanır.
REM     → “goto :bulundu” komutu ile döngüden çıkılır (ilk bulduğu profili alır).

:bulundu
REM Bu etiket (label), script’in yukarıdaki döngüden sonra atlayacağı noktadır.

if not defined profilKlasor (
    echo ⚠️ prefs.js herhangi bir profil klasorunde bulunamadi.
    pause
    exit /b
)
REM Eğer profilKlasor değişkeni hâlâ tanımlanmadıysa, prefs.js hiç bulunamamış demektir.
REM Kullanıcı bilgilendirilir ve işlem sonlandırılır.

echo ✅ prefs.js bulundu:
echo %profilKlasor%
REM prefs.js dosyasının bulunduğu dizin kullanıcıya gösterilir.

REM ----------------------------------------------------------------------
REM prefs.js dosyasını silme işlemi
REM ----------------------------------------------------------------------

del /f /q "%profilKlasor\prefs.js%"
REM “del” komutu dosyayı siler.
REM /f → Dosyaları zorla(force) siler.
REM /q → Sessiz mod, onay istemez.
REM Burada prefs.js dosyası doğrudan silinir.

REM ----------------------------------------------------------------------
REM Dosyanın gerçekten silinip silinmediğini kontrol et
REM ----------------------------------------------------------------------

if exist "%profilKlasor%\prefs.js" (
    echo ❌ prefs.js silinemedi.
) else (
    echo ✅ prefs.js basariyla silindi.
    echo Firefox yeniden baslatildiginda otomatik olarak yeni bir prefs.js dosyasi olusturacak.
)
REM Eğer dosya hâlâ mevcutsa, silme başarısız olmuştur.
REM Eğer mevcut değilse, silme işlemi başarılıdır ve Firefox açıldığında varsayılan ayarlarla yeni bir “prefs.js” oluşturacaktır.

pause
REM Komut penceresini açık tutar, kullanıcı mesajı görebilir.

endlocal
REM “setlocal” ile başlatılan değişken kapsamını sonlandırır.
REM Yani script bitince oluşturulan tüm değişkenler silinir.
