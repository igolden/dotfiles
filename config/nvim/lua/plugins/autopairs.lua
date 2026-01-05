return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- enables Tree-sitter integration
      fast_wrap = {},
    })
  end,
}
