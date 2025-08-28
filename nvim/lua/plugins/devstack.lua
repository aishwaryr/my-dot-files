return {
  ---------------------------------------------------------------------------
  -- Treesitter (No changes needed here)
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Web
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsonc",
        "css",
        "html",
        "yaml",
        "markdown",
        "markdown_inline",
        -- Misc
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "gitignore",
        -- Go
        "go",
        "gomod",
        "gosum",
        "gowork",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Mason: install tooling (UPDATED)
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Your original tools
        "gopls",
        "gofumpt",
        "goimports",
        "delve",

        -- NEW: Added for Web Dev
        "typescript-language-server",
        "tailwindcss-language-server", -- Optional, but good to have
        "emmet-language-server",
        "eslint_d",
        "prettier",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- LSP servers (No changes needed here)
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
        html = {},
        cssls = {},
        jsonls = {},
        tailwindcss = { filetypes = { "javascriptreact", "typescriptreact", "css", "html" } },
        emmet_language_server = { filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" } },
        gopls = { settings = { gopls = { staticcheck = true, gofumpt = true } } },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Formatting: Prettier for JS/TS/React, gofumpt+goimports for Go (UPDATED)
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- NEW: Added Prettier for all web file types
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        -- Your original Go formatters
        go = { "gofumpt", "goimports" },
      },
      format_on_save = { lsp_fallback = true, timeout_ms = 3000 },
    },
  },

  ---------------------------------------------------------------------------
  -- Linting: eslint_d for JS/TS/React (UPDATED)
  ---------------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- NEW: Added eslint_d for JS/TS
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Other plugins (No changes needed here)
  ---------------------------------------------------------------------------
  { "windwp/nvim-ts-autotag", event = "VeryLazy", config = true },
  { "brenoprata10/nvim-highlight-colors", event = "VeryLazy", opts = { enable_tailwind = true } },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
