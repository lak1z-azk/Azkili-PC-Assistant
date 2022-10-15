Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'IOWT Advanced Installer'
$main_form.Width = 600
$main_form.Height = 400


$Image = [system.drawing.image]::FromFile("G:\Scripts\bg.png") 
$main_form.BackgroundImage = $Image

$objIcon = New-Object System.Drawing.Icon ("C:\Windows\Installer\{A3985C05-7386-411F-A4BF-32A73F37EB44}\installer.ico")
$main_form.Icon = $objIcon

$main_form.AutoSize = $true
$main_form.BackColor = "Black"


####################### 
$objListBox = New-Object Windows.Forms.Listbox
$objListBox = New-Object System.Windows.Forms.ListBox
$objListBox.Location = New-Object System.Drawing.Size(15,10)
$objListBox.Size = New-Object System.Drawing.Size(600,10)
$objListBox.Height = 400



######################

$Header9 = New-Object System.Windows.Forms.Label

$Header9.Text = "v0.3"
$Header9.Location  = New-Object System.Drawing.Point(550,400)

$Header9.AutoSize = $true

$Header9.Font = "Humnst777 BlkCn BT"
$Header9.BackColor = "Transparent"

$main_form.Controls.Add($Header9)
$Header9.ForeColor = "white"

######################

$Header8 = New-Object System.Windows.Forms.Label

$Header8.Text = "Gaming Platforms"
$Header8.Location  = New-Object System.Drawing.Point(445,25)

$Header8.AutoSize = $true

$Header8.Font = "Humnst777 BlkCn BT"
$Header8.BackColor = "Transparent"

$main_form.Controls.Add($Header8)
$Header8.ForeColor = "white"

#######################

$Header5 = New-Object System.Windows.Forms.Label

$Header5.Text = "Personal Use"
$Header5.Location  = New-Object System.Drawing.Point(315,25)

$Header5.AutoSize = $true

$header5.Font = "Humnst777 BlkCn BT"
$header5.BackColor = "Transparent"

$main_form.Controls.Add($Header5)
$Header5.ForeColor = "white"



##############################

$Header6 = New-Object System.Windows.Forms.Label

$Header6.Text = "Brave `nVLC `nNotepad++ `nAdobe Reader `nGrammarly `nTeam Viewer "
$Header6.Location  = New-Object System.Drawing.Point(315,80)

$Header6.AutoSize = $true

$Header6.Font = "Humnst777 BlkCn BT"
$Header6.BackColor = "Transparent"
$main_form.Controls.Add($Header6)
$Header6.ForeColor = "white"

##############################

$Header = New-Object System.Windows.Forms.Label

$Header.Text = "Google Chrome `nVLC `nNotepad++ `nAdobeReader `nGrammarly `nCCleaner `nAvast Free Antivirus"
$Header.Location  = New-Object System.Drawing.Point(175,80)

$Header.AutoSize = $true

$Header.BackColor = "Transparent"
$header.Font = "Humnst777 BlkCn BT"

$main_form.Controls.Add($Header)
$Header.ForeColor = "white"
#########################################
$Header = New-Object System.Windows.Forms.Label

$Header.Text = "Default Users"
$Header.Location  = New-Object System.Drawing.Point(175,25)

$Header.AutoSize = $true

$Header.Font = "Humnst777 BlkCn BT"
$Header.BackColor = "Transparent"
$main_form.Controls.Add($Header)
$Header.ForeColor = "white"

############################

$Header = New-Object System.Windows.Forms.Label

$Header.Text = "Advanced Installs"
$Header.Location  = New-Object System.Drawing.Point(25,25)

$Header.AutoSize = $true


$header.Font = "Humnst777 BlkCn BT"
$Header.BackColor = "Transparent"
$main_form.Controls.Add($Header)
$Header.ForeColor = "white"

###########################
$Label2 = New-Object System.Windows.Forms.Label

$Label2.Text = "Debug " 

$Label2.Location  = New-Object System.Drawing.Point(5,400)

$Label2.Font = "Humnst777 BlkCn BT"
$Label2.AutoSize = $true
$Label2.BackColor = "Transparent"
$main_form.Controls.Add($Label2)
$Label2.ForeColor = "white"

################################

$Label3 = New-Object System.Windows.Forms.Label

$Label3.Text = ""


$Label3.Location  = New-Object System.Drawing.Point(70,400)

$Label3.AutoSize = $false
$Label3.BackColor = "Transparent"
$main_form.Controls.Add($Label3)
$Label3.ForeColor = "White"





$Button = New-Object System.Windows.Forms.Button

$Button.Location = New-Object System.Drawing.Size(10,50)

$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Font =  "Humnst777 BlkCn BT"
$Button.Text = "Blender"
$Button.ForeColor = "White"

$Button.BackColor = "DarkRed"

$main_form.Controls.Add($Button)


$Button.Add_Click(

{

 $Label3.Text = choco install Blender -y

})


$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Size(10,80)

$Button2.Size = New-Object System.Drawing.Size(120,23)
$Button2.Font =  "Humnst777 BlkCn BT"
$Button2.Text = "Unity Hub"
$Button2.ForeColor = "White"

$Button2.BackColor = "DarkRed"

$main_form.Controls.Add($Button2)

$Button2.Add_Click(

{

$label3.Text = choco uninstall unityhub -y

}

)

$Button3 = New-Object System.Windows.Forms.Button

$Button3.Location = New-Object System.Drawing.Size(10,110)

$Button3.Size = New-Object System.Drawing.Size(120,23)
$Button3.Font =  "Humnst777 BlkCn BT"
$Button3.Text = "OBS Studio"
$Button3.ForeColor = "White"

$Button3.BackColor = "DarkRed"

$main_form.Controls.Add($Button3)


$Button3.Add_Click(

{

 $Label3.Text = choco install obs-studio -y

})

$Button4 = New-Object System.Windows.Forms.Button

$Button4.Location = New-Object System.Drawing.Size(10,140)

$Button4.Size = New-Object System.Drawing.Size(120,23)
$Button4.Font =  "Humnst777 BlkCn BT"
$Button4.Text = "Streamlabs"
$Button4.ForeColor = "White"

$Button4.BackColor = "DarkRed"

$main_form.Controls.Add($Button4)


$Button4.Add_Click(

{

 $Label3.Text = choco install streamlabs-obs -y

})


$Button5 = New-Object System.Windows.Forms.Button

$Button5.Location = New-Object System.Drawing.Size(10,170)

$Button5.Size = New-Object System.Drawing.Size(120,23)
$Button5.Font =  "Humnst777 BlkCn BT"
$Button5.Text = "HWMonitor"
$Button5.ForeColor = "White"

$Button5.BackColor = "DarkRed"

$main_form.Controls.Add($Button5)


$Button5.Add_Click(

{

 $Label3.Text = choco install hwmonitor -y

})

$Button6 = New-Object System.Windows.Forms.Button

$Button6.Location = New-Object System.Drawing.Size(10,200)

$Button6.Size = New-Object System.Drawing.Size(120,23)
$Button6.Font =  "Humnst777 BlkCn BT"
$Button6.Text = "Winrar"
$Button6.ForeColor = "White"

$Button6.BackColor = "DarkRed"

$main_form.Controls.Add($Button6)


$Button6.Add_Click(

{

 $Label3.Text = choco install winrar -y

})

$Button7 = New-Object System.Windows.Forms.Button

$Button7.Location = New-Object System.Drawing.Size(10,230)

$Button7.Size = New-Object System.Drawing.Size(120,23)
$Button7.Font =  "Humnst777 BlkCn BT"
$Button7.Text = "7Zip"
$Button7.ForeColor = "White"

$Button7.BackColor = "DarkRed"

$main_form.Controls.Add($Button7)


$Button7.Add_Click(

{

 $Label3.Text = choco install 7Zip -y


})


$Button8 = New-Object System.Windows.Forms.Button

$Button8.Location = New-Object System.Drawing.Size(10,260)

$Button8.Size = New-Object System.Drawing.Size(120,23)
$Button8.Font =  "Humnst777 BlkCn BT"
$Button8.Text = "GeForce Experience"
$Button8.ForeColor = "White"

$Button8.BackColor = "DarkRed"

$main_form.Controls.Add($Button8)


$Button8.Add_Click(

{

 $Label3.Text = choco install geforce-experience -y

})

$Button9 = New-Object System.Windows.Forms.Button

$Button9.Location = New-Object System.Drawing.Size(10,290)

$Button9.Size = New-Object System.Drawing.Size(120,23)
$Button9.Font =  "Humnst777 BlkCn BT"
$Button9.Text = "Visual Studio Code"
$Button9.ForeColor = "White"

$Button9.BackColor = "DarkRed"

$main_form.Controls.Add($Button9)


$Button9.Add_Click(

{

 $Label3.Text = choco install vscode -y

})

$Button10 = New-Object System.Windows.Forms.Button

$Button10.Location = New-Object System.Drawing.Size(10,320)

$Button10.Size = New-Object System.Drawing.Size(120,23)
$Button10.Font =  "Humnst777 BlkCn BT"
$Button10.Text = "mRemoteNG"
$Button10.ForeColor = "White"

$Button10.BackColor = "DarkRed"

$main_form.Controls.Add($Button10)


$Button10.Add_Click(

{

 $Label3.Text = choco install mremoteng -y

})

$Button11 = New-Object System.Windows.Forms.Button

$Button11.Location = New-Object System.Drawing.Size(10,350)

$Button11.Size = New-Object System.Drawing.Size(120,23)
$Button11.Font =  "Humnst777 BlkCn BT"
$Button11.Text = "SteelSeries Engine"
$Button11.ForeColor = "White"

$Button11.BackColor = "DarkRed"

$main_form.Controls.Add($Button11)


$Button11.Add_Click(

{

 $Label3.Text = choco install mremoteng -y

})


$MinInstall = New-Object System.Windows.Forms.Button

$MinInstall.Location = New-Object System.Drawing.Size(150,50)

$MinInstall.Size = New-Object System.Drawing.Size(120,23)
$MinInstall.Font =  "Humnst777 BlkCn BT"
$MinInstall.Text = "Install"
$MinInstall.ForeColor = "White"

$MinInstall.BackColor = "DarkRed"

$main_form.Controls.Add($MinInstall)


$MinInstall.Add_Click(

{

 $Label3.Text = choco install googlechrome vlc notepadplusplus adobereader grammarly ccleaner avastfreeantivirus  -y 

})


$advInstall = New-Object System.Windows.Forms.Button

$advInstall.Location = New-Object System.Drawing.Size(290,50)

$advInstall.Size = New-Object System.Drawing.Size(120,23)
$advInstall.Font =  "Humnst777 BlkCn BT"
$advInstall.Text = "Install"
$advInstall.ForeColor = "White"

$advInstall.BackColor = "DarkRed"

$main_form.Controls.Add($advInstall)


$advInstall.Add_Click(

{

 $Label3.Text = choco install brave vlc notepadplusplus adobereader grammarly teamviewer  -y 

})

$steaminstall = New-Object System.Windows.Forms.Button

$steaminstall.Location = New-Object System.Drawing.Size(430,50)

$steaminstall.Size = New-Object System.Drawing.Size(120,23)
$steaminstall.Font =  "Humnst777 BlkCn BT"
$steaminstall.Text = "Steam"
$steaminstall.ForeColor = "White"

$steaminstall.BackColor = "DarkRed"

$main_form.Controls.Add($steaminstall)


$steaminstall.Add_Click(

{

 $Label3.Text = choco install  steam-client -y 

})

$originInstall = New-Object System.Windows.Forms.Button

$originInstall.Location = New-Object System.Drawing.Size(430,80)

$originInstall.Size = New-Object System.Drawing.Size(120,23)
$originInstall.Font =  "Humnst777 BlkCn BT"
$originInstall.Text = "Origin"
$originInstall.ForeColor = "White"

$originInstall.BackColor = "DarkRed"

$main_form.Controls.Add($originInstall)


$originInstall.Add_Click(

{

 $Label3.Text = choco install  origin  -y 

})


$epicGames = New-Object System.Windows.Forms.Button

$epicGames.Location = New-Object System.Drawing.Size(430,110)

$epicGames.Size = New-Object System.Drawing.Size(120,23)
$epicGames.Font =  "Humnst777 BlkCn BT"
$epicGames.Text = "Epic Games"
$epicGames.ForeColor = "White"

$epicGames.BackColor = "DarkRed"

$main_form.Controls.Add($epicGames)


$epicGames.Add_Click(

{

 $Label3.Text = choco install epicgameslauncher  -y 

})


$GOGGalaxy = New-Object System.Windows.Forms.Button

$GOGGalaxy.Location = New-Object System.Drawing.Size(430,140)

$GOGGalaxy.Size = New-Object System.Drawing.Size(120,23)
$GOGGalaxy.Font =  "Humnst777 BlkCn BT"
$GOGGalaxy.Text = "GOG Galaxy"
$GOGGalaxy.ForeColor = "White"

$GOGGalaxy.BackColor = "DarkRed"

$main_form.Controls.Add($GOGGalaxy)


$GOGGalaxy.Add_Click(

{

 $Label3.Text = choco install goggalaxy discord -y 

})

$dcInstall = New-Object System.Windows.Forms.Button

$dcInstall.Location = New-Object System.Drawing.Size(430,170)

$dcInstall.Size = New-Object System.Drawing.Size(120,23)
$dcInstall.Font =  "Humnst777 BlkCn BT"
$dcInstall.Text = "Discord"
$dcInstall.ForeColor = "White"

$dcInstall.BackColor = "DarkRed"

$main_form.Controls.Add($dcInstall)


$dcInstall.Add_Click(

{

 $Label3.Text = choco install discord -y 

})

$update = New-Object System.Windows.Forms.Button

$update.Location = New-Object System.Drawing.Size(455,370)

$update.Size = New-Object System.Drawing.Size(120,23)
$update.Font =  "Humnst777 BlkCn BT"
$update.Text = "Update All"
$update.ForeColor = "White"

$update.BackColor = "DarkRed"

$main_form.Controls.Add($update)


$update.Add_Click(

{
$Label3.Text = "Starting the update"
sleep 3 
 $Label3.Text = choco upgrade all -y  

})

$update = New-Object System.Windows.Forms.Button

$update.Location = New-Object System.Drawing.Size(330,370)

$update.Size = New-Object System.Drawing.Size(120,23)
$update.Font =  "Humnst777 BlkCn BT"
$update.Text = "Add/Remove Window"
$update.ForeColor = "White"

$update.BackColor = "DarkRed"

$main_form.Controls.Add($update)


$update.Add_Click(

{
$Label3.Text = "Opening Add/Remove" 
sleep 2
 $Label3.Text = appwiz.cpl 

})


$update = New-Object System.Windows.Forms.Button

$update.Location = New-Object System.Drawing.Size(205,370)

$update.Size = New-Object System.Drawing.Size(120,23)
$update.Font =  "Humnst777 BlkCn BT"
$update.Text = "Open DXDIAG"
$update.ForeColor = "White"

$update.BackColor = "DarkRed"

$main_form.Controls.Add($update)


$update.Add_Click(

{

$Label3.Text = "Opening DXDIAG"
sleep 3 
Start-Process dxdiag.exe

})

$update = New-Object System.Windows.Forms.Button

$update.Location = New-Object System.Drawing.Size(455,340)

$update.Size = New-Object System.Drawing.Size(120,23)
$update.Font =  "Humnst777 BlkCn BT"
$update.Text = "Activate Win 10 Pro"
$update.ForeColor = "White"

$update.BackColor = "DarkRed"

$main_form.Controls.Add($update)


$update.Add_Click(

{

$Label3.Text = "Activating windows"
sleep 2
$OSversion = (Get-WmiObject -class Win32_OperatingSystem).Caption

switch -Regex ($OSversion){
    'Windows 10 Pro'  {$key = 'VK7JG-NPHTM-C97JM-9MPGT-3V66T';break}
   
}

$KMSservice = Get-WMIObject -query "select * from SoftwareLicensingService"

$Label3.Text = 'Windows Activated'
$null = $KMSservice.InstallProductKey($key)
$null = $KMSservice.RefreshLicenseStatus()


})

 
$main_form.ShowDialog()


