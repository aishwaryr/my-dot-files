return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "steelrose-dark",
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      light_style = "day",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
    },
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            functions = "bold",
          },
        },
      })
    end,
  },

  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "light",
      })
    end,
  },
}
