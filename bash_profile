[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"

umask 002
#PS1='[\h]$'
#PS1='[\u@\h:$PWD]'
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
#export CC=gcc-4.2
#export CC=/usr/bin/gcc-4.2
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export GEMEDITOR=mate
export EDITOR=mate

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


