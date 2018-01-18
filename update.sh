DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OLD_PWD=$(pwd)

git submodule update

vim +PluginUpdate +qall

cd $DIR/vim/bundle/YouCompleteMe && ./install.sh

cd $OLD_PWD
