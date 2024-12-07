Import-Module -Name Terminal-Icons
Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\ys.omp.json" | Invoke-Expression
