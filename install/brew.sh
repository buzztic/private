#!/usr/bin/env bash
# Setup script for setting up a new macos machine
echo "Starting brew setup"
# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Install Brew Packages
brew install python
brew install ipython
brew install grep
brew install gnu-sed
brew install tree

echo "Cleaning up..."
brew cleanup

# Install MacOS Applications
brew cask install slack
brew cask install spotify
brew cask install cursor
brew cask install 1password
brew cask install notion
brew cask install brave-browser
brew cask install onyx
