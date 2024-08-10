oh-my-posh.exe init pwsh --config "$MY_POSH_THEME" | Invoke-Expression

if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:_ZO_ECHO = "1"
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Functions

function cfbat {
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" 
}

function cdf {
    $TARGET=$(fzf --preview 'eza --all --icons=always --classify {}' --walker=dir,hidden --preview-window=bottom:20%)
    if ($TARGET) { z $TARGET };
}

<# 
.DESCRIPTION
Example config in .ssh/config for invoking this
here, its a file not a function
ProxyCommand bash -c "ncat $(powershell -File ~/.ssh/get-laptop-ip.ps1) %p"
#>
function laptopip {
    Write-Output $(Get-NetNeighbor -AddressFamily IPv4 | Where-Object { $_.LinkLayerAddress -eq $LAPTOP_MAC_ADDRESS } | Select-Object -ExpandProperty IPAddress)
}
