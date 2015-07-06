
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  rename
  python
  node
  git
  docker
  boot2docker
  fish
  jmeter
  wget
  leiningen
  maven
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew tap homebrew/binary

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Apps
apps=(
  dropbox
  google-chrome
  java6
  java7
  java
  atom
  skype
  forklift
  intellij-idea
  lighttable
  virtualbox
  clipmenu
  evernote
  skitch
  p4merge
  asepsis
  adobe-reader
  hipchat
  sourcetree
  send-to-kindle
  vlc
  calibre
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# fish
## add fish to list of shells
sudo bash -c "echo \"/usr/local/bin/fish\" >> /etc/shells"

## change default shell
chsh -s /usr/local/bin/fish
omf install

# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Other configurations
mkdir /Users/jirkapenzes/dev/github
git clone https://github.com/jirkapenzes/dotfiles /Users/jirkapenzes/dev/github/dotfiles

dotfiles_path="/Users/jirkapenzes/dev/github/dotfiles/"
echo "DOT_FILES DIR: " >> $dotfiles_dir

# dev setup
sh $dotfiles_dir ".dev.sh"
