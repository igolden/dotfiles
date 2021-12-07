if has('python3')
  silent! python3 1
endif

set shell=/opt/homebrew/bin/zsh                    " use zsh for shell
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
set foldmethod=syntax
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

" YouCompleteME
let g:ycm_key_list_select_completion = ['<Down>']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "ᐅ"

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>u :UltiSnipsEdit<cr>

" google calendar calendar.vim
let g:calendar_google_calendar=0

" nerdtree
let g:nerdtree_tabs_open_on_gui_startup=0
let NerdTreeShowHidden=1
map <leader>t :NERDTreeToggle<cr>

" command t
let g:CommandTCancelMap = [ '<Esc>', '<C-c>', '<space>' ]
nnoremap <space> :CommandT<cr>
