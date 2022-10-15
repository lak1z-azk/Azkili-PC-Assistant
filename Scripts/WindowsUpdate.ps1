
#################TRANSCRIPT ENABLE
Start-Transcript -Path C:\WindowsUpdateLog.txt
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Logs will be saved in C:\WindowsUpdateLog.txt" 
Write-Host "-------------------------------------------------------------------"
sleep 2


#################WINDOWS UPDATES
Write-Host "`n-------------------------------------------------------------------"
Write-Host "Checking for Windows updates"
Write-Host "-------------------------------------------------------------------"

sleep 1
Install-Module -Name PSWindowsUpdate -Force;
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned;
    Import-Module PSWindowsUpdate;
    Get-Command -Module PSWindowsUpdate;
    Get-WindowsUpdate -Install -AcceptAll
    

 sleep 1
  Get-WindowsUpdate -Install -AcceptAll
  sleep 2

  Write-Host -ForegroundColor Yellow "Installation has finished... Closing script"

Stop-Transcript

sleep 5


