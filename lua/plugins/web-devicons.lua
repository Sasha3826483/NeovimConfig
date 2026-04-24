-- web-devicons.lua: подключает nvim-web-devicons для отображения файловых иконок в UI‑компонентах
return {
    {
        "nvim-tree/nvim-web-devicons",  -- иконки файлов для различных UI компонентов
        lazy = true,  -- загружается только по запросу (при необходимости)
    },
}
