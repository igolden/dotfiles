if has('python3')
  silent! python3 1
endif

set shell=zsh                    " use zsh for shell
call pathogen#infect()															" use pathogen for plugins, or else

filetype plugin indent on 													" filetype plugins and indent support

syntax on

let mapleader=","																		" set , as our leader instead default \

inoremap kj <Esc>
colorscheme sexy-railscasts


set autoindent 																			" autoindent on
set backspace=eol,indent,start 											" better backspace functionality, end of line, insert, start
set cmdheight=4                                     " cmd height is 3
set cuc
set cursorline
set encoding=utf-8
set expandtab 																			" uses correct tab size in insert mode
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set noswapfile
set foldlevel=1
set foldminlines=0
set hidden																					" when buffer is hidden, unload
set history=1000 																	  " set vim command history to 1K lines
set hlsearch                                        " highlights search results
set incsearch                                       " gives you feedback as you search with /
set ignorecase smartcase                            " handles case as you search
set laststatus=2																		" multiwindow status line support
set nocompatible 																		" don't try to be compatible with vi mode
set number                                          " always show line numbers
set numberwidth=3                                   " width of line numbers col
set shiftwidth=2 																		" defaults to tabstop if 0
set softtabstop=2																		" softtabstop, default it to 2 spaces
set tabstop=2 																			" ruby style tabstops, two spaces
set scrolloff=3
set shelltype=3
set showcmd                                         " display incomplete or wrong commands
set showmatch                                       " shows matching bracket, open close
set showtabline=1
set splitbelow                                      " split vertically below
set splitright                                      " split horizontally right
set switchbuf=useopen                               " use the open buffer by default
set t_ti=
set t_te=
set t_Co=256
set wildmode=longest,list
set wildmenu
set wildignore+=vendor/**,.bundle*,*node_modules*
set winwidth=70                                     " default window columns 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype highlighitng
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.json set ft=javascript
au BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.ts set ft=javascript


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" TESTING
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>



" Set number keys to give git actions
nnoremap <leader>` :!git diff<cr>
nnoremap <leader>1 :!git status<cr>
nnoremap <leader>2 :!git log <cr>
nnoremap <leader>3 :!git add %<cr>
nnoremap <leader>4 :!git add .<cr>
nnoremap <leader>5 :!git commit<cr>
nnoremap <leader>6 :!git diff origin/master<cr>
nnoremap <leader>7 :!git diff master<cr>
nnoremap <leader>8 :!git checkout master<cr>
nnoremap <leader>9 :!git branch -v<cr>
nnoremap <leader>0 :!git stash pop<cr>
nnoremap <leader>- :!git stash<cr>
nnoremap <leader>= :!git push origin HEAD<cr>

" set window split maneuvering
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" punish those who use arrow keys
nnoremap <Left> :echo "Shame on you."<cr>
nnoremap <Right> :echo "Shame on you."<cr>
nnoremap <Up> :echo "Shame on you."<cr>
nnoremap <Down> :echo "Shame on you."<cr>

" Typo mappings
map :W :w
map :WQ :wq
map :Wq :wq
map :Wqa :wqa
map :WQa :wqa
map :wQa :wqa
map :wqA :wqa

" PLUGINS
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"

" YouCompleteME
let g:ycm_key_list_select_completion = ['<Tab>']
"let g:ycm_key_invoke_completion ='<Enter>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_ultisnips_completer = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction


function! IGWW()
  set winwidth=60
  return 0
endfunction

command! Igww :call IGWW()

function! GetBufferName()
  echo expand('%:t:b')
  return 0
endfunction

command! IGGetBufferName :call GetBufferName()



inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>


nnoremap <leader>u :UltiSnipsEdit<cr>

" nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NerdTreeShowHidden=1
map <leader>t :NERDTreeToggle<cr>
map <leader><S-t> :call IGWW()<cr>

map <leader>r :MRU<cr>
map <leader>r :MRU<cr>


" command t
let g:CommandTCancelMap = [ '<Esc>', '<C-c>', '<space>' ]
nnoremap <space> :CommandT<cr>
