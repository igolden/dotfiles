set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="igolden"

" 187 -> yello
" 194 ->  HoneyDew (light melon green)
" 109 -> light blue

hi Normal           cterm=NONE      ctermfg=254         ctermbg=234
hi Visual           cterm=bold      ctermfg=0         ctermbg=191
hi Comment          cterm=NONE      ctermfg=194        ctermbg=234
hi Todo              cterm=NONE      ctermfg=191         ctermbg=234
hi Operator          cterm=NONE      ctermfg=231         ctermbg=234
hi Identifier        cterm=NONE      ctermfg=107        ctermbg=234
hi Statement         cterm=NONE      ctermfg=109         ctermbg=234
hi Type              cterm=NONE      ctermfg=48        ctermbg=234
hi Constant          cterm=NONE      ctermfg=109         ctermbg=234
hi Conditional       cterm=NONE      ctermfg=65         ctermbg=234
hi Delimiter         cterm=NONE      ctermfg=65         ctermbg=234
hi Define            cterm=NONE      ctermfg=172        ctermbg=234
hi PreProc           cterm=NONE      ctermfg=65         ctermbg=234
hi Special           cterm=NONE      ctermfg=197         ctermbg=234
hi Keyword           cterm=NONE      ctermfg=50         ctermbg=234
hi Directory         cterm=NONE      ctermfg=45         ctermbg=234
hi LineNr           cterm=NONE      ctermfg=194          ctermbg=234
hi Cursor           cterm=NONE      ctermfg=123         ctermbg=0
hi CursorLine       cterm=bold      ctermfg=11       ctermbg=0
hi CursorLineNr     cterm=NONE      ctermfg=231         ctermbg=66
hi Function         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Character         cterm=NONE      ctermfg=74         ctermbg=NONE
hi String         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Boolean         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Float         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Label         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Repeat         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Exception         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Include         cterm=NONE      ctermfg=74         ctermbg=NONE
hi TypeDef         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Macro         cterm=NONE      ctermfg=74         ctermbg=NONE
hi PreCondit         cterm=NONE      ctermfg=74         ctermbg=NONE
hi StorageClass         cterm=NONE      ctermfg=221         ctermbg=NONE
hi Structure         cterm=NONE      ctermfg=221         ctermbg=NONE
hi Tag         cterm=NONE      ctermfg=74         ctermbg=NONE
hi TypeDef         cterm=NONE      ctermfg=74         ctermbg=NONE
hi SpecialChar         cterm=NONE      ctermfg=74         ctermbg=NONE
hi SpecialComment         cterm=NONE      ctermfg=74         ctermbg=NONE
hi Debug         cterm=NONE      ctermfg=74         ctermbg=NONE


hi TabLine          cterm=NONE      ctermfg=231         ctermbg=231
hi TabLineFill      cterm=NONE      ctermfg=231        ctermbg=231
hi TabLineSel       cterm=NONE      ctermfg=231         ctermbg=231

" Msg
hi Error            cterm=bold      ctermfg=231         ctermbg=52
hi ErrorMsg         cterm=bold      ctermfg=231         ctermbg=52
hi WarningMsg       cterm=NONE      ctermfg=231         ctermbg=NONE

hi StatusLine       cterm=NONE      ctermfg=248        ctermbg=0
hi StatusLineNC     cterm=NONE      ctermfg=231         ctermbg=0

hi VertSplit        cterm=NONE      ctermfg=238         ctermbg=0


" UI
hi Pmenu            cterm=NONE      ctermfg=231         ctermbg=0
hi PmenuSel         cterm=NONE      ctermfg=231         ctermbg=0
hi PmenuSbar        cterm=NONE      ctermfg=231         ctermbg=0
hi PmenuThumb       cterm=NONE      ctermfg=231         ctermbg=0


"hi Include          cterm=bold      ctermfg=0          ctermbg=191
"hi Conditional      cterm=bold      ctermfg=0         ctermbg=191
"hi Boolean          cterm=bold      ctermfg=0          ctermbg=NONE
"hi Define           cterm=NONE      ctermfg=65          ctermbg=NONE
"hi Type             cterm=NONE      ctermfg=65          ctermbg=NONE
"hi TypeDef          cterm=NONE      ctermfg=65          ctermbg=NONE
"hi ColorColumn      cterm=NONE      ctermfg=231        ctermbg=242

"hi Character        cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Constant         cterm=NONE      ctermfg=231          ctermbg=NONE
"hi Delimiter        cterm=bold      ctermfg=231          ctermbg=NONE
"hi DiffAdd          cterm=NONE      ctermfg=231         ctermbg=NONE
"hi DiffChange       cterm=NONE      ctermfg=231         ctermbg=NONE
"hi DiffDelete       cterm=NONE      ctermfg=231         ctermbg=NONE
"hi DiffText         cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Directory        cterm=NONE      ctermfg=231         ctermbg=NONE
"hi FoldColumn       cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Folded           cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Identifier       cterm=bold      ctermfg=231          ctermbg=NONE
"hi IncSearch        cterm=NONE      ctermfg=231         ctermbg=217
"hi Macro            cterm=NONE      ctermfg=231          ctermbg=NONE
"hi NonText          cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Operator         cterm=NONE      ctermfg=231         ctermbg=NONE
"hi PreProc          cterm=NONE      ctermfg=231          ctermbg=NONE
"hi Search           cterm=NONE      ctermfg=0         ctermbg=109
"hi Special          cterm=NONE      ctermfg=231          ctermbg=NONE
"hi SpecialKey       cterm=NONE      ctermfg=231          ctermbg=NONE
"hi SpellBad         cterm=NONE      ctermfg=231         ctermbg=NONE
"hi SpellCap         cterm=NONE      ctermfg=231          ctermbg=NONE
"hi SpellLocal       cterm=NONE      ctermfg=231         ctermbg=NONE
"hi SpellRare        cterm=NONE      ctermfg=231         ctermbg=NONE
"hi Statement        cterm=NONE      ctermfg=231         ctermbg=NONE
"hi String           cterm=NONE      ctermfg=231          ctermbg=NONE
"hi Tag              cterm=NONE      ctermfg=231          ctermbg=NONE
"hi Todo             cterm=NONE      ctermfg=231         ctermbg=66
"hi Underlined       cterm=underline ctermfg=231        ctermbg=NONE
"hi WildMenu         cterm=NONE      ctermfg=231          ctermbg=NONE

