# New PC install scripts

```powershell
Set-ExecutionPolicy Unrestricted
```

## Install WinGet Packages

`install-winget-packages.ps1`

Then change to Microsoft Powershell instead of the old one

## Install Fonts, Icons, posh-git and OhMyPosh

`install-fonts-and-poshgit.ps1`

## Powershell profile

```powershell
Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 -Destination $PROFILE -Force
```

## Terminal settings

```powershell
Copy-Item -Path .\windows-terminal-settings.json -Destination $HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force
```

# Misc

## Powershell execution policy

```
Set-ExecutionPolicy Unrestricted
```

## Enable option to set "screen timeout" on lock screen

Regedit
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7
```
Change "Attributes" to 2 to enable in advanced power settings