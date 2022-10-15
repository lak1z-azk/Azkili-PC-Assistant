Start-Transcript -Path C:\WindowsFeaturesLogs.txt
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Logs will be saved in C:\WindowsFeaturesLogs.txt" 
Write-Host "-------------------------------------------------------------------"
sleep 2

#################WINDOWS FEATURES ENABLE
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Enabling Windows Features"
Write-Host "-------------------------------------------------------------------"

sleep 1 

Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All
Enable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -All
sleep 2


Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Installing Windows Extensions... "
Write-Host "-------------------------------------------------------------------"
Start-Sleep -Seconds 3
choco install vcredist-all chocolatey-windowsupdate.extension dotnet -y
Start-Sleep -Seconds 3
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Installation finished.. "
Write-Host "-------------------------------------------------------------------"
Start-Sleep -Seconds 3


Write-Host -ForegroundColor Yellow "Installation has finished... Closing script"

Stop-Transcript

sleep 5


