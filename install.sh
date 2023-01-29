#!/bin/bash

# Make sure prompt string is passed in
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 PROFILE_PROMPT_PREFIX" >&2
  exit 1
fi

# Check that we are up to date and have basic requirements
echo "Checking for curl and wget"
apt-get -qq -y update
apt-get -qq -y install curl wget git zsh
chsh -s /bin/zsh

# Set permissions for install script folder
chmod -R u+x install/

# Install required dependencies
./install/dependencies.sh

# Set timezone
echo "Checking for timezone"
ln -snf /usr/share/zoneinfo/America/Vancouver /etc/localtime

# Generate locale
locale-gen en_US.UTF-8

# Install and setup oh-my-zsh shell awesomizer
./install/oh-my-zsh.sh $1

# Install and setup asdf version manager
./install/asdf.sh

# Install tools
./install/tools.sh

# Change to zsh shell
exec zsh -l