" Set Leaders for plugins ------------- {{{
let mapleader="\<Space>"
let maplocalleader="\\"
" }}}

" Load Plugins ------------------------ {{{
" Source files only if they exist ----- {{{
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }}}

" External Plugins
call plug#begin("~/.vim/plugged")
    " Generic plugins
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'joshdick/onedark.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'ggreer/the_silver_searcher'

    " Rust
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'"
    Plug 'hrsh7th/vim-vsnip'
call plug#end()
" }}}

" UI Config --------------------------- {{{
syntax enable
set cursorline
set number
set relativenumber
set scrolloff=5
set guifont=jetbrains_mono_semi_light:h13
set splitright
set splitbelow
set signcolumn=yes
set foldmethod=syntax
set foldnestmax=2
set foldlevelstart=1
set hidden
set nowrap

" OneDark
if (has("termguicolors"))
     set termguicolors
endif
colorscheme onedark

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}

" Generic Config ----------------------- {{{
set ignorecase
set smartcase
" }}}

" Remaps ------------------------------ {{{
" Unbind for tmux
map <C-a> <Nop>

" JK no more editing... and training
inoremap jk <esc>

" Autocomplete characters for coding -- {{{
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : '""<left>'
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" }}}

" Clear the last highlight
nnoremap <leader><cr> :nohlsearch<cr>

" Hit vimrc faster
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
" }}}

" Autocommands ------------------------ {{{
augroup all_files
    autocmd!
    autocmd FileType * exe "normal zr"
augroup END

augroup vimscript_files
    autocmd!
    autocmd FileType vim
      \ setlocal foldmethod=marker |
      \ exe "normal zM"
augroup END

augroup js_files
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
augroup END

augroup python_files
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
    autocmd FileType python
        \ setlocal tabstop=4 |
        \ setlocal softtabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal expandtab |
        \ setlocal fileformat=unix |
        \ setlocal foldmethod=manual
augroup END

augroup rust_files
    autocmd!
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" }}}

" Vimscript Tweaks -------------------- {{{
" Set silver searcher as default lgrep command
set grepprg=ag\ --vimgrep\ $* 
set grepformat=%f:%l:%c:%m
" }}}

" Plugin Configs ---------------------- {{{
" Rust stuff ---------------------------{{{

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Load rust-tools config from Lua file
:lua require('rust-tools-init')

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" }}}"

" NERDTree ---------------------------- {{{
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" }}}

" Fzf --------------------------------- {{{
nnoremap <leader>s :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" }}}
" }}}

" ASCII-cat, because why not?
echom ">^.^<"
