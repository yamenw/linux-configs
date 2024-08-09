export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"


[ "$BASH_VERSION" ] && [[ $- == *i* ]] || return
. "${HOME}/.bashrc"
. "$HOME/.cargo/env"
