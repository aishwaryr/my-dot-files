local chain_fmt = vim.fn.stdpath("config") .. "/tools/chain-fmt"

return {
  ---------------------------------------------------------------------------
  -- Treesitter
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

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Mason
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Go
        "gopls",
        "gofumpt",
        "goimports",
        "delve",

        -- Web
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint_d",
        "prettier",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- LSP
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = false,
        virtual_lines = false,
      },
      servers = {
        ts_ls = {},
        html = {},
        cssls = {},
        jsonls = {},

        tailwindcss = {
          filetypes = {
            "javascriptreact",
            "typescriptreact",
            "css",
            "html",
          },
        },

        gopls = {
          settings = {
            gopls = {
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Formatting (Conform)
  ---------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      opts.formatters.chain_fix = {
        command = chain_fmt .. "/node_modules/.bin/eslint",
        args = {
          "--config",
          chain_fmt .. "/eslint.config.mjs",
          "--fix",
          "$FILENAME",
        },
        stdin = false,
      }

      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Web
      opts.formatters_by_ft.javascript = {
        "prettier",
        "chain_fix",
      }

      opts.formatters_by_ft.typescript = {
        "prettier",
        "chain_fix",
      }

      opts.formatters_by_ft.javascriptreact = {
        "prettier",
        "chain_fix",
      }

      opts.formatters_by_ft.typescriptreact = {
        "prettier",
        "chain_fix",
      }

      -- Other frontend files
      opts.formatters_by_ft.json = { "prettier" }
      opts.formatters_by_ft.css = { "prettier" }
      opts.formatters_by_ft.html = { "prettier" }
      opts.formatters_by_ft.yaml = { "prettier" }
      opts.formatters_by_ft.markdown = { "prettier" }

      -- Go
      opts.formatters_by_ft.go = { "gofumpt", "goimports" }
    end,
  },

  ---------------------------------------------------------------------------
  -- Linting
  ---------------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Completion (Non-invasive)
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.completion = {
        autocomplete = false,
      }

      opts.preselect = cmp.PreselectMode.None

      vim.opt.completeopt = {
        "menu",
        "menuone",
        "noselect",
        "noinsert",
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-e>"] = cmp.mapping.abort(),

        ["<CR>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = false })
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Auto tag
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = true,
  },

  ---------------------------------------------------------------------------
  -- Tailwind color previews
  ---------------------------------------------------------------------------
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      enable_tailwind = true,
    },
  },

  ---------------------------------------------------------------------------
  -- LazyGit
  ---------------------------------------------------------------------------
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  ---------------------------------------------------------------------------
  -- Disable Snacks Explorer
  ---------------------------------------------------------------------------
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = { enabled = false },

      indent = {
        indent = {
          enabled = true,
          char = "┊",
          hl = "MyIndentGuide",
        },

        scope = {
          enabled = true,
          char = "│",
        },
      },
    },

    init = function()
      local function set_custom_colors()
        -- Indent guides
        vim.api.nvim_set_hl(0, "MyIndentGuide", {
          fg = "#34343f",
        })

        -- Diagnostics: muted gray-red
        local error_color = "#a66a72"

        -- Error text
        vim.api.nvim_set_hl(0, "DiagnosticError", {
          fg = error_color,
        })

        -- Inline error messages
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
          fg = error_color,
          bg = "NONE",
        })

        -- Squiggly underline
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
          sp = error_color,
          undercurl = true,
        })

        -- Error icon in sign column
        vim.api.nvim_set_hl(0, "DiagnosticSignError", {
          fg = error_color,
        })
      end

      set_custom_colors()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_custom_colors,
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Neo-tree
  ---------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },

      window = {
        width = 24,
        position = "left",
      },
    },
  },

  ---------------------------------------------------------------------------
  -- Surround
  ---------------------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*",
    config = true,
  },
}
