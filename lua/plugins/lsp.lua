-- lsp.lua: конфигурирует nvim-lspconfig и подключает базовые LSP‑серверы (clangd, pyright, bashls)
return {
  {
    "neovim/nvim-lspconfig",  -- конфигурация LSP для Neovim
    event = { "BufReadPre", "BufNewFile" },  -- загружать при открытии/создании буфера

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- интеграция LSP с системой автодополнения nvim-cmp
    },

    config = function()
      -- подготовить capabilities, чтобы nvim-cmp мог использовать LSP‑комплекты
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- настроить серверы LSP с нашими capabilities
      vim.lsp.config("clangd", { capabilities = capabilities })  -- C/C++
      vim.lsp.config("pyright", { capabilities = capabilities })  -- Python
      vim.lsp.config("bashls", { capabilities = capabilities })  -- Bash

      -- Специфичные настройки для bashls
      vim.lsp.config("bashls", {
        settings = {
          bashIde = {
            shellcheckPath = "shellcheck",   -- явно указываем путь
            shellcheckArguments = { "--external-sources" },
          },
        },
      })

      -- включить LSP‑серверы
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
      vim.lsp.enable("bashls")
    end,
  },
}
