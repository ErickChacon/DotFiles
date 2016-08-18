" ~/.vimrc
set nocompatible " vim no compatible with with vi
filetype off " vim filetype interferes with vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'sickill/vim-monokai' " colorscheme
Plugin 'altercation/vim-colors-solarized' " colorscheme
Plugin 'junegunn/seoul256.vim' " colorscheme
Plugin 'nielsmadan/harlequin' " colorscheme
Plugin 'ervandew/screen' " send selections to be evaluated
Plugin 'scrooloose/syntastic' " for syntaxis error
Plugin 'ctrlpvim/ctrlp.vim' " for folders ans files
Plugin 'Lokaltog/vim-powerline' " powerline
Plugin 'Valloric/YouCompleteMe' " autocompletition
" Plugin 'JuliaLang/julia-vim' " autocompletition
Plugin 'tpope/vim-surround' " sorround
Plugin 'tomtom/tcomment_vim' " easy comment
Plugin 'vimwiki/vimwiki' " notes
Plugin 'kana/vim-textobj-indent' " copy indented block
Plugin 'kana/vim-textobj-user' " custom text object
Plugin 'Yggdroot/indentLine' " show indentation
Plugin 'SirVer/ultisnips' " snippets 
Plugin 'honza/vim-snippets' " snippets scripts

" Plugin 'powerline/powerline' " bottom line
" Plugin 'jalvesaq/Nvim-R' " Vim's support to edit R code 

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git' " explore your filesystem and to open files

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" old Now we can turn our filetype functionality back on
" old filetype plugin indent on

let mapleader = " " " Leader - ( Spacebar )
set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup " avoid create backup automatically
set nowritebackup " save: avoid new-delete-rename
set history=50 " history of the last commands
set ruler " row and column position
set laststatus=2 " Always display the status line
set encoding=utf-8 " Necessary to show Unicode glyphs
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !
set number " show line number
set numberwidth=5
" set splitright " use in vnew
set title
set hlsearch "highlight searches
set incsearch    " search as characters are entered
set ignorecase    " case insensitive searching (unless specified)
set smartcase
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set showmatch

syntax enable " allow syntax colors
set background=dark " incompatible with colorscheme
" highlight Normal ctermfg=grey ctermbg=darkblue
" colorscheme desert
" colorscheme solarized
" let g:gruvbox_italic=1
set t_Co=256 " allow 256 colors and use external colorschemes
colorscheme gruvbox
" colorscheme monokai
" colorscheme harlequin
" let g:solarized_termcolors=256
" colorscheme solarized
" let g:seoul256_background = 256
" colo seoul256
" set background=dark
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE
" set tabstop=2       " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd         " show incomplete command in bottom bar
set cursorline      " highlight current line
set visualbell      " stop the annoying beeping
filetype indent on  " load filetype-specific indent files R,
set wildmenu        " nice visual autocomplete for command menu
set wildmode=list:longest,full " full menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set clipboard=unnamedplus " copy to clipboard

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Make it obvious where 100 characters is
 set textwidth=80
 " set formatoptions=cq
 set formatoptions=qrn1
 set wrapmargin=0
 set colorcolumn=+1

" Auto resize Vim splits to active split
" set winwidth=104
" set winheight=5
" set winminheight=5
" set winheight=999

"set guifont=Monaco:h80
"set guifont=Monospace:h40

"set term=xterm
"if match($TERM, 'screen')!=-1
"        set term=xterm
"endif

" Options of Screen Plugin to load the desired
" programs such as R, python and julia.
function! s:ScreenShellListener()
    if g:ScreenShellActive
    nmap <C-c><C-c> :ScreenSend<cr> " normal mode
    nmap <C-j> V:ScreenSend<cr>j " normal mode
    vmap <C-j> :ScreenSend<cr> " visual mode
    cmap <C-j> ScreenSend<cr> " console
    nmap <C-c><C-x> :ScreenQuit<cr>
    else
	nmap <C-c><C-c> :ScreenShell! <cr>
	nmap <C-c><C-r> :ScreenShell! R<cr>
	nmap <C-c><C-p> :ScreenShell! python<cr>
	nmap <C-c><C-j> :ScreenShell! julia<cr>
    endif
endfunction

nmap <C-c><C-c> :ScreenShell! <cr>
nmap <C-c><C-r> :ScreenShell! R<cr>
nmap <C-c><C-p> :ScreenShell! python<cr>
nmap <C-c><C-j> :ScreenShell! julia<cr>
augroup ScreenShellEnter
  autocmd User * call <SID>ScreenShellListener()
augroup END
augroup ScreenShellExit
  autocmd User * call <SID>ScreenShellListener()
augroup END

let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
" let g:ScreenShellExternal = 1
"nmap <C-c><C-r> :ScreenShell R<cr>
"nmap <C-c><C-p> :ScreenShell python<cr>
"nmap <C-c><C-j> :ScreenShell julia<cr>

" Testing
:nmap \l :setlocal number!<CR>
:nmap \o :set paste!<CR>
" :nmap j gj " move per row, no line
" :nmap k gk

" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Control P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" :nmap ; :CtrlPBuffer<CR>
" :let g:ctrlp_map = '<Leader>t'
" :let g:ctrlp_match_window_bottom = 0
" :let g:ctrlp_match_window_reversed = 0
" :let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" :let g:ctrlp_working_path_mode = 0
" :let g:ctrlp_dotfiles = 0
" :let g:ctrlp_switch_buffer = 0

" NerdTree settings
:nmap \e :NERDTreeToggle<CR>
" Powerline settings
let g:Powerline_symbols = 'compatible'

":imap <C-L> <Esc>

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
  set nu! 
  set rnu 
endfunction
function! ToggleRelativeOn()
  set rnu!
  set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-l><c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetsDir=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Vimwiki settings
let g:vimwiki_list = [{'path':'$HOME/Documents/vimwiki'}]
" , 'path_html':'$HOME/cerebra/export/html'}]
