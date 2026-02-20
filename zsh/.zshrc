HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY      
setopt SHARE_HISTORY        
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_REDUCE_BLANKS   

setopt AUTO_CD             
setopt AUTO_PUSHD           
setopt PUSHD_IGNORE_DUPS    

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select            
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias tree='eza --tree --level=2 --icons'
alias dc="docker compose"
alias dcu="dc up -d"
alias dcd="dc down"
alias dcv="dcd -v"
alias dcl="dc logs -f --tail 10"
alias dci="dcu && dcl"
alias dcr="dcd && dci"
alias vi='nvim'
alias vim="vi"
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias q='exit'
alias reload='source ~/.zshrc'
alias rm='rm -i'

function mkcd() {
	mkdir -p "$1" && cd "$1"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

export EDITOR='nvim'
export VISUAL='nvim'
export TERM="xterm-256color" 

zellij

