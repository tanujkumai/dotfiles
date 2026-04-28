### ---------------------------
### Zinit init
### ---------------------------
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

### Plugins (lazy-loaded + fast)
zinit ice wait'0' lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'0' lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait'0' lucid
zinit light zsh-users/zsh-completions

zinit ice wait'0' lucid
zinit light Aloxaf/fzf-tab


### ---------------------------
### Prompt (Starship)
### ---------------------------
eval "$(starship init zsh)"


### ---------------------------
### History (improved)
### ---------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS


### ---------------------------
### Key bindings
### ---------------------------
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


### ---------------------------
### Better shell behavior
### ---------------------------
setopt AUTO_CD
setopt CORRECT


### ---------------------------
### compinit (fixed + faster)
### ---------------------------
autoload -Uz compinit
compinit -C


### ---------------------------
### fzf (portable WSL-safe setup)
### ---------------------------
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow 2>/dev/null || fdfind --type f --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


### ---------------------------
### Aliases (safer)
### ---------------------------
alias ls='ls --color=auto'
alias ll='ls -lahF'
alias la='ls -A'
alias grep='grep --color=auto'

alias vim='nvim'
alias vi='nvim'

alias bat='batcat 2>/dev/null || bat'
alias cat='bat --paging=never'


### ---------------------------
### PATH (fixed)
### ---------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v24.14.1/bin:$PATH"


### ---------------------------
### nvm
### ---------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"


### ---------------------------
### tmux (safe auto-start)
### ---------------------------
if [[ -z "$TMUX" && -n "$PS1" && -z "$SSH_TTY" ]]; then
  exec tmux
fi


### ---------------------------
### dotfiles alias
### ---------------------------
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
