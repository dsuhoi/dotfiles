highlight clear

if exists("syntax_on")
  syntax reset
endif

set background=dark
let colors_name = "theme"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine    ctermbg=234 cterm=NONE
  hi CursorColumn  ctermbg=238
endif

" General colors
hi Cursor          ctermfg=0 ctermbg=252
hi CursorLineNr    ctermfg=11 ctermbg=NONE
hi ColorColumn     ctermbg=4
hi Directory       ctermfg=14 ctermbg=NONE
hi ErrorMsg        ctermfg=15 ctermbg=9 cterm=NONE
hi Error           ctermfg=15 ctermbg=9
hi Folded          ctermfg=23 ctermbg=0
hi LineNr          ctermfg=244 ctermbg=NONE
hi Normal          ctermfg=15 ctermbg=NONE
hi SpecialKey      ctermfg=244 ctermbg=NONE
hi StatusLine      ctermfg=0 ctermbg=39 cterm=bold term=bold
hi StatusLineNC    ctermfg=231 ctermbg=237 cterm=bold
hi VertSplit       ctermfg=238 ctermbg=240
hi Visual          ctermfg=159 ctermbg=239 cterm=bold
hi WarningMsg      ctermfg=208

" Syntax highlighting
hi Boolean         ctermfg=119 cterm=bold
hi Character       ctermfg=111
hi Comment         ctermfg=241
hi Constant        ctermfg=111
hi Define          ctermfg=208
hi Exception       ctermfg=80 cterm=bold
hi Function        ctermfg=4
hi Identifier      ctermfg=83
hi Keyword         ctermfg=50 ctermbg=NONE cterm=bold
hi Label           ctermfg=231
" hi Number          ctermfg=255
hi Statement       ctermfg=105 cterm=bold
hi String          ctermfg=222
hi Todo            ctermfg=6 ctermbg=239 cterm=bold
hi Type            ctermfg=83
hi Typedef         ctermfg=83 cterm=bold
hi Operator        ctermfg=8
