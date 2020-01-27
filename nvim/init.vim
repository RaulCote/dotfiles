
"****************************************************
"*************** general config *********************
"****************************************************
 
set number " allow line numbers
set cursorline " highlight current line
set noswapfile "no swap file
set nobackup
set nowritebackup
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2 
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set laststatus=2
let g:jsx_ext_required = 0 "Enable JSX syntax higlighting in .js files
set noshowmode "as we got the status trough airline don't need to display twice
set updatetime=100 "it's set low as recommended for git gutter
set colorcolumn=81
set autowrite "autosaves before changin buffers
set ttimeoutlen=0 "no timeout when switching modes
let mapleader = ' ' "set space as mapleader
set lazyredraw "attemps to kill vim lag
set nostartofline "keep cursor in same place when changing buffers
set splitbelow "new horizontal splits down
set splitright "new vertical splits at right
" Start scrolling before cursor gets to the edge
set scroll=5 
set scrolloff=3
set sidescrolloff=15
set sidescroll=1
" restore session function
set nostartofline
function! RestoreSession()
  if argc() == 0 "vim called without arguments 
    execute'source~/Documents/vimsessions/Session.vim'
  endif
endfunction
autocmd VimEnter * call RestoreSession()

"****************************************************
"*************** vim-plug section *******************
"****************************************************

call plug#begin('~/.config/nvim/plugged')

" ale :: for eslint / prettier use
Plug 'dense-analysis/ale'

" colors schemes
Plug 'ayu-theme/ayu-vim' " ayu
Plug 'morhetz/gruvbox' " gruvbox
Plug 'hzchirs/vim-material' " material different version : the closer to VSC one
Plug 'haishanh/night-owl.vim' "night owl theme

" css color picker - :VCoolor :VCoolIns r (rgb) VCoolIns ra (rgba)
" requires to install 'zenity' for the color picker itself
Plug 'KabbAmine/vCoolor.vim'
" matching bracket pairs
Plug 'jiangmiao/auto-pairs'
" show indent line
Plug 'Yggdroot/indentLine'

" comment lines in blocks a la Visual Studio Code
" gcc to comment a line, number-gcc multiple and gcap for paragraph 
Plug 'tpope/vim-commentary'
" put everything between surroundings
Plug 'tpope/vim-surround'
" close html tags with > char
Plug 'alvan/vim-closetag'
" intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

"git hunks
Plug 'airblade/vim-gitgutter'

"git fugitive
Plug 'tpope/vim-fugitive'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()


"****************************************************
"****************** ack vim *************************
"****************************************************
let g:ackprg = 'ag --vimgrep'

"****************************************************
"****************** airline config ******************
"****************************************************

let g:airline_theme = 'ayu'
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
"******************** ale config ********************
"****************************************************

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

" Fix files automatically on save
let g:ale_fix_on_save = 1

"****************************************************
"******************** color scheme ******************
"****************************************************

if (has('termguicolors'))
  set termguicolors
endif

"ayu config
"let ayucolor = 'light' | 'mirage' | 'dark'
"colorsheme ayu

let ayucolor = 'dark'
colorscheme ayu

"gruvbox config : light mode in medium looks good
"colorscheme gruvbox
"set bg=dark | light
"let g:gruvbox_contrast_light='soft' | 'medium' | 'hard'
"let g:gruvbox_contrast_dark='soft' | 'medium' | 'hard'

"material hzchirs vim config: style: oceanic | dark | light | palenight
"let g:material_terminal_italics = 1
"let g:material_style='oceanic'
"set background=dark
"colorscheme vim-material


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

call coc#add_extension('coc-pairs', 'coc-json', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-snippets', 'coc-highlight')

nnoremap <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if &filetype == 'vim'
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
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
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
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
nmap <Leader>hk <Plug>(GitGutterPrevHunk)
nmap <Leader>hj <Plug>(GitGutterNextHunk)  
nmap <F12> :GitGutterToggle<CR>
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
"***************************************************
"**************** smooth scroll ********************
"***************************************************

let g:smoothie_base_speed = 25
let g:smoothie_update_interval = 5

"***************************************************
"******************** syntax ***********************
"*********** 
let g:javascript_plugin_jsdoc=1 "vim-javascript for jsdoc

"***************************************************
"******************* key bindings ******************
"***************************************************

" Search files by name : only those listed in git (no node_modules etc)
nnoremap <C-p> :GFiles<CR>
" Previous buffer 
nnoremap <C-k> :bprevious<CR>
" Next buffer 
nnoremap <C-j> :bnext<CR>
" close buffer
nnoremap <Leader>bd :Bdelete<CR> 
" Next occurrence
nnoremap <F2> :cnext<CR>
" Previous occurence 
nnoremap <F3> :cprev<CR> 
" COC : Go to Definition with leader gd , back from definition Ctrl-6
nmap <silent> <leader>gd <Plug>(coc-definition)
" COC : Rename symbol
nmap <silent> <leader>sy <Plug>(coc-rename)

nmap <silent> <leader>dy <Plug>(coc-type-definition)
" save session
nmap SQ <Esc>:mksession!~/Documents/vimsessions/Session.vim<CR>:wqa<CR>
" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
" close quickfix / location window
nnoremap <leader>fc :cclose<bar>lclose<cr>
" open quickfix
nnoremap <leader>fo :copen<cr>

"****************************************************
"*********** comments *******************************
"****************************************************
"To install ctags:
"https://askubuntu.com/questions/796408/installing-and-using-universal-ctags-instead-of-exuberant-ctags
"

