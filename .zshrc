# Environment variables
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export ANDROID_HOME=$HOME/dev/android/sdk
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export ANT_HOME=/opt/ant
#export M2_HOME=/opt/maven
#export M2=$M2_HOME/bin
#export RUBYGEMS_GEMDEPS=-
export UNITY_PATH=/Applications/Unity/Unity.app/Contents/MacOS/Unity

export PATH=/usr/local/heroku/bin:$(npm bin):$QA/bin:$JAVA_HOME/bin:${WEBGAME}/Tools/Scripts:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/usr/local/share/npm/bin:$HOME/bin:$LIBMOBILEDEVICE:/opt/local/bin:/opt/local/sbin:/usr/local/bin:${PATH}

# General setting
set -o ignoreeof
setopt list_types
setopt auto_menu
setopt magic_equal_subst
setopt extended_glob

#PROMPT='%F{green}[%n@%m %C]$%f '
PROMPT='%F{magenta}[@%C]$%f '

# Antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle mollifier/anyframe
  antigen apply
fi

# Completion
fpath=(~/.zsh/completion $fpath)

fpath=($HOME/.zsh/zsh-completions/src(N-/) $fpath)
autoload -Uz compinit
#compinit -u
compinit 
zstyle ':completion:*:default' menu select=8
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Word style
autoload -Uz select-word-style
select-word-style default
zstyle 'zle:*' word-chars " /=;@:{},|"
zstyle 'zle:*' word-style unspecified

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# VCS
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%F{blue}%v%f"

# Color
autoload colors
colors

# Bindkey 
bindkey -e
bindkey '^x^r' anyframe-widget-put-history
bindkey '^x^v' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

unset GEM_HOME
unset GEM_PATH
