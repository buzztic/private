#!/usr/bin/env bash
# Setup script for setting up a new macos machine
echo "Starting setup"
# install xcode CLI
xcode-select —-install
# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    git
    python@3.12
    ipython
    grep
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
CASKS=(
    slack
    spotify
    cursor
    1password
    notion
    brave-browser
    onyx
)
echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Intalling fancy git"
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh


echo "Macbook setup completed!"
