"****************************************************
"*************** general config *********************
"****************************************************

set number " allow line numbers
set relativenumber " display relative numbers to cursor position
set cursorline " highlight current line
set mouse=a
set noswapfile "no swap file
set nobackup
set nowritebackup
set expandtab " On pressing tab, insert 4 spaces
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4 
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set laststatus=2
let g:jsx_ext_required = 0 "Enable JSX syntax higlighting in .js files
set noshowmode "as we got the status trough airline don't need to display twice
set updatetime=100 "it's set low as recommended for git gutter
set colorcolumn=81
set autowrite "autosaves before changin buffers
set ttimeoutlen=0 "no timeout when switching modes
let mapleader = ' ' "set space as mapleader
" set lazyredraw "attemps to kill vim lag
set nostartofline "keep cursor in same place when changing buffers
set splitbelow "new horizontal splits down
set splitright "new vertical splits at right
" Start scrolling before cursor gets to the edge
set scrolloff=3
set sidescrolloff=15
set sidescroll=1
set foldmethod=manual
" don't start auto comment
au BufEnter * set fo-=c fo-=r fo-=o

" Force j and k to work on display lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" autoreload changes made outside vim

if ! exists("g:CheckUpdateStarted")
  let g:CheckUpdateStarted=1
  call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
  silent! checktime
  call timer_start(1000,'CheckUpdate')
endfunction

"****************************************************
"**************** filetypes *************************
"****************************************************
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"****************************************************
"*************** vim-plug section *******************
"****************************************************

call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'suxpert/vimcaps'
" colors schemes
Plug 'barlog-m/oceanic-primal-vim'
Plug 'ayu-theme/ayu-vim' " ayu
Plug 'morhetz/gruvbox' " gruvbox
Plug 'hzchirs/vim-material' " material different version : the closer to VSC one
Plug 'kaicataldo/material.vim'  
Plug 'chuling/vim-equinusocio-material'   " new material for vim
Plug 'sainnhe/sonokai'
Plug 'crusoexia/vim-monokai'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ntk148v/vim-horizon'
" css color picker - :VCoolor :VCoolIns r (rgb) VCoolIns ra (rgba)
" requires to install 'zenity' for the color picker itself
Plug 'KabbAmine/vCoolor.vim'
" matching bracket pairs
Plug 'jiangmiao/auto-pairs'
" show indent line
Plug 'Yggdroot/indentLine'

" nerdtree
Plug 'preservim/nerdtree'

" comment lines in blocks a la Visual Studio Code
" gcc to comment a line, number-gcc multiple and gcap for paragraph 
Plug 'tpope/vim-commentary'
" put everything between surroundings
Plug 'tpope/vim-surround'
" close html tags with > char
Plug 'alvan/vim-closetag'
" intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" airline :: status bar customization
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" maintain Layout when closing buffers
Plug 'moll/vim-bbye'

" fzf :: fuzzy search files 
" silver searcher or ripgrep: sudo apt-get ripgrep / silversearcher -ag
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" vim slash : better higlighting on regular vim search
Plug 'junegunn/vim-slash' 
" ack search
Plug 'mileszs/ack.vim'

" snippets
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'simonsmith/vim-custom-snippets'
Plug 'SirVer/ultisnips'

" syntax higlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'sheerun/vim-polyglot'

"git hunks
Plug 'airblade/vim-gitgutter'

"git fugitive
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" tests
Plug 'vim-test/vim-test'

" " prettier
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 call plug#end()

"****************************************************
"****************** fugitive ************************
"****************************************************

set diffopt+=vertical

"****************************************************
"****************** ack vim *************************
"****************************************************
let g:ackprg = 'ag --vimgrep'

"****************************************************
"****************** airline config ******************
"****************************************************

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t' " Show the filename
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 0

" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.dirty=⚡
  
"****************************************************
"******************** color scheme ******************
"****************************************************

if (has('termguicolors'))
  set termguicolors
endif

"ayu config
"let ayucolor = 'light' | 'mirage' | 'dark'
"colorsheme ayu

let ayucolor = 'mirage'
colorscheme ayu
let g:airline_theme = 'ayu_mirage'

" colorscheme oceanic-primal

" colorscheme horizon

" let g:sonokai_style = 'shusia'
" let g:sonokai_style = 'andromeda'
" let g:sonokai_style = 'atlantis'
" let g:sonokai_style = 'maia'  "the nice one
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai

" let g:equinusocio_material_darker = 0
" let g:equinusocio_material_hide_vertsplit = 1
" colorscheme equinusocio_material

"gruvbox config : light mode in medium looks good
"set bg=dark | light
"let g:gruvbox_contrast_light='soft' | 'medium' | 'hard'
"let g:gruvbox_contrast_dark='soft' | 'medium' | 'hard'
" set bg=dark
" let g:gruvbox_bold=0
" let g:gruvbox_contrast_dark = 'soft'
" colorscheme gruvbox
" let g_airline_theme = 'gruvbox'

"material hzchirs vim config: style: oceanic | dark | light | palenight
" set background=dark
" let g:material_terminal_italics = 1
" let g:material_style='palenight'
" let g:airline_theme='material'
" colorscheme vim-material


" set background=dark
" colorscheme palenight
" let g:airline_theme = 'palenight'
" let g:palenight_terminal_italics=1


"this material version is the one with React Components on goldie
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'   
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'palenight'
" let g:airline_theme = 'material'
" colorscheme material

" indent line color scheme. colors set 0 means take from colorscheme,
" next line change indentLine to VSC style
let g:indentLine_setColors = 0
let g:indentLine_char='▏'

"***************************************************
"***************** closetag ************************
"***************************************************

let g:closetag_filenames = "*.html,*.js,*.jsx"

"***************************************************
"******************* coc ***************************
"***************************************************

autocmd FileType scss setl iskeyword+=@-@
"note : prettier-eslint inside .config/coc/extensions/node_modules/coc-prettier/package.json - ^10.1.1 - forced to 9.0.1
call coc#add_extension('coc-pairs', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-snippets', 'coc-highlight', 'coc-emmet', 'coc-python')

command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction


"***************************************************
"******************* nerdtree ********************
"***************************************************
nnoremap <Leader>tr :NERDTreeToggle<CR>

"***************************************************
"******************* fzf search ********************
"***************************************************

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" put FZF in the middle of the screen
if has('nvim')
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  function! FloatingFZF()
    " Size and position
    " on center screen
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

"***************************************************
"****************** git gutter *********************
"***************************************************

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified='•'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0

"***************************************************
"**************** smooth scroll ********************
"***************************************************

let g:smoothie_base_speed = 25
let g:smoothie_update_interval = 5

"***************************************************
"******************** syntax ***********************
"*************************************************** 

" let g:polyglot_disabled = ['jsx', 'js']
let g:javascript_plugin_jsdoc=1 "vim-javascript for polyglot jsdoc

"***************************************************
"******************* key bindings ******************
"***************************************************
set nostartofline
nnoremap ñ /
" Previous buffer 
nnoremap <C-k> :bprevious<CR>
" Next buffer 
nnoremap <C-j> :bnext<CR>
" Move lines
nnoremap <a-j> :move+<CR>
xnoremap <a-j> :move'>+<CR>gv
nnoremap <a-k> :move-2<CR>
xnoremap <a-k> :move-2<CR>gv
" close buffer via bbye, keeping layout
nnoremap <Leader>bd :Bdelete<CR> 
" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
" allow us to go to normal mode in terminal mode so we can scroll etc
tnoremap <F1> <C-\><C-n>
" folding method
inoremap <F11> <C-O>za
nnoremap <F11> za
onoremap <F11> <C-C>za
"select in visual and fold
vnoremap <F11> zf 
"""""""""""""""""""""""""""""""""""""""""""""""""""" git gutter
nmap <Leader>hj <Plug>(GitGutterNextHunk)  
nmap <Leader>hk <Plug>(GitGutterPrevHunk)
nmap <F12> :GitGutterToggle<CR>
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <Leader>hf :GitGutterEnable<bar>GitGutterQuickFix<bar>copen<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""" git messenger
"hunk blame
nmap <Leader>hb :GitMessenger<CR> 
""""""""""""""""""""""""""""""""""""""""""""""""""""" coc
" COC : Go to Definition with leader gd , back from definition Ctrl-6
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nnoremap <silent> <F11> :<C-u>CocList diagnostics<cr>
" COC : Rename symbol
" nmap <silent> <leader>sy <Plug>(coc-rename)
" Coc-fzf - search symbols
nmap <silent> <leader>sy :CocFzfList symbols<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""" fzf
nnoremap <leader>rg :Rg<CR>'
" Search files by name : only those listed in git (no node_modules etc)
nnoremap <C-p> :GFiles<CR>
" Search on project term under cursor
nnoremap <C-f> :Ag <C-R><C-W> *<CR>
" Search on project visual selection
xnoremap <C-f> "vy:<C-u>Ag <C-r>v<CR>: 
"""""""""""""""""""""""""""""""""""""""""""""""""""" quickfix
nnoremap <leader>fj :cnext<CR>
nnoremap <leader>fk :cprev<CR> 
" close quickfix / location window
nnoremap <leader>fc :cclose<bar>lclose<cr>
nnoremap <leader>fo :copen<cr>
