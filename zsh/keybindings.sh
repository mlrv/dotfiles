# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^[k" up_widget

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^[h" goto_home

# LS
	function ctrl_l() {
		BUFFER="ls"
		zle accept-line
	}
	zle -N ctrl_l
	bindkey "^[l" ctrl_l

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^[s" add_sudo

# git stuff
function is_in_git_repo() {
	git rev-parse HEAD > /dev/null 2>&1
}

function gf() {
	is_in_git_repo &&
	git -c color.status=always status --short |
	fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}
zle -N gf
bindkey "^[f" gf

function gb() {
	is_in_git_repo &&
	git branch -a -vv --color=always | grep -v '/HEAD\s' |
	fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
	sed 's#^remotes/[^/]*/##'
}
zle -N gb
bindkey "^[b" gb

function gt() {
	is_in_git_repo &&
	git tag --sort -version:refname |
	fzf --height 40% --multi
}
zle -N gt
bindkey "^[t" gt

function gh() {
	is_in_git_repo &&
	git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
	fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}
zle -N gh
bindkey "^[h" gh

function gr() {
	is_in_git_repo &&
	git remote -v | awk '{print $1 " " $2}' | uniq |
	fzf --height 40% --tac | awk '{print $1}'
}
zle -N gr
bindkey "^[r" gr


