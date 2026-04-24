# Структура конфигурации Neovim

В данном репозитории находится полностью автономный набор конфигураций для **Neovim** (0.9+). Всё написано на Lua и управляется менеджером плагинов **lazy.nvim**.

## Каталог проекта

```
.
├── init.lua                 # Точка входа – подключает core‑модули и lazy.nvim
├── lazy-lock.json           # Зафиксированные версии плагинов (генерируется lazy.nvim)
├── lua
│   ├── core                 # Основные настройки редактора
│   │   ├── options.lua      # Настройки UI, поведения, поисков, clipboard и др.
│   │   ├── keymaps.lua      # Пользовательские привязки клавиш (Leader, навигация окон и т.п.)
│   │   └── lazy.lua         # Bootstrap lazy.nvim и импорт всех плагинов из "plugins"
│   └── plugins              # Отдельный файл‑конфиг для каждого плагина
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

### Описание ключевых файлов

- **init.lua** – главный файл, который вызывается Neovim при старте. Последовательно загружает `core.options`, `core.keymaps` и `core.lazy`.
- **lua/core/options.lua** – задаёт глобальные опции (`number`, `relativenumber`, `tabstop`, `expandtab`, `termguicolors` и др.).
- **lua/core/keymaps.lua** – определяет `mapleader` (`space`), быстрый выход из Insert (`jk`), навигацию между окнами (`<leader>h/j/k/l`) и очистку подсветки поиска.
- **lua/core/lazy.lua** – проверяет наличие `folke/lazy.nvim`, при необходимости клонирует его, добавляет в `runtimepath` и инициализирует lazy‑модель, импортируя все плагины из каталога `plugins`.
- **lua/plugins/*.lua** – каждый файл экспортирует таблицу, которую понимает `lazy.nvim`. Внутри указаны:
  - репозиторий плагина,
  - событие/условие lazy‑загрузки (`event`, `cmd`, `keys` и т.д.),
  - список зависимостей (`dependencies`),
  - функция `config` с настройками и привязками клавиш.

## Используемые плагины

| Плагин | Что делает | Как загружается |
|--------|------------|-----------------|
| `catppuccin/nvim` | Тема оформления (flavour `mocha`). Интегрирована с `lualine`. | **не lazy** – загружается сразу (`lazy = false`). |
| `nvim-lualine/lualine.nvim` | Статус‑строка, отображает режим, ветку Git, позицию и т.п. | `event = "VeryLazy"` (после темы). |
| `nvim-telescope/telescope.nvim` + `nvim-lua/plenary.nvim` | Файловый поиск, live‑grep, буферы, help‑теги. | Загружается при первом вызове команд (`builtin.find_files` и т.д.). |
| `nvim-treesitter/nvim-treesitter` | Улучшенный синтаксис, подсветка, инкрементальные парсеры. | `event = {"BufReadPost", "BufNewFile"}` – при открытии файла. |
| `windwp/nvim-autopairs` | Автоматическое закрытие скобок, поддержка treesitter. | `event = "InsertEnter"`. |
| `hrsh7th/nvim-cmp` + `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, `L3MON4D3/LuaSnip` | Система автодополнения, интегрирована с LSP и сниппетами. | `event = "InsertEnter"`. |
| `neovim/nvim-lspconfig` | Базовая конфигурация LSP‑серверов. | `event = {"BufReadPre", "BufNewFile"}`. |
| `lewis6991/gitsigns.nvim` | Индикация git‑изменений в гутере, навигация по hunks, быстрые команды. | Загружается сразу (не lazy). |
| `nvim-tree/nvim-web-devicons` | Иконки файлов для UI‑компонентов (lualine, telescope и др.). | `lazy = true` – загружается только при запросе. |

