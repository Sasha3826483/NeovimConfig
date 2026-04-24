-- options.lua: задаёт глобальные опции Neovim (UI, отступы, поиск, clipboard и пр.)
local opt = vim.opt  -- ссылка на объект настроек Neovim

-- UI
opt.number = true  -- показывать абсолютные номера строк
opt.relativenumber = true  -- показывать относительные номера строк
opt.cursorline = true  -- подсвечивать текущую строку курсором

-- Tabs / indent
opt.tabstop = 4  -- количество пробелов, соответствующее табуляции
opt.shiftwidth = 4  -- количество пробелов для автоматических отступов
opt.expandtab = true  -- использовать пробелы вместо символов табуляции
opt.smartindent = true  -- включить умные отступы при написании кода

-- Search
opt.ignorecase = true  -- игнорировать регистр при поиске
opt.smartcase = true  -- если в запросе есть заглавные буквы, поиск будет чувствителен к регистру

-- Clipboard
opt.clipboard = "unnamedplus"  -- использовать системный буфер обмена для yank/paste

-- Performance
opt.updatetime = 250  -- время (мс) бездействия перед вызовом событий вроде CursorHold
opt.timeoutlen = 400  -- время (мс) ожидания клавиши после клавиши‑префикса (например <Leader>)

-- Splits
opt.splitright = true  -- новые вертикальные сплиты открывать справа от текущего окна
opt.splitbelow = true  -- новые горизонтальные сплиты открывать ниже текущего окна

opt.termguicolors = true  -- включить поддержку 24‑bit цветов в терминале
