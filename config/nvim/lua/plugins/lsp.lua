return {
  -- Mason installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",     -- JS/TS/RN
          --"gopls",        -- Go
          "solargraph",   -- Ruby
          "bashls",       -- Shell scripts
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "tsserver", "gopls", "solargraph", "bashls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },

  -- Formatter runner
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
          yaml = { "prettier" },
          go = { "goimports", "gofmt" },
          ruby = { "rubocop" },
          sh = { "shfmt" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 1000,
          exclude = { "go" }, -- optional
        },
      })
    end,
  },
}

