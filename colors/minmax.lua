-- minmax.nvim: phosphor-green terminal colorscheme.
vim.opt.background = "dark"
vim.g.colors_name = "minmax"

local palette = {
  green = "#75ff75",
  bright = "#b4ff9b",
  mid = "#45bd59",
  dim = "#287a3b",
  muted = "#174d29",
  red = "#ff6b6b",
  yellow = "#d5e86a",
  black = "#000000",
}

local groups = {
  Normal = { fg = palette.green, bg = "NONE" },
  NormalNC = { fg = palette.green, bg = "NONE" },
  EndOfBuffer = { fg = palette.muted, bg = "NONE" },
  Cursor = { fg = palette.black, bg = palette.bright },
  CursorLine = { bg = "NONE" },
  CursorLineNr = { fg = palette.bright, bold = true },
  LineNr = { fg = palette.dim, bg = "NONE" },
  SignColumn = { fg = palette.green, bg = "NONE" },
  Visual = { fg = palette.bright, bg = "NONE", reverse = true },
  Search = { fg = palette.yellow, bg = "NONE", underline = true, bold = true },
  IncSearch = { fg = palette.bright, bg = "NONE", underline = true, bold = true },
  MatchParen = { fg = palette.bright, bg = "NONE", underline = true, bold = true },
  Pmenu = { fg = palette.green, bg = "NONE" },
  PmenuSel = { fg = palette.bright, bg = "NONE", reverse = true, bold = true },
  FloatBorder = { fg = palette.mid, bg = "NONE" },
  NormalFloat = { fg = palette.green, bg = "NONE" },
  Title = { fg = palette.bright, bold = true },
  Directory = { fg = palette.bright, bold = true },
  Comment = { fg = palette.dim, italic = true },
  Constant = { fg = palette.bright },
  String = { fg = palette.mid },
  Character = { fg = palette.mid },
  Number = { fg = palette.bright },
  Boolean = { fg = palette.bright },
  Identifier = { fg = palette.green },
  Function = { fg = palette.bright },
  Statement = { fg = palette.green, bold = true },
  Keyword = { fg = palette.green, bold = true },
  Type = { fg = palette.mid },
  PreProc = { fg = palette.mid },
  Special = { fg = palette.bright },
  Delimiter = { fg = palette.mid },
  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.yellow },
  DiagnosticInfo = { fg = palette.mid },
  DiagnosticHint = { fg = palette.dim },
  DiagnosticFloatingError = { fg = palette.red },
  DiagnosticFloatingWarn = { fg = palette.yellow },
  DiagnosticFloatingInfo = { fg = palette.mid },
  DiagnosticFloatingHint = { fg = palette.dim },
  Error = { fg = palette.red, bold = true },
  ErrorMsg = { fg = palette.red, bold = true },
  WarningMsg = { fg = palette.yellow, bold = true },
  StatusLine = { fg = palette.green, bg = "NONE" },
  StatusLineNC = { fg = palette.dim, bg = "NONE" },
}

for group, spec in pairs(groups) do
  vim.api.nvim_set_hl(0, group, spec)
end

vim.api.nvim_set_hl(0, "@variable", { fg = palette.green })
vim.api.nvim_set_hl(0, "@function", { fg = palette.bright })
vim.api.nvim_set_hl(0, "@keyword", { fg = palette.green, bold = true })
vim.api.nvim_set_hl(0, "@type", { fg = palette.mid })
vim.api.nvim_set_hl(0, "@string", { fg = palette.mid })
vim.api.nvim_set_hl(0, "@comment", { fg = palette.dim, italic = true })
