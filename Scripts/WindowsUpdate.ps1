#################TRANSCRIPT ENABLE
Start-Transcript -Path C:\WindowsUpdateLog.txt
Write-Host -ForegroundColor Yellow "Logs will be saved in C:\WindowsUpdateLog.txt" 

#################WINDOWS UPDATES
Write-Host "Checking for Windows updates"
# Try to install and apply Windows updates
try {
  # Install the PSWindowsUpdate module and set the execution policy
  Install-Module -Name PSWindowsUpdate -Force
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

  # Import the module and list all available commands
  Import-Module PSWindowsUpdate
  Get-Command -Module PSWindowsUpdate

  # Install all available updates
  Get-WindowsUpdate -Install -AcceptAll

  # Install any remaining updates
  Get-WindowsUpdate -Install -AcceptAll
}
# Catch any errors that occur during the installation
catch {
  # Write an error message to the transcript
  Write-Error "An error occurred while installing updates: $($_.Exception.Message)"
}

Write-Host -ForegroundColor Yellow "Installation has finished... Closing script"

Stop-Transcript

sleep 5
