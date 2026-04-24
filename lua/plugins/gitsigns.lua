return {
  "lewis6991/gitsigns.nvim",  -- отображение гит‑изменений в виде знаков в гутере
  config = function()
    require("gitsigns").setup()  -- использовать настройки по умолчанию

    -- Навигация между изменениям (hunks)
    vim.keymap.set("n", "]c", function()
      require("gitsigns").next_hunk()
    end, { desc = "Next git hunk" })

    vim.keymap.set("n", "[c", function()
      require("gitsigns").prev_hunk()
    end, { desc = "Prev git hunk" })

    -- Действия над текущим hunk
    vim.keymap.set("n", "<leader>hs", function()
      require("gitsigns").stage_hunk()
    end, { desc = "Stage hunk" })

    vim.keymap.set("n", "<leader>hr", function()
      require("gitsigns").reset_hunk()
    end, { desc = "Reset hunk" })

    vim.keymap.set("n", "<leader>hp", function()
      require("gitsigns").preview_hunk()
    end, { desc = "Preview hunk" })
  end,
}
