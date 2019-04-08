# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# home
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

# LS
	function ctrl_l() {
		BUFFER="ls"
		zle accept-line
	}
	zle -N ctrl_l
	bindkey "^l" ctrl_l

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo

# vim
	function open_vim() {
		BUFFER="vim"
		zle accept-line
	}
	zle -N open_vim
	bindkey "^v" open_vim

	# chrome
	function open_chrome() {
		BUFFER="google-chrome"
		zle accept-line
	}
	zle -N open_chrome
	bindkey "^z" open_chrome
