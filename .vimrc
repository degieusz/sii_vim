execute pathogen#infect()

let mapleader =","
nnoremap  <F12> :!cscope -bR<CR>:cs reset<CR><CR>
nnoremap <C-A> :NERDTreeToggle<cr>
nnoremap <leader>nt :NERDTreeFind<cr>
nnoremap <leader>m :MRU<cr>
nnoremap <leader>tt :TagbarToggle<cr>
nnoremap <leader>gre :%!grep <space>
nnoremap <leader>igre :%!grep -v <space>
nnoremap <leader>vgre :vimgrep  <cword> %<cr>
nnoremap <tab> %
nnoremap <C-]> g<C-]>


nnoremap ; :

imap jk <esc>
imap kj <esc>
set number
colorscheme dracula
set clipboard=unnamedplus
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
set smartindent "?
set autoindent

"set cindent
"
filetype plugin on
filetype plugin indent on
set background=light

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

nnoremap <leader>cl :noh<CR>
" Vim can see bash aliases
set shellcmdflag=-ic

set laststatus=2
set wrap

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

set tags=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_ut
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_ttcn3
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_dg_k3lteasn1
"set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/Tags/tags_issar_cpp
set tags+=/var/fpwork/dgudersk/bts_sc_cplane/lteDo/I_Interface/Application_Env/Isar_Env/tags

"./lteTools/scbm/bin/lte_env_utils.sh -utf

"buffers
nnoremap <leader>bm <C-w>_ <C-w>\|
nnoremap <leader>br <C-w>=

nnoremap <leader>bd :BD<cr>
nnoremap <leader>bn :BF<cr>
nnoremap <leader>bp :BB<cr>

"splits
nnoremap <leader>sp :sp<cr>
nnoremap <leader>vs :vs<cr>

nnoremap <leader>gb :Gblame<cr>

let MRU_Max_Entries = 1000

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>clr :nohl<cr>

nnoremap <C-j> :m +1<cr>
nnoremap <C-k> :m -2<cr>


nnoremap <leader>do m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <leader>dO m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

"search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <leader>sa :bufdo! %s/\<<C-r><C-w>\>//ge<left><left><left>

nnoremap <leader>z :A<cr>
nnoremap <C-w><C-w> <C-W><C-p>

" Make shift-insert work like in Xterm:
map       <S-Insert>  <MiddleMouse>
map!  <S-Insert>  <MiddleMouse>

" Remove trailing whitespace after bufwrite
autocmd BufWrite * silent! %s/\s\+$//ge
if executable('ag')
      let g:ackprg = 'ag --vimgrep'
  endif

nnoremap <leader>awc :Ack <cword><cr>
nnoremap <leader>ab :Ack <cword> %<cr>
nnoremap <leader>acb :Ack  %<left><left>
nnoremap <leader>aw :Ack <cword><cr>
nnoremap <leader>awt :Ack <cword> C_Test/<cr>
nnoremap <leader>aia :Ack <cword> C_Application/<cr>
nnoremap <leader>aa :Ack <cword> --ignore-dir Test_modules C_Application/<cr>
nnoremap <leader>ar :Ack <cword> C_Application/SC_RROM<cr>
nnoremap <leader>air :Ack <cword> --ignore-dir Test_modules C_Application/SC_RROM<cr>
nnoremap <leader>ac :Ack <cword> C_Application/SC_CELLC<cr>
nnoremap <leader>aic :Ack <cword> --ignore-dir Test_modules C_Application/SC_CELLC<cr>
nnoremap <leader>ai :Ack <cword> I_Interface/<cr>
nnoremap <leader>av :Ack <cword>
nnoremap <C-y> :e **/
nnoremap <C-y>t :e C_Test/**/

nnoremap <C-y>r :e C_Application/SC_RROM/**/
nnoremap <C-y>c :e C_Application/SC_CELLC/**/
nnoremap <C-y>u :e C_Application/SC_UEC/**/
nnoremap <C-y>a :e C_Application/**/
nnoremap <C-y>i :e I_Interface/**/

let &t_SI = "\<Esc>]12;yellow\x7"
let &t_EI = "\<Esc>]12;blue\x7"
nnoremap <leader>ll :BLines<cr>
nnoremap <leader>lo :Locate
nnoremap <leader>lg :Lines<cr>
nnoremap <leader>lb :Buffers<cr>

" Make it obvious where 80 characters is
set colorcolumn=+1
set textwidth=0 wrapmargin=0

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>
set rtp+=~/.fzf
set cursorline
let NERDTreeShowLineNumbers=1
nnoremap <leader>mb :vertical resize +10<cr>
nnoremap <leader>ms :vertical resize -10<cr>
nnoremap <leader>mhb :resize +10<cr>
nnoremap <leader>mhs :resize -10<cr>
autocmd BufRead,BufNewFile *.ttcn* set filetype=ttcn
autocmd! Syntax ttcn source ~/.vim/syntax/ttcn.vim

autocmd BufRead,BufNewFile *.log set filetype=nsn-syslog
autocmd! Syntax nsn-syslog source ~/.vim/syntax/nsn-syslog.vim

autocmd BufRead,BufNewFile *.k3.txt,*k3.log set filetype=nsn-k3txt
autocmd! Syntax nsn-syslog source ~/.vim/syntax/nsn-k3txt.vim

autocmd BufRead,BufNewFile *.out set filetype=nsn-syslog
autocmd BufRead,BufNewFile *.LOG set filetype=nsn-syslog


"file extension ignore in search
:set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

nmap <leader>sfp :let @+=expand("%:p")<CR>
nmap <leader>sfi :let @+=expand("%:t")<CR>
nmap <leader>sfn :let @+=expand("%:t")<CR>

nnoremap <leader>tn :tabNext<cr>
nnoremap <leader>tp :tabprevious<cr>
