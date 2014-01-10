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
"Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-vinegar'

" Fuzzy file opening
Bundle 'kien/ctrlp.vim'

" auto complete
Bundle 'Valloric/YouCompleteMe'

" code snippets
Bundle 'SirVer/ultisnips'

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

" documentation plugin
Bundle 'Keithbsmiley/investigate.vim'

" git support
Bundle 'tpope/vim-fugitive'

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
try 
  colorscheme jellybeans
catch
  " do nothing - this prevents the press ENTER to continue message
endtry


" interface
set cursorline   " highlight current line
set number       " Show Line numbers
set vb t_vb=     " disable beep and flashing
set laststatus=2 " always show status bar
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands

" Searching
set hlsearch     " Search highlighting
set incsearch    " do incremental searching
set ignorecase   " case-insensitive
set smartcase    " case-SENSITIVE with capital letters

" vim behavior
let mapleader=','              " make , the leader key
set autoindent	               " always set auto indenting on
set nowrap	               " Don't break lines
set autochdir                  " always use current directory
set backspace=indent,eol,start " allow backspacing over everything
set backup                     " keep backups in /tmp
set backupdir=/tmp
set directory=/tmp
set clipboard=unnamed          " yank to clipboard
set history=500

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
" set default clang-completer configuration
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" auto close preview windows on insertion
let g:ycm_autoclose_preview_window_after_insertion = 1

" UltiSnips
" UltiSnips trigger keymapping conflicts with YCM
let g:UltiSnipsExpandTrigger = '<c-space>'

" make investigate.vim use dash on osx
nnoremap <leader>g :call investigate#Investigate()<CR>
if has('macunix')
	let g:investigate_use_dash=1
endif


"""""""""""""""""""""""""""
" lightline configuration "
"""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"""""""""""""""""""""""""""""""
" end lightline configuration "
"""""""""""""""""""""""""""""""


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

