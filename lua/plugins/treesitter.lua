-- treesitter.lua: подключает nvim-treesitter, устанавливает набор парсеров и запускает автостарт
return {
  {
    "nvim-treesitter/nvim-treesitter",  -- улучшенный синтаксический анализ и подсветка
    branch = "main",
    build = ":TSUpdate",  -- автоматически обновлять парсеры после установки/обновления

    event = { "BufReadPost", "BufNewFile" },  -- загружать при открытии буфера

    config = function()
      local ts = require("nvim-treesitter")

      local parsers = {
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
      }

      -- установить нужные парсеры
      ts.install(parsers, { summary = true })

      -- автостарт Treesitter при открытии файлов поддерживаемых типов
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
