-- init.lua: основной входной файл, подключает базовые настройки и менеджер плагинов
require("core.options")  -- загрузить настройки UI и поведения редактора
require("core.keymaps")  -- загрузить пользовательские клавиатурные привязки
require("core.lazy")  -- инициализировать lazy.nvim (плагин‑менеджер)

-- local osc52 = require("vim.ui.clipboard.osc52")

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
      },
}

vim.opt.clipboard:append('unnamedplus')
