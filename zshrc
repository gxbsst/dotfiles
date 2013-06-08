# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="clean"
ZSH_THEME="weston"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
#alias tmux="TERM=screen-256color-bce tmux"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 textmate ruby vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/opt/local/bin:/opt/local/sbin:/Users/weston/.rvm/gems/ruby-1.9.2-p290/bin:/Users/weston/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/weston/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/weston/.rvm/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin::/usr/local/ruby/bin:/opt/local/bin:/usr/local/git/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/mysql/bin:/usr/local/:/usr/local/php5/bin:/usr/share/pear/bin:/Users/weston/bin




# .BASH_PROFILE IS HERE

export SVN_EDITOR=vim
export PATH="$PATH:/usr/local/mysql/bin:/usr/local/:/usr/local/php5/bin"
QTDIR=/opt/local/lib/qt3;
export QTDIR
#export EDITOR='mate -w'
PATH="$PATH:/usr/share/pear/bin:/Users/weston/bin"
alias ls='ls -w'
alias sf='symfony'
alias vps="AUTOSSH_POLL=1 /usr/local/bin/autossh -M 9999:9999 -t baiselife 'screen -DR'"
alias mysqlstart='sudo launchctl load -w ~/Library/LaunchDaemons/com.mysql.mysqld.plist'
alias mysqlstop='sudo launchctl unload -w ~/Library/LaunchDaemons/com.mysql.mysqld.plist'
export LANG=zh_CN.UTF-8
#alias vi='env LC_CTYPE=zh_CN.UTF-8 vi'
#bind 'set convert-meta off'
#bind 'set meta-flag on'
#bind 'set output-meta on'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

svndiff()
{
  svn diff "${@}" | view -
}

# Ruby
export PATH=":/usr/local/ruby/bin:/opt/local/bin:/usr/local/git/bin/:$PATH"

##
# Your previous /Users/weston/.bash_profile file was backed up as /Users/weston/.bash_profile.macports-saved_2009-12-11_at_21:53:00
##

# MacPorts Installer addition on 2009-12-11_at_21:53:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/weston/.bash_profile file was backed up as /Users/weston/.bash_profile.macports-saved_2009-12-11_at_22:24:40
##

# MacPorts Installer addition on 2009-12-11_at_22:24:40: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/weston/.bash_profile file was backed up as /Users/weston/.bash_profile.macports-saved_2009-12-11_at_23:42:53
##

# MacPorts Installer addition on 2009-12-11_at_23:42:53: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session
export GEM_PATH=/Library/Ruby/Gems/1.8/:${GEM_PATH}

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off


##
# Your previous /Users/weston/.bash_profile file was backed up as /Users/weston/.bash_profile.macports-saved_2011-10-08_at_11:50:44
##

# MacPorts Installer addition on 2011-10-08_at_11:50:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
