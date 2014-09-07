# Create symlink for the dotfiles
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.ycm_extra_conf.py ~/.ycm_extra_conf.py

# Get the submodules
git submodule init
git submodule update --init --recursive

# Install YouCompleteMe
cd ~

if ! test -d ${LLVM_SRC}; then
    mkdir ycm_temp
    cd ycm_temp
    wget llvm.org/releases/3.5.0/clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz 
    tar xvf clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
    mv clang+llvm-3.5.0-x86_64-linux-gnu/* .
    rm clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
    rmdir clang+llvm-3.5.0-x86_64-linux-gnu/
    cd ~
fi

mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DCMAKE_CXX_COMPILER=clang++ -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
