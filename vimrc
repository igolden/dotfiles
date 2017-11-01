call pathogen#infect()															" use pathogen for plugins, or else

filetype plugin indent on 													" filetype plugins and indent support

let mapleader=","																		" set , as our leader instead default \

imap kj <Esc> 																			" when in insert mode, exit with kj

colorscheme sexy-railscasts

set autoindent 																			" autoindent on
set backspace=eol,indent,start 											" better backspace functionality, end of line, insert, start
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set cmdheight=3                                     " cmd height is 3
set cuc
set cursorline
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set encoding=utf-8
set expandtab 																			" uses correct tab size in insert mode
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldminlines=0
set hidden																					" when buffer is hidden, unload
set history=10000 																	" set vim command history to 10K lines
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
set shell=zsh                                       " use zsh for shell
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

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype highlighitng
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.json set ft=javascript
au BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set number keys to give git actions
nnoremap <leader>` :!git diff<CR>
nnoremap <leader>1 :!git status<CR>
nnoremap <leader>2 :!git log <CR>
nnoremap <leader>3 :!git add %<CR>
nnoremap <leader>4 :!git add .<CR>
nnoremap <leader>5 :!git commit<CR>
nnoremap <leader>6 :!git diff origin/master<CR>
nnoremap <leader>7 :!git diff master<CR>
nnoremap <leader>8 :!git checkout master<CR>
nnoremap <leader>9 :!git branch -v<CR>
nnoremap <leader>0 :!git stash pop<CR>
nnoremap <leader>- :!git stash<CR>
nnoremap <leader>= :!git push origin HEAD<CR>

" set window split maneuvering
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" punish those who use arrow keys
map <Left> :echo "Shame on you."<cr>
map <Right> :echo "Shame on you."<cr>
map <Up> :echo "Shame on you."<cr>
map <Down> :echo "Shame on you."<cr>

" Typo mappings
map :W :w
map :WQ :wq
map :Wq :wq
map :Wqa :wqa
map :WQa :wqa

" TODOs

" PLUGINS

" Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSEditSplit="vertical"

" google calendar calendar.vim
let g:calendar_google_calendar=0

" nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NerdTreeShowHidden=1

" command t
let g:CommandTCancelMap = [ '<Esc>', '<C-c>', '<space>' ]
nnoremap <space> :CommandTFlush<cr>\|:CommandT<cr>
