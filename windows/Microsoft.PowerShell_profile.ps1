oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH\craver.omp.json" | Invoke-Expression

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
    $TARGET=$(fzf --preview 'eza --all --icons=always --classify {}' --walker=dir,hidden --preview-window=right:40%)
    if ($TARGET) { z $TARGET };
}
