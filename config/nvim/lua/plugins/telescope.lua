-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      config = function()
        require("telescope").load_extension("file_browser")
      end,
    }
  },
  cmd = "Telescope",
  keys = {
    { "<space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { width = 0.9 },
        file_ignore_patterns = { "node_modules", "%.git/" },
      },
    })
  end,
}

