# Boxstarter script

#---- TEMPORARY ---
Disable-UAC
Set-MpPreference -DisableRealtimeMonitoring $true

#--- Windows Settings ---
Disable-BingSearch
Disable-GameBarTips

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Hyper-V / WSFL
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install Microsoft-Windows-Subsystem-Linux -source windowsFeatures
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

# Enable containers feature
Enable-WindowsOptionalFeature -Online -FeatureName containers -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart

# Chocolatay packages
choco install firacode -y
choco install sysinternals -y
#choco install spotify -y

# winget packages
winget install -h -e Microsoft.WindowsTerminal
winget install -h -e Microsoft.VisualStudioCode-User-x64
winget install -h -e GitExtensionsTeam.GitExtensions
winget install -h -e Git.Git
winget install -h -e Microsoft.PowerShell
winget install -h -e Microsoft.AzureCLI
winget install -h -e 7zip.7zip
winget install -h -e Microsoft.Teams
winget install -h -e Microsoft.PowerToys
winget install -h -e Microsoft.SQLServerManagementStudio
winget install -h -e Microsoft.AzureStorageExplorer
winget install -h -e Google.Chrome
winget install -h -e KDE.KDiff3
winget install -h -e GitHub.GitHubDesktop
winget install -h -e Docker.DockerDesktop
winget install -h -e LINQPad.LINQPad6
winget install -h -e 3T.Robo3T

# Making the terminal prompt look good
Import-Module PowerShellGet -Force
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force

#--- Uninstall unecessary applications that might come with Windows out of the box ---
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage *Autodesk* | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage *Dell* | Remove-AppxPackage
Get-AppxPackage *Dropbox* | Remove-AppxPackage
Get-AppxPackage *Facebook* | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage *Keeper* | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage *McAfee* | Remove-AppxPackage
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage *Minecraft* | Remove-AppxPackage
Get-AppxPackage *Photoshop* | Remove-AppxPackage
Get-AppxPackage *Duolingo* | Remove-AppxPackage
Get-AppxPackage *EclipseManager* | Remove-AppxPackage
Get-AppxPackage *ActiproSoftwareLLC.562882FEEB491* | Remove-AppxPackage
Get-AppxPackage *MicrosoftPowerBIForWindows* | Remove-AppxPackage
Get-AppxPackage *Netflix* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.OneConnect | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
Get-AppxPackage *Plex* | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage *Solitaire* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrushFriends | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage

#--- Windows Settings ---
# Some from: @NickCraver's gist https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9

# Privacy: Let apps use my advertising ID: Disable
If (-Not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0

# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
    New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0

# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
# To Restore (Enabled):
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 1

# Disable Telemetry (requires a reboot to take effect)
# Note this may break Insider builds for your organization
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
Get-Service DiagTrack,Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled

# Change Explorer home screen back to "This PC"
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 1
# Change it back to "Quick Access" (Windows 10 default)
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Type DWord -Value 2

# Better File Explorer
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1		
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1		
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# These make "Quick Access" behave much closer to the old "Favorites"
# Disable Quick Access: Recent Files
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 0
# Disable Quick Access: Frequent Folders
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 0
# To Restore:
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -Type DWord -Value 1
# Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowFrequent -Type DWord -Value 1

# Disable the Lock Screen (the one before password prompt - to prevent dropping the first character)
If (-Not (Test-Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization)) {
	New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows -Name Personalization | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreen -Type DWord -Value 1
# To Restore:
# Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreen -Type DWord -Value 1

# Lock screen (not sleep) on lid close
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name AwayModeEnabled -Type DWord -Value 1
# To Restore:
# Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name AwayModeEnabled -Type DWord -Value 0

# Use the Windows 7-8.1 Style Volume Mixer
If (-Not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC")) {
	New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name MTCUVC | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 0
# To Restore (Windows 10 Style Volume Control):
# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" -Name EnableMtcUvc -Type DWord -Value 1

# Disable Xbox Gamebar
#Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
#Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0

# Turn off People in Taskbar
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0

# Prevents "Suggested Applications" returning
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" -Name DisableWindowsConsumerFeatures -Type DWord -Value 1

# Activity Tracking: Disable
@('EnableActivityFeed','PublishUserActivities','UploadUserActivities') |% { Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\System -Name $_ -Type DWord -Value 0 }

#--- Restore Temporary Settings ---
Enable-UAC
Set-MpPreference -DisableRealtimeMonitoring $false
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula