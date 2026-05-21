-- keymaps.lua: определяет пользовательские привязки клавиш (leader, навигация окон, быстрый выход и т.п.)
local keymap = vim.keymap  -- получаем доступ к API для создания клавиатурных привязок

-- Leader
vim.g.mapleader = " "  -- задаём пробел как <Leader> клавишу

-- Быстрый выход из insert
keymap.set("i", "jk", "<ESC>")  -- быстрый выход из режима insert по нажатию jk

-- Окна
keymap.set("n", "<leader>h", "<C-w>h")  -- переместить курсор в окно слева
keymap.set("n", "<leader>l", "<C-w>l")  -- переместить курсор в окно справа
keymap.set("n", "<leader>j", "<C-w>j")  -- переместить курсор в окно ниже
keymap.set("n", "<leader>k", "<C-w>k")  -- переместить курсор в окно выше

-- Очистка поиска
keymap.set("n", "<leader>nh", ":nohl<CR>")  -- очистить подсветку последнего поиска

-- Форматирование файла
keymap.set("n", "<leader>f", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ async = true, lsp_fallback = true })
  else
    vim.notify("Conform not loaded", vim.log.levels.WARN)
  end
end, { desc = "Format file" })

-- Внутри on_attach функции
local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)     -- показать ошибку
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)            -- предыдущая
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)            -- следующая
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)    -- список ошибок
