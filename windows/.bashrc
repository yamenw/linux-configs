eval "$(oh-my-posh init bash --config "$POSH_THEMES_PATH/star.omp.json")"

eval "$(fzf --bash)"

export HISTFILESIZE=5000

export USER=yamen

[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --attach=none
[[ ${BLE_VERSION-} ]] && ble-attach

export _ZO_ECHO=1
eval "$(zoxide init bash)"

# https://github.com/akinomyoga/ble.sh/issues/57#issuecomment-631870907
bleopt prompt_ps1_transient=always:trim

# Did not like any SSH config managers I found, so I made my own

format-ssh-host-info() {
    ssh -TG $1 | grep -e "^user " -e "^hostname"  -e "^identityfile " -e "^port " | column -t
}

get-all-ssh-config-hosts() {
    grep "^Host " ~/.ssh/config | awk '{print $2}'
}

cssh() {
    export -f format-ssh-host-info
    SELECTED_HOST=$(get-all-ssh-config-hosts | fzf --multi --preview 'format-ssh-host-info {}' --preview-window=bottom:4)

    if [[ $? -gt 0 ]]; then
        return
    fi

    ssh $SELECTED_HOST
}

clipd() { 
    mkdir -p "$HOME/nano-clips"
    local TIMESTAMP=$(date -d 'today' +'%Y-%m-%d-%H-%M-%S')
    local FILEPATH="$HOME/nano-clips/$TIMESTAMP.txt"
    touch $FILEPATH
    powershell -command "Get-Clipboard" > $(realpath "$FILEPATH")
    nano $FILEPATH
}
