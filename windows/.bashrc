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
cssh() {
    SELECTED_HOST=$(grep "^Host " ~/.ssh/config | awk '{print $2}' | fzf --multi --preview 'ssh -TG {} | grep -e "^user " -e "^hostname"  -e "^identityfile " -e "^port " | column -t' --preview-window=bottom:4)

    if [[ $? -gt 0 ]]; then
        return
    fi

    ssh $SELECTED_HOST
}
