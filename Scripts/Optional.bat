@Echo off
PowerShell -WindowStyle Hidden -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Optional.ps1""' -Verb RunAs}"


Exit