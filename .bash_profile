#. $HOME/.bashrc

set -o ignoreeof
#export PS1="[\u@\h \W]\\$ "
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export NODE_PATH=/usr/local/lib/node
export NODE_PATH=/opt/local/lib/node_modules
ADK_HOME=${HOME}/dev/android/sdk
#ADK_HOME=/opt/share/repos/WebGame/android/DevKits/sdk/
#ADK_HOME=/opt/local/android/sdk
export JSDOCDIR=/opt/local/jsdoc-toolkit
export JSDOCTEMPLATEDIR=${JSDOCDIR}/templates/jsdoc
YUI=${HOME}/dev/tools/yuicompressor-2.4.2/build
GLCC=${HOME}/dev/tools/glcc
JSL=${HOME}/dev/tools/jsl-0.3.0-mac
WEBGAME=${HOME}/dev/ngcore/repos/WebGame
QA=/opt/share/repos/ngQA
LIBMOBILEDEVICE=/opt/libmobiledevice
#export DYLD_LIBRARY_PATH=$LIBMOBILEDEVICE/:$DYLD_LIBRARY_PATH
#export ANDROID_HOME=$HOME/dev/adt/sdk
export ANDROID_HOME=$HOME/dev/android/sdk
#export ANDROID_HOME=/Users/omata.yuichi/dev/android/sdk
#export ANDROID_HOME=$ADK_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export ANT_HOME=/opt/ant
#export M2_HOME=/opt/maven
#export M2=$M2_HOME/bin
export RUBYGEMS_GEMDEPS=-

export PATH=/usr/local/heroku/bin:$(npm bin):${HOME}/bin:$QA/bin:$JAVA_HOME/bin:$ANT_HOME/bin:${WEBGAME}/Tools/Scripts:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:/usr/local/share/npm/bin:$HOME/bin:$LIBMOBILEDEVICE:/opt/local/bin:/opt/local/sbin:/usr/local/bin:${PATH}
#export PATH=${HOME}/bin:$QA/bin:${HOME}/.gem/ruby/1.8/bin:${WEBGAME}/Tools/Scripts:${ADK_HOME}/tools:${ADK_HOME}/platform-tools:/usr/local/share/npm/bin:$HOME/bin:$LIBMOBILEDEVICE:${PATH}

##
# Your previous /Users/omata.yuichi/.bash_profile file was backed up as /Users/omata.yuichi/.bash_profile.macports-saved_2011-02-08_at_20:53:49
##


alias a=alias
#a ls="ls -ltr"
#a lls="/bin/ls"
a jsl="${JSL}/jsl"
a yuic="java -jar ${YUI}/yuicompressor-2.4.2.jar"
a glcc="java -jar ${GLCC}/compiler.jar"
a vmrun="/Library/Application\ Support/VMware\ Fusion/vmrun"
a ass="$ADK_HOME/tools/monkeyrunner $ADK_HOME/tools/mr/scripts/ss.py"
a mysql=/usr/local/mysql/bin/mysql
a mysqladmin=/usr/local/mysql/bin/mysqladmin
a plistbuddy=/usr/libexec/PlistBuddy
#a resign='/usr/bin/codesign -fv -s "iPhone Developer: miura ichiro (NS74525997)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
#a resignsdk='/usr/bin/codesign -fv -s "iPhone Developer: masao kobayashi (GDBB286FBP)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
a resignsdk='/usr/bin/codesign -fv -s "iPhone Developer: RYOSUKU IWANAGA (4ME25R82MW)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
a resignsdk4='/usr/bin/codesign -fv -s "iPhone Developer: masao kobayashi (GDBB286FBP)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
a resignsdk2='/usr/bin/codesign -fv -s "iPhone Developer: Ryosuke Iwanaga (WUNGCMNQXD)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
a resignsdk3='/usr/bin/codesign -fv -s "iPhone Developer: RYOSUKE IWANAGA (Z32CD4C9BQ)" iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app'
a resign='/usr/bin/codesign -fv -s "iPhone Developer: RYOSUKU IWANAGA (4ME25R82MW)" '
a resign4='/usr/bin/codesign -fv -s "iPhone Developer: masao kobayashi (GDBB286FBP)" '
a resign2='/usr/bin/codesign -fv -s "iPhone Developer: Ryosuke Iwanaga (WUNGCMNQXD)" '
a resign3='/usr/bin/codesign -fv -s "iPhone Developer: RYOSUKE IWANAGA (Z32CD4C9BQ)" '
a vibc='vi iOS/Release-iphoneos/webgame_JP_LIVE_SAND_SDK.app/bootconfig.xml'
a vibcus='vi iOS/Release-iphoneos/webgame_US_LIVE_SAND_SDK.app/bootconfig.xml'
a visim='vi iOS/Release-iphonesimulator/webgame_JP_LIVE_SAND_SDK-iPhone-Simulator.app/Contents/Resources/EmbeddedApp/webgame.app/bootconfig.xml'
a visimus='vi iOS/Release-iphonesimulator/webgame_US_LIVE_SAND_SDK-iPhone-Simulator.app/Contents/Resources/EmbeddedApp/webgame.app/bootconfig.xml'
a runsim='open iOS/Release-iphonesimulator/webgame_JP_LIVE_SAND_SDK-iPhone-Simulator.app'
a runsimus='open iOS/Release-iphonesimulator/webgame_US_LIVE_SAND_SDK-iPhone-Simulator.app'
a replaceNGWindow="find . -name '*.js' -exec sed -i -e 's/NGWindow/UI.Window/g' {} \;"
a jake='node $WEBGAME/Tools/jake/lib/jake.js'
a jake-build='../../Tools/jake/lib/jake.js -f ../../Tools/prepare/build.jake build'
a package='./ngPackager.js --bakeGame --gamePath '
a jarsigner='/usr/bin/jarsigner -J-Dfile.encoding=UTF-8'
a keytool='/usr/bin/keytool -J-Dfile.encoding=UTF-8'
#a sudo='sudo '
a ipfw='sudo ipfw'
a ipflush='sudo ipfw -f flush && sudo ipfw -f pipe flush'
a adbver='adb shell getprop ro.build.version.release'
a mysql=/usr/local/mysql/bin/mysql
a mysqladmin=/usr/local/mysql/bin/mysqladmin

# . /opt/local/.nvm/nvm.sh
function runsimg()
{
    # $1: Game path to run, e.g. Samples/Launcher
    #sed -i -e "s#NgStartingGame\">\(.*\)<#NgStartingGame\">$1<#" iOS/Release-iphonesimulator/webgame_JP_LIVE_SAND_SDK-iPhone-Simulator.app/Contents/Resources/EmbeddedApp/webgame.app/bootconfig.xml
    sed -i -e "s#NgStartingGame\'>\(.*\)<#NgStartingGame\'>$1<#" iOS/Release-iphonesimulator/webgame_JP_LIVE_SAND_SDK-iPhone-Simulator.app/Contents/Resources/EmbeddedApp/webgame.app/bootconfig.xml
    runsim
}
function arunjp() 
{
  case $# in
    1 ) adb shell am start -a com.mobage.jp.RUN -e server http://`myip`:8002 -e game $1;;
    2 ) adb shell am start -a com.mobage.jp.RUN -e server $1 -e game $2;;
    * ) echo "Usage: arunjp [URL:port] GameToRun";;
  esac
}

function arunww() 
{
  case $# in
    1 ) adb shell am start -a com.mobage.ww.RUN -e server http://`myip`:8002 -e game $1;;
    2 ) adb shell am start -a com.mobage.ww.RUN -e server $1 -e game $2;;
    * ) echo "Usage: arunww [URL:port] GameToRun";;
  esac
}

function arunkr() 
{
  case $# in
    1 ) adb shell am start -a com.mobage.kr.sb.RUN -e server http://`myip`:8002 -e game $1;;
    2 ) adb shell am start -a com.mobage.kr.sb.RUN -e server $1 -e game $2;;
    * ) echo "Usage: arunkr [URL:port] GameToRun";;
  esac
}
function setfacl()
{
  case $# in 
    2 ) sudo chmod +a "$1 allow read,write,delete,add_file,add_subdirectory,file_inherit,directory_inherit" $2;;
    * ) echo "Usage: setfacl UserID File|Directory";;
  esac
}

function setfaclr()
{
  case $# in 
    2 ) sudo chmod -R +a "$1 allow read,write,delete,add_file,add_subdirectory,file_inherit,directory_inherit" $2;;
    * ) echo "Usage: setfaclr UserID File|Directory";;
  esac
}


##
# Your previous /Users/omata.yuichi/.bash_profile file was backed up as /Users/omata.yuichi/.bash_profile.macports-saved_2012-06-06_at_19:28:45
##

# MacPorts Installer addition on 2012-06-06_at_19:28:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#eval "$(rbenv init -)"
