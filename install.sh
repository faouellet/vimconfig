# Create a .vim folder if one is not present
cd ~
mkdir .vim

# Transfer the content to the .vim folder
mv vimconfig/* .vim/
cd .vim/
rmdir vimconfig/

# Create symlink for the dotfiles
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.ycm_extra_conf.py ~/.ycm_extra_conf.py

# Get the submodules
git submodule init
git submodule update --init --recursive

# Install YouCompleteMe
cd bundle/YouCompleteMe/
./install.py --clang-completer

