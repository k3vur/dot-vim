#!/usr/bin/env sh

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
vim +BundleInstall +qall

echo
echo "compiling YouCompleteMe..."
pushd ./bundle/YouCompleteMe
./install.sh --clang-completer
popd
