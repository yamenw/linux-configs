# The C prefix is just there to indicate that I wrote it, its a cheapo namespace

cget-ip() {
	echo $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
}

cbat() {
	batcat --pager=always $1
}

czbat() {
	zellij action new-pane --floating -- batcat $1
}

cfzf() {
	fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'
}

catuin() {
	atuin search -i
}

cfl() {
	fzf --preview 'eza --icons --classify {}' --walker=dir --preview-window=right:40%
}

cdf() {
	z $(fzf --preview 'eza --all --icons --classify {}' --walker=dir,hidden --preview-window=right:40% || pwd)
}

git-contrib-percent() {
	local TOTAL=$(git rev-list --all --count)
	git shortlog -s -n | awk '{p = $1/ENVIRON["TOTAL"]; printf "%.4f%% %s\n", p, $2}'
}

search-zip() {
	unzip -t $1 || return 1

	unzip -l $1 | awk 'NR>3 {print $NF}' | head -n -2 | fzf --preview="unzip -p $1 {} > ~/.fzf-preview/{} ; termimage -s 24x24 ~/.fzf-preview/{}"
	rm -f ~/.fzf-preview/*
}
