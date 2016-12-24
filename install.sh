# Remove old .vim directory if one already exists and then create an empty one
#cd ~
#if [ -d ".vim" ]; then
#  rm -rf ".vim"
#fi
#mkdir ".vim"

# Install Neovim
#apt-get install software-properties-common
#add-apt-repository ppa:neovim-ppa/unstable
#apt-get install neovim

# Transfer the contents of my vim config to the .vim folder
mv vimconfig/* .vim/
cd .vim/
rm -rf vimconfig/

# Create symlink for the .vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

# Get Vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Have Vundle fetch the plugins
nvim +PluginInstall +qall

# Install YouCompleteMe
cd bundle/YouCompleteMe/
./install.py --clang-completer

