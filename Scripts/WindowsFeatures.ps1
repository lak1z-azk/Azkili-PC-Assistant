# Start a transcript of the session and save it to a file
Start-Transcript -Path C:\WindowsFeaturesLogs.txt
Write-Host -ForegroundColor Yellow "Logs will be saved in C:\WindowsFeaturesLogs.txt" 

# Enable Windows features
Write-Host -ForegroundColor Yellow "Enabling Windows Features"
try {
  # Enable the NetFx3 and SMB1Protocol features
  Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All
  Enable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -All
}
# Catch any errors that occur while enabling the features
catch {
  # Write an error message to the transcript
  Write-Error "An error occurred while enabling features: $($_.Exception.Message)"
}

# Install Windows extensions
Write-Host -ForegroundColor Yellow "Installing Windows Extensions... "
try {
  # Install the vcredist-all, chocolatey-windowsupdate.extension, and dotnet packages
  choco install vcredist-all chocolatey-windowsupdate.extension dotnet -y

  Write-Host -ForegroundColor Yellow "Installation finished.. "
}
# Catch any errors that occur while installing the packages
catch {
  # Write an error message to the transcript
  Write-Error "An error occurred while installing extensions: $($_.Exception.Message)"
}

# Display a message indicating that the installation has finished
Write-Host -ForegroundColor Yellow "Installation has finished... Closing script"

# Stop the transcript
Stop-Transcript

# Wait for 5 seconds before closing the script
sleep 5
