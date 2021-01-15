#!/ bin/bash

script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

source ${script_dir}/helpers.sh

### install homebrew if not installed
if ! type -P brew > /dev/null ; then
  green "installing homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

green "finished installing homebrew"

### update and upgrade homebrew and packages
green "updating homebrew ..."

# Check your system for potential problems
brew doctor
# Fetch the newest version of Homebrew and all formulae from GitHub using git and perform any necessary migrations
brew update
# Show formulae that have an updated version available
brew outdated
# Upgrade outdated, unpinned brews (with existing install options)
brew upgrade

green "finished updating homebrew ..."

### add repositories
repositories="homebrew/cask homebrew/services wix/brew heroku/brew"
for repository in ${repositories} ; do
  if [ "`brew tap | grep ${repository}`" != "${repository}" ] ; then
    green "brew tapping ${repository} ..."
    brew tap ${repository}
  fi
done
green ""
green "finished brew tap ..."
green ""

### install packages
package_list="applesimutils
              colordiff
              composer
              coreutils
              docker
              gettext
              gh
              ghostscript
              gnu-sed
              graphviz
              heroku
              httpd
              mysql
              node
              php
              php@7.4
              phpmyadmin
              php-cs-fixer
              pkg-config
              sass/sass/sass
              svn
              tree
              unrar
              watchman
              wget
              wireshark
              wp-cli
              wp-cli-completion
              yarn
              yarn-completion
              zsh-completions
              zsh-autosuggestions
              zsh-syntax-highlighting"

for package in ${package_list} ; do
  if [ "`brew list --formula | grep ^${package}$`" != "${package}" ] ; then
    green "installing ${package} ..."
    brew install ${package}
  fi
done

### install packages on cask
package_list="appcleaner
              chatwork
              chromedriver
              db-browser-for-sqlite
              docker
              dropbox
              firefox
              flux
              fontforge
              futubull
              imageoptim
              iterm2
              mpv
              sequel-pro
              simple-comic
              sketch
              skim
              skype
              tinypng4mac
              tor-browser
              typora
              visual-studio-code
              zoom"

for package in ${package_list} ; do
  if [ "`brew list --cask | grep ^${package}$`" != "${package}" ] ; then
    green "installing ${package} ..."
    brew install --cask ${package}
  fi
done

green "finishing installing packages ..."
brew -v
brew list
brew cleanup -s
rm -rf $(brew --cache)
green "finished installing homebrew packages ..."

green "start service Apache, PHP and MySQL at login..."
brew services restart httpd
brew services restart php
brew services restart mysql

brew unlink yarn && brew link yarn

wp package install wp-cli/dist-archive-command
