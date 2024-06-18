eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"
export PATH=$PATH:/home/yamen/.exec
eval "$(oh-my-posh init bash --config ~/atomic.omp.json)"
eval "$(zoxide init bash)"
export _ZO_ECHO=1

source ~/.config/yamens/functions.sh
source ~/.config/yamens/nnn-config.sh
