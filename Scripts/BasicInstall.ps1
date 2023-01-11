# Set the PCName variable to the computer's name
$PCName = $env:COMPUTERNAME

# Start a transcript of the session and save it to a file
Start-Transcript -Path C:\BasicInstall.txt
Write-Host "Logs will be saved in C:\BasicInstall.txt" 

# Wait for 2 seconds
sleep 2 

# Display a message indicating that the PC's status is being checked
Write-Host -ForegroundColor Yellow "Checking PC Status..."

sleep 2

# Check the internet connection
$internetConnection = Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet
if ($internetConnection) {
  Write-Host "Internet connection: OK"
} else {
  Write-Host "Internet connection: NOT OK"
}

sleep 3

# Check the CPU status
$cpu = Get-WmiObject -Class Win32_Processor | Select-Object -Property LoadPercentage, Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed
$cpu

sleep 3

# Check the RAM status
$ram = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property FreePhysicalMemory, TotalVisibleMemorySize
$ramFree = [int]($ram.FreePhysicalMemory / 1024)
$ramTotal = [int]($ram.TotalVisibleMemorySize / 1024)
$ramUsage = [math]::Round((($ramTotal - $ramFree) / $ramTotal) * 100, 2)
Write-Host "RAM usage: $ramUsage%"

sleep 3 

#Check the Disk usage
$disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3"
$disks | ft DeviceID, @{label="Size(GB)";expression={$_.Size/1GB -as [int]}}, @{label="FreeSpace(GB)";expression={$_.FreeSpace/1GB -as [int]}}, @{label="FreeSpace(%)";expression={"{0:N2}" -f ($_.FreeSpace/$_.Size*100)}}
sleep 3

# Check the PC health
$pcHealth = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property Status
Write-Host "PC health: $($pcHealth.Status)"

sleep 3
# Wait for 3 seconds
sleep 3

#################CHOCOLATEY
# Check if Chocolatey is installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  # Chocolatey is not installed, so install it
  Write-Host "Chocolatey is not installed... Installing"

  # Set the execution policy to allow the Chocolatey installation script to be run
  Set-ExecutionPolicy Bypass -Scope Process -Force
  # Set the security protocol to allow the Chocolatey installation script to be downloaded
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
  # Download and run the Chocolatey installation script
  iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

  # Display a message indicating that Chocolatey has been installed
  Write-Host "Installed on $env:COMPUTERNAME"
} else {
  # Chocolatey is already installed, so display a message
  Write-Host "Chocolatey already exists on $env:COMPUTERNAME"
}



#################WINDOWS APP DELETE
Write-Host -ForegroundColor Yellow "Deleting unneccesary Windows Apps"
Get-AppxPackage *skypeapp* | Remove-AppxPackage #Silent Remove
sleep 2

#################THIS PC ICON 
Write-Host -ForegroundColor Yellow "Adding This PC icon to desktop..."
$path="HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$name="{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
$exist="Get-ItemProperty -Path $path -Name $name"
if ($exist)
{
    Set-ItemProperty -Path $path -Name $name -Value 0
}
Else
{
    New-ItemProperty -Path $path -Name $name -Value 0
}

sleep 1

$shell = New-Object -ComObject Shell.Application
$shell.minimizeall()
start-sleep 1
$wsh = New-Object -ComObject Wscript.Shell
$wsh.sendkeys('{F5}')
start-sleep 1
$shell.undominimizeall()
sleep 3

#################CORTANA DISABLE
Write-Host -ForegroundColor Yellow "Disabling Cortana"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value 0
#################SEARCH BAR DISABLE
Write-Host -ForegroundColor Yellow "Disabling Search Bar"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0
#################DISABLE NEWS & INTERESTS
Write-Host -ForegroundColor Yellow "Disabling News & Interests"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2 
sleep 2

#################TIME ZONE
# Define a lookup table for time zones
$timeZoneLookup = @{
  "EET" = "FLE Standard Time"
  "Europe/Vilnius" = "FLE Standard Time"
  "GMT" = "GMT Standard Time"
}

# Check the user's IP location
$ipLocation = (Invoke-WebRequest -Uri "https://ipinfo.io/json" -UseBasicParsing).Content | ConvertFrom-Json

# Get the time zone for the IP location
$timeZone = $ipLocation.timezone

# Look up the time zone ID in the lookup table
$timeZoneId = $timeZoneLookup[$timeZone]

# Check if the time zone ID is valid
if ($timeZoneId) {
  # The time zone ID is valid, so set the time zone
  Set-TimeZone -Id $timeZoneId

  # Display a message indicating that the time zone has been adjusted
  Write-Host "Time zone has been adjusted to $timeZoneId"
} else {
  # The time zone ID is not valid, so display an error message
  Write-Host "Error: The time zone '$timeZone' could not be mapped to a valid time zone ID on the local computer."
}

#################KEYBOARD LAYOUTS
# Add two keyboard layouts: English (United States) and Lithuanian
Set-WinUserLanguageList -LanguageList en-US,lt-LT -Force

# Set the system locale to English (United States)
Set-WinSystemLocale en-US

# Set the culture for the current session to English (United States)
Set-Culture en-Us
           
sleep 2

#################PC Rename
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Renaming PC"
Write-Host "-------------------------------------------------------------------"
[int] $pcNO = Get-Content -Path "No.txt"
if($pcNO -ne $null){
$pcNewNO = "ITW" + $pcNO
$pcNO += 1
$pcNO | Out-File -FilePath "No.txt"
Rename-Computer -NewName $pcNewNO
}
Write-Host -ForegroundColor Yellow "Installation has finished... Closing script"
Stop-Transcript

sleep 5
