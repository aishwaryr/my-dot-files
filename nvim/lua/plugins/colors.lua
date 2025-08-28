return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set the colorscheme to tokyonight-moon
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },

  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  -- OneDark (all styles selectable via command)
  {
    "navarasu/onedark.nvim",
    lazy = false, -- ensure it shows in :colorscheme list
    priority = 1000,
    config = function()
      local current = "dark" -- "dark","darker","cool","deep","warm","warmer","light"
      local function apply()
        require("onedark").setup({ style = current })
        require("onedark").load()
      end
      vim.api.nvim_create_user_command("OnedarkStyle", function()
        local styles = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }
        vim.ui.select(styles, { prompt = "OneDark style:" }, function(choice)
          if choice then
            current = choice
            apply()
          end
        end)
      end, {})
    end,
  },

  -- Colorscheme picker
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>cs",
        function()
          require("telescope.builtin").colorscheme({ enable_preview = true })
        end,
        desc = "Choose colorscheme",
      },
    },
  },
}
