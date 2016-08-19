" Environment {
    set nocompatible                " Must be first line
    " Let Vim use utf-8 internally
    set encoding=utf-8
    set fileencoding=utf-8
" }

" General {
    filetype plugin indent on       " Automatically detect file types
    set incsearch                   " Find as you type search
    set ignorecase
    set smartcase                   " Case sensitive when upper case present
" }

" Vim UI {
    "colorscheme darkblue
    set background=dark             " Assume a dark background

    syntax on                       " Syntax highlighting

    set cursorline                  " Highlight current line
    set cursorcolumn                " Highlight current column
    highlight CursorLine term=reverse cterm=NONE ctermbg=242

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    set number
    set relativenumber

    set scrolloff=10                " Minimum lines to keep above and below cursor

    set hlsearch                    " Highlight search matches

    set list
    set listchars=tab:>\ ,trail:•

    set wildmenu                    " Show list instead of just completing

    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    endif

    if has('statusline')
        set laststatus=2            " Always show status line

        set statusline=%<%f
        set statusline+=%m%r
        set statusline+=[%{&ff}/%Y]
        set statusline+=[%{getcwd()}]
        set statusline+=%=%14.(%l,%c%V%)\ %p%%
    endif
" }

" Formatting {
    "set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every 4 columns
    set softtabstop=4               " Let backspace delete indent

    " Matlab {
"        autocmd FileType matlab setlocal textwidth=70
    " }

" }

" Key (re)Mappings {
    " Wrapped lines goes down/up to next row, rather than next line.
    noremap j gj
    noremap k gk
" }
"
" Complete {
    set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
    set complete+=k
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                    \   if &omnifunc == "" |
                    \       setlocal omnifunc=syntaxcomplete#Complete |
                    \   endif
        autocmd BufRead,BufNewFile *.launch setfiletype xml
    endif

    set completeopt=menuone,longest
" }
