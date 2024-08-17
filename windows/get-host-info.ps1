param (
    [string]$HOSTNAME
)

& "C:\Program Files\Git\usr\bin\ssh.exe" -TG $HOSTNAME |
Select-String -Pattern "^user ", "^hostname", "^identityfile ", "^port " |
ForEach-Object {
    $_.Line
}
