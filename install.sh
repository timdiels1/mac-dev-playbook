#!/bin/sh

# Welcome to the laptop install script!
#
# This script bootstraps the OSX laptop to a point where we can run
# Ansible on localhost.
#  1. Installs 
#    - xcode
#    - homebrew
#    - ansible (via brew) 
#
# It will ask you for your sudo password

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo "Boostrapping ..."

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
# sudo -v
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Ensure Apple's command line tools are installed
if ! command -v cc >/dev/null; then
  fancy_echo "Installing xcode ..."
  xcode-select --install 
else
  fancy_echo "Xcode already installed. Skipping."
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
  fancy_echo "Homebrew already installed. Skipping."
fi

# [Install Ansible](http://docs.ansible.com/intro_installation.html).
if ! command -v ansible >/dev/null; then
  fancy_echo "Installing Ansible ..."
  brew install ansible 
else
  fancy_echo "Ansible already installed. Skipping."
fi

# Clone the repository to your local drive.
if [ -d "~/Workspace/mac-dev-playbook" ]; then
  fancy_echo "Mac-dev-playbook repo dir exists. Removing ..."
  rm -rf ~/Workspace/mac-dev-playbook/
fi
fancy_echo "Cloning mac-dev-playbook repo ..."
cd ~/Workspace/
git clone https://github.com/timdiels1/mac-dev-playbook.git 

fancy_echo "Changing to laptop repo dir ..."
cd ~/Workspace/mac-dev-playbook
