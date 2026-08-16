# Homebrew is under /opt/homebrew on Apple Silicon and /usr/local on Intel.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

export EDITOR=vim
export VISUAL=vim
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks

# Completion includes Docker Desktop's completions when Docker is installed.
fpath=(
  "$HOME/.docker/completions"
  /Applications/Docker.app/Contents/Resources/etc
  $fpath
)
autoload -Uz compinit
compinit

# Vim editing: start in insert mode; Escape enters normal mode.
bindkey -v
export KEYTIMEOUT=1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^[[B' down-line-or-beginning-search

alias l='eza -lahF --group-directories-first'
alias cat='bat'
alias c='clear'
alias v='vim .'
alias gs='git status --short --branch'
alias gc='git commit'
alias gco='git switch'
alias gcb='git switch -c'
alias gpp='git push'
alias gll='git log --all --decorate --oneline --graph'
alias gc-='git switch -'

gtg() { git log --oneline "$1...$2"; }

_in_git_repo() { git rev-parse --is-inside-work-tree >/dev/null 2>&1; }
_insert_selection() {
  [[ -n "$1" ]] || return
  LBUFFER+="${(q)1}"
  zle redisplay
}

_parent_directory() { BUFFER='cd ..'; zle accept-line; }
_home_directory() { BUFFER='cd ~'; zle accept-line; }
_list_directory() { BUFFER='l'; zle accept-line; }
_prepend_sudo() { LBUFFER="sudo $LBUFFER"; }
_git_file() {
  _in_git_repo || return
  _insert_selection "$(git status --short | sed 's/^...//' | fzf --height=40% --multi)"
}
_git_branch() {
  _in_git_repo || return
  _insert_selection "$(git branch --all --format='%(refname:short)' | grep -v '/HEAD$' | fzf --height=40% --tac)"
}
_git_tag() {
  _in_git_repo || return
  _insert_selection "$(git tag --sort=-version:refname | fzf --height=40%)"
}
_git_remote() {
  _in_git_repo || return
  _insert_selection "$(git remote | fzf --height=40%)"
}
_git_commit() {
  _in_git_repo || return
  local line
  line=$(git log --color=always --format='%C(green)%h%C(reset) %s %C(blue)(%cr)%C(reset)' |
    fzf --height=40% --ansi --no-sort --reverse)
  _insert_selection "${line%% *}"
}

for widget in _parent_directory _home_directory _list_directory _prepend_sudo \
  _git_file _git_branch _git_tag _git_remote _git_commit; do
  zle -N "$widget"
done

bindkey -M viins '^[k' _parent_directory
bindkey -M viins '^[h' _home_directory
bindkey -M viins '^[l' _list_directory
bindkey -M viins '^[s' _prepend_sudo
bindkey -M viins '^[f' _git_file
bindkey -M viins '^[b' _git_branch
bindkey -M viins '^[t' _git_tag
bindkey -M viins '^[r' _git_remote
bindkey -M viins '^[gh' _git_commit

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

