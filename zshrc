# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export DOTFILES="$HOME/dotfiles"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
#ZSH_THEME="carborn"
#ZSH_THEME="evan"
#ZSH_THEME="lambda"
#ZSH_THEME="mikeh"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="amuse"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="emotty"
#ZSH_THEME="frontcube"
#ZSH_THEME="garyblessington"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  docker
  kubectl
  brew
  npm
  helm
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias gc="git clone "

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin/:$PATH"

#export PATH="/usr/local/opt/openssl/bin:$PATH:/opt/homebrew/bin"
export PATH="$PATH:/opt/homebrew/bin"
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"

# eval "$(pyenv init -)"
#export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
alias pyserver="python -m http.server"
alias yt="yarn test"
alias y="yarn"
alias bi='brew install'
ANDROID="$HOME/Library/Android"
export ANDROID_HOME="$ANDROID/sdk"
export PATH="$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID/sdk/ndk-bundle:${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/"
alias uba='umi block add'
alias mqtt='brew services start mosquitto'
alias mqtt_restart='brew services restart mosquitto'
alias mqtt_stop='brew services stop mosquitto'
alias yarn_upgrade_interactive='yarn upgrade-interactive'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias lt="lt --subdomain weixuhong"
alias killChrome="ps aux|grep Chromium|awk '{print $2}'|xargs kill -9"
alias loop='f() { while true; do sleep 0.5 && $1 $2 $3 $4; done  };f'
alias which='which -a'
alias s='webstorm .'
alias wxcli="/Applications/wechatwebdevtools.app/Contents/MacOS/cli"
alias v="lvim"

[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh
export DEFAULT_USER="$(whoami)"
#source ~/.zsh/antigen.zsh
#antigen bundle zsh-users/zsh-completions
bindkey '^ ' autosuggest-accept
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
#source ~/.bash_profile


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export FLUTTER_HOME="$HOME/development/flutter"
export PATH="/usr/local/opt/libxml2/bin:$PATH:$HOME/development/bin"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"
autoload bashcompinit
bashcompinit
#source $HOME/development/wp-completion.bash

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
# export PATH="$PATH:$(yarn global bin):$HOME/bin"
#alias python=/usr/local/bin/python3.7

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/weston/.sdkman"
[[ -s "/Users/weston/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/weston/.sdkman/bin/sdkman-init.sh"
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
export EDITOR=lvim
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# eval "$(pyenv init -)"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

#export CFLAGS="-I$(brew --prefix openssl)/include"
#export LDFLAGS="-L$(brew --prefix openssl)/lib"


alias lzd='lazydocker'
#eval "$(starship init zsh)"
#. /usr/local/etc/profile.d/z.sh
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
#export PYTHON_HOST_PROG="/Users/weston/.pyenv/shims/python"
#export PYTHON3_HOST_PROG="/Users/weston/.pyenv/shims/python3"

#alias python=/usr/local/bin/python3

alias ils='logo-ls'
alias ila='logo-ls -A'
alias ill='logo-ls -al'
# equivalents with Git Status on by Default
alias ilsg='logo-ls -D'
alias ilag='logo-ls -AD'
alias illg='logo-ls -alD'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

export PATH="/opt/homebrew/opt/openldap/bin:$PATH"
export PATH="/opt/homebrew/opt/openldap/sbin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/sbin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/bin:/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Applications/wechatwebdevtools.app/Contents/MacOS/:$PATH"
export PATH="$HOME/bin/nvim-macos/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH"
alias python2="/usr/local/bin/python"
alias k9s="$HOME/dotfiles/k9s"
alias k="kubectl"
export VISUAL="$EDITOR"

export RUSTUP_DIST_SERVER=https://mirrors.sjtug.sjtu.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.sjtug.sjtu.edu.cn/rust-static/rustup

# 显示项目link 的npm包
alias llp="sh $DOTFILES/bin/list_yarn_links.sh"
alias dev="sh $DOTFILES/bin/dev.sh"
alias wx='cli --project "$(pwd)"'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

#source /Users/weston/.config/broot/launcher/bash/br

#export http_proxy="socks5://127.0.0.1:1080"
#export https_proxy="socks5://127.0.0.1:1080"

alias ls='exa --git --icons --color=always --group-directories-first'
export OPENAI_API_KEY="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"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
