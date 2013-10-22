#!/usr/bin/env sh

function getAbsolutePath() {
	pushd $(dirname $1) > /dev/null
	echo $(PWD)
	popd > /dev/null
}

if ! which -s vim; then
	echo "error: vim not found"
	echo "install vim and try again"
	exit 1
fi

if ! which -s git; then
	echo "error: git not found"
	echo "install git and try again"
	exit 1
fi

if [ $(getAbsolutePath $0) != $HOME/.vim ]; then
	echo "error: not installed into $HOME/.vim directory"
	echo "move this directory to $HOME/.vim and try again"
	exit 1
fi

if [ ! -f $HOME/.vimrc ]; then
	echo
	echo "symlinking vimrc to $HOME/.vimrc"
	ln -s $HOME/.vim/vimrc $HOME/.vimrc
fi

pushd .vim > /dev/null

echo
echo "fetching vundle..."
it submodule init
git submodule update

echo
echo "installing vundle bundles"
vim +BundleInstall +qall

echo
echo "compiling YouCompleteMe..."
pushd ./bundle/YouCompleteMe > /dev/null
./install.sh --clang-completer
popd > /dev/null

if [ $(uname -s) = "Darwin" ]; then
	echo
	if ! which -s mvim; then
		echo "consider installing MacVim (old vim versions don't support all the plugins):"
		echo "brew install macvim"
		echo
	fi
	echo "consider symlinking vim to mvim (given that $HOME/bin is in your \$PATH):"
	echo "ln -s $(which mvim) $HOME/bin/vim"
fi

popd > /dev/null

