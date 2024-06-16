cget-ip () {
	echo $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
}

cbat () {
	batcat --pager=always $1
}

czbat () {
	zellij action new-pane --floating -- batcat $1
}

cat22 () {
	cat
}

cfzf () {
	 fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'
}
