#!/bin/sh

### ======= GET LIBRRIES/MODULES ======= 

# Check if brew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check if wget is installed
which -s wget
if [[ $? != 0 ]] ; then
    # Install Homebrew
    brew install wget
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### ======= SETUP VIM & ZSH CONFIGURATIONS ======= 
cp ./.vimrc ~/.vimrc

### ======= iTerm2 Setup + ZSH Setup =======
sh -c "cd temp && wget https://iterm2.com/downloads/stable/latest -O latest.zip && unzip latest.zip"
mv ./temp/iTerm.app ~/Applications/iTerm.app
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
# Powerline Fonts
sh -c "cd temp && git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts"
cp ./.zshrc ~/.zshrc
chsh -s /bin/zsh

# Setup Development Environment
brew cask install visual-studio-code


open ~/Applications/iTerm.app