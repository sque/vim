"
" Vim config by padeler 
" 23-04-2014
"

" Initially disable filetype and syntax.
" These are re-enabled below.
syntax off
filetype off

" Automatic reloading of .vimrc
autocmd! bufwritepost ~/.vim/vimrc source %


" Bind nohl
" Removes highlight of your last search
noremap <leader>n :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" easier moving between tabs
map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" XXX This is working only with Scemes that define the ExtraWhitespace field.
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color wombat256mod
"color adrian

filetype plugin indent on
filetype plugin on
" Enable syntax highlighting
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
set cursorline
highlight cursorline ctermbg=17 term=bold cterm=NONE guibg=Gray40

autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline



" Enable mouse support. 
" NOTE: This breaks copy-paste. Use shift when highlighting text to 
" fall back to the default copy-paste behaivior of the terminal.
set mouse=a

" Auto read files that have changed on disk.
" set autoread
" au WinEnter,TabEnter,FocusGained,BufEnter * :silent! !

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=1000
set undolevels=1000

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" ===== Cool stuff found on vimbits.com ===== 
"

" MAP w!! to sudo w!
" Sometimes I forget to run vim with sudo privileges especially when editing
" files under /etc. I use w!! to override the permissions and saves the file as
" sudo.
command! SUwrite % !sudo tee > /dev/null % 


" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu nornu
au InsertLeave * :set nonu rnu
set nonu rnu


" Easilly move lines up/down in normal, insert or visual mode.
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Map the CTRL-F11 key to run Python code. Test your
" code the easy way. Press to run the code, then to return to Vim. This will
" allow you to easily press the letter 'u' to undo anything that does not work.
" Of course you can substitute :!python % for :!bash % to run your Bash
" scripts!
map <C-F11> :w<CR>:!ipython % <CR>

" ================ Plugin Settings ================ 
" Enable pathogen to load plugins under bundle/
call pathogen#infect()
" =================================================

" Settings for vim-powerline
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Pyflakes config
let g:pyflakes_use_quickfix = 0


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" TagList Config
" Map TListToggle to <leader>o (o for outline)
map <C-o> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Compact_Format=1

" NERD Tree Config
" NERD Tree is a file browser for VIM
map <C-n> :NERDTreeToggle<CR>
" Close vim is the last window open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


