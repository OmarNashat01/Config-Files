let mapleader = ","


"Make vim yank and paste from system clipboard
set clipboard=unnamed

set enc=utf-8

set nocompatible
set number relativenumber
set splitright splitbelow
set nowrap
set noerrorbells
set signcolumn=number
set scrolloff=8 "Keep 8 lines under or above my cursor when scrolling
set showcmd

set ignorecase
set smartcase
set wildmenu
set hidden
set backspace=indent,eol,start

set notimeout ttimeout ttimeoutlen=200

set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab


if has('filetype')
	filetype indent plugin on
endif

if has('syntax')
	syntax on
endif


set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

map Y y$

set listchars=tab:¶━,trail:●,eol:¬,nbsp:_
set list

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap + 5<C-w>>
nmap - 5<C-w><

nnoremap ; :
nnoremap : ;

nnoremap gb :buffers<CR>:buffer<Space>
nnoremap cb :buffers<CR>:bd<Space>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"set search highlighting
"set hlsearch


																			
call plug#begin('~/.vim/plugged')

"General vim plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'


"Theme related
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'



"NERD-TREE AND NERD-COMMENTER for all languages
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

"MARKDOWN PLUGINS
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'mmai/vim-markdown-wiki'


"Fuzzy finder -- very fast searching tool
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', {'do': { ->fzf#install() } }




"To be able to compile and run without exiting vim or putting it on hold
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'


"For programming languages and syntax
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Snippets Manager
Plug 'honza/vim-snippets'

call plug#end()


noremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-f> :FZF<CR>


au BufRead,BufNewFile *.asm set filetype=masm
au BufRead,BufNewFile *.inc set filetype=masm
au BufRead *.pdf,*.png,*.jpeg sil exe "!start " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!



if has('termguicolors')
  set termguicolors
endif

colorscheme gruvbox "Add the name of the scheme you want (ex. gruvbox, sonokai,..)
set background=dark


" Open vimrc with <Leader>rc
nnoremap <leader>rc :e /Users/sicom/_vimrc<CR>

"Open Notes index page
nnoremap <leader>ni :cd /Users/sicom/Documents/Notes<CR>:e Index.md<CR>

if has("autocmd")

	" Markdown Configuration
"
	" Spellcheck in British English
	autocmd FileType markdown setlocal spell spelllang=en_gb
	autocmd FileType markdown set spell
	" Automatically open Goyo
	"autocmd FileType markdown Goyo
	autocmd Filetype markdown noremap <C-g> :Goyo<CR>
	" Hide plain text formatting and use color instead

	autocmd FileType markdown set conceallevel=0

	" Disable cursor line and column highlight
	autocmd FileType markdown set nocursorline
	autocmd FileType markdown set nocursorcolumn
	autocmd Filetype markdown set wrap

	autocmd Filetype markdown nnoremap <BS> <C-o>
	set colorcolumn=0
endif

" Configuration for vim-markdown
"let g:vim_markdown_toc_autofit = 1
""let g:vim_markdown_folding_disabled = 1
""let g:vim_markdown_conceal_code_blocks = 2
"let g:vim_markdown_math = 1
"let g:vim_markdown_toml_frontmatter = 1
"let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_strikethrough = 1
"let g:vim_markdown_autowrite = 1
"let g:vim_markdown_edit_url_in = 'tab'
"let g:vim_markdown_follow_anchor = 1


"Async Settings
"let g:asyncrun_open = 6
"let g:asynctasks_term_pos = 'external'
"let g:asynctasks_term_reuse = 1

"Coc Settings
let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
let g:coc_global_extensions = [
	\  'coc-prettier',
	\  'coc-clangd',
	\  ]
"let b:coc_root_patterns = [
	"\ '.sln',
	"\  ]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1

														
"Look for this when using cpp again
"                                                       
"
"Coc Settings
vmap <leader>act  <Plug>(coc-codeaction-selected)

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fa <Plug>(coc-format)

imap <silent><c-l> <Plug>(coc-snippets-expand)
imap <silent><c-j> <Plug>(coc-snippets-jump)


"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> rn <Plug>(coc-rename)
nmap <leader> qf  <Plug>(coc-fix-current)


