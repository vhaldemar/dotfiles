DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in vim vimrc tmux.conf; do
    if [[ -f $HOME/.$name || -d $HOME/.$name || -L $HOME/.$name ]]; then
        mv $HOME/.$name $HOME/.$name\.bak
    fi

    ln -s $(pwd)/$name $HOME/.$name
done

git clone git clone https://github.com/VundleVim/Vundle.vim.git $DIR/bundle/Vundle.vim

vim +PluginInstall +qall

# sudo apt-get install python-flake8 ghc-mod

cd $DIR/bundle/YouCompleteMe && ./install.sh && cd -
