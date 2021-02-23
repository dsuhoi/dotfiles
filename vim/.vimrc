" VIM CONFIG FILE

set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
" Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim' 
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call plug#end()

" Default Indentation
set autoindent
set expandtab       " expand tab to space
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set number          " show number line

set wrap linebreak nolist
set textwidth=80

" Make Indentation
autocmd filetype make set noexpandtab
autocmd filetype make set nocin

" Mouse
set mousehide
set mouse=a
set termencoding=utf-8
set novisualbell

set nobackup
set noswapfile

set hidden


" color scheme
"-----------------
colorscheme ron


" Plugin settings
"-----------------
" YMC
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_max_num_candidates = 30

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" PowerLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" EasyMotion
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>L <Plug>(easymotion-overwin-line)

