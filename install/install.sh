#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1
gitdir=$2

# dotfiles directory
dotfiledir=${homedir}/Documents/github/private/install

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Intalling fancy git
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh

# # Run the Homebrew Script
./brew.sh

echo "Macbook setup completed!"
