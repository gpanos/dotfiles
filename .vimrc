" We want the latest Vim settings/options.
set nocompatible
syntax enable
set encoding=utf-8

" Source plugins.vim
so ~/.vim/plugins.vim

" The default is \, but a comma is much better.
let mapleader = ','

"-------------Editing--------------"
" Set the 80 characters soft line limit.
set colorcolumn=80
" Make backspace behave like every other editor.
set backspace=indent,eol,start
" Enable line numbers.
set number
" No damn bells!
set noerrorbells visualbell t_vb=
" Automatically write the file when switching buffers.
set autowriteall
" Set our desired autocompletion match.
set complete=.,w,b,u
" Keep the default value of 8
set tabstop=8
" Use spaces instead of tabs
set expandtab
" The width we apply for tabs in insert mode
set softtabstop=4
" The width of our indent on normal mode
set shiftwidth=4
" Use multiple of shiftwidth when indenting
set shiftround
" Always set autoindenting on
set autoindent
" Copy the previous indentation on autoindenting
set copyindent
" Don't wrap lines
set nowrap
" Always show what mode we're currently in
set showmode
" Show matching parenthesis
set showmatch
" Keep 4 lines of the edges of the screen when scrolling
set scrolloff=4
" Always show the status line
set laststatus=2
" Make <C-a> and <C-x> play well with zero-padded numbers
set nrformats=
" Automatically reload files changed outside of Vim
set autoread
" Hide the launch screen
set shortmess+=I
" Set OS clipboard interaction
set clipboard=unnamed
" Speed up the updatetime
set updatetime=1000
" Make the keyboard fast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
" Which tags to use
set tags=tags

"-------------Vim behaviour--------------"
" Hide buffers instead of closing them
set hidden
" Remember more commands and search history
set history=1000
" Use many levels of undo
set undolevels=1000
" Do not keep backup files
set nobackup
" Do not write out changes via backup files
set nowritebackup
" Do not write annoying intermediate swap files
set noswapfile
" Store swap files in one of these directories
set directory=~/.vim/.tmp,~/tmp,/tmp

"-------------Search--------------"
" Highlight all matched terms.
set hlsearch
" Incrementally highlight, as we type.
set incsearch
" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase
set smartcase

"-------------Visuals--------------"
if has('gui_running')
    " Set colorscheme when gui running
    colorscheme atom-dark
    " Set the default font family and size.
    set guifont=Fira\ Code:h17
    " We want pretty symbols, when available.
    set macligatures
    " We don't want Gui tabs.
    set guioptions-=e
    " Macvim-specific line-height.
    set linespace=16
    set lines=999
    " Disable Gui scrollbars.
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    " Make numbers column same bg as the rest.
    hi LineNr guibg=bg
    " Get rid of ugly split borders.
    hi vertsplit guifg=bg guibg=bg
else
    " Set colorscheme when running in terminal 
    colorscheme atom-dark-256
    " Use 256 colors. This is useful for Terminal Vim.
    set t_Co=256
endif

" -------------Split Management-------------- "
" Make splits default to below.
set splitbelow
" And to the right. This feels more natural.
set splitright
" We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" -------------Mappings-------------- "
" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
" Quickly browse to any tag/symbol in the project.
" Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>
" Easy escaping to normal mode.
imap jj <esc>
" Fast saves
nmap <Leader>w :w!<cr>
" Insert new lines from normal mode
map <Enter> o<esc>
map <S-Enter> O<esc>
" Easy Expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" -------------Plugins-------------- "
""/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"/
""/ NERDTree
"/
let NERDTreeHijackNetrw = 0
" Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

"/
""/ Greplace.vim
"/
" We want to use Ag for the search.
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
""/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"/
""/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
""/ Airline 
"/
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" -------------Laravel-Specific-------------- "
nmap <Leader>lr :e app/routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>

" -------------Auto-Commands-------------- "
" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
        autocmd BufWritePost .vimrc source %
augroup END

" Automatically insert use for php
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Automatically expand class
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" Sort PHP use statements
" http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" -------------Tips and Reminders-------------- "
" - Press 'zz' to instantly center the line where the cursor is located.
