call pathogen#infect()

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:set t_Co=256 
:color railscasts

set nocompatible
set hidden
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cursorline
set cmdheight=2
set switchbuf=useopen
set number
set numberwidth=5
set showtabline=1
set winwidth=80
set shell=bash
set t_ti= t_te=
set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showcmd " display incomplete commands
syntax on
set splitbelow
set splitright
filetype plugin indent on
set wildmode=longest,list
set wildmenu
set cuc

let mapleader=","

" Git
map <leader>` :!git diff<CR>
map <leader>1 :!git status<CR>
map <leader>2 :!git log <CR>
map <leader>3 :!git add %<CR>
map <leader>4 :!git add .<CR>
map <leader>5 :!git commit<CR>
map <leader>6 :!git diff origin/master<CR>
map <leader>7 :!git diff master<CR>
map <leader>8 :!git checkout master<CR>
map <leader>9 :!git branch -v<CR>
map <leader>0 :!git stash pop<CR>
map <leader>- :!git stash<CR>
map <leader>= :!git push origin HEAD<CR>

" Fixme / Notes
map <leader>; :!gulp notes<CR>
map <leader>[ :!gulp notes \| grep TODO<CR>
map <leader>] :!gulp notes \| grep FIXME<CR>
map <leader>\ :!gulp notes \| grep OPTIMIZE<CR>


map <leader>v ggVG=

" rails
map <leader>b :!bundle install --path .bundle/gems --binstubs .bundle/bin<CR>
map <leader>d :!rake db:migrate<CR>
map <leader>s :!bundle exec rake test<CR>


:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-n> :call NumberToggle()<cr>
" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>
" Map kj to Esc
imap kj <Esc>
" arrow keys
map <Left> :echo "No!"<cr>
map <Right> :echo "No!"<cr>
map <Up> :echo "No!"<cr>
map <Down> :echo "No!"<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>  
" open files current dir


" COMMAND T
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set foldminlines=0

" Set encoding
set encoding=utf-8

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" typos
map :W :w
imap <c-l> <space>=><space>

" Command T ignore
set wildignore+=vendor/**,*node_modules*

" Nerdtree
map <leader>t :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


