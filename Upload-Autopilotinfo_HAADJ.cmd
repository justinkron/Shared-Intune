rem version 1.8 - add IE first run bypass.
rem version 1.9 - add new community diag script
@echo on
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}" -ExecutionPolicy Bypass
powershell -Command "& {Install-PackageProvider NuGet -MinimumVersion 2.8.5.201 -Force}" -ExecutionPolicy Bypass
powershell -Command "& {Install-Script -name Get-WindowsAutopilotInfo -Force}"  -ExecutionPolicy Bypass
powershell -Command "& {Install-Script -name Get-AutopilotDiagnostics -Force}"  -ExecutionPolicy Bypass
powershell -Command "& {Install-Script -Name Get-AutopilotDiagnosticsCommunity}" -ExecutionPolicy Bypass
powershell -Command "& {Install-Script -name Autopilottestattestation -Force}"  -ExecutionPolicy Bypass
powershell -Command "& {reg add 'HKLM\SOFTWARE\Microsoft\Internet Explorer\Main' /v 'DisableFirstRunCustomize' /t REG_DWORD /d 1 /f}" -ExecutionPolicy Bypass
powershell -Command "& {set-executionpolicy RemoteSigned}"

powershell.exe -file "C:\Program Files\WindowsPowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1" -Online -Assign -reboot
