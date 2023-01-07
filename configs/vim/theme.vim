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
  hi iCursor       ctermfg=0 ctermbg=252
  hi Incsearch     ctermfg=201 ctermbg=NONE cterm=underline
  hi MatchParen    ctermfg=214 ctermbg=NONE cterm=bold
  hi Pmenu         ctermfg=255 ctermbg=238
  hi PmenuSel      ctermfg=0 ctermbg=172
  hi Search        ctermfg=50 ctermbg=NONE
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
hi NonText         ctermfg=63
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
hi Exception       ctermfg=153 cterm=bold
hi Function        ctermfg=25
hi Identifier      ctermfg=78
hi Keyword         ctermfg=68 ctermbg=NONE cterm=bold
hi Label           ctermfg=231
hi Number          ctermfg=255
hi Repeat          ctermfg=153 cterm=bold
hi Statement       ctermfg=68 cterm=bold
hi String          ctermfg=221
hi Structure       ctermfg=78
hi Special         ctermfg=77 cterm=bold
hi Todo            ctermfg=6 ctermbg=239 cterm=bold
hi Type            ctermfg=78
hi Typedef         ctermfg=78 cterm=bold
hi Operator        ctermfg=251

" Diff
hi DiffAdd         cterm=NONE ctermfg=46 ctermbg=22
hi DiffChange      cterm=NONE ctermfg=NONE ctermbg=NONE
hi DiffDelete      cterm=NONE ctermfg=9 ctermbg=52
hi DiffText        cterm=underline ctermfg=10 ctermbg=239


" Python
hi pythonBuitinFunc ctermfg=35
