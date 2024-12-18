# IMPORTANT: OMP will use the default theme if the path is incorrect
# Without printing any errors

# Set $CONFIG_REPO_PATH to the path of this repo

oh-my-posh.exe init pwsh --config "$CONFIG_REPO_PATH\windows\powershell.omp.toml" | Invoke-Expression

if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$env:_ZO_ECHO = "1"
Invoke-Expression (& { (zoxide init powershell | Out-String) })

<# 
.DESCRIPTION
https://superuser.com/questions/1767008/prevent-certain-commands-from-being-logged-by-history-in-powershell
#>
Set-PSReadLineOption -AddToHistoryHandler {
    param($command)
    if ($command -like ' *') {
        return $false
    }
    return $true
}

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


function get-host-info([string]$HOSTNAME) {
    & "C:\Program Files\Git\usr\bin\ssh.exe" -TG $HOSTNAME | Select-String -Pattern "^user ", "^hostname", "^identityfile ", "^port " | ForEach-Object { $_.Line }
}

function cssh {
    $ALL_HOSTS = $(Get-Content ~\.ssh\config | Select-String -Pattern "^Host ")
    $SELECTED_HOST=$(Write-Output $ALL_HOSTS | ForEach-Object { ($_ -split '\s+')[1] } | fzf --multi --preview "powershell.exe -File $CONFIG_REPO_PATH\windows\get-host-info.ps1 -HOSTNAME {}" --preview-window=bottom:4)
    if (-not $? -or -not $SELECTED_HOST) {
        return
    }

    & 'C:/Program Files/Git/usr/bin/ssh.exe' $SELECTED_HOST
}
