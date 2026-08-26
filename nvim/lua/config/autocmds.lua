vim.opt.autoread = true

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
  "CursorHoldI",
}, {
  pattern = "*",
  command = "silent! checktime",
})
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Short diagnostic squiggle:
-- underline only the first 3 non-whitespace characters of a diagnostic line.

local diagnostic_ns = vim.api.nvim_create_namespace("short_diagnostic_underline")

local diagnostic_hl = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticUnderlineError",
  [vim.diagnostic.severity.WARN] = "DiagnosticUnderlineWarn",
  [vim.diagnostic.severity.INFO] = "DiagnosticUnderlineInfo",
  [vim.diagnostic.severity.HINT] = "DiagnosticUnderlineHint",
}

local function draw_short_diagnostic_underlines(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  vim.api.nvim_buf_clear_namespace(bufnr, diagnostic_ns, 0, -1)

  -- Only draw one squiggle per line.
  -- If there are multiple diagnostics, use the most severe one.
  local diagnostics_by_line = {}

  for _, diagnostic in ipairs(vim.diagnostic.get(bufnr)) do
    local existing = diagnostics_by_line[diagnostic.lnum]

    if not existing or diagnostic.severity < existing.severity then
      diagnostics_by_line[diagnostic.lnum] = diagnostic
    end
  end

  for lnum, diagnostic in pairs(diagnostics_by_line) do
    local line = vim.api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)[1]

    if line then
      local first = line:find("%S")

      if first then
        -- Neovim extmark columns are byte-indexed.
        local start_col = first - 1

        -- Grab at most 3 actual characters.
        local remaining = line:sub(first)
        local first_three = vim.fn.strcharpart(remaining, 0, 3)
        local end_col = start_col + #first_three

        vim.api.nvim_buf_set_extmark(bufnr, diagnostic_ns, lnum, start_col, {
          end_col = end_col,
          hl_group = diagnostic_hl[diagnostic.severity],
          hl_mode = "combine",
          priority = 200,
        })
      end
    end
  end
end

vim.api.nvim_create_autocmd({
  "DiagnosticChanged",
  "BufEnter",
}, {
  callback = function(args)
    draw_short_diagnostic_underlines(args.buf)
  end,
})
