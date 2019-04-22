#.bin
rm -r ~/.bin
ln -s ~/dotfiles/.bin ~/.bin

#compton
rm ~/.config/compton.conf
ln -s ~/dotfiles/compton.conf ~/.config/compton.conf

#emacs
rm -r ~/.emacs.d
ln -s ~/dotfiles/.emacs.d ~/.emacs.d
