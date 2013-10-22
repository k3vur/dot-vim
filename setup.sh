#!/usr/bin/env sh

if ! which -s mvim; then
	echo "error: mvim not found"
	echo "install MacVim and try again"
	exit 1
fi

if ! which -s git; then
	echo "error: git not found"
	echo "install git and try again"
	exit 1
fi

echo
echo "fetching vundle..."
git submodule init
git submodule update

echo
echo "installing vundle bundles"
mvim -v +BundleInstall +qall

echo
echo "compiling YouCompleteMe..."
pushd ./bundle/YouCompleteMe > /dev/null
./install.sh --clang-completer
popd > /dev/null

echo
echo "symlinking .vimrc"
ln -s $HOME/.vim/vimrc $HOME/.vimrc

