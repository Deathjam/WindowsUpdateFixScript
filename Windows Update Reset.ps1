net stop bits
net stop cryptsvc
net stop wuauserv
#Stop Windows update services, so we can remove the files
Remove-Item -Recurse C:\windows\SoftwareDistribution\*
#remove everything under the software distribution folder
net start bits
net start cryptsvc
net start wuauserv
#start the services, so we'll be able to check for updates after we are done
Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
#re-register windows stuff. Works miracles
Read-Host
#hit enter when you are done