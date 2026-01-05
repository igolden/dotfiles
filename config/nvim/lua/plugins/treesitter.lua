return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        -- Parsers to install automatically
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "tsx",      -- JSX/TSX
          "html",
          "css",
          "svelte",
          "go",
          "ruby",
        },

        sync_install = false, -- install asynchronously
        auto_install = true,  -- auto-install missing parsers

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
}

