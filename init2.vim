syntax enable	" подсветка
color habamax
filetype plugin on
filetype plugin indent on	" для дерева файлов
" command! MakeTags !ctags -R .	" показ исходного кода (скачтать ctags)
set path+=**	" переход в директорию запуска nvim
set wildmenu	" автокомплит в командной строке
set wildmode=full	" автокомплит в столбец
set wildignorecase	" игнорирование регистра в автокомплите
set shiftwidth=4 " правильное расставление линий
set softtabstop=4
set mouse=a " включение мышки
set number
" set relativenumber	" относительная нумерация
set clipboard+=unnamedplus " использование сисетменого буфера
set tabstop=4
set ignorecase	" игнорирование регистра при поиске
set smartcase " учёт регистра, если используются большие буквы 
set cursorline	" подсветка текущей линии
set hlsearch	" подсветка при поиске
set nobackup	" не сохраняет бэкапы для оптимизации
set nowritebackup	
" set so=999	" курсор по центру
imap jj <Esc>	" горячие клавиши для норм режима
let g:netrw_banner = 0	" скрыть банер в дереве файлов
let g:netrw_winsize = 18  " размер в процентах
let g:netrw_liststyle=3		" иерархия в 3 уровня
" let g:netrw_browse_split = 3	" открыть в новом табе
nnoremap <C-n> :Lexplore<CR>
nnoremap <C-m> :FloatermToggle<CR>
"tnoremap <C-m> <C-\><C-n>:FloatermToggle<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-p> :Files<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-b> :Buffer<CR>
" setlocal spell spelllang=ru_yo,en_us	" использование русских букв
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set noruler	" отключение отображения строк нумерации строки и колонки
set laststatus=0	" отключение линии статус
" Запоминает, где nvim последний раз редактировал файл
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au BufEnter * set fo-=c fo-=r fo-=o	" убрать автокомментирование строк
set splitright	" разделение справа
set splitbelow	" разделение вниз
" Язык
set keymap=russian-jcukenwin
set iminsert=0 " Чтобы при старте ввод был на английском, а не русском (start > i)
set imsearch=0 " Чтобы при старте поиск был на английском, а не русском (start > /)
inoremap <C-l> <C-^> " Чтобы вместо Ctrl-^ нажимать Ctrl

highlight lCursor guifg=NONE guibg=Cyan " Смена цвета курсораet keymap=russian-jcukenwin

nnoremap <silent><F1> :noh<CR> " По F1 очищаем последний поиск с подсветкой
set noswapfile
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'davidhalter/jedi-vim'
" automplite
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()
" По умолчанию я не хочу использовать LSP, но иногда, когда это необходимо, я могу просто вызвать StartLsp
"чтобы запустить его
function g:StartLsp()
	function! OnLspBufferEnabled() abort
	    setlocal omnifunc=lsp#complete
	    setlocal signcolumn=yes
	    nmap <buffer> gi <plug>(lsp-definition)
	    nmap <buffer> gd <plug>(lsp-declaration)
	    nmap <buffer> gr <plug>(lsp-references)
	    nmap <buffer> gl <plug>(lsp-document-diagnostics)
	    nmap <buffer> <f2> <plug>(lsp-rename)
	    nmap <buffer> <f3> <plug>(lsp-hover)
	endfunction
	
	augroup lsp_install
	  au!
	  autocmd User lsp_buffer_enabled call OnLspBufferEnabled()
	augroup END

endfunction

