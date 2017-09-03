set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="blank"

let __bg = "234"

hi Normal           cterm=NONE      ctermfg=65         ctermbg=bg
hi Visual           cterm=bold      ctermfg=0         ctermbg=191

hi Include          cterm=bold      ctermfg=0          ctermbg=191
hi Conditional      cterm=bold      ctermfg=0         ctermbg=191
hi Boolean          cterm=bold      ctermfg=0          ctermbg=NONE
hi Define           cterm=NONE      ctermfg=65          ctermbg=NONE
hi Type             cterm=NONE      ctermfg=65          ctermbg=NONE
hi TypeDef          cterm=NONE      ctermfg=65          ctermbg=NONE

hi Character        cterm=NONE      ctermfg=231         ctermbg=NONE
hi ColorColumn      cterm=NONE      ctermfg=231        ctermbg=242
hi Comment          cterm=NONE      ctermfg=231         ctermbg=NONE
hi Constant         cterm=NONE      ctermfg=231          ctermbg=NONE
hi Cursor           cterm=NONE      ctermfg=231         ctermbg=NONE
hi CursorLine       cterm=bold      ctermfg=231        ctermbg=234
hi CursorLineNr     cterm=NONE      ctermfg=231         ctermbg=66
hi Delimiter        cterm=bold      ctermfg=231          ctermbg=NONE
hi DiffAdd          cterm=NONE      ctermfg=231         ctermbg=NONE
hi DiffChange       cterm=NONE      ctermfg=231         ctermbg=NONE
hi DiffDelete       cterm=NONE      ctermfg=231         ctermbg=NONE
hi DiffText         cterm=NONE      ctermfg=231         ctermbg=NONE
hi Directory        cterm=NONE      ctermfg=231         ctermbg=NONE
hi Error            cterm=bold      ctermfg=231         ctermbg=234
hi ErrorMsg         cterm=bold      ctermfg=231         ctermbg=NONE
hi FoldColumn       cterm=NONE      ctermfg=231         ctermbg=NONE
hi Folded           cterm=NONE      ctermfg=231         ctermbg=NONE
hi Function         cterm=NONE      ctermfg=231         ctermbg=NONE
hi Identifier       cterm=bold      ctermfg=231          ctermbg=NONE
hi IncSearch        cterm=NONE      ctermfg=231         ctermbg=247
hi LineNr           cterm=NONE      ctermfg=231          ctermbg=234
hi Macro            cterm=NONE      ctermfg=231          ctermbg=NONE
hi NonText          cterm=NONE      ctermfg=231         ctermbg=NONE
hi Operator         cterm=NONE      ctermfg=231         ctermbg=NONE
hi Pmenu            cterm=NONE      ctermfg=231         ctermbg=234
hi PmenuSel         cterm=NONE      ctermfg=231         ctermbg=NONE
hi PmenuSbar        cterm=NONE      ctermfg=231         ctermbg=NONE
hi PmenuThumb       cterm=NONE      ctermfg=231         ctermbg=NONE
hi PreProc          cterm=NONE      ctermfg=231          ctermbg=NONE
hi Search           cterm=NONE      ctermfg=231         ctermbg=66
hi Special          cterm=NONE      ctermfg=231          ctermbg=NONE
hi SpecialKey       cterm=NONE      ctermfg=231          ctermbg=NONE
hi SpellBad         cterm=NONE      ctermfg=231         ctermbg=NONE
hi SpellCap         cterm=NONE      ctermfg=231          ctermbg=NONE
hi SpellLocal       cterm=NONE      ctermfg=231         ctermbg=NONE
hi SpellRare        cterm=NONE      ctermfg=231         ctermbg=NONE
hi Statement        cterm=NONE      ctermfg=231         ctermbg=NONE
hi StatusLine       cterm=NONE      ctermfg=231         ctermbg=NONE
hi StatusLineNC     cterm=NONE      ctermfg=231         ctermbg=NONE
hi String           cterm=NONE      ctermfg=231          ctermbg=NONE
hi TabLine          cterm=NONE      ctermfg=231         ctermbg=NONE
hi TabLineFill      cterm=NONE      ctermfg=231        ctermbg=251
hi TabLineSel       cterm=NONE      ctermfg=231         ctermbg=NONE
hi Tag              cterm=NONE      ctermfg=231          ctermbg=NONE
hi Todo             cterm=NONE      ctermfg=231         ctermbg=66
hi Underlined       cterm=underline ctermfg=231        ctermbg=NONE
hi VertSplit        cterm=NONE      ctermfg=231         ctermbg=NONE
hi WarningMsg       cterm=NONE      ctermfg=231         ctermbg=NONE
hi WildMenu         cterm=NONE      ctermfg=231          ctermbg=NONE

