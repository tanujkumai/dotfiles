### Zinit init
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

### Plugins (lazy-loaded for speed)
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

### Prompt: Starship (install separately below)
eval "$(starship init zsh)"

### History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

### Key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

### Better defaults
setopt AUTO_CD
setopt CORRECT
autoload -Uz compinit && compinit

### fzf integration
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && \
  source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && \
  source /usr/share/doc/fzf/examples/completion.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### Aliases
alias ls='ls --color=auto'
alias ll='ls -lahF'
alias la='ls -A'
alias grep='grep --color=auto'
alias bat='bat --style=numbers'
alias vim='nvim'
alias vi='nvim'
alias cat='bat'

### PATH
export PATH="$HOME/.local/bin:$PATH"

### nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
if [ -z "$TMUX" ] && [ -n "$PS1" ]; then tmux; fi
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
