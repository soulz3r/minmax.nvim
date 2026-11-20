local M = {}

local palettes = {
  phosphor = {
    black = "#090d08", fg = "#9acb78", bright = "#c4e6a0",
    mid = "#79a85b", dim = "#58734a", muted = "#344b32",
    accent = "#d6a45d", accent_bright = "#efc477",
    string = "#b6bd78", red = "#d97968",
  },
  mono = {
    black = "#080c09", fg = "#a6c5a8", bright = "#e0f0df",
    mid = "#82a78a", dim = "#587360", muted = "#354b3c",
    accent = "#c1d5c2", accent_bright = "#eff8ee",
    string = "#9db8a1", red = "#c9827b",
  },
  amber = {
    black = "#100c07", fg = "#d6a45d", bright = "#f2cf91",
    mid = "#b88748", dim = "#80633c", muted = "#51402b",
    accent = "#9fbd78", accent_bright = "#c5e39a",
    string = "#c9ae7a", red = "#d97968",
  },
  oxide = {
    black = "#090e0d", fg = "#83b5a3", bright = "#b4d8c4",
    mid = "#628f7c", dim = "#496b61", muted = "#2d4943",
    accent = "#c58b67", accent_bright = "#e0ad83",
    string = "#a5b994", red = "#cf7770",
  },
}

function M.setup(style)
  local p = palettes[style]
  if not p then
    error("minmax.nvim: unknown style '" .. tostring(style) .. "'")
  end

  vim.opt.background = "dark"
  vim.g.colors_name = "minmax-" .. style

  local groups = {
    Normal = { fg = p.fg, bg = "NONE" },
    NormalNC = { fg = p.fg, bg = "NONE" },
    EndOfBuffer = { fg = p.muted, bg = "NONE" },
    Cursor = { fg = p.black, bg = p.bright },
    CursorLine = { bg = "NONE" },
    CursorLineNr = { fg = p.bright, bold = true },
    LineNr = { fg = p.dim },
    SignColumn = { fg = p.fg, bg = "NONE" },
    ColorColumn = { bg = "NONE" },
    Folded = { fg = p.dim, bg = "NONE", italic = true },
    FoldColumn = { fg = p.dim, bg = "NONE" },
    NonText = { fg = p.muted },
    Whitespace = { fg = p.muted },

    Visual = { fg = p.bright, bg = "NONE", reverse = true },
    Search = { fg = p.accent_bright, bg = "NONE", underline = true },
    IncSearch = { fg = p.black, bg = p.accent_bright, bold = true },
    CurSearch = { fg = p.black, bg = p.accent_bright, bold = true },
    MatchParen = { fg = p.bright, bg = "NONE", underline = true, bold = true },

    Pmenu = { fg = p.fg, bg = "NONE" },
    PmenuSel = { fg = p.bright, bg = "NONE", reverse = true },
    PmenuSbar = { bg = "NONE" },
    PmenuThumb = { bg = p.dim },
    FloatBorder = { fg = p.mid, bg = "NONE" },
    NormalFloat = { fg = p.fg, bg = "NONE" },
    FloatTitle = { fg = p.accent, bg = "NONE", bold = true },
    Title = { fg = p.bright, bold = true },
    Directory = { fg = p.bright },

    Comment = { fg = p.dim, italic = true },
    Constant = { fg = p.accent },
    String = { fg = p.string },
    Character = { fg = p.string },
    Number = { fg = p.accent },
    Boolean = { fg = p.accent_bright },
    Identifier = { fg = p.fg },
    Function = { fg = p.bright },
    Statement = { fg = p.fg, bold = true },
    Keyword = { fg = p.fg, bold = true },
    Operator = { fg = p.accent },
    Type = { fg = p.mid },
    StorageClass = { fg = p.fg, bold = true },
    Structure = { fg = p.mid },
    Typedef = { fg = p.mid },
    PreProc = { fg = p.mid },
    Include = { fg = p.accent },
    Define = { fg = p.mid },
    Macro = { fg = p.accent },
    Special = { fg = p.accent },
    SpecialChar = { fg = p.accent },
    Delimiter = { fg = p.mid },

    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.accent },
    DiagnosticInfo = { fg = p.mid },
    DiagnosticHint = { fg = p.dim },
    DiagnosticOk = { fg = p.fg },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.accent },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.mid },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.dim },
    Error = { fg = p.red, bold = true },
    ErrorMsg = { fg = p.red, bold = true },
    WarningMsg = { fg = p.accent, bold = true },

    DiffAdd = { fg = p.fg, bg = "NONE" },
    DiffChange = { fg = p.accent, bg = "NONE" },
    DiffDelete = { fg = p.red, bg = "NONE" },
    DiffText = { fg = p.accent_bright, bg = "NONE", underline = true },
    StatusLine = { fg = p.fg, bg = "NONE" },
    StatusLineNC = { fg = p.dim, bg = "NONE" },
    WinSeparator = { fg = p.muted, bg = "NONE" },
  }

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  local captures = {
    ["@variable"] = { fg = p.fg },
    ["@variable.builtin"] = { fg = p.accent },
    ["@function"] = { fg = p.bright },
    ["@function.call"] = { fg = p.bright },
    ["@function.builtin"] = { fg = p.accent },
    ["@method"] = { fg = p.bright },
    ["@keyword"] = { fg = p.fg, bold = true },
    ["@keyword.operator"] = { fg = p.accent },
    ["@operator"] = { fg = p.accent },
    ["@type"] = { fg = p.mid },
    ["@type.builtin"] = { fg = p.mid, italic = true },
    ["@string"] = { fg = p.string },
    ["@string.escape"] = { fg = p.accent_bright },
    ["@character"] = { fg = p.string },
    ["@number"] = { fg = p.accent },
    ["@boolean"] = { fg = p.accent_bright },
    ["@constant"] = { fg = p.accent },
    ["@constant.builtin"] = { fg = p.accent_bright },
    ["@property"] = { fg = p.fg },
    ["@parameter"] = { fg = p.fg, italic = true },
    ["@comment"] = { fg = p.dim, italic = true },
    ["@punctuation"] = { fg = p.mid },
    ["@tag"] = { fg = p.mid },
    ["@tag.attribute"] = { fg = p.fg },
    ["@tag.delimiter"] = { fg = p.dim },
  }

  for group, spec in pairs(captures) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M
