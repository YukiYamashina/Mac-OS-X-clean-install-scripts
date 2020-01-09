#!/ bin/bash

script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

source ${script_dir}/helpers.sh

### install homebrew if not installed
if ! type -P brew > /dev/null ; then
    green "installing homebrew ..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
repositories="homebrew/cask homebrew/services wix/brew"
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
              ghostscript
              gnu-sed
              httpd
              mysql
              node
              php
              phpmyadmin
              php-cs-fixer
              pkg-config
              sass/sass/sass
              tree
              unrar
              watchman
              wget
              wp-cli
              wp-cli-completion
              yarn
              yarn-completion"

for package in ${package_list} ; do
    if [ "`brew list | grep ${package}`" != "${package}" ] ; then
        green "installing ${package} ..."
        brew install ${package}
    fi
done

### install packages on cask
package_list="chromedriver"

for package in ${package_list} ; do
    if [ "`brew cask list | grep ${package}`" != "${package}" ] ; then
        green "installing ${package} ..."
        brew cask install ${package}
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

echo 'export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
