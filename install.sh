#i3
rm -r ~/.config/i3
ln -s ~/dotfiles/i3 ~/.config/i3

#.bin
rm -r ~/.bin
ln -s ~/dotfiles/.bin ~/.bin

#compton
rm ~/.config/compton.conf
ln -s ~/dotfiles/compton.conf ~/.config/compton.conf

#emacs
rm ~/.config/.emacs.d
ln -s ~/dotfiles/.emacs.d ~/.emacs.d

#bthemer
rm ~/.bthemer
ln -s ~/dotfiles/.bthemer ~/.bthemer
