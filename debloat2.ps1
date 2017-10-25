To remove almost all the modern apps in windows 10 except calculator and store
open powershell (as administrator)
Set-ExecutionPolicy Unrestricted
Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*Microsoft.WindowsStore*"} | where-object {$_.name -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxPackage
Get-AppxProvisionedPackage -online | where-object {$_.packagename -notlike "*Microsoft.WindowsStore*"} | where-object {$_.packagename -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxProvisionedPackage -online
To restore almost all the modern apps in windows 10

open powershell (as administrator)
Set-ExecutionPolicy Unrestricted
Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)AppXManifest.xml"}
