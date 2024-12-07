# Install FiraCode Nerd Font
Install-PSResource -Name NerdFonts
Import-Module NerdFonts
Install-NerdFont -Name 'FiraCode'

# Install Terminal Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# Install posh-git
Install-Module posh-git -Scope CurrentUser -Force

# Install OhMyPosh
winget install JanDeDobbeleer.OhMyPosh -s winget