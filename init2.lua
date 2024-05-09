vim.opt.syntax = "ON"	-- подсветка
vim.opt.termguicolors = true	-- подсветка терминала
vim.cmd('set path+=**')	-- переход в директорию запуска nvim
vim.cmd('set wildmenu')	-- автокомплит в командной строке
vim.opt.backup = false	-- отключение свап-файлов
vim.opt.number = true	-- нумерация строк
vim.opt.relativenumber = true	-- нумерация ввех и вниз
vim.opt.mouse = 'a'	-- использование мышки во всех режимах
vim.opt.ignorecase = true	-- игнорирование регистра при поиске
vim.opt.smartcase = true	-- учитывает регистр с большими буквами
vim.opt.wrap = true	-- перенос текста
vim.opt.fileencoding = "utf-8"	-- encoding
vim.opt.cursorline = true	-- подсветка текущей строки
vim.cmd('colorscheme evening')	-- тема
vim.opt.clipboard:append("unnamedplus")	-- системный буфер обмена

-- Использование русского
vim.cmd("set keymap=russian-jcukenwin")
vim.cmd("set iminsert=0")
vim.cmd("set imsearch=0")
vim.keymap.set({'i', 'n', 'v'}, '<C-l>', '<C-^>')

-- Автоматическое выставление знаков
-- vim.keymap.set("i", "'", "''<left>")
-- vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")

-- LSP	
vim.lsp.start({
  name = 'python',
  cmd = {'pyright'},
  root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
})

