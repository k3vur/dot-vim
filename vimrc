 "Screw vi-compatible mode
 "
set nocompatible

" vundle
filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" vim plugins

" toggle comments
Bundle 'scrooloose/nerdcommenter'

" syntax checker
Bundle 'scrooloose/syntastic'

" file explorer
Bundle 'scrooloose/nerdtree'

" auto complete
Bundle 'Valloric/YouCompleteMe'

" code snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" color scheme
Bundle 'nanotech/jellybeans.vim'

" fancy status bar
Bundle 'itchyny/lightline.vim'

" mark git diffs in line numbers
Bundle 'airblade/vim-gitgutter'

" auto close parentheses, ...
Bundle 'Raimondi/delimitMate'

" move stuff around
Bundle 'matze/vim-move'

" I have no idea what it does, but important
filetype plugin indent on


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" (syntax) coloring
syntax on
set t_Co=256           " terminal color 256
set background=dark    " Dunkler Hintergrund
colorscheme jellybeans


" interface
set cursorline   " highlight current line
set number       " Show Line numbers
set vb t_vb=     " disable beep and flashing
set laststatus=2 " always show status bar
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands

" Searching
set hlsearch	" Search highlighting
set incsearch	" do incremental searching
set ignorecase	" case-insensitive
set smartcase	" case-SENSITIVE with capital letters

" vim behavior
set autoindent	               " always set auto indenting on
set nowrap	               " Don't break lines
set autochdir                  " always use current directory
set backspace=indent,eol,start " allow backspacing over everything
set backup                     " keep backups in /tmp
set backupdir=/tmp
set directory=/tmp
set clipboard=unnamed          " yank to clipboard

" make completion in :edit mode more bash-style
set wildmenu
set wildmode=list:longest

"set ts=4 sts=0 sw=4 noexpandtab " Tab Width

" MacVIM Gui-Options
if has("gui_running")
	set guifont=Source\ Code\ Pro:h14 " Default Font
	set guioptions-=T                 " remove toolbar
	set linespace=6                   " Line height
	set spell                         " spell checking

	" Invisible characters
	set list             " display tab character
	set listchars=tab:▸\ " set tab character
endif " gui_running

" Python 4 Spaces als Tab
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Bright scheme for LaTeX
au FileType tex set background=light
au FileType tex nmap <Leader>m :!make<CR>

" YCM
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Keymappings
let mapleader=','

" lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype', 'syntastic']]
    \ },
    \ 'component_expand': {
    \     'syntastic': 'SyntasticStatuslineFlat'
    \ },
    \ 'component_type': {
    \      'syntastic': 'middle'
    \ },
    \ 'subseparator': {
    \     'left': '|', 'right': '|'
    \ }
    \}

" Insert date
nmap <Leader>d 0!!date +\%Y-\%m-\%d<CR>

" un-highlight search matches
nnoremap <silent> <Leader>h :nohl<CR><Leader>h

" NERDTree
nmap <Leader>e :NERDTreeToggle<CR>

" NERDcommenter
nmap <D-7> <Leader>c<space>
vmap <D-7> <Leader>c<space>


"""""""""""""""
" Text Moving "
"""""""""""""""

" uses matze/vim-move
nmap <C-A-Up> <A-k>
nmap <C-A-Down> <A-j>
vmap <C-A-Up> <A-k>
vmap <C-A-Down> <A-j>

" Tab / Shift-tab to indent
nmap <S-Tab> <<
nmap <Tab> >>
vmap <Tab> >gv
vmap <S-Tab> <gv

" Indenting keeps selection
vnoremap < <gv
vnoremap > >gv
nmap gV `[v`]
