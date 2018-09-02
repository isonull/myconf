set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/lervag/vimtex.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'      " git support
Plugin 'https://github.com/vim-syntastic/syntastic.git' " syntax check
Plugin 'https://github.com/Chiel92/vim-autoformat.git'  " auto-format codes
Plugin 'https://github.com/godlygeek/tabular.git'       " tabularise or align
Plugin 'https://github.com/vim-pandoc/vim-pandoc.git'
Plugin 'https://github.com/vim-pandoc/vim-pandoc-syntax'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'https://github.com/Yggdroot/indentLine.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git' " fuzzy file finder
Plugin 'https://github.com/airblade/vim-gitgutter.git' " show git diff +/-
Plugin 'https://github.com/tpope/vim-repeat.git' " repeat mapped command
Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'https://github.com/SirVer/ultisnips.git'
Plugin 'https://github.com/honza/vim-snippets.git' " snippets support
Plugin 'https://github.com/Raimondi/delimitMate.git' " auto closing
Plugin 'https://github.com/luochen1990/rainbow.git'
Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
Plugin 'https://github.com/sjl/gundo.vim.git' " vim undo tree
Plugin 'https://github.com/mileszs/ack.vim.git' " vim grep
Plugin 'https://github.com/python-mode/python-mode.git'
Plugin 'https://github.com/plasticboy/vim-markdown.git'
Plugin 'https://github.com/vimwiki/vimwiki.git'

call vundle#end()            " required

filetype plugin indent on    " required

" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
            \ 'syntax': 'markdown',
            \ 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \ '.mkd': 'markdown',
            \ '.wiki': 'media'}
let g:vimwiki_global_ext = 0
autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown

" rainbow settings
let g:rainbow_active = 1

" YCM settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python3'

" vimtex settings
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:vimtex_fold_enabled = 1
autocmd BufEnter,BufRead,BufNewFile *.tex set filetype=tex

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let b:syntastic_mode = 'passive'

nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>

" Autoformat settings
let g:formatter_yapf_style = 'pep8'

" Airline settings
let g:airline#extensions#tabline#enabled = 1

" indentLine settings
let g:indentLine_conceallevel = 2

" snippets settings
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" vim pandoc settings
" let g:pandoc#syntax#conceal#use = 0
" let g:pandoc#filetypes#pandoc_markdown = 0

nnoremap <silent> <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <F3> :TagbarToggle<cr>
nnoremap <silent> <F4> :IndentGuidesToggle<cr>
nnoremap <silent> <F5> :GundoToggle<cr>

syntax on

" color
set background=dark
colorscheme solarized

" show command autofill options
set wildmenu

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" clipboard
set clipboard=unnamed

" searching highlight
set hlsearch
set incsearch
nnoremap <silent> <leader><CR> :nohlsearch<CR>

" display
set lazyredraw

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" disable bell
set visualbell
set t_vb=

" indentation
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" line display
set linebreak
set textwidth=500
set wrap
set nolist

" position and line
set number
set relativenumber

" spell checking
noremap <leader>ss :setlocal spell!<CR>
" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<CR>

noremap Y y$
" insert mode
inoremap jk <esc>
 inoremap <C-u> <esc>gUiwea

" normal mode
nnoremap <silent> <C-j> mz:m+<CR>`z
nnoremap <silent> <C-k> mz:m-2<CR>`z
vnoremap <silent> <C-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <silent> <C-k> :m'<-2<CR>`>my`<mzgv`yo`z

" edit/source .vimrc
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" window
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>
set splitbelow
set splitright

" tabe
nnoremap <S-Left> gT
nnoremap <S-Right> gt
nnoremap <silent> <esc>[1;9D :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <esc>[1;9C :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
nnoremap <silent> <leader>t :tabnew<CR>

" buffer
nnoremap <silent> <S-Up> :bprevious<CR>
nnoremap <silent> <S-Down> :bnext<CR>
set hidden

" run python script
autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python nnoremap <buffer> <F10> :exec '!python3 > out.txt' shellescape(@%, 1)<CR>

set mouse=a
set ttymouse=xterm2

" abbreviation
iabbrev @@ yanzijun@me.com

" <C_x>k dictionary
set dictionary=/usr/share/dict/words

" conceal setting
set conceallevel=2
let g:tex_conceal="abgm"
