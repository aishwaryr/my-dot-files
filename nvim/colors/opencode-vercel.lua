vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "opencode-vercel"

local c = {
  bg = "#111111",
  bg_alt = "#171717",
  panel = "#1d1d1d",
  element = "#2a2a2a",

  fg = "#EDEDED",
  muted = "#878787",

  blue = "#0AC7AC",
  pink = "#F75590",
  purple = "#BF7AF0",
  green = "#F2A700",
  amber = "#63C46D",
  teal = "#52A8FF",

  red = "#E5484D",
}

local hl = vim.api.nvim_set_hl

-- Editor
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.panel })
hl(0, "FloatBorder", { fg = "#454545", bg = c.panel })

hl(0, "Comment", { fg = c.muted })
hl(0, "LineNr", { fg = "#454545" })
hl(0, "CursorLineNr", { fg = c.fg })
hl(0, "CursorLine", { bg = c.bg_alt })
hl(0, "Visual", { bg = c.element })

-- Standard syntax
hl(0, "Keyword", { fg = c.pink })
hl(0, "Conditional", { fg = c.pink })
hl(0, "Repeat", { fg = c.pink })
hl(0, "Operator", { fg = c.pink })

hl(0, "Function", { fg = c.purple })

hl(0, "Identifier", { fg = c.blue })

hl(0, "String", { fg = c.green })
hl(0, "Character", { fg = c.green })

hl(0, "Number", { fg = c.amber })
hl(0, "Boolean", { fg = c.amber })
hl(0, "Float", { fg = c.amber })

hl(0, "Type", { fg = c.teal })
hl(0, "StorageClass", { fg = c.teal })

hl(0, "Delimiter", { fg = c.fg })
hl(0, "Special", { fg = c.teal })

-- Treesitter
hl(0, "@comment", { fg = c.muted })

hl(0, "@keyword", { fg = c.pink })
hl(0, "@keyword.function", { fg = c.pink })
hl(0, "@keyword.return", { fg = c.pink })
hl(0, "@operator", { fg = c.pink })

hl(0, "@function", { fg = c.purple })
hl(0, "@function.call", { fg = c.purple })
hl(0, "@function.method", { fg = c.purple })
hl(0, "@function.method.call", { fg = c.purple })

hl(0, "@variable", { fg = c.blue })
hl(0, "@variable.parameter", { fg = c.blue })
hl(0, "@property", { fg = c.blue })

hl(0, "@string", { fg = c.green })
hl(0, "@string.special", { fg = c.green })

hl(0, "@number", { fg = c.amber })
hl(0, "@boolean", { fg = c.amber })

hl(0, "@type", { fg = c.teal })
hl(0, "@type.builtin", { fg = c.teal })

hl(0, "@punctuation.bracket", { fg = c.fg })
hl(0, "@punctuation.delimiter", { fg = c.fg })

-- Diagnostics
hl(0, "DiagnosticError", { fg = c.red })
hl(0, "DiagnosticWarn", { fg = c.amber })
hl(0, "DiagnosticInfo", { fg = c.blue })
hl(0, "DiagnosticHint", { fg = c.teal })

hl(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg })
hl(0, "NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
hl(0, "NeoTreeDirectoryName", { fg = c.blue })
hl(0, "NeoTreeFileName", { fg = c.fg })
hl(0, "NeoTreeIndentMarker", { fg = "#34343f" })
