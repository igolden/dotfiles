return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile"},
  keys = {
    { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional but recommended
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false
      }
    })
  end,
}
