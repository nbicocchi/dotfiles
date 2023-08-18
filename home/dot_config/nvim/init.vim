call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'dmerejkowsky/vim-ale'
Plug 'vim/colorschemes'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons' 
Plug 'https://github.com/tc50cal/vim-terminal' 
Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/terryma/vim-multiple-cursors' 
"Plug 'https://github.com/neoclide/coc.nvim' 
"Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ayu-theme/ayu-vim'
call plug#end()

:set encoding=UTF-8
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set termguicolors     
:set completeopt-=preview 

:let ayucolor="light"
:colorscheme ayu

:let g:NERDTreeDirArrowExpandable="+"
:let g:NERDTreeDirArrowCollapsible="~"

:nnoremap <C-f> :NERDTreeToggle<CR>
:nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
:nnoremap <C-Left> :tabprevious<CR>
:nnoremap <C-Right> :tabnext<CR>
:nmap <F8> :TagbarToggle<CR>

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

