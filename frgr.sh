#!/bin/bash

display_command() {
    echo "$@" | bat -l sh - | awk -F '->' '{print $2}'
}

cheatsheet_lookup() {
    local cheatsheet_file="$HOME/.cheatsheet.csv"
    local selected

    if [ ! -f "$cheatsheet_file" ]; then
        echo "Cheatsheet file not found at $cheatsheet_file"
        return 1
    fi

    export -f display_command

    selected=$(awk -F ',' '{print $1 " -> " $2}' "$cheatsheet_file" | fzf --delimiter="->" --with-nth=1 --preview-window=bottom:4 --preview 'display_command {}' | awk -F '->' '{print $2}' | sed 's/^ //')

    if [ -n "$selected" ]; then
        echo "Running: $selected"
        eval "$selected"
    else
        echo "No command selected."
    fi
}
