# Terminal-Icons: https://github.com/devblackops/Terminal-Icons
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

# posh-git: https://github.com/dahlbyk/posh-git
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
# PowerShellGet\Update-Module posh-git
Import-Module posh-git

# oh-my-posh: https://github.com/dahlbyk/posh-git
# winget install JanDeDobbeleer.OhMyPosh -s winget
# winget upgrade JanDeDobbeleer.OhMyPosh -s winget
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\ys.omp.json" | Invoke-Expression
