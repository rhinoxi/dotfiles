" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
set nobackup

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
" Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer' }
Plug 'kien/rainbow_parentheses.vim'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-airline/vim-airline'
Plug 'Lokaltog/vim-distinguished'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-obsession'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdcommenter'
" c
Plug 'Rip-Rip/clang_complete', { 'do': 'nvim -c \"r! git ls-files autoload bin doc plugin\" -c \"$$,$$d _\" -c \"%MkVimball! $@ .\" -c \"q!\" && nvim &< -c \"so %\" -c \"q\"' }
" js
Plug 'pangloss/vim-javascript'
" go
Plug 'fatih/vim-go'
" react.js
Plug 'mxw/vim-jsx'
" node.js
Plug 'moll/vim-node'
" clojure
Plug 'venantius/vim-eastwood'
" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" theme
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Quramy/tsuquyomi'
call plug#end()

nmap <Leader>d :YcmCompleter GoToDefinition<CR>

let g:ycm_goto_buffer_command = 'new-tab'

" set expandtab
set tabstop=4
set shiftwidth=4

filetype plugin indent on
autocmd FileType python,c,cpp setlocal et ts=4 sw=4 sts=4
autocmd FileType html,javascript,lua setlocal et ts=4 sw=4 sts=4
autocmd FileType css setlocal et ts=4 sw=4 sts=4

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk


" set t_Co=256
" let g:solarized_termcolors=256
" let g:solarized_termtrans = 1

" colorscheme distinguished
" colorscheme solarized
colorscheme gruvbox

set hlsearch

set is

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  

" Tag list
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
" let Tlist_Auto_Open=1
" let Tlist_Use_Right_Window = 1

let g:NERDTreeWinSize = 20

let g:nerdtree_tabs_open_on_console_startup = 1

autocmd VimEnter * NERDTreeMirrorOpen
autocmd VimEnter * wincmd p
autocmd VimLeave * NERDTreeTabsClose

autocmd FileType python setlocal completeopt-=preview

set sessionoptions-=options

set colorcolumn=80

let s:extfname = expand("%:e")

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [COL=%04v][%p%%]\ [LEN=%L]
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height = 3
" 
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_typescript_checkers = ['tsuquyomi']
 

" let g:flake8_error_marker='EE'     " set error marker to 'EE'
" let g:flake8_warning_marker=''   " set warning marker to 'WW'
 
" let g:jedi#show_call_signatures = "1"
" let g:jedi#use_tabs_not_buffers = 1
 
"python folding
set foldmethod=indent
set foldlevelstart=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
 
"golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>d <Plug>(go-def-tab)

"Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1


set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" 
" "latex-box
" 
" 
"rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

" deoplete
" let g:deoplete#enable_at_startup = 1

"repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" jsx
let g:jsx_ext_required = 0
" javascript
set regexpengine=1

" ale
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 1000
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:ale_open_list = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
\   'typescript': ['tsuquyomi'],
\   'python': ['flake8'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <Enter> <Plug>(ale_detail)

" vim-node
" set runtimepath^=~/.vim/bundle/node

let g:ycm_python_binary_path = 'python'

let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3.6'

nnoremap H gT
nnoremap L gt

" disable error beeping
set vb t_vb=

" EasyMotion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
\ 'c': { 'left': '/**','right': '*/' },
\ 'python': {'left': '#'},
\}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
