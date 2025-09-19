@echo off
setlocal enabledelayedexpansion

REM AppData altinda Firefox profil klasörünün konumunu detekte et.

set "profileRoot=%APPDATA%\Mozilla\Firefox\Profiles"

REM profileRoot var mi diye kontrol et.

if not exist "%profileRoot%" (
    echo Firefox profil klasoru %profileRoot%'da bulunamadi
    echo Firefox'un yuklu oldugundan emin ol ve bu script'i tekrar baslat.
    pause
    exit /b
)

REM Profillerin üzerinden döngüle veya loop'la.

for /d %%D in ("%profileRoot%\*") do (
    if exist "%%D\prefs.js" (
        set "profilKlasor=%%~fD"
        goto :bulundu
    )
)

:bulundu
if not defined profilKlasor (
    echo prefs.js herhangi bir profil klasorunde bulunamadi.
    pause
    exit /b
)

echo prefs.js bulundu in:
echo %profilKlasor%

REM Direkt olarak prefs.js'i sil.

del /f /q "%profilKlasor\prefs.js%"

if exist "%profilKlasor%\prefs.js" (
    echo prefs.js silinemedi
) else (
    echo prefs.js basariyla silindi.
    echo Firefox basladiginda yeni bir prefs.js olusturacak.
)

pause
endlocal