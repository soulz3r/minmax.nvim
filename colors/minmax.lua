-- minmax.nvim: a phosphor-green terminal colorscheme with restrained amber.
vim.opt.background = "dark"
vim.g.colors_name = "minmax"

local palette = {
  bg = "#10150f",
  black = "#090d08",
  green = "#9acb78",
  bright = "#c4e6a0",
  mid = "#79a85b",
  dim = "#58734a",
  muted = "#344b32",
  amber = "#d6a45d",
  amber_bright = "#efc477",
  string = "#b6bd78",
  red = "#d97968",
}

local groups = {
  -- Editor
  Normal = { fg = palette.green, bg = "NONE" },
  NormalNC = { fg = palette.green, bg = "NONE" },
  EndOfBuffer = { fg = palette.muted, bg = "NONE" },
  Cursor = { fg = palette.black, bg = palette.bright },
  CursorLine = { bg = "NONE" },
  CursorLineNr = { fg = palette.bright, bold = true },
  LineNr = { fg = palette.dim },
  SignColumn = { fg = palette.green, bg = "NONE" },
  ColorColumn = { bg = "NONE" },
  Folded = { fg = palette.dim, bg = "NONE", italic = true },
  FoldColumn = { fg = palette.dim, bg = "NONE" },
  NonText = { fg = palette.muted },
  Whitespace = { fg = palette.muted },

  -- Selection and search
  Visual = { fg = palette.bright, bg = "NONE", reverse = true },
  Search = { fg = palette.amber_bright, bg = "NONE", underline = true },
  IncSearch = { fg = palette.black, bg = palette.amber_bright, bold = true },
  CurSearch = { fg = palette.black, bg = palette.amber_bright, bold = true },
  MatchParen = { fg = palette.bright, bg = "NONE", underline = true, bold = true },

  -- Completion and floating windows
  Pmenu = { fg = palette.green, bg = "NONE" },
  PmenuSel = { fg = palette.bright, bg = "NONE", reverse = true },
  PmenuSbar = { bg = "NONE" },
  PmenuThumb = { bg = palette.dim },
  FloatBorder = { fg = palette.mid, bg = "NONE" },
  NormalFloat = { fg = palette.green, bg = "NONE" },
  FloatTitle = { fg = palette.amber, bg = "NONE", bold = true },
  Title = { fg = palette.bright, bold = true },
  Directory = { fg = palette.bright },

  -- Syntax
  Comment = { fg = palette.dim, italic = true },
  Constant = { fg = palette.amber },
  String = { fg = palette.string },
  Character = { fg = palette.string },
  Number = { fg = palette.amber },
  Boolean = { fg = palette.amber_bright },
  Identifier = { fg = palette.green },
  Function = { fg = palette.bright },
  Statement = { fg = palette.green, bold = true },
  Keyword = { fg = palette.green, bold = true },
  Operator = { fg = palette.amber },
  Type = { fg = palette.mid },
  StorageClass = { fg = palette.green, bold = true },
  Structure = { fg = palette.mid },
  Typedef = { fg = palette.mid },
  PreProc = { fg = palette.mid },
  Include = { fg = palette.amber },
  Define = { fg = palette.mid },
  Macro = { fg = palette.amber },
  Special = { fg = palette.amber },
  SpecialChar = { fg = palette.amber },
  Delimiter = { fg = palette.mid },

  -- Diagnostics
  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.amber },
  DiagnosticInfo = { fg = palette.mid },
  DiagnosticHint = { fg = palette.dim },
  DiagnosticOk = { fg = palette.green },
  DiagnosticUnderlineError = { undercurl = true, sp = palette.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = palette.amber },
  DiagnosticUnderlineInfo = { undercurl = true, sp = palette.mid },
  DiagnosticUnderlineHint = { undercurl = true, sp = palette.dim },
  Error = { fg = palette.red, bold = true },
  ErrorMsg = { fg = palette.red, bold = true },
  WarningMsg = { fg = palette.amber, bold = true },

  -- Diff and status
  DiffAdd = { fg = palette.green, bg = "NONE" },
  DiffChange = { fg = palette.amber, bg = "NONE" },
  DiffDelete = { fg = palette.red, bg = "NONE" },
  DiffText = { fg = palette.amber_bright, bg = "NONE", underline = true },
  StatusLine = { fg = palette.green, bg = "NONE" },
  StatusLineNC = { fg = palette.dim, bg = "NONE" },
  WinSeparator = { fg = palette.muted, bg = "NONE" },
}

for group, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, group, spec)
end

-- Tree-sitter captures.
local captures = {
  ["@variable"] = { fg = palette.green },
  ["@variable.builtin"] = { fg = palette.amber },
  ["@function"] = { fg = palette.bright },
  ["@function.call"] = { fg = palette.bright },
  ["@function.builtin"] = { fg = palette.amber },
  ["@method"] = { fg = palette.bright },
  ["@keyword"] = { fg = palette.green, bold = true },
  ["@keyword.operator"] = { fg = palette.amber },
  ["@operator"] = { fg = palette.amber },
  ["@type"] = { fg = palette.mid },
  ["@type.builtin"] = { fg = palette.mid, italic = true },
  ["@string"] = { fg = palette.string },
  ["@string.escape"] = { fg = palette.amber_bright },
  ["@character"] = { fg = palette.string },
  ["@number"] = { fg = palette.amber },
  ["@boolean"] = { fg = palette.amber_bright },
  ["@constant"] = { fg = palette.amber },
  ["@constant.builtin"] = { fg = palette.amber_bright },
  ["@property"] = { fg = palette.green },
  ["@parameter"] = { fg = palette.green, italic = true },
  ["@comment"] = { fg = palette.dim, italic = true },
  ["@punctuation"] = { fg = palette.mid },
  ["@tag"] = { fg = palette.mid },
  ["@tag.attribute"] = { fg = palette.green },
  ["@tag.delimiter"] = { fg = palette.dim },
}

for group, spec in pairs(captures) do
  vim.api.nvim_set_hl(0, group, spec)
end
