return {
  {
    "nvim-treesitter/nvim-treesitter", -- плагин Treesitter для синтаксического анализа

    branch = "main", -- использовать новую ветку с новым API

    build = ":TSUpdate", -- после установки/обновления обновлять парсеры

    event = { "BufReadPost", "BufNewFile" }, -- загружать плагин при открытии файла

    config = function()
      -- подключаем основной модуль nvim-treesitter
      local ts = require("nvim-treesitter")

      -- устанавливаем парсеры для нужных языков
      ts.install({
        "lua",
        "vim",
        "vimdoc",
        "python",
        "bash",
        "json",
        "html",
        "css",
        "javascript",
        "typescript",
        "c",
        "cpp",
      })

      -- при определении типа файла запускать Treesitter
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- запускаем Treesitter для текущего буфера
          -- pcall защищает от ошибок, если парсер отсутствует
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
