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
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tComment'
Plugin 'The-NERD-tree'
Plugin 'python.vim'
Plugin 'Solarized'
Plugin 'Syntastic'
Plugin 'vividchalk.vim'
Plugin 'SuperTab'
Plugin 'fugitive.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'molokai'
Plugin 'pangloss/vim-javascript'
Bundle 'git://github.com/davidhalter/jedi-vim'
Bundle 'git://github.com/reedes/vim-lexical'

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
let g:syntastic_enable_highlighting = 1
autocmd FileType python let b:syntastic_checkers = ["flake8"]

" Disable folding
set nofoldenable

" Set search highlighting
set hlsearch

" Jedi code completion
" let g:jedi#completions_command = "<C-N>"
" Disable preview pane
set completeopt=longest,menuone

" javascript folding
let b:javascript_fold = 0

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
"       on OS X for some reason. I use 
" set t_Co=256
" let g:solarized_visibility = "low"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 256
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized

" Set terminal colors to 256
set t_Co=256
" colorscheme vividchalk
colorscheme molokai
" let g:molokai_original = 1

" Line numbers
set number
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

" In gvim, this makes copying use the system's clipboard
" set clipboard=unnamed
