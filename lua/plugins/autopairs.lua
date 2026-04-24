return {
  {
    "windwp/nvim-autopairs",  -- плагин для автоматической вставки парных скобок и т.п.
    event = "InsertEnter",  -- загружать плагин при входе в режим Insert
    config = function()
      -- настроить плагин; включить проверку treesitter (если доступно)
      require("nvim-autopairs").setup({
        check_ts = true,  -- использовать treesitter для более умной работы (может работать нестабильно)
      })
    end,
  },
}
