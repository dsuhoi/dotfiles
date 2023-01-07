" VIM CONFIG FILE

set nocompatible
set encoding=utf-8
set termencoding=utf-8
filetype plugin indent on
syntax on

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'lervag/vimtex'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
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
set novisualbell

set nobackup
set nowritebackup
set noswapfile
nnoremap <C-@> :call system("wl-copy", @")<CR>

set hidden

" color scheme
"-----------------
colorscheme theme


" Plugin settings
"-----------------
" Coc.nvim
let g:coc_global_extensions = ['coc-clangd', 'coc-python', 'coc-diagnostic', 'coc-snippets', 'coc-pairs']
let b:coc_diagnostic_disable = 1
let b:coc_diagnostic_info={'information': 0, 'hint': 0, 'lnums': [0, 0, 0, 0], 'warning': 0, 'error': 0}
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <tab>
    \ coc#pum#visible() && coc#expandable() ? coc#_select_confirm():
    \ <SID>check_back_space() ? "\<tab>" :
    \ coc#refresh()

inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

highlight CocMenuSel ctermbg=4

" let g:coc_user_config = {}

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" LightLine
set laststatus=2
set showtabline=2
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {'colorscheme': 'default'}
let g:lightline.active = {
    \ 'left':  [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
    \ 'right': [['linter_checking', 'linter_errors', 'linter_warnings'],
    \ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
    \}
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {
    \ 'buffers':         'lightline#bufferline#buffers',
    \ 'linter_checking': 'lightline#ale#checking',
    \ 'linter_warnings': 'lightline#ale#warnings',
    \ 'linter_errors':   'lightline#ale#errors',
    \}
let g:lightline.component_type = {
    \ 'buffers':         'tabsel',
    \ 'linter_checking': 'right',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors':   'error',
    \}
let g:lightline.component_function = {'gitbranch': 'FugitiveHead'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

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
nnoremap <silent> <Leader>b :Buffers<CR>
let g:fzf_layout = { 'down': '30%' }

" ALE
let g:ale_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_change_sign_column_color = 1
let g:ale_linters = {
    \ 'c':      ['ccls', 'clang'],
    \ 'cpp':    ['clang'],
    \ 'python': ['flake8'],
    \ 'vim':    ['vint'],
    \}
let g:ale_fixers = {
    \ '*':      ['remove_trailing_lines', 'trim_whitespace'],
    \ 'c':      ['clang-format'],
    \ 'cpp':    ['clang-format'],
    \ 'python': ['black', 'isort'],
    \ 'json':   ['prettier'],
    \ 'css':    ['prettier'],
    \ 'html':   ['prettier'],
    \}

let g:ale_javascript_prettier_options = '--tab-width 4'

let g:ale_c_clangformat_style_option = '{
    \ "BasedOnStyle": "Google",
    \ "Standard": "Latest",
    \ "IndentWidth": 4,
    \ "AccessModifierOffset": -4,
    \ "BreakBeforeBraces": "Allman",
    \ "AlignConsecutiveMacros": "true",
    \ "AlignTrailingComments": "true",
    \}'

let g:ale_c_cc_options = '-std=c17 -Wall'
let g:ale_cpp_cc_options = '-std=c++2b -Wall'

let g:ale_fix_on_save = 1
let b:ale_warn_about_trailing_whitespace = 0

highlight ALEErrorSign ctermfg=9 guibg=NONE ctermbg=NONE
highlight ALEWarningSign ctermfg=11 guibg=NONE ctermbg=NONE
highlight clear ALESignColumnWithErrors
highlight clear  ALESignColumnWithoutErrors
nmap <Leader>z :ALEToggle<CR>

" LaTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_mode=1
