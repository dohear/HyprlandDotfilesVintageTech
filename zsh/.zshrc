# ~/.zshrc

# Load theme from our previous configuration
[[ -f ~/.zsh/vintage-tech-theme.zsh ]] && source ~/.zsh/vintage-tech-theme.zsh

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # Don't record duplicated commands
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_VERIFY           # Show command with history expansion before running it
setopt SHARE_HISTORY         # Share history between all sessions
setopt EXTENDED_HISTORY      # Record timestamp of command

# Directory navigation
setopt AUTO_CD              # Just type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto directory stack
setopt PUSHD_IGNORE_DUPS    # Don't push multiple copies
setopt PUSHD_SILENT         # Don't print directory stack

# Completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select                    # Menu-style completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case-insensitive completion
zstyle ':completion:*' special-dirs true             # Complete . and ..
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Colored completion

# Load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Plugin settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#4C515C"  # Gray color for suggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Key bindings
bindkey '^[[A' up-line-or-search                # Up arrow for history search
bindkey '^[[B' down-line-or-search              # Down arrow for history search
bindkey '^[[H' beginning-of-line                # Home key
bindkey '^[[F' end-of-line                      # End key
bindkey '^[[3~' delete-char                     # Delete key
bindkey '^[[1;5C' forward-word                  # Ctrl+Right
bindkey '^[[1;5D' backward-word                 # Ctrl+Left

# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Common aliases
alias vim='nvim'
alias g='git'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias grep='grep --color=auto'
alias ip='ip -c'
alias mkdir='mkdir -p'
alias df='df -h'
alias free='free -m'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# Useful functions
mkcd() {
    mkdir -p "$1" && cd "$1"
}

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Path additions
path+=("$HOME/.local/bin")
export PATH

if [ -x "$(command -v neofetch)" ]; then
    neofetch
fi

