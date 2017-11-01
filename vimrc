call pathogen#infect()
filetype plugin indent on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

:set t_Co=256 
:color igolden

let g:calendar_google_calendar = 1


set nocompatible 
set mouse=
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

let g:jsx_ext_required = 0


let mapleader=","

nnoremap <leader>;= :Tabularize /=l1r1<cr>
nnoremap <leader>;> :Tabularize /=>l2r2<cr>
nnoremap <leader>;, :Tabularize /,<cr>
nnoremap <leader>;) :Tabularize /)<cr>
nnoremap <leader>;: :Tabularize /:l4<cr>
nnoremap <leader>;. :Tabularize /.<cr>
vmap - :Tabularize /
  
nnoremap <C-w> :e $MYVIMRC<cr>
nnoremap <C-s> :call EditSnippets()<cr>




" ruby runners
nmap <C-r><space> :!ruby 
nmap <C-r>r :!ruby %<cr> 
nmap <C-r>r :!ruby %<cr> 
nmap <C-r>r :!ruby %<cr> 



" Git
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



nnoremap <leader>c :NERDComToggleComment<CR>
nnoremap <C-v>v <Plug>VimroomToggle<CR>

" rails
nnoremap <leader>r :!bundle exec rake test<CR>


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
nnoremap <Left> :echo "No!"<cr>
nnoremap <Right> :echo "No!"<cr>
nnoremap <Up> :echo "No!"<cr>
nnoremap <Down> :echo "No!"<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>  
" open files current dir


" COMMAND T
nnoremap <leader>gr :topleft :split config/routes.rb<cr>
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
nnoremap <leader>gR :call ShowRoutes()<cr>
nnoremap <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
nnoremap <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
nnoremap <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
nnoremap <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
nnoremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
nnoremap <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
nnoremap <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
nnoremap <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
nnoremap <leader>gg :topleft 100 :split Gemfile<cr>
nnoremap <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
nnoremap <leader>f :CommandTFlush<cr>\|:CommandT<cr>
nnoremap <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

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
nnoremap <leader>f :call ToggleMRU()<CR>
nnoremap <leader>ls :MRU spec<CR>
nnoremap <leader>lc :MRU controller<CR>
nnoremap <leader>lm :MRU controller<CR>
nnoremap <leader>lm :MRU controller<CR>
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
nnoremap :W :w
nnoremap :WQa :wqa
nnoremap :Wqa :wqa
nnoremap :Q :q
nnoremap :Qa :qa

nnoremap <leader>b :!bundle install<cr>
nnoremap <space> :CommandT<cr>

imap <c-l> <space>=><space>

" Command T ignore
set wildignore+=vendor/**,*node_modules*
"command for :source ~/.vimrc

" Nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree innoremap€kb€kb€kb| endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd BufEnter * call FileTree()


" Macros
nnoremap <leader>, @w<cr>
nnoremap <leader>e @e<cr>

let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeShowHidden=1

let g:CommandTCancelMap     = ['<ESC>', '<C-c>', '<space>']
let g:vimroom_background = 'white'

nnoremap <C-f> :UltiSnipsEdit<cr>

set nuw=2



let g:headless_tree_open = 0
function! HeadlessTree()
  set nosplitright
  if g:headless_tree_open
    echom "File tree open"
  else
    vertical split . 
    vertical resize 24
    set ft=__HeadlessTree__
    set winfixwidth
    let g:headless_tree_open = 1
    "let g:headless_window_id = call get_wininfo()
  endif
  set splitright
endfunction

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
