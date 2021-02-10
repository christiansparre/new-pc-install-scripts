# Just a few scripts to get a new PC install going

## Install Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
``` 

## Install winget 
Check version
https://github.com/microsoft/winget-cli/releases

```powershell
$ProgressPreference = 'SilentlyContinue'
wget https://github.com/microsoft/winget-cli/releases/download/v-0.2.10191-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -outfile "winget.appxbundle"
.\winget.appxbundle

```

# Install Boxstarter

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); Get-Boxstarter -Force

```

# WSL stuff

Needs kernel update?

See: https://github.com/microsoft/WSL/issues/5650#issuecomment-765825503
* http://download.windowsupdate.com/c/msdownload/update/software/updt/2021/02/wsl_update_x64_a3ae94894fc23e4eb522dd65a08cb5ddfa898f73.cab
* https://www.catalog.update.microsoft.com/Search.aspx?q=wsl


# Install Visual Studio with winget

Docs: https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio?view=vs-2019&preserve-view=true

Component id's: https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-professional?view=vs-2019&preserve-view=true


```bash
winget install -h -e Microsoft.VisualStudio.Professional --override "--passive --wait --productId Microsoft.VisualStudio.Product.Professional --channelId VisualStudio.16.Release --channelUri https://aka.ms/vs/16/release/channel --includeRecommended --add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb""
```

# Misc

```
Set-ExecutionPolicy Unrestricted
```