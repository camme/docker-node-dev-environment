set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'wavded/vim-stylus'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
"Plug 'marijnh/tern_for_vim'
Plug 'ternjs/tern_for_vim'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'rking/ag.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'Lokaltog/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/TaskList.vim'
Plug 'digitaltoad/vim-jade'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shutnik/jshint2.vim'
Plug 'mxw/vim-jsx'
"Plug 'bling/vim-airline'
"Plug 'powerline/powerline'
Plug 'paradigm/vim-multicursor'
Plug 'mxw/vim-xhp'
Plug 'sjl/gundo.vim'
"Plug 'ap/vim-css-color'
Plug 'vim-scripts/loremipsum'
Plug 'XadillaX/json-formatter.vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'marchelzo/ircnvim'
Plug 'vim-scripts/VimIRC.vim'
"Plug 'flowtype/vim-flow'
"Plug 'steelsojka/deoplete-flow'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'elzr/vim-json'
Plug 'tpope/vim-jdaddy'
"Plug 'junegunn/vim-slash'
Plug 'jaxbot/semantic-highlight.vim'
"Plug 'blueyed/vim-diminactive'
Plug 'altercation/vim-colors-solarized'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on    " required

syntax on
set syn=auto
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=4
set number
set wildignore+=node_modules
set wildignore+=pim
set wildignore+=dist

set backupdir=~/.vim/backup
set directory=~/.vim/tmp

syntax enable
"set regexpengine=1

set background=dark

try
    colorscheme desert
    colorscheme solarized

catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

set clipboard=unnamed

function! ClipboardYank()
    call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
    let @@ = system('pbpaste')
endfunction

"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>
"onoremap <silent> y y:call ClipboardYank()<cr>
"onoremap <silent> d d:call ClipboardYank()<cr>

" shortcut for for loops i js
ab fori for ( let i = 0, ii = ___.length; i < ii; i++ l) {

"py import uuid
"ab uuuid :=pyeval('str(uuid.uuid4())')

"function! UUID()
" pyeval('str(uuid.uuid4())')  
"endfunction

"map ;U :call UUID()<CR>

" shortcut for commenting
function! Komment()
  if getline(".") =~ '\/\/'
    let hls=@/
    s/^\/\///
    let @/=hls
  else
    let hls=@/
    s/^/\/\//
    let @/=hls
  endif
endfunction
map ;k :call Komment()<CR>

"map ' <Nop>
map ;l :tabprevious<CR>
map ;' :tabnext<CR>
map ;p :tabnew<CR>

nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" Map :W to :w since i always accidentally press wrong
command W w

" Map NT to toggle NERDTreeTabsToggle
command NT NERDTreeTabsToggle

map <Leader>dr :python debugger_resize()<cr>
map <Leader>di :python debugger_command('step_into')<cr>
map <Leader>do :python debugger_command('step_over')<cr>
map <Leader>dt :python debugger_command('step_out')<cr>

map <Leader>ds :python debugger_run()<cr>
map <Leader>dq :python debugger_quit()<cr>
map <Leader>dc :python debugger_context()<cr>
map <Leader>dp :python debugger_property()<cr>

map <Leader>dwc :python debugger_watch_input("context_get")<cr>A<cr>
map <Leader>dwp :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>

set tags=tags;

map <Leader>ee :s/\s\+$//g<cr>

let g:syntastic_javascript_checkers = ['eslint']

autocmd FileType javascript noremap <buffer>  <c-d> :call JsBeautify()<cr>

" Multicursor
nnoremap <Leader>c :<c-u>call MultiCursorPlaceCursor()<cr>
nnoremap <Leader>cm :<c-u>call MultiCursorManual()<cr>
nnoremap <Leader>cx :<c-u>call MultiCursorRemoveCursors()<cr>
xnoremap <Leader>cv :<c-u>call MultiCursorVisual()<cr>
nnoremap <Leader>cr :<c-u>call MultiCursorSearch('')<cr>
nnoremap <Leader>cw :<c-u>call MultiCursorSearch('<c-r><c-w>')<cr>
xnoremap <Leader>ck "*y<Esc>:call MultiCursorSearch('<c-r>=substitute(escape(@*, '\/.*$^~[]'), "\n", '\\n', "g")<cr>')<cr>
let g:multicursor_quit = "{<Leader>cq}"

" XML formatter
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')
 
    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

let mapleader = "\\"

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>

nmap <leader>e A<Esc>x

filetype plugin indent on

"define 3 custom highlight groups
hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
 
set statusline=
"set statusline+=%1*  "switch to User1 highlight
set statusline+=%F   "full filename
set statusline+=%2*  "switch to User2 highlight
set statusline+=%y   "filetype
set statusline+=%3*  "switch to User3 highlight
set statusline+=%l   "line number
set statusline+=%*   "switch back to statusline highlight
set statusline+=%P   "percentage thru file

set laststatus=2

:nnoremap <Leader>s :SemanticHighlightToggle<cr>

highlight SignColumn ctermbg=Black

if has('neovim')
    let g:deoplete#enable_at_startup = 1
    let s:python_host_init = 'python -c "import neovim; neovim.start_host()"'
    let &initpython = s:python_host_init
    let &initclipboard = s:python_host_init
    set unnamedclip " Automatically use clipboard as storage for the unnamed register
else 

endif

" Turn of beep
set noeb vb t_vb=

:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" No more ex mode
nnoremap Q <nop>

" Remember folds
" TUNED OF ON THE 9th of MArch 2017 because it gave an error
" autocmd BufWrite * mkview
" autocmd BufRead * silent loadview

" Ignore folders etc in ctrl p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '(pim|node_modules)'
  \ }

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

set hlsearch

" Sometimes easytags takes to much time when we save a file, so this is
" supposed to make it faster
"let g:easytags_syntax_keyword = 'always'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
au BufRead,BufNewFile *.jsx set filetype=javascript

let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile 
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()

  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " is read-only (write with :w new_filename)
  setlocal buftype=nowrite
  " no undo possible
  setlocal undolevels=-1
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."

endfunction

set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Repeat commands
vnoremap . :normal .<CR>

let g:tern_show_argument_hints=1

" vim colors settings
let g:cssColorVimDoNotMessMyUpdatetime = 1

set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" ignore case if no uppercase letter exists in search query
set smartcase





let g:deoplete#enable_at_startup = 1

" call deoplete#enable_logging("DEBUG", "/Users/camilo/Projects/flowtest/debug.logg")

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

