# Структура конфигурации Neovim

В данном репозитории находится полностью автономный набор конфигураций для **Neovim** версии 0.12.1. Всё написано на Lua и управляется менеджером плагинов **lazy.nvim**.

## Каталог проекта

```
.
├── init.lua                 # Точка входа – подключает core‑модули и lazy.nvim
├── lazy-lock.json           # Зафиксированные версии плагинов (генерируется lazy.nvim)
├── lua
│   ├── core                 # Основные настройки редактора
│   │   ├── options.lua      # Настройки UI, поведения, поисков, clipboard и др.
│   │   ├── keymaps.lua      # Некоторые пользовательские привязки клавиш (Leader, навигация окон и т.п.), но не все. Какие-то привязки в файлах с плагинами. Пока так
│   │   └── lazy.lua         # Bootstrap lazy.nvim и импорт всех плагинов из "plugins"
│   └── plugins              # Отдельный каталог для каждого плагина
│       ├── autopairs.lua   # nvim-autopairs (+ treesitter integration)
│       ├── cmp.lua         # nvim-cmp, источники (buffer, path, nvim_lsp) + LuaSnip
│       ├── colorscheme.lua # catppuccin theme (mocha) с интеграцией lualine
│       ├── gitsigns.lua    # gitsigns.nvim – гит‑индикаторы и keymaps
│       ├── lsp.lua         # nvim-lspconfig + базовые LSP‑серверы (clangd, pyright, bashls)
│       ├── lualine.lua     # статус‑строка lualine.nvim (auto‑theme)
│       ├── telescope.lua   # Telescope + plenary – fuzzy‑поиск файлов, live grep и др.
│       ├── treesitter.lua  # nvim-treesitter, список парсеров и автосборка
│       └── web-devicons.lua# nvim-web-devicons – иконки файлов (lazy‑загрузка)
└── README.md                # Текущий файл (содержит описание структуры)
```
