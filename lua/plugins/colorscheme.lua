-- colorscheme.lua: задаёт тему catppuccin (flavour "mocha") и интегрирует её с lualine
return {
    {
    "catppuccin/nvim",  -- тема оформления catppuccin
    name = "catppuccin",
    priority = 1000,     -- высокий приоритет, чтобы тема загрузилась первой
    lazy = false,       -- отключаем lazy‑загрузку, тема должна быть сразу доступна
    config = function()
      -- настроить тему: выбрать вариант "mocha" и включить интеграцию с lualine
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          lualine = true,
        },
      })
      -- переключить colorscheme на установленную тему
      vim.cmd.colorscheme "catppuccin-nvim"
    end,
  },
}
