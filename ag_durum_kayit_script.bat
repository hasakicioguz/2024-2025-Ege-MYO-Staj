@echo off
REM Bu komut, komut penceresinde (CMD ekranında) komutların kendisinin görüntülenmesini engeller. Yani ekranda sadece çıktılar görünecek, yazılan komutların kendisi gösterilmeyecek.

set dosya=D:\ag_durum_kayit_script_klasor\ag_durum_kayit_dokum.txt
REM 1) "dosya" adlı bir değişken tanımlanıyor.
REM 2) Bu değişkene, ağ bilgilerini kaydedeceğimiz metin belgesinin tam lokasyonu atanıyor. Yani raporun bu metin belgesine yazılacağı belirtiliyor.


echo Ag bilgileri raporu > %dosya%
REM "echo" komutu, belirtilen metni ekrana veya bir dosyaya yazar.
REM Burada "Ag bilgileri raporu" ifadesi, belirtilen "dossya" metin belgesine yazılıyor.
REM ">" işareti, eğer dosya zaten varsa içeriğini siler ve yeni içerik olarak bu satırı yazar.
REM Eğer dosya yoksa, bu satır o dosyayı oluşturur.

ipconfig /all >> %dosya%
REM "ipconfig /all" komutu, bilgisayarın tüm ağ yapılandırma bilgilerini (IP adresi, DNS vs.) detaylı olarak listeler.
REM ">>" işareti, çıktıyı dosyaya ekler yani mevcut içeriği silmeden sonuna ekleme yapar.
REM Böylece ağ yapılandırma bilgileri, rapor metin belgesine kaydedilmiş olur.

echo --- Ping testi --- >> %dosya%
REM Rapor dosyasına, bir bölüm başlığı gibi görünsün diye "Ping testi" satırı ekleniyor.
REM Bu, ağ bağlantı testi sonuçlarının hemen üstünde görünecektir.

ping 8.8.8.8 -n 4 >> %dosya%
REM "ping" komutu, belirtilen IP adresine (burada 8.8.8.8 ama başka biri de olabilirdi) veri paketi gönderir.
REM "-n 4" parametresi, 4 kez ping atılacağını belirtir.
REM Bu işlem, internet bağlantısının aktif olup olmadığını test eder.

echo Rapor olusturuldu: %dosya%
REM "%dosya%" değişkeni burada raporun tam konumunu gösterecektir.

pause
REM "pause" komutu, komut penceresini hemen kapatmaz ve ekranda "Devam etmek için bir tuşa basın..." mesajı çıkar.
