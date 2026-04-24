return {
  {
    "hrsh7th/nvim-cmp",  -- основной плагин автодополнения
    event = "InsertEnter",  -- загружать при входе в режим Insert
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- источник LSP-комплитов
      "hrsh7th/cmp-buffer",   -- источник из текущего буфера
      "hrsh7th/cmp-path",     -- источник файловой системы
      "L3MON4D3/LuaSnip",      -- сниппет-движок
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          -- определяем, как разворачивать сниппеты
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),               -- открыть меню автодополнения
          ["<CR>"] = cmp.mapping.confirm({ select = true }),    -- подтверждать выбранный элемент
          ["<C-n>"] = cmp.mapping.select_next_item(),           -- переместиться к следующему элементу
          ["<C-p>"] = cmp.mapping.select_prev_item(),           -- переместиться к предыдущему элементу
        }),

        sources = {
          { name = "nvim_lsp" },   -- LSP-источник
          { name = "buffer" },     -- буферный источник
          { name = "path" },       -- путь к файлам
        },
      })
    end,
  },
}
