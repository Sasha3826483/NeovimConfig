-- lazy.lua: bootstrap lazy.nvim (устанавливает менеджер плагинов, если отсутствует) и импортирует конфигурацию всех плагинов из каталога plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"  -- путь к директории, где будет установлен lazy.nvim

-- Если lazy.nvim еще не установлен, клонируем его из репозитория
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })  -- выполнить git clone в указанный путь
end

vim.opt.rtp:prepend(lazypath)  -- добавить директорию lazy.nvim в runtimepath

-- Инициализация lazy.nvim с импортом всех плагинов из каталога plugins
require("lazy").setup({
    spec = {
        { import = "plugins" },  -- импортировать конфигурацию плагинов
    },
})
