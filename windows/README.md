# Windows Configs

> [!NOTE]
> It's recommended that you only source this instead of symlinking them, that way, you can have machine specific configs, also good for keeping secrets like IPs.

## Git Bash

Install [ble.sh](https://github.com/akinomyoga/ble.sh/releases), make sure you get a binary, you also have to specify `$USER` for it to work.

## PowerShell Config

### Dependencies

Use PowerShell 7

1. [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#windows-packages)
2. [PSFzf](https://github.co%5B%5B%5D%5Dm/kelleyma49/PSFzf)
3. [zoxide](https://github.com/ajeetdsouza/zoxide)
4. [PSReadLine](https://github.com/PowerShell/PSReadLine) (Might be already installed)
5. [OMP](https://github.com/JanDeDobbeleer/oh-my-posh)
6. [bat](https://github.com/sharkdp/bat)
7. [eza](https://github.com/eza-community/eza)
8. [sshs](https://github.com/quantumsheep/sshs)

Reload your shell, restart your terminal, or IDE, or even entire user sometimes to get the path to reload.

### Usage

Just clone it and [source it](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.4#dot-sourcing-operator-).
