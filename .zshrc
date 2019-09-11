# stty
stty stop undef
stty start undef


#Environment variables
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export ANDROID_HOME=$HOME/dev/android/sdk
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export JAVA_HOME=$HOME/.anyenv/envs/jenv/versions/1.8
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
#export ANT_HOME=/opt/ant
#export M2_HOME=/opt/maven
#export M2=$M2_HOME/bin
#export RUBYGEMS_GEMDEPS=-
export UNITY_PATH=/Applications/Unity/Unity.app/Contents/MacOS/Unity
export SDKMANAGER_OPTS="--add-modules java.se.ee"
export DEFAULT_JVM_OPTS='"-Dcom.android.sdklib.toolsdir=$APP_HOME" -XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export MALMO_XSD_PASTH=$HOME/Malmo/Schemas
export GOPATH=$HOME/go

# iTerm2
source ~/.iterm2_shell_integration.zsh
#source /etc/zprofile


# AWS
#export AWS_DEFAULT_PROFILE=swet-omata
export AWS_DEFAULT_PROFILE=default

export PATH=/usr/local/heroku/bin:$(npm bin):$QA/bin:$JAVA_HOME/bin:${WEBGAME}/Tools/Scripts:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/usr/local/share/npm/bin:$HOME/bin:$LIBMOBILEDEVICE:/opt/local/bin:/opt/local/sbin:/usr/local/bin:${GAE_SDK_ROOT}:${GOPATH}/bin:${PATH}

# GCP
source ~/.gcp.env

# Aliases
alias a=alias
a chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
a vgs='vagrant global-status'
a vrp='vagrant reload --provision'
a h=history
#a npm-exec='PATH=$(npm bin):$PATH'
#a mdfind=
a mdfind\ 'kMDItemFSName='
a myip='ifconfig en0 | grep "inet " | cut -d " " -f2'
a activate=$PYENV_ROOT/versions/anaconda3-4.1.0/bin/activate
a kc=kubectl
a kcg='kubectl get'
a kcd='kubectl describe'
a kcdf='kubectl delete --grace-period=0 --force'
a gcl='gcloud'
a jxa=osascript
a sls serverless

# Alias function
function mdfname(){
  mdfind "kMDItemFSName=$1"
}

# STF
function stf() {
  host=$1
  case "$host" in
    stf*)   user=swet-stf; pass=55Mobage;;
    macpro) user=swet-jenkins; pass=ev9ch8YH6V;;
    provider-mini) user=swet-stf; pass=E7fWspEkXa;;
    fuji*)  user=stf; pass=55Mobage;;
    provider-fuji) user=alsys-jenkins; pass=pfhExBmtP2;;
  esac

  ping -c 1 -q $host > /dev/null || {echo "Ping to host: $host failed." && return 1}
  /usr/local/bin/sshpass -p $pass ssh $user@$host
}

# General setting
set -o ignoreeof
setopt list_types
setopt auto_menu
setopt magic_equal_subst
setopt extended_glob

#PROMPT='%F{green}[%n@%m %C]$%f '
PROMPT='%F{magenta}[%m@%C]$%f '

#ZSH_THEME="agnoster"

# Zplug
source ~/.zplug/init.zsh

# Antigen
#if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
#  source $HOME/.zsh/antigen/antigen.zsh
#  antigen bundle zsh-users/zsh-syntax-highlighting
#  antigen bundle mollifier/anyframe
#  antigen apply
#fi

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
#autoload -Uz add-zsh-hook
#autoload -Uz vcs_info

#zstyle ':vcs_info:*' formats '[%b]'
#zstyle ':vcs_info:*' actionformats '[%b|%a]'

#function _update_vcs_info_msg() {
#  psvar=()
#  LANG=en_US.UTF-8 vcs_info
#  psvar[1]="$vcs_info_msg_0_"
#}
#add-zsh-hook precmd _update_vcs_info_msg
#RPROMPT="%F{blue}%v%f"

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


# Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

function stf() {
  host=$1
  case "$host" in
    stf*)   user=swet-stf; pass=55Mobage;;
    macpro) user=swet-jenkins; pass=ev9ch8YH6V;;
    provider-mini) user=swet-stf; pass=E7fWspEkXa;;
    fuji*)  user=stf; pass=55Mobage;;
    provider-fuji) user=alsys-jenkins; pass=pfhExBmtP2;;
  esac

  ping -c 1 -q $host > /dev/null || {echo "Ping to host: $host failed." && return 1}
  /usr/local/bin/sshpass -p $pass ssh $user@$host
}

function provider() {
    command=$1
    plist=/Library/LaunchDaemons/com.dena.swet.stf.provider.plist
    bundleid=com.dena.swet.stf.provider
    case "$command" in
	start)  sudo launchctl load $plist;;
	stop)   sudo launchctl unload $plist;;
	status) sudo launchctl list $bundleid &> /dev/null && echo "Running" || echo "Not running";;
	restart) sudo launchctl unload $plist && sleep 3 && sudo launchctl load $plist;;
	*) echo "Usage: ${FUNCNAME[0]} (start|stop|restart|status)"
    esac
}


# BEGIN Ansible managed block for anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
eval "$(pyenv virtualenv-init -)"
# END Ansible managed block for anyenv

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Powerlvevel9k
#source  ~/repos/powerlevel9k/powerlevel9k.zsh-theme
#POWERLEVEL9K_MODE='nerdfont-complete'
##POWERLEVEL9K_COLOR_SCHEME='light'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir status)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#DISABLE_UPDATE_PROMPT=true
##zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Powerlevel10k
#zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
source ~/repos/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
DISABLE_UPDATE_PROMPT=true
#zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme


#OKTAAWS
#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/omata.yuichi/.config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

### ZNT's installer added snippet ###
#fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
#autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
#autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
#alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
#alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
#zle -N znt-history-widget
#bindkey '^R' znt-history-widget
#setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
#zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###
