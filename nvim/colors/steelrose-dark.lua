vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "steelrose-dark"
vim.g.steelrose_theme = true

local c = {
  -- Surfaces
  background = "#1A1A1A",
  background_active = "#202020",
  panel = "#242424",
  selection = "#303030",

  -- General text
  foreground = "#EDEDED",
  foreground_muted = "#737B86",
  punctuation = "#D2D9E3",

  -- Syntax
  keyword = "#D98FB3",
  func = "#F75590",
  identifier = "#4DA6FF",
  -- string = "#C5A3E8",
  string = "#7EE787",
  literal = "#E0B0FF",
  type = "#7291B8",

  imported_symbol = "#F75590",

  -- JSX / HTML
  jsx_native = "#546275",
  jsx_component = "#FF78B7",
  jsx_attribute = "#8EAAF2",

  -- Structured data
  -- data_key = "#8FA7C7",
  data_key = "#FF96DA",

  -- Diagnostics
  error = "#E5484D",
  warning = "#B28C54",
  info = "#5580A6",
  hint = "#5A616A",

  -- UI
  border = "#454545",
  line_number = "#454545",
  indent = "#282828",

  -- Explorer
  explorer_file = "#D2D9E3",
  explorer_directory = "#7291B8",
  explorer_open = "#FF78B7",
  explorer_hidden = "#5A616A",
  explorer_icon = "#8EAAF2",

  -- Version-control states
  vcs_modified = "#F75590",
  vcs_added = "#8EAAF2",
  vcs_untracked = "#4DA6FF",
  vcs_staged = "#C5A3E8",
  vcs_renamed = "#C5A3E8",
  vcs_deleted = "#E5484D",
  vcs_conflict = "#E5484D",
  vcs_ignored = "#5A616A",
}

local hl = vim.api.nvim_set_hl

-- =========================================================
-- Editor
-- =========================================================

hl(0, "Normal", {
  fg = c.foreground,
  bg = c.background,
})

hl(0, "NormalNC", {
  fg = c.foreground,
  bg = c.background,
})

hl(0, "NormalFloat", {
  fg = c.foreground,
  bg = c.panel,
})

hl(0, "FloatBorder", {
  fg = c.border,
  bg = c.panel,
})

hl(0, "Comment", {
  fg = c.foreground_muted,
})

hl(0, "Todo", {
  fg = c.keyword,
  bold = true,
})

hl(0, "LineNr", {
  fg = c.line_number,
})

hl(0, "CursorLineNr", {
  fg = c.foreground,
})

hl(0, "CursorLine", {
  bg = c.background_active,
})

hl(0, "Visual", {
  bg = c.selection,
})

-- =========================================================
-- Standard syntax
-- =========================================================

hl(0, "Keyword", {
  fg = c.keyword,
})

hl(0, "Conditional", {
  fg = c.keyword,
})

hl(0, "Repeat", {
  fg = c.keyword,
})

hl(0, "Operator", {
  fg = c.keyword,
})

hl(0, "Function", {
  fg = c.func,
})

hl(0, "Identifier", {
  fg = c.identifier,
})

hl(0, "String", {
  fg = c.string,
})

hl(0, "Character", {
  fg = c.string,
})

hl(0, "Number", {
  fg = c.literal,
})

hl(0, "Boolean", {
  fg = c.literal,
})

hl(0, "Float", {
  fg = c.literal,
})

hl(0, "Type", {
  fg = c.type,
})

hl(0, "StorageClass", {
  fg = c.type,
})

hl(0, "Delimiter", {
  fg = c.punctuation,
})

hl(0, "Special", {
  fg = c.type,
})

-- =========================================================
-- Treesitter: comments
-- =========================================================

hl(0, "@comment", {
  fg = c.foreground_muted,
})

hl(0, "@comment.todo", {
  fg = c.keyword,
  bold = true,
})

-- =========================================================
-- Treesitter: keywords
-- =========================================================

hl(0, "@keyword", {
  fg = c.keyword,
  bold = true,
})

hl(0, "@keyword.function", {
  fg = c.keyword,
})

hl(0, "@keyword.return", {
  fg = c.keyword,
})

hl(0, "@operator", {
  fg = c.keyword,
})

-- =========================================================
-- Treesitter: functions
-- =========================================================

hl(0, "@function", {
  fg = c.func,
})

hl(0, "@function.call", {
  fg = c.func,
})

hl(0, "@function.method", {
  fg = c.func,
})

hl(0, "@function.method.call", {
  fg = c.func,
})

-- =========================================================
-- Treesitter: identifiers
-- =========================================================

hl(0, "@variable", {
  fg = c.identifier,
})

hl(0, "@variable.parameter", {
  fg = c.identifier,
})

hl(0, "@property", {
  fg = c.identifier,
})

-- JSON keys
hl(0, "@property.json", {
  fg = c.data_key,
})

hl(0, "@property.jsonc", {
  fg = c.data_key,
})

-- =========================================================
-- Treesitter: strings
-- =========================================================

hl(0, "@string", {
  fg = c.string,
})

hl(0, "@string.special", {
  fg = c.string,
})

-- =========================================================
-- Treesitter: literals
-- =========================================================

hl(0, "@number", {
  fg = c.literal,
})

hl(0, "@boolean", {
  fg = c.literal,
})

-- =========================================================
-- Treesitter: types
-- =========================================================

hl(0, "@type", {
  fg = c.type,
})

hl(0, "@type.builtin", {
  fg = c.type,
})

-- =========================================================
-- Treesitter: punctuation
-- =========================================================

hl(0, "@punctuation.bracket", {
  fg = c.punctuation,
})

hl(0, "@punctuation.delimiter", {
  fg = c.punctuation,
})

-- =========================================================
-- JSX / HTML
-- =========================================================

-- React/custom components:
-- Card, Button, Input, CardHeader, etc.
hl(0, "@tag", {
  fg = c.jsx_component,
})

-- Native HTML:
-- div, main, form, span, etc.
hl(0, "@tag.builtin", {
  fg = c.jsx_native,
})

-- className, htmlFor, id, name, etc.
hl(0, "@tag.attribute", {
  fg = c.jsx_attribute,
})

-- < > </ />
hl(0, "@tag.delimiter", {
  fg = c.punctuation,
})

-- =========================================================
-- Imported symbols
-- =========================================================

hl(0, "@import.name", {
  fg = c.imported_symbol,
})

-- =========================================================
-- Diagnostics
-- =========================================================

hl(0, "DiagnosticError", {
  fg = c.error,
})

hl(0, "DiagnosticWarn", {
  fg = c.warning,
})

hl(0, "DiagnosticInfo", {
  fg = c.info,
})

hl(0, "DiagnosticHint", {
  fg = c.hint,
})

-- =========================================================
-- Neo-tree: general
-- =========================================================

hl(0, "NeoTreeNormal", {
  fg = c.explorer_file,
  bg = c.background,
})

hl(0, "NeoTreeNormalNC", {
  fg = c.explorer_file,
  bg = c.background,
})

hl(0, "NeoTreeEndOfBuffer", {
  fg = c.background,
  bg = c.background,
})

hl(0, "NeoTreeWinSeparator", {
  fg = c.border,
  bg = c.background,
})

hl(0, "NeoTreeCursorLine", {
  bg = c.background_active,
})

hl(0, "NeoTreeTitleBar", {
  fg = c.foreground,
  bg = c.panel,
  bold = true,
})

hl(0, "NeoTreeRootName", {
  fg = c.foreground,
  bold = true,
})

-- =========================================================
-- Neo-tree: files/directories
-- =========================================================

hl(0, "NeoTreeFileName", {
  fg = c.explorer_file,
})

hl(0, "NeoTreeFileNameOpened", {
  fg = c.explorer_open,
  bold = true,
})

hl(0, "NeoTreeFileIcon", {
  fg = c.explorer_icon,
})

hl(0, "NeoTreeDirectoryName", {
  fg = c.explorer_directory,
})

hl(0, "NeoTreeDirectoryIcon", {
  fg = c.explorer_directory,
})

hl(0, "NeoTreeIndentMarker", {
  fg = c.indent,
})

hl(0, "NeoTreeExpander", {
  fg = c.punctuation,
})

-- =========================================================
-- Neo-tree: hidden / filtered
-- =========================================================

hl(0, "NeoTreeDotfile", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeHiddenByName", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeDimText", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeFileNameHidden", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeDirectoryNameHidden", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeFileIconHidden", {
  fg = c.explorer_hidden,
})

hl(0, "NeoTreeDirectoryIconHidden", {
  fg = c.explorer_hidden,
})

-- =========================================================
-- Neo-tree: modified / git status
-- =========================================================

hl(0, "NeoTreeModified", {
  fg = c.vcs_modified,
})

hl(0, "NeoTreeGitModified", {
  fg = c.vcs_modified,
})

hl(0, "NeoTreeGitAdded", {
  fg = c.vcs_added,
})

hl(0, "NeoTreeGitUntracked", {
  fg = c.vcs_untracked,
})

hl(0, "NeoTreeGitUnstaged", {
  fg = c.vcs_modified,
})

hl(0, "NeoTreeGitStaged", {
  fg = c.vcs_staged,
})

hl(0, "NeoTreeGitRenamed", {
  fg = c.vcs_renamed,
})

hl(0, "NeoTreeGitDeleted", {
  fg = c.vcs_deleted,
})

hl(0, "NeoTreeGitConflict", {
  fg = c.vcs_conflict,
  bold = true,
})

hl(0, "NeoTreeGitIgnored", {
  fg = c.vcs_ignored,
})
