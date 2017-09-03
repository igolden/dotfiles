call pathogen#infect()
filetype plugin indent on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:set t_Co=256 
:color railscasts

let g:calendar_google_calendar = 1


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
set wildmode=longest,list
set wildmenu
set cuc

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips/"

let mapleader=","

map <leader>;= :Tabularize /=l1r1<cr>
map <leader>;> :Tabularize /=>l2r2<cr>
map <leader>;, :Tabularize /,<cr>
map <leader>;) :Tabularize /)<cr>
map <leader>;: :Tabularize /:l4<cr>
map <leader>;. :Tabularize /.<cr>
vmap - :Tabularize /
  
map <C-v> :e $MYVIMRC<cr>
map <C-s> :call EditSnippets()<cr>




" ruby runners
nmap <C-r><space> :!ruby 
nmap <C-r>r :!ruby %<cr> 
nmap <C-r>r :!ruby %<cr> 
nmap <C-r>r :!ruby %<cr> 



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



map <leader>c :NERDComToggleComment<CR>
map <leader>v <Plug>VimroomToggle<CR>

" rails
map <leader>r :!bundle exec rake test<CR>


:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"                                    

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
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru}    set ft=ruby

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


" MRU
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :call ToggleMRU()<CR>
map <leader>ls :MRU spec<CR>
map <leader>lc :MRU controller<CR>
map <leader>lm :MRU controller<CR>
map <leader>lm :MRU controller<CR>
let g:mru_is_open = 0

function! ToggleMRU() 
  if g:mru_is_open
    :execute "close"
    let g:mru_is_open = 0
  else
    let g:mru_is_open = 1
    :execute "MRU"
  endif
endfunction


" typos
map :W :w
map :WQa :wqa
map :Wqa :wqa
map :Q :q
map :Qa :qa

map <leader>b :!bundle install<cr>
map <space> :call commandt#FileFinder('.')<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        call commandt#private#Delete()
        let g:quickfix_is_open = 0
    else
        call 
        let g:quickfix_is_open = 1
    endif
endfunction

let g:CommandTFileScanner="find"

imap <c-l> <space>=><space>

" Command T ignore
set wildignore+=vendor/**,*node_modules*
"command for :source ~/.vimrc

" Nerdtree
map <leader>t :NERDTreeToggle<CR>
"map <leader>t :Explore<cr>
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Macros
map <leader>, @w<cr>
map <leader>e @e<cr>

let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeShowHidden=1

let g:CommandTCancelMap     = ['<ESC>', '<C-c>', '<space>']
let g:vimroom_background = 'white'

function! EditSnippets() 
  if !exists("g:UltiSnipsSnippetsDir")
    :exec ":o g:UltiSnipsEdit<cr>"
  endif
endfunction

nnoremap <C-f> :UltiSnipsEdit<cr>

set nuw=2




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
