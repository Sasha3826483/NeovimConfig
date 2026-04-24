return {
  "nvim-telescope/telescope.nvim",  -- мощный поиск файлов и многое другое
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",  -- префикс ввода поиска
        selection_caret = "➜ ",     -- маркер выбранного элемента
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
    })

    local builtin = require("telescope.builtin")

    -- удобные сочетания клавиш для разных режимов поиска
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
}
