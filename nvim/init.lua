-- Enable true color support BEFORE loading any plugins
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.titlestring = "nvim - %{fnamemodify(getcwd(), ':t')}"

-- Bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
