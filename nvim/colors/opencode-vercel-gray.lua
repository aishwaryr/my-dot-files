vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "opencode-vercel-gray"

local c = {
  -- Editor surfaces
  background = "#1a1a1a",
  background_active = "#202020",
  panel = "#242424",
  selection = "#303030",

  -- General text
  foreground = "#EDEDED",
  comment = "#878787",
  punctuation = "#B0B0B0",

  -- Syntax roles
  keyword = "#F75590",
  func = "#BF7AF0",
  identifier = "#0AC7AC",
  string = "#F2A700",
  literal = "#63C46D",
  type = "#52A8FF",

  -- Imports / JSX
  imported_symbol = "#0AC7AC",
  jsx_tag = "#50658A",
  jsx_attribute = "#59B5F7",

  -- Diagnostics
  error = "#E5484D",
  warning = "#E5A50A",
  info = "#7DCFFF",
  hint = "#8B8B8B",

  -- UI
  border = "#454545",
  line_number = "#454545",
  indent = "#34343f",
  directory = "#0AC7AC",
}

local hl = vim.api.nvim_set_hl

-- Editor
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
  fg = c.comment,
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

-- Standard syntax
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

-- Treesitter: comments
hl(0, "@comment", {
  fg = c.comment,
})

-- Treesitter: keywords
hl(0, "@keyword", {
  fg = c.keyword,
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

-- Treesitter: functions
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

-- Treesitter: identifiers
hl(0, "@variable", {
  fg = c.identifier,
})

hl(0, "@variable.parameter", {
  fg = c.identifier,
})

hl(0, "@property", {
  fg = c.identifier,
})

-- Treesitter: strings
hl(0, "@string", {
  fg = c.string,
})

hl(0, "@string.special", {
  fg = c.string,
})

-- Treesitter: literals
hl(0, "@number", {
  fg = c.literal,
})

hl(0, "@boolean", {
  fg = c.literal,
})

-- Treesitter: types
hl(0, "@type", {
  fg = c.type,
})

hl(0, "@type.builtin", {
  fg = c.type,
})

-- Treesitter: punctuation
--
-- { } ( ) [ ]
hl(0, "@punctuation.bracket", {
  fg = c.punctuation,
})

-- ; , etc.
hl(0, "@punctuation.delimiter", {
  fg = c.punctuation,
})

-- JSX / HTML
--
-- div, main, Button, CardHeader, etc.
hl(0, "@tag", {
  fg = c.jsx_tag,
})

hl(0, "@tag.builtin", {
  fg = c.jsx_tag,
})

-- className, htmlFor, id, name, etc.
hl(0, "@tag.attribute", {
  fg = c.jsx_attribute,
})

-- < > </ />
hl(0, "@tag.delimiter", {
  fg = c.punctuation,
})

-- Custom Treesitter capture for imported names
--
-- import { Button, Input, Card } from "..."
hl(0, "@import.name", {
  fg = c.imported_symbol,
})

-- Diagnostics
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

-- Neo-tree
hl(0, "NeoTreeNormal", {
  fg = c.foreground,
  bg = c.background,
})

hl(0, "NeoTreeNormalNC", {
  fg = c.foreground,
  bg = c.background,
})

hl(0, "NeoTreeDirectoryName", {
  fg = c.directory,
})

hl(0, "NeoTreeFileName", {
  fg = c.foreground,
})

hl(0, "NeoTreeIndentMarker", {
  fg = c.indent,
})
