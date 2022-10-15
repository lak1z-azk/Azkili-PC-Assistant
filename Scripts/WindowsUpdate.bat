@Echo off
PowerShell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0WindowsUpdate.ps1""' -windowstyle minimized -Verb RunAs}"


Exit