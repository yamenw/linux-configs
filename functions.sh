# The C prefix is just there to indicate that I wrote it, its a cheapo namespace

cget-ip () {
	echo $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
}

cbat () {
	batcat --pager=always $1
}

czbat () {
	zellij action new-pane --floating -- batcat $1
}

cfzf () {
	 fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'
}

catuin () {
	atuin search -i
}

cb () {
	batcat $1
}

cll () {
	exa --icons --classify $@
}

cfl () {
	fzf --preview 'exa --icons --classify {}' --walker=dir --preview-window=right:40%
}
