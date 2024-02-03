# .bashrc

# Shortcuts
alias hg='history | grep'
# alias kill_all_docker="docker kill $(docker ps -q)"
alias gogit="cd ~/Documents/GitHub/"
alias goprivate="cd ~/Documents/github/private/"


# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

. ~/.fancy-git/prompt.sh
