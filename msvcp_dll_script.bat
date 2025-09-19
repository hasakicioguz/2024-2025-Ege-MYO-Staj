net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
regsvr32 /u msvcp140.dll
regsvr32 msvcp140.dll
net start wuauserv