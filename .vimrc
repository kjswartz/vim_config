set nocompatible									"We want the latest Vim settings/options
so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start			"Make backspace behave like everyother editor
set number													"Display line numbers.
set noerrorbells visualbell t_vb=		"No damn error bells!
set nowrap													"no word wrap


"--------------Visuals--------------------"
colorscheme onedark
set t_CO=256								"Set 256 colors in terminal vim.
set guifont=Menlo:h14
set macligatures						"Pretty symbols when available.
set guioptions-=e						"we dont want gui tabs
set linespace=15

set guioptions-=l						"Scroll bar visual options.
set guioptions-=L
set guioptions-=r
set guioptions-=R

set tabstop=2								"Soft tabs, 2 spaces
set shiftwidth=2						"Shift to 2

"highlight verticle split with a white bar
hi vertsplit guifg=white guibg=white

"highlight horizontal split of NON ACTIVE window
hi StatusLineNC guifg=LightRed guibg=DarkRed

"highlight horizontal split of active window. this will also 
hi StatusLine guifg=LightGreen guibg=DarkGreen

"Highlight active tab with green color
hi TabLineSel guifg=LightGreen guibg=DarkGreen

"Highlight nonactive tab with red background
hi TabLine guifg=LightRed guibg=DarkRed

"-----------------Search----------------"
set hlsearch      					"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.





"------------Split Management-------------"
set splitright						"And to the right. This feels more natural
set splitbelow						"Make splits default to below...

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"-----------Mappings------------"
"Make it easy to edit vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Make it easy to edit plugins file.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Add highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Searching tags
nmap <Leader>f :tag<space>

"Set modifiable to on
nmap <Leader>m :set ma<cr>

"Ack searching
nmap <D-f> :Ack! '
" Make toggling quotes super easy.
"nmap <D-3> <Plug>Csurround "'
"nmap <D-4> <Plug>Csurround '"
"-----------------Plugins------------------"
"/
"/CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|tags\'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/NERDTree
"/
let NERDTreeHijackNetrw = 0
"Make nerd tree toggle easier.
nmap <D-1> :NERDTreeToggle<cr>

"/
"/GSearch
"/
set grepprg=ack													"We want to use Ack for the search.
let g:grep_cmd_opts = '--noheading'
nmap <Leader>fr :Gsearch<cr>


"/
"/SnipMate
"/
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

"/
"/Markdown
"/
let vim_markdown_preview_hotkey='<C-m>'				" Hot key for loading preview
let vim_markdown_preview_github=1							" Gihub flavored markdown

"---------------Auto-Commands--------------"
"Automatically source Vimrc file on save.
augroup autosourcing
	autocmd!	
	autocmd BufWritePost .vimrc source %
augroup END


"--------------------Tips-----------------------"
"zz to center on cursor
