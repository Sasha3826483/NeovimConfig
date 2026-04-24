-- lualine.lua: статус‑строка lualine.nvim, использующая текущий colorscheme и иконки
return {
    {
    "nvim-lualine/lualine.nvim",  -- статус‑строка и информация о редакторе
    event = "VeryLazy",  -- загружается после темы (catppuccin)
    dependencies = { "catppuccin/nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",  -- автоматически подобрать тему в зависимости от colorscheme
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },
}
