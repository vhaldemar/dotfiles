DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLD_PWD=$(pwd)

for name in vim vimrc tmux.conf; do
	if [[ -f $HOME/.$name || -d $HOME/.$name || -L $HOME/.$name ]]; then
		mv $HOME/.$name $HOME/.$name\.bak
	fi

	ln -s $DIR/$name $HOME/.$name
done

cd $DIR

if [[ -d $DIR/vim/bundle ]]; then
	rm -rf $DIR/vim/bundle
fi

git submodule init
git submodule update

vim +PluginInstall +qall

# sudo apt-get install python-flake8 ghc-mod

if [[ ! -d $DIR/vim/backup ]]; then
	mkdir $DIR/vim/backup
fi

if [[ ! -d $DIR/vim/undo ]]; then
	mkdir $DIR/vim/undo
fi

cd $DIR/vim/bundle/YouCompleteMe && ./install.sh

cd $OLD_PWD
