# This is the new and reworked version of old Customization tool. Providing with a new name, design.

**Name**: Azkili PC Assistant

## Main Tab
![image](https://github.com/user-attachments/assets/37c272d9-28f8-4d25-8cc1-be03fd02db17)

- I have reworked on this application with JS. Mostly all of the functionalities are left the same, it uses the same Powershell logic to install and setup the PC. 
- With new design on main tab you will see you PC performance in live time like CPU, RAM and Network usage.
- Below it fetches the 2 latest errors from your Event Viewer part.

## PC Setup tab
![image](https://github.com/user-attachments/assets/005e8e1f-2f63-4100-9d2d-c76c0488191b)


- In this tab you will be able to select keyboard layouts, which will set your selected language(-es). **NOTE:** Each time you will select a keyboard layout, it will replace all your existing keyboard layouts, so if you don't see your keyboard layout, reach me out and I will add it in future! 
- Additionally it will add **This PC** icon to your desktop. 
- Make sure you install **Chocolatey** as its required for further **Application** and **Utilities** setup. 
- It will assign a Timezone by your location.
- Debug log is set to show what is happening while you applying settings. 

## Windows Setup
![image](https://github.com/user-attachments/assets/3dce6629-b47e-4141-8cf3-7293127d9c6f)

- Windows setup is set for basic right now:
 - Delete unnecessary windows apps - it does uninstalls only one app, which currently comes with Windows, is Skype.
 - Common part with disabling Cortana, Search Bar and News & Interests.
 - Code part how it is assigned:
 ``
 const operations = {
        deleteWindowsApps: () => runPowerShellAsAdmin(`Get-AppxPackage *skypeapp* | Remove-AppxPackage`),
        disableCortana: () => runPowerShellAsAdmin(`Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced" -Name "ShowCortanaButton" -Value 0`),
        disableSearchBar: () => runPowerShellAsAdmin(`Set-ItemProperty -Path "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search" -Name "SearchboxTaskbarMode" -Value 0`),
        disableNewsInterests: () => runPowerShellAsAdmin(`Set-ItemProperty -Path "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2`),
        renamePC: (newName) => runPowerShellAsAdmin(`Rename-Computer -NewName "${newName}" -Force`)
    };
``

# Applications and Utilities
![image](https://github.com/user-attachments/assets/418c3c01-dfb8-4ad6-ada8-20c955e5f61a)
![image](https://github.com/user-attachments/assets/33bae67b-239d-4dac-82be-25b731a6f619)

- This is the single part which uses Chocolatey string to install application. It will open a Powershell, where you will also see what is happening. 
