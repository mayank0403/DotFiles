set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.  
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'ajh17/VimCompletesMe'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'mrnugget/vim-fzz'
Plugin 'markonm/traces.vim'
Plugin 'devjoe/vim-codequery'
Plugin 'Shougo/unite.vim'
Plugin 'godlygeek/tabular'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-repeat'
Plugin 'glts/vim-magnum'

" Radical shows binary, octal, decimal.. representation under cursor. Show all: gA.
" crd for change to decimal
Plugin 'glts/vim-radical'
"Plugin 'liuchengxu/space-vim-dark'
"Plugin 'tpope/vim-dispatch'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let mapleader=","
set timeout timeoutlen=1500
set clipboard^=unnamed,unnamedplus
"show line numbers along with lines
set number
set laststatus=2
autocmd vimenter * NERDTree
nnoremap <Leader>w <C-w>w
syntax on
"let g:syntastic_cpp_compiler='g++'
"let g:syntastic_cpp_compiler_options=' --std=c++11'
"let g:syntastic_cpp_check_header=1

" To set tab stop = 2.
"set sts=2
"set ts=2
"set sw=2

" To set tab stop = 4.
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:ycm_global_ycm_extra_conf = ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
"let g:ycm_show_diagnostics_ui = 0
colorscheme gruvbox
nnoremap <leader>p :echo expand('%:p')<CR>
"use CLI commands while at vim
nnoremap <leader>j :!
"Go to local definition of variable
nnoremap <leader>dd gd 
"Go to global defintion of variable/function
nnoremap <leader>df gD
"Find the first occurence of variable, then use n to navigate
nnoremap <leader>da g*
"Suspend vim. Then use fg on bash to return back
nnoremap <leader>ss <C-z>
"Find a string in project
nnoremap <leader>fi :!ag<Space>
"init fold
nnoremap <leader>fold :set foldmethod=syntax
"Fold all functions in file
nnoremap <leader>fo zM
"Unfold all functions in file
nnoremap <leader>uf zR
"Toggle fold at cursor
nnoremap <leader>ff za
"To select a word
nnoremap <leader>sw viw
"To delete a word
nnoremap <leader>dw diw
" EXTRA: Set a mark by m<alphabet>
"Move to a mark. After space press `<alphabet>
"Surround current word with something ysiw]
"Surround current line with something yss}
" EXTRA: Replace ' ' with \" \" with cs'"
" Select current line
nnoremap <leader>sl V
"Build Codequery DB for the project by
"going to project root and typing in vim - 
"CodeQueryMakeDB cpp (for python, use python)

"Open codequery menu
nnoremap <space>m :CodeQueryMenu Unite Full<CR>
nnoremap <space>; :CodeQueryMenu Unite Magic<CR>
"Once you find all the occurences of some query using any of
"the above 2 commands, if you open the occurence directly, they will
"window overwrite the existing cpp file. To avoid this, Go to the 
"pane listing all occurences, command in :new and then go back to 
"listing pane and now the occurence if opened, opens in the new
"window created by :new command.

" Or enable typing (to search menu items) by default
nnoremap <space>\ :CodeQueryMenu Unite Magic<CR>A

" For case insensitive search use - :set ic, where ic is ignore case and then use / to search.
" To go back to case sensitive search use - :set noic

" To go top of the current function use [m (recursively till you reach top) and ]m to go bottom.

" Use [[ to go to the first line of function above and ]] to go the first line	
" of function below. [[ works differently than [m. The latter is used to go up	
" by block while former to go up by function in cpp.
" To do a particular syntax highlighting for a file use - set syntax=python/cpp

" This will use python syntax highlighting for .mpc SPDZ files
au BufNewFile,BufRead,BufReadPost *.mpc set syntax=python

" Remove 
 char coming from DOS/Windows style formatted file
nnoremap <leader>rm :e ++ff=dos
" If the above does not work, replace the char using :%s/
/

" Move (shift the whole thing, no actual change in code) the line at cursor to the center of screen zz, to the top of screen zt and zb for the bottom

nnoremap <leader>se :/\v
" Search for regex in file. c{5} matches exactly 5 c chars. .+ expects atleast
" one char. *+ means 0 or more chars. <abc> for a word abc. hand(y|ful)
" matched handy or handful.

" To resize vim windows use mouse mode by :set mouse=a
"
set mouse=a
set backspace=indent,eol,start
" The above command will let me delete chars not written by me on mac
"
" Paste by replacing current word
" cp stands for change paste
nmap <silent> cp "_ciw<C-R>"<Esc>

" Move left and right faster through panes
nmap <silent> tj <C-w><Left>
nmap <silent> tk <C-w>w

" Move pane to left or right
nmap <silent> ttj <C-w>r  
nmap <silent> ttk <C-w>H

" Increase/Decrease/Equalise window size - https://vi.stackexchange.com/questions/514/how-do-i-change-the-current-splits-width-and-height
" 20<C-w>+ is increase size of horizontal window by 20 places
" <C-w>= will equalize all window sizes

" Buffer mode in :term on vim
" <C-w> Shift N

" Go back to previous location <C-o>
" Go back to next location <C-i>

" Open netrw listing
" More here: https://blog.stevenocchipinti.com/2016/12/28/using-netrw-instead-of-nerdtree-for-vim/
" New file %, new directory d
" To copy, mark file to copy with mf, then mark directory where to copy with
" mt and then copy with mc
nmap <silent> - :Explore

" jump to the previous function
nnoremap <silent> [f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call search('^\s*\(\i\+\_[ \t\*]\+\)\+\i\+\_s*(\_[^)]*)\_s*{', "w")<CR>

" Close NerdTree after file opened
let NERDTreeQuitOnOpen=1


" Surround selected text with () can be done using S(
