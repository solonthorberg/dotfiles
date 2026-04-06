
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# syntax highlighting
source ~/.zsh/current-zsh-sh-theme.zsh
zinit light zsh-users/zsh-syntax-highlighting

# auto completions
zinit light zsh-users/zsh-completions

# auto suggestions
zinit light zsh-users/zsh-autosuggestions

# enable case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# tab
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# zinit snippet OMZP::tmux
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit

zinit cdreplay -q

# promt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"

# theme-switch
export PATH="$HOME/.local/bin:$PATH"

_theme_switch() {
  compadd $(ls ~/.config/themes/)
}
compdef _theme_switch theme-switch

# keybinds
bindkey -v

# history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks 

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# aliases
alias ls='ls --color=auto'
alias l='ls -lah --color=auto'
alias vim='nvim'
alias c='clear'


fman() {
  local line
  line=$(man -k . 2>/dev/null | fzf --preview 'echo {} | awk "{print \$1}" | xargs man 2>/dev/null | head -80' --preview-window=right:60%:wrap)
  if [[ -n "$line" ]]; then
    local name=$(echo "$line" | awk '{print $1}')
    local section=$(echo "$line" | grep -oP '\(\K[0-9a-z]+' | head -1)
    man "$section" "$name" 2>/dev/null || man "$name"
  fi
}

# shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export PATH=$PATH:/home/solonthorberg/.spicetify
