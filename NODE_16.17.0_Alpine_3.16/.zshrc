export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'
export TERM=xterm

##### Zsh/Oh-my-Zsh Configuration
export ZSH="/home/node/.oh-my-zsh"

ZSH_THEME="half-life"
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
  zsh-syntax-highlighting
  history-substring-search
  node
  npm
  yarn
  zsh-interactive-cd
  zsh-navigation-tools
)

bindkey "\$terminfo[kcuu1]" history-substring-search-up
bindkey "\$terminfo[kcud1]" history-substring-search-down
source $ZSH/oh-my-zsh.sh