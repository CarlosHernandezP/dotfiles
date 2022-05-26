# Symlinks all config files such that we can directly modify the
# config files in this directory, instead of the files in ~/.config

# If there are existing configs, they need to be removed
# Before symlinking to the ones in these dotfiles
# TODO: Find nicer way of not duplicating all these checks
if [ -d ~/.config/zathura ]; then
  rm -rf ~/.config/zathura
fi
if [ -d ~/.config/kitty ]; then
  rm -rf ~/.config/kitty
fi
if [ -d ~/.config/rofi ]; then
  rm -rf ~/.config/rofi
fi
if [ -d ~/.config/dunst ]; then
  rm -rf ~/.config/dunst
fi
if [ -d ~/.config/tmux ]; then
  rm -rf ~/.config/tmux
fi
if [ -d ~/.config/i3 ]; then
  rm -rf ~/.config/i3
fi
if [ -d ~/.config/nvim ]; then
  rm -rf ~/.config/nvim
fi

ln -sf ~/dotfiles/zathura ~/.config/
ln -sf ~/dotfiles/kitty ~/.config/
ln -sf ~/dotfiles/rofi ~/.config/
ln -sf ~/dotfiles/dunst ~/.config/
ln -sf ~/dotfiles/tmux ~/.config/
ln -sf ~/dotfiles/i3 ~/.config/
ln -sf ~/dotfiles/nvim ~/.config/

ln -sf ~/dotfiles/compton/compton.conf ~/.config/compton.conf

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/fzf.zsh ~/.fzf.zsh

#rm ~/.config/zathura/zathura
#rm ~/.config/compton/compton
#rm ~/.config/kitty/kitty
#rm ~/.config/rofi/rofi
#rm ~/.config/dunst/dunst
#rm ~/.config/tmux/tmux
#rm ~/.config/i3/i3
