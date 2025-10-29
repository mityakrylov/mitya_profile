""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'Valloric/ListToggle'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/ReplaceWithRegister'
set rtp+=~/.fzf

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix for putty
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Correct mapping of functional keys for putty ESC[n~ functional keyboard setting and
" screen-256color terminal
map [11~ <F1>
map [12~ <F2>
map [13~ <F3>
map [14~ <F4>
map! [11~ <F1>
map! [12~ <F2>
map! [13~ <F3>
map! [14~ <F4>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable mouse everywhere
set mouse=a

" Use smartcase search (ignore case only when searching all lowercase letter)
set ignorecase
set smartcase

" enable 256 colors
set t_Co=256
" enable syntax highlighting
syntax on
" display line numbers
set number

set background=dark
colorscheme wombat256mod

" Size of tab
set tabstop=4
" Indents width
set shiftwidth=4
" expand tabs to spaces
set expandtab

" smart autoindenting when starting a new line.  Works for C-like
" programs, but can also be used for other languages
set smartindent
" Smart indents in .py files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
" Copy indent from current line when starting a new line
set autoindent

" Highlighting search results
set hlsearch

" Show invisible characters but no end of line, show trailing spaces as '.'
set list
set listchars=trail:.

" correct backspace
set backspace=indent,eol,start

" Some speedup
" Maximum column in which to search for syntax items
set synmaxcol=400
" A fast terminal
set ttyfast
" Maximum number of lines to scroll the screen
set ttyscroll=3
" The screen will not be redrawn while executing macros, registers and other
" commands that have not been typed
set lazyredraw

" Enhanced command complition (see :h<tab>)
set wildmenu
set wcm=<TAB>

if version >= 800
" always show sign column
set signcolumn=yes
endif

" persistent undo
call system('mkdir -p $HOME/.vim/undo')
set undofile
set undodir=$HOME/.vim/undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = get(g:, 'airline#extensions#tabline#enabled', 1)

let g:airline_theme = 'dark'
" display the status line always
set laststatus=2

" EasyMotion
" Disable deafult mappings
let g:EasyMotion_do_mapping = 0
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap S <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" No default mappings for NerdCommenter
let NERDCreateDefaultMappings=0
" Use left comment by default
let g:NERDDefaultAlign = 'left'
" Use Ctrl+/ to toggle comments
nmap  <plug>NERDCommenterToggle
vmap  <plug>NERDCommenterToggle
" Create mappings like in Visual Studio
"nmap <C-k><C-k> <plug>NERDCommenterAlignLeft
"vmap <C-k><C-k> <plug>NERDCommenterAlignLeft
"nmap <C-k><C-u> <plug>NERDCommenterUncomment
"vmap <C-k><C-u> <plug>NERDCommenterUncomment

let g:ycm_autoclose_preview_window_after_completion = get(g:, 'ycm_autoclose_preview_window_after_completion', 1)
let g:ycm_autoclose_preview_window_after_insertion = get(g:, 'ycm_autoclose_preview_window_after_insertion', 1)

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

" Settings for CtrlSF
nmap <C-f> <Plug>CtrlSFPrompt
vmap <C-f> <Plug>CtrlSFVwordPath
nmap <F9> <Plug>CtrlSFCCwordPath

"let g:ctrlsf_auto_focus = { "at": "done", "duration_less_than": 2000 }
let g:ctrlsf_auto_focus = { "at": "start" }

" FZF
nmap ø :FZF<CR>

" ALE
let g:ale_sign_error = '■'
let g:ale_sign_warning = '■'

hi Error ctermfg=252 ctermbg=124 cterm=none gui=undercurl guisp=Red
hi ErrorMsg ctermfg=196 ctermbg=234 cterm=bold guifg=#ff2026 guibg=#3a3a3a gui=bold
hi SpellBad ctermfg=252 ctermbg=124 cterm=none gui=undercurl guisp=Red
hi SpellCap ctermfg=239 ctermbg=221 cterm=none gui=undercurl guisp=Red
hi SignColumn ctermfg=241 ctermbg=232 cterm=none guifg=#857b6f guibg=#080808 gui=none
hi ALEErrorSign ctermfg=124 ctermbg=232 cterm=none gui=undercurl guisp=Red
hi ALEWarningSign ctermfg=221 ctermbg=232 cterm=none gui=undercurl guisp=Red

nmap <silent> [l <Plug>(ale_previous_wrap)
nmap <silent> ]l <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'python': ['flake8'],
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Press space to start entering command in normal mode
"nmap <Space> :

" Open file under cursor in vertical split
"map gv <C-w>v<C-w>lgf

" Open and close quick fix window
map <Leader>oq :copen<CR>
map <Leader>cq :cclose<CR>

" Global replace word under cursor on \rr
nmap <Leader>rr :%s/<C-r><C-w>//g<Left><Left>

" Close current buffer on Alt+w
:nmap w :call Bclose()<CR>
:nmap ∑ :call Bclose()<CR>
" Close current window on Alt+q
map q :q<CR>
map œ :q<CR>
" Close all windows on Alt+Shift+q
map Q :qa<CR>
map Œ :qa<CR>

" Ctrl+s to save (need to properly setup putty: send correct signal on ctrl+s)
map <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>

" \N to toggle line numbers and sign column
fun! ToggleSignColumn()
    if &signcolumn == 'yes'
        set signcolumn=no
    else
        set signcolumn=yes
    endif
endf

nmap <Leader>N :set invnumber<CR>:call ToggleSignColumn()<CR>

" Move between splits on Ctrl+h,j,k,l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Paste mode
"set pastetoggle=<leader>p
set pastetoggle=π

nmap <F3> :noh<CR>

nmap <F12> :YcmCompleter GoToDefinition<CR>

map <F2> :NERDTreeToggle<CR>
map! <F2> <ESC>:NERDTreeToggle<CR>

map <F10> :bprevious<CR>
map! <F10> <ESC>:bprevious<CR>

map <F11> :bnext<CR>
map! <F11> <ESC>:bnext<CR>i


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" delete buffer without closing window
function! Bclose()
    let curbufnr = bufnr("%")
    let altbufnr = bufnr("#")

    if buflisted(altbufnr)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == curbufnr
        new
    endif

    if buflisted(curbufnr)
        execute("bdelete! " . curbufnr)
    endif
endfunction

" Preview window on the bottom of vim
function! PreviewDown()
    if !&previewwindow
        silent! wincmd P
    endif
    if &previewwindow
        silent! wincmd J
        silent! wincmd p
    endif
endf
au BufWinEnter * call PreviewDown()

" Remove trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,sh,yaml,json autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Color column (grey color for all columns after 120)
"let &colorcolumn=join(range(120,999),",")
"highlight ColorColumn ctermbg=235

" Highlight .sh files as bash
let g:is_bash = 1

" dot in keywords for sh languages
let g:sh_noisk="yes"

" Copy between vim instances using tmp file
vmap <leader>y :w! ~/tmp/vim_clipboard<CR>
nmap <leader>p :r! cat ~/tmp/vim_clipboard<CR>

