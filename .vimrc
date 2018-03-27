execute pathogen#infect()
let mapleader =","
nnoremap  <F12> :!cscope -bR<CR>:cs reset<CR><CR>
nnoremap <C-A> :NERDTreeToggle<cr>
nnoremap <leader>nt :NERDTreeFind<cr>
nnoremap <leader>mr :MRU<cr>
nnoremap <leader>tt :TagbarToggle<cr>
nnoremap <leader>gre :%!grep 
nnoremap <tab> %
nnoremap <C-]> g<C-]>


nnoremap ; :

imap jk <esc>
set number
colorscheme dracula
set clipboard=unnamed
set hlsearch
set smartcase
set ignorecase
set list
set listchars=tab:▸\ ,trail:.,extends:#,nbsp:.
set incsearch
au BufRead,BufNewFile *.ttcn* set filetype=ttcn
au BufRead,BufNewFile *.cpp* set filetype=cpp
au BufRead,BufNewFile *.hpp* set filetype=cpp
au BufRead,BufNewFile *.k3.txt* set filetype=k3
au BufRead,BufNewFile *.out.post* set filetype=out
au BufRead,BufNewFile *.out* set filetype=out

au BufReadPost quickfix set modifiable

au! Syntax ttcn source ~/.vim/syntax/ttcn.vim
au! Syntax cpp source ~/.vim/syntax/cpp.vim
au! Syntax hpp source ~/.vim/syntax/cpp.vim
au! Syntax k3 source ~/.vim/syntax/k3.vim
au! Syntax out source ~/.vim/syntax/out.vim

" set term=builtin_xterm
" syntax on
set t_Co=256

" enable mouse support
set mouse=a

syntax enable

set showmatch
set mat=2



" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"set cindent
filetype plugin on
filetype plugin indent on

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

nnoremap <leader>cl :noh<CR>
" Vim can see bash aliases
set shellcmdflag=-ic

set laststatus=2
set wrap

"Search path for gF

let g:defaultpath = &path
set path+=$CPLANE_WORKING_COPY/C_Application/**
set path+=$CPLANE_WORKING_COPY/lteDo/C_Application/**
set path+=$CPLANE_WORKING_COPY/I_Interface/**
set path+=$CPLANE_WORKING_COPY/C_Test/cplane_k3/src/**
let g:cplanepath = &path
let &path = g:defaultpath

"smart gF
"map<f6> <ESC>:let &path = g:cplanepath<CR><C-W>gF<CR>:let &path = g:defaultpath<CR><CR>



" simple mappings to save a lot of time
com W w
com WQ wq
com Wq wq
com Q q

function! SwitchToSource()
    let s:path = expand("%:p")
    if match(s:path, "/Source/.*\.cpp") >= 0
        call SwitchToHeader()
    elseif match(s:path, "/Include/UecI.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/UecI", "/Include/Uec", "")
        let s:path = substitute(s:path, "/Include/", "/Source/", "")
        let s:path = substitute(s:path, "\.hpp", "\.cpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/", "/Source/", "")
        let s:path = substitute(s:path, "\.hpp", "\.cpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*TestSuite\.cpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/", "/Source/", "")
        let s:path = substitute(s:path, "TestSuite", "", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*Mock\.hpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/Mocks/", "/Source/", "")
        let s:path = substitute(s:path, "Mock\.hpp", "\.cpp", "")
        exe ":e " s:path
    else
        echo "NO: " s:path
    endif
endfun

function! SwitchToHeader()
    let s:path = expand("%:p")
    if match(s:path, "/Source/.*\.cpp") >= 0
        let s:path = substitute(s:path, "/Source/", "/Include/", "")
        let s:path = substitute(s:path, "\.cpp", "\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/UecI.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/UecI", "/Include/Uec", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/.*\.hpp") >= 0
        call SwitchToSource()
    elseif match(s:path, "/Test_modules/.*TestSuite\.cpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/", "/Include/", "")
        let s:path = substitute(s:path, "TestSuite", "", "")
        let s:path = substitute(s:path, "\.cpp", "\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*Mock\.hpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/Mocks/", "/Include/", "")
        let s:path = substitute(s:path, "Mock\.hpp", "\.hpp", "")
        exe ":e " s:path
    else
        echo "NO: " s:path
    endif
endfun

function! SwitchToTestSuite()
    let s:path = expand("%:p")
    if match(s:path, "/Source/.*\.cpp") >= 0
        let s:path = substitute(s:path, "/Source/", "/Test_modules/", "")
        let s:path = substitute(s:path, "\.cpp", "TestSuite\.cpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/UecI.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/UecI", "/Include/Uec", "")
        let s:path = substitute(s:path, "/Include/", "/Test_modules/", "")
        let s:path = substitute(s:path, "\.hpp", "TestSuite\.cpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/", "/Test_modules/", "")
        let s:path = substitute(s:path, "\.hpp", "TestSuite\.cpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*TestSuite\.cpp") >= 0
        echo "ALREADY IN TEST SUITE"
    elseif match(s:path, "/Test_modules/.*Mock\.hpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/Mocks/", "/Test_modules/", "")
        let s:path = substitute(s:path, "Mock", "TestSuite", "")
        let s:path = substitute(s:path, "\.hpp", "\.cpp", "")
        exe ":e " s:path
    else
        echo "NO: " s:path
    endif
endfun

function! SwitchToMock()
    let s:path = expand("%:p")
    if match(s:path, "/Source/.*\.cpp") >= 0
        let s:path = substitute(s:path, "/Source/", "/Test_modules/Mocks/", "")
        let s:path = substitute(s:path, "\.cpp", "Mock\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/UecI.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/UecI", "/Include/Uec", "")
        let s:path = substitute(s:path, "/Include/", "/Test_modules/Mocks/", "")
        let s:path = substitute(s:path, "\.hpp", "Mock\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/", "/Test_modules/Mocks/", "")
        let s:path = substitute(s:path, "\.hpp", "Mock\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*TestSuite\.cpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/", "/Test_modules/Mocks/", "")
        let s:path = substitute(s:path, "TestSuite", "Mock", "")
        let s:path = substitute(s:path, "\.cpp", "\.hpp", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*Mock\.hpp") >= 0
        echo "ALREADY IN MOCK"
    else
        echo "NO: " s:path
    endif
endfun

function! SwitchToInterface()
    let s:path = expand("%:p")
    if match(s:path, "/Source/.*\.cpp") >= 0
        let s:path = substitute(s:path, "/Source/", "/Include/", "")
        let s:path = substitute(s:path, "\.cpp", "\.hpp", "")
        let s:path = substitute(s:path, "/Include/Uec", "/Include/UecI", "")
        exe ":e " s:path
    elseif match(s:path, "/Include/UecI.*\.hpp") >= 0
        echo "ALREADY IN INTERFACE"
    elseif match(s:path, "/Include/Uec.*\.hpp") >= 0
        let s:path = substitute(s:path, "/Include/Uec", "/Include/UecI", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*TestSuite\.cpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/", "/Include/", "")
        let s:path = substitute(s:path, "TestSuite", "", "")
        let s:path = substitute(s:path, "\.cpp", "\.hpp", "")
        let s:path = substitute(s:path, "/Include/Uec", "/Include/UecI", "")
        exe ":e " s:path
    elseif match(s:path, "/Test_modules/.*Mock\.hpp") >= 0
        let s:path = substitute(s:path, "/Test_modules/Mocks/", "/Include/", "")
        let s:path = substitute(s:path, "Mock\.hpp", "\.hpp", "")
        let s:path = substitute(s:path, "/Include/Uec", "/Include/UecI", "")
        exe ":e " s:path
    else
        echo "NO: " s:path
    endif
endfun

function SexyPlane()
"get current line number
    let b:line = line(".")
"delete duplicated spaces
    exe ":12,$s/\\(^ *\\)\\@<! \\{2,}/ /ge"
"reduce multiple blank lines
    exe ":g/^\\_$\\n\\_^$/d"
"move , to the left
    exe ":%s/\\(^ *\\)\\@<! ,/,/ge"
"delete spaces before )
    exe ":%s/\\(^ *\\)\\@<! )/)/ge"
"delete spaces before ;
    exe ":%s/\\(^ *\\)\\@<! ;/;/ge"
"delete spaces after (
    exe ":%s/( /(/ge"
"put space after ,
    exe ":%s/,\\( \\|$\\)\\@!/, /ge"
"remove spaces between >
    exe ":%s/> >/>>/ge"
"remove space between ( and !
    exe ":%s/( !/(!/ge"
"remove space between const and &
    exe ":%s/\\<const &/const\\&/ge"
"remove space between auto and &
    exe ":%s/\\<auto &/auto\\&/ge"
"put space after if
    exe ":%s/ if(/ if (/ge"
"put space after for
    exe ":%s/ for(/ for (/ge"
"put space after while
    exe ":%s/ while(/ while (/ge"
"put space after switch
    exe ":%s/ switch(/ switch (/ge"
"put space after catch
    exe ":%s/ catch(/ catch (/ge"
"put space after return
    exe ":%s/ return(/ return (/ge"
"put space between ) and const
    exe ":%s/)const\\>/) const/ge"
"put space between ) and override
    exe ":%s/)override\\>/) override/ge"
"put space between ) and final
    exe ":%s/)final\\>/) final/ge"
"remove unnecesary _ptr
    exe ":%s/\\(shared\\|unique\\)\\@<!_ptr//ge"
"remove virtual when override
    exe ":%s/virtual \\(.*override\\)\\@=//ge"
"autoindent all file
"    exe ":12"
"    exe ":normal! =G"
"broke too long lines
"    exe ":%s:\\(//.*\\)\\@<!, \\(.*\\%>121v\\)\\@=:,\\r:ge"
"autoindent all file
"    exe ":12"
"    exe ":normal! =G"
"go to line taken in the begining
    exe ":".b:line
endfun
map <F2> :call SwitchToHeader()<CR>
nnoremap <leader>a :call SwitchToHeader()<CR>
map <F3> :call SwitchToSource()<CR>
map <F4> :call SwitchToTestSuite()<CR>
map <F5> :call SwitchToMock()<CR>
map <F6> :call SwitchToInterface()<CR>
map <F9> :call SexyPlane()<CR>

set hidden
"Search path for gF

let g:defaultpath = &path
set path+=$CPLANE_WORKING_COPY/C_Application/**
set path+=$CPLANE_WORKING_COPY/lteDo/C_Application/**
set path+=$CPLANE_WORKING_COPY/I_Interface/**
set path+=$CPLANE_WORKING_COPY/C_Test/cplane_k3/src/**
let g:cplanepath = &path
let &path = g:defaultpath

map<f6> <ESC>:let &path = g:cplanepath<CR><C-W>gF<CR>:let &path = g:defaultpath<CR><CR>
" s: Find this C symbol
 nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
 nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
 nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
 nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
 nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
 nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
 nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
 nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

set tags=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_ut
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_ttcn3

"./lteTools/scbm/bin/lte_env_utils.sh -utf
"


"buffers
nnoremap <leader>ma <C-w>_ <C-w>\|
nnoremap <leader>re <C-w>=

nnoremap <leader>bd :BD<cr>
nnoremap <leader>bn :BF<cr>
nnoremap <leader>bp :BB<cr>

"splits
nnoremap <leader>sp :sp<cr>
nnoremap <leader>vs :vs<cr>

nnoremap <leader>gb :Gblame<cr>

let MRU_Max_Entries = 1000

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>clr :nohl<cr>

nnoremap <C-j> :m +1<cr>
nnoremap <C-k> :m -2<cr>

nnoremap <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

nnoremap <leader>do m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <leader>dO m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

"search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <leader>z :A<cr>
nnoremap <C-w><C-w> <C-W><C-p>
