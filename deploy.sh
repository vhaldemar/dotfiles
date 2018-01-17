DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for name in vim vimrc tmux.conf; do
    if [[ -f $HOME/.$name || -d $HOME/.$name || -L $HOME/.$name ]]; then
        mv $HOME/.$name $HOME/.$name\.bak
    fi

    ln -s $DIR/$name $HOME/.$name
done

vim +PluginInstall +qall

# sudo apt-get install python-flake8 ghc-mod

mkdir $DIR/vim/backup
mkdir $DIR/vim/undo

cd $DIR/vim/bundle/YouCompleteMe && ./install.sh && cd -
