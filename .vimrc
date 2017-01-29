" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" git clone https://github.com/Lokaltog/powerline-fonts.git
autocmd BufRead,BufNewFile *.py let python_highlight_all=1

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" PLUGINS
Plugin 'unblevable/quick-scope'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tComment'
Plugin 'The-NERD-tree'
" Plugin 'python.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'Solarized'
" Plugin 'Syntastic'
Plugin 'w0rp/ale'
Plugin 'vividchalk.vim'
" Plugin 'SuperTab'
Plugin 'fugitive.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'molokai'
Plugin 'pangloss/vim-javascript'
" Plugin 'davidhalter/jedi-vim'
Bundle 'git://github.com/reedes/vim-lexical'
Bundle 'ervandew/supertab'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'git://github.com/hashivim/vim-terraform'
Plugin 'altercation/vim-colors-solarized'
Plugin 'maralla/completor.vim'
Plugin 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
syntax enable

" Syntax error checking
" let g:syntastic_enable_highlighting = 1
" autocmd FileType python let b:syntastic_checkers = ["flake8"]

" Disable folding
set nofoldenable

" Set search highlighting
set hlsearch

" Jedi code completion
" let g:jedi#completions_command = "<C-N>"
" Disable preview pane
set completeopt=longest,menuone

" Disable jedi popup on dots
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
" let g:jedi#completions_enabled = 0
" Disable docstring window on completion
" autocmd FileType python setlocal completeopt-=preview

" Disable rope, fixes slow jedi python
let g:pymode_rope = 0

" Supertab fixes on new lines
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" javascript folding
let b:javascript_fold = 0

let vimrplugin_assign = 0

set encoding=utf-8 " Necessary to show Unicode glyphs

" Powerline settings
" NOTE: you should install the custom powerline fonts.
" let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" Always show statusline
set laststatus=2
set showcmd             " show command in bottom bar
" set cursorline

" solarized options
" NOTE: solarized color scheme is annoying to get working
"       on OS X for some reason.
" set t_Co=256
" let g:solarized_visibility = "low"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 256
" let g:solarized_termtrans = 1
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" set background=dark
" colorscheme solarized

set backspace=indent,eol,start

" Set terminal colors to 256
set t_Co=256
" colorscheme vividchalk
colorscheme molokai
" let g:molokai_original = 1

" Line numbers
" set number
set numberwidth=5

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Brackets
set showmatch           " highlight matching [{()}]

" Show hidden characters
" set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Quick toggle paste mode
set pastetoggle=<F2>

" nnoremap // :TComment<CR>
" vnoremap // :TComment<CR>

map <C-n> :NERDTreeToggle<CR>

" lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us','en_ca',]

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" JS indenting
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(pyc|exe|so|dll|class|png|jpg|jpeg)$',
    \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    " ctrl-p use git if available
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" In gvim, this makes copying use the system's clipboard
" set clipboard=unnamed

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
