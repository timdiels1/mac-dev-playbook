# Mac Development Ansible Playbook

[![Build Status](https://travis-ci.org/timdiels1/mac-dev-playbook.svg?branch=master)](https://travis-ci.org/timdiels1/mac-dev-playbook)

This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have some manual installation steps, but at least it's all documented here.

This is a work in progress, and is mostly a means for me to document my current Mac's setup. I'll be evolving this set of playbooks over time.

## Installation

### Normal install

  1. [Install Ansible](http://docs.ansible.com/intro_installation.html).
  2. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  3. Clone this repository to your local drive.
  4. Run `$ ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  5. Run `ansible-playbook main.yml -i inventory -K` inside this directory. Enter your account password when prompted.

> Note: If some Homebrew commands fail, you might need to agree to XCode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

### Fast Install

If you'd like to start with my default list of tools and apps (see Included Apps/Config below), then simply install with;

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/timdiels1/mac-dev-playbook/master/install.sh)"


You can always customize the install after-the-fact (see below), and re-run the playbook. It will skip over any installed apps.

## Overriding Defaults

Not everyone's development environment and preferred software configuration is the same.

You can override any of the defaults configured in `default.config.yml` by creating a `config.yml` file and setting the overrides in that file. For example, you can customize the installed packages and apps with something like:

    homebrew_installed_packages:
      - cowsay
      - git
      - go
    
    mas_installed_app_ids:
      - 443987910 # 1Password
      - 498486288 # Quick Resizer
      - 557168941 # Tweetbot
      - 497799835 # Xcode

Any variable can be overridden in `config.yml`; see the supporting roles' documentation for a complete list of available variables.

## Included Applications / Configuration (Default)

Applications (installed with Homebrew Cask):

  - [Docker](https://www.docker.com/)
  - [Dropbox](https://www.dropbox.com/)
  - [Fing](https://www.fing.io/)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - [Google Chrome](https://www.google.com/chrome/)
  - [Handbrake](https://handbrake.fr/)
  - [Homebrew](http://brew.sh/)
  - [Java](https://java.com)
  - [KDiff3](http://kdiff3.sourceforge.net/)
  - [LICEcap](http://www.cockos.com/licecap/)
  - [LimeChat](http://limechat.net/mac/)
  - [MacVim](http://macvim-dev.github.io/macvim/)
  - [Menu Meters](https://www.ragingmenace.com/software/menumeters/) (Note: Currently using [this fork](http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/) for compatibility)
  - [nvALT](http://brettterpstra.com/projects/nvalt/)
  - [Sequel Pro](https://www.sequelpro.com/) (MySQL client)
  - [Skype](https://www.skype.com/en/)
  - [Skitch](https://evernote.com/skitch/)
  - [Slack](https://slack.com/)
  - [Sublime Text](https://www.sublimetext.com/)
  - [Transmit](https://panic.com/transmit/) (S/FTP client)
  - [Vagrant](https://www.vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  - [VLC](http://www.videolan.org/vlc/index.html)

Packages (installed with Homebrew):

  - autoconf
  - bash-completion
  - chromedriver
  - doxygen
  - gettext
  - git
  - go
  - gpg
  - hub
  - httpie
  - iperf
  - libdvdcss
  - libevent
  - packer
  - python
  - sqlite
  - mcrypt
  - mysql
  - npm
  - nvm
  - php70
  - php70-mcrypt
  - php70-xdebug
  - ssh-copy-id
  - cowsay
  - readline
  - subversion
  - openssl
  - pv
  - drush
  - wget
  - wrk

My [dotfiles](https://github.com/geerlingguy/dotfiles) are also installed into the current user's home directory, including the `.osx` dotfile for configuring many aspects of macOS for better performance and ease of use.

Finally, there are a few other preferences and settings added on for various apps and services.

## Future additions

### Things that still need to be done manually

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

  1. Set JJG-Term as the default Terminal theme (it's installed, but not set as default automatically).
  2. Install [Sublime Package Manager](http://sublime.wbond.net/installation).
  3. Install all the apps that aren't yet in this setup (see below).
  4. Remap Caps Lock to Escape (requires macOS Sierra 10.12.1+).
  5. Set trackpad tracking rate.
  6. Set mouse tracking rate.
  7. Configure extra Mail and/or Calendar accounts (e.g. Google, Exchange, etc.).

### Applications/packages to be added:

These are mostly direct download links, some are more difficult to install because of custom installers or other nonstandard install quirks:

  - [Adobe Creative Cloud](http://www.adobe.com/creativecloud.html)

## Testing the Playbook

This project is [continuously tested on Travis CI's macOS infrastructure](https://travis-ci.org/timdiels1/mac-dev-playbook).

## Ansible for DevOps

Check out [Ansible for DevOps](https://www.ansiblefordevops.com/), which teaches you how to automate almost anything with Ansible.

## Author

[Tim Diels](http://www.tim-diels.be/), 2016.

## Inspiration

### Ansible playbook

[geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)

### Install script

[siyelo/laptop](https://github.com/siyelo/laptop)
