#!/bin/sh

echo "Take a coffee this will take a while..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install PHP extensions with PECL
pecl install memcached imagick

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Create sites subdirectories
mkdir $HOME/Sites/laravel

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink vim prefs
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
rm $HOME/.vim
ln -s $HOME/.dotfiles/.vim $HOME/.vim

# Symlink .hushlogin
rm -rf $HOME/.hushlogin
ln -s $HOME/.dotfiles/.hushlogin $HOME/.hushlogin

# Symlink .gitignore_global
rm -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
