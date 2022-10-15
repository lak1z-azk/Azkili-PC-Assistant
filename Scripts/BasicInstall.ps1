$PCName = $env:COMPUTERNAME


#################TRANSCRIPT ENABLE
Start-Transcript -Path C:\BasicInstall.txt
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Logs will be saved in C:\BasicInstall.txt" 
Write-Host "-------------------------------------------------------------------"
sleep 2



#################DISK STATUS
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Checking Disk Status..."
Write-Host "-------------------------------------------------------------------"

Get-PhysicalDisk

sleep 3


#################CHOCOLATEY
$chococheck = choco -?
if(-not($chococheck) )
{
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Red "Chocolatey is not installed...  Installing"
Write-Host "-------------------------------------------------------------------"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Green "Installed on $PCName" 
Write-Host "-------------------------------------------------------------------"
sleep 2
}
 else{
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Green "Chocolatey already exists on $PCName "
Write-Host "-------------------------------------------------------------------"
sleep 1
}




#################WINDOWS APP DELETE
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Deleting unneccesary Windows Apps"
Write-Host "-------------------------------------------------------------------"
Get-AppxPackage *skypeapp* | Remove-AppxPackage #Silent Remove
sleep 2

#################THIS PC ICON 
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Adding This PC icon to desktop..."
Write-Host "-------------------------------------------------------------------"
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
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Disabling Cortana"
Write-Host "-------------------------------------------------------------------"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value 0
sleep 1

#################SEARCH BAR DISABLE
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Disabling Search Bar"
Write-Host "-------------------------------------------------------------------"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0
sleep 1

#################DISABLE NEWS & INTERESTS
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Disabling News & Interests"
Write-Host "-------------------------------------------------------------------"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2 
sleep 1


#################SCHEDULED DEFRAG DISABLE
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Disabling Scheduled defrag... "
Write-Host "-------------------------------------------------------------------"
Start-Sleep -Seconds 3
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduleDefrag" 
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor GREEN "Scheduled Defrag has been disabled..."
Write-Host "-------------------------------------------------------------------"
Start-Sleep -Seconds 3

#################TIME ZONE
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Adjusting Time Zone..."
Write-Host "-------------------------------------------------------------------"
sleep 2



$zone = Read-Host "Choose location: [LT/UK]"

if($zone -Like "LT"){
Set-TimeZone -Id "FLE Standard Time" -PassThru;
            Set-WinHomeLocation -GeoId 0x8d;}

elseif($zone -Like "UK")
{
Set-TimeZone -Id "GMT Standard Time" -PassThru
            Set-WinHomeLocation -GeoId 0xf2;
}

Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Time zone has been adjusted"
Write-Host "-------------------------------------------------------------------"
Start-Sleep -Seconds 3

#################KEYBOARD LAYOUTS
Write-Host "`n-------------------------------------------------------------------"
Write-Host -ForegroundColor Yellow "Adding keyboard layouts"
Write-Host "-------------------------------------------------------------------"

 Set-WinUserLanguageList -LanguageList en-US,lt-LT; -Confirm:$False
    Set-WinSystemLocale en-US;
    Set-Culture en-Us; 
    
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



