" enable syntax highlighting
"
syntax on

" overwrite annoying default keys
map Q <Nop>
map q <Nop>
map <F1> <Nop>
map K <Nop>
map <Cap> <Nop>

" center text after jumping to next item
nnoremap n nzz

" Map arrow keys to null operation
" Later will modify to control switching between buffers in vim diff mode (vim -d)
" map <Up> <Nop>
" map <Down> <Nop>
" map <Left> <Nop>
" map <Right> <Nop>
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
" An easier shortcut
nmap w <Left>
nmap <silent> <Right> :wincmd l<CR>
" An easier shortcut
nmap e <Right>

" Map navigation keys to make a little more sense
" left
noremap j h
" right
" leave as is
" up
noremap i k
" down
noremap k j
" speedy nav
map K 5k
map I 5i
map L 5l
map J 5j

" map quick insert mode
nnoremap ; :startinsert<Enter>
inoremap ; <ESC>l
" vnoremap ; <ESC>

" ********************** STATUS LINE **************************

" Status line color???
" hi User1 ctermbg=black ctermfg=black guibg=black guifg=black
set statusline=%1*

" Status line
set statusline+=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

" ************************* TAB SETTINGS *************************
" Tab = two spaces
set shiftwidth=2 softtabstop=2 tabstop=2
" Expand tabs into spaces
autocmd Filetype * :set expandtab
autocmd Filetype * :retab

" ************************* COMMENT SETTINGS *********************
" Disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ************************* MISC SETTINGS ************************
" sets backspace to remove indents, eol, and ???
set backspace=indent,eol,start

" Enable neocomplcache at startup
let g:neocomplcache_enable_at_startup = 1

" Configure space highlighting colors
let g:spacehi_tabcolor="ctermfg=White ctermbg=Green guifg=White guibg=Green"
let g:spacehi_spacecolor="ctermfg=Black ctermbg=Blue guifg=Black guibg=Blue"
let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"


" Turn on space highlighting by default
" autocmd syntax * SpaceHi

" Turn off search highlighting by default
autocmd VimEnter * :set nohlsearch
" Map toggle search highlighting
map h :set hlsearch! hlsearch?<Enter>

" Map command line auto-comploete to more appropiate key(s)
"cmap LL <Plug>CmdlineCompleteForward
"cmap JJ <Plug>CmdlineCompleteBackward

" Map easier comment settings
" nmap m gcc
" vmap m gc
nmap s gcc
vmap s gc

" Set comment string for spec files
autocmd Filetype spec set commentstring=#\ %s
" Set comment string for gsp files
autocmd Filetype gsp set commentstring=%{--\ %s\ --}%
" Set comment string for java files
autocmd Filetype java set commentstring=//\ %s
" Set comment string for groovy files
autocmd Filetype groovy set commentstring=//\ %s
" Set comment string for ccxml/vxml files
autocmd FileType vxml set commentstring=<!--\ %s\ -->
autocmd FileType ccxml set commentstring=<!--\ %s\ -->
" Set comment string for elixir files
autocmd FileType elixir set commentstring=#\ %s
" Set comment string for embedded elixir files
autocmd FileType eex set commentstring=<!--\ %s\ -->
" Set comment string for earl grey files
autocmd FileType imba set commentstring=#\ %s
" Set comment string for elm files
autocmd FileType elm set commentstring={-\ %s\ -}

" ignore case
set ignorecase
set smartcase

" show line number and column at bottom right
" set ruler

" Search as you type (incremental search)
set incsearch

" change working directory to loaded file
set autochdir

set virtualedit=onemore

" ***************************** NEEDS SORTED ***************************
" Give us some way to enter ';' in insert mode (since we mapped over it)
" inoremap :: ;
inoremap ** ;

" Skip to end of line
" noremap f A:stopinsert<Enter>
noremap f A<Esc>l
" Skip to end of line and enter insert
noremap F A
" Skip to beginning of line
map a ^
" Skip to beginning of line and enter insert
map A ^:startinsert<Enter>

" Remap auto-complete
inoremap <C-n> <tab>

" Colors for highlighting seem to be all fucked up on this systema nd can't be fixed
" Fix autocomplete coloring
" autocmd VimEnter hi Pmenu ctermbg=Green
" autocmd VimEnter hi Pmenu ctermfg=Black
" hi PmenSel guibg=Cyan
" autocmd VimEnter hi PmenSel ctermfg=Black
" autocmd VimEnter hi PmenSel ctermbg=Black

" inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Reverse supertab navigation (tab descends, s-tab ascends)
"let g:SuperTabDefaultCompletionType = "<c-n>"

" !!! INSTALL VIM PLUG FOR PLUGINS TO WORK !!! "

" Plugins
call plug#begin('~/.nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

call plug#end()

"let g:python_recommended_style = 0
"au Filetype python setlocal ts=2 sts=0 sw=2
filetype plugin on
autocmd FileType python setlocal noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
