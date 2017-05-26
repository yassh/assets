echo 'start `brew update`'
brew update
echo 'start `brew upgrade`'
brew upgrade
echo 'start `brew cleanup`'
brew cleanup
echo 'start `brew cask install --force $(brew cask list)`'
brew cask install --force $(brew cask list)
echo 'start `brew cask cleanup`'
brew cask cleanup

echo 'start `npm update -g`'
npm update -g
