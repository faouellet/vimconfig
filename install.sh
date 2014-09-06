# Create symlink for the dotfiles
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/.ycm_extra_conf.py

# Get the submodules
git submodule init
git submodule update --init --recursive

# Install YouCompleteMe
cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=~/llvm_build/Release/lib . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
