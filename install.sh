# Remove old .vim directory if one already exists and then create an empty one
cd ~
if [ -d ".vim" ]; then
  rm -rf ".vim"
fi
mkdir ".vim"

# To be sure I can add the neovim repository
apt-get install python-software-properties

# Install Neovim
apt-get install software-properties-common
add-apt-repository ppa:neovim-ppa/unstable
apt-get install neovim

# Transfer my .vimrc to the .vim folder
mv vimconfig/.vimrc .vim/
cd .vim/
rm -rf vimconfig/

# Setup my Neovim configuration
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Create symlink for the .vimrc
ln -s ~/.vim/.vimrc ~/.vimrc

# Prerequisite for the Python modules
apt-get install python-dev python-pip python3-dev python3-pip

# Neovim Python support
pip install --upgrade neovim

# Get Vundle plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Have Vundle fetch the plugins
nvim +PluginInstall +qall

# Install YouCompleteMe
cd bundle/YouCompleteMe/
./install.py --clang-completer

