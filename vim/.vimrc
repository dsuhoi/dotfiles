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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
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
"set textwidth=80

" Make Indentation
autocmd filetype make set noexpandtab
autocmd filetype make set nocin

" Mouse
set mousehide
set mouse=a
set ttymouse=sgr
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
set completeopt=menuone
let g:ycm_max_num_candidates = 30
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_stop_completion = ['<C-Space>']
let g:ycm_python_binary_path='/usr/bin/python3'

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" PowerLine
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsRemoveSelectModeMappings = 1

" Termdebug
nnoremap ,m :Break<CR>
nnoremap ,n :Clear<CR>
nnoremap ,o :Over<CR>
nnoremap ,s :Step<CR>
nnoremap ,c :Continue<CR>
nnoremap ,p :Stop<CR>
nnoremap ,f :Finish<CR>
nnoremap ,k :Evaluate<CR>
nnoremap ,r :Run<CR>

" Tagbar
nnoremap <C-t> :TagbarToggle<CR>

" EasyMotion
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>c <Plug>(easymotion-overwin-f)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" FZF
nnoremap <silent> <Leader>f :FZF<CR>
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
let g:fzf_layout = { 'down': '30%' }

" LaTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
