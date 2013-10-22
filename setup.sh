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
pushd ./bundle/YouCompleteMe > /dev/null
./install.sh --clang-completer
popd > /dev/null

echo
echo "symlinking .vimrc"
ln -s $HOME/.vim/vimrc $HOME/.vimrc

if [ $(uname -s) = "Darwin" ]; then
	echo
	if ! which -s mvim; then
		echo "consider installing MacVim (old vim versions don't support all the plugins):"
		echo "brew install macvim"
		echo
	fi
	echo "also consider symlinking vim to mvim (given that $HOME/bin is in your \$PATH):"
	echo "ln -s $(which mvim) $HOME/bin/vim"
fi

