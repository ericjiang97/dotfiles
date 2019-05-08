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
    # Install Wget
    brew install wget
fi

# Install Git
which -s git
if [[ $? != 0 ]]; then 
    brew install git
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### ======= SETUP VIM & ZSH CONFIGURATIONS ======= 
cp ./.config/.vimrc ~/.vimrc

### ======= iTerm2 Setup + ZSH Setup =======
sh -c "cd temp && wget https://iterm2.com/downloads/stable/latest -O latest.zip && unzip latest.zip"
mv ./temp/iTerm.app ~/Applications/iTerm.app
rm -rf ./temp/iTerm.app
cp ./com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
# Powerline Fonts
sh -c "cd temp && git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd .. && rm -rf fonts"
cp ./.config/.zshrc ~/.zshrc
chsh -s /bin/zsh

# ======= Setup VSCode Dev Environment =======  
brew cask install visual-studio-code
cp ./vscode.json ~/Library/Application Support/Code/User/settings.json

# ======= Setup JAVA Dev Environment  =======
brew cask install java8
brew cask install java
brew install gradle

# ======= Setup NodeJS Dev Environment ======= 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node10
nvm use node10
brew install yarn --ignore-dependencies # install yarn without node depdenency

# ======= Install Google Cloud SDK =======
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# ======= Folder Setup =======
cd ~/Documents
mkdir Uni Work Work/MonPlan Tools

# ======= Open Apps =======
open ~/Applications/iTerm.app
