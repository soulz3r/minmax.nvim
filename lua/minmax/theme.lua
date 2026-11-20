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

local function set_groups(groups)
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

function M.setup(style)
  local p = palettes[style]
  if not p then
    error("minmax.nvim: unknown variant '" .. tostring(style) .. "'")
  end

  vim.opt.background = "dark"
  vim.g.colors_name = "minmax-" .. style

  set_groups({
    -- Core editor
    Normal = { fg = p.fg, bg = "NONE" },
    NormalNC = { fg = p.fg, bg = "NONE" },
    NormalFloat = { fg = p.fg, bg = "NONE" },
    EndOfBuffer = { fg = p.muted },
    SignColumn = { fg = p.fg, bg = "NONE" },
    FoldColumn = { fg = p.dim, bg = "NONE" },
    Folded = { fg = p.dim, bg = "NONE", italic = true },
    LineNr = { fg = p.dim },
    CursorLine = { bg = "NONE" },
    CursorLineNr = { fg = p.bright, bold = true },
    Cursor = { fg = p.black, bg = p.bright },
    lCursor = { fg = p.black, bg = p.bright },
    ColorColumn = { bg = "NONE" },
    NonText = { fg = p.muted },
    Whitespace = { fg = p.muted },
    SpecialKey = { fg = p.dim },
    Conceal = { fg = p.dim },
    WinSeparator = { fg = p.muted, bg = "NONE" },
    VertSplit = { fg = p.muted, bg = "NONE" },

    -- Selection, search and navigation
    Visual = { fg = p.bright, bg = "NONE", reverse = true },
    VisualNOS = { fg = p.bright, bg = "NONE", reverse = true },
    Search = { fg = p.accent_bright, bg = "NONE", underline = true },
    IncSearch = { fg = p.black, bg = p.accent_bright, bold = true },
    CurSearch = { fg = p.black, bg = p.accent_bright, bold = true },
    Substitute = { fg = p.black, bg = p.accent_bright },
    MatchParen = { fg = p.bright, bg = "NONE", underline = true, bold = true },

    -- Floating windows and completion
    FloatBorder = { fg = p.mid, bg = "NONE" },
    FloatTitle = { fg = p.accent, bg = "NONE", bold = true },
    FloatFooter = { fg = p.dim, bg = "NONE" },
    Pmenu = { fg = p.fg, bg = "NONE" },
    PmenuSel = { fg = p.bright, bg = "NONE", reverse = true, bold = true },
    PmenuSbar = { bg = "NONE" },
    PmenuThumb = { bg = p.dim },
    PmenuKind = { fg = p.mid, bg = "NONE" },
    PmenuKindSel = { fg = p.bright, bg = "NONE", reverse = true },
    PmenuExtra = { fg = p.dim, bg = "NONE" },
    PmenuExtraSel = { fg = p.bright, bg = "NONE", reverse = true },
    WildMenu = { fg = p.black, bg = p.bright, bold = true },
    Question = { fg = p.accent, bold = true },
    MoreMsg = { fg = p.mid, bold = true },
    ModeMsg = { fg = p.bright, bold = true },
    MsgArea = { fg = p.fg },
    MsgSeparator = { fg = p.muted },
    Title = { fg = p.bright, bold = true },
    Directory = { fg = p.bright, bold = true },

    -- Traditional syntax groups
    Comment = { fg = p.dim, italic = true },
    Constant = { fg = p.accent },
    String = { fg = p.string },
    Character = { fg = p.string },
    Number = { fg = p.accent },
    Boolean = { fg = p.accent_bright, bold = true },
    Float = { fg = p.accent },
    Identifier = { fg = p.fg },
    Function = { fg = p.bright, bold = true },
    Statement = { fg = p.fg, bold = true },
    Conditional = { fg = p.fg, bold = true },
    Repeat = { fg = p.fg, bold = true },
    Label = { fg = p.mid, bold = true },
    Operator = { fg = p.accent },
    Keyword = { fg = p.fg, bold = true },
    Exception = { fg = p.fg, bold = true },
    Type = { fg = p.mid, bold = true },
    StorageClass = { fg = p.fg, bold = true },
    Structure = { fg = p.mid, bold = true },
    Typedef = { fg = p.mid, bold = true },
    PreProc = { fg = p.mid, bold = true },
    Include = { fg = p.accent, bold = true },
    Define = { fg = p.mid, bold = true },
    Macro = { fg = p.accent, bold = true },
    PreCondit = { fg = p.mid, bold = true },
    Special = { fg = p.accent },
    SpecialChar = { fg = p.accent_bright },
    Tag = { fg = p.mid, bold = true },
    Delimiter = { fg = p.mid },
    Underlined = { fg = p.bright, underline = true },
    Bold = { fg = p.bright, bold = true },
    Italic = { italic = true },
    Ignore = { fg = p.dim },
    Todo = { fg = p.black, bg = p.accent_bright, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.accent },
    DiagnosticInfo = { fg = p.mid },
    DiagnosticHint = { fg = p.dim },
    DiagnosticOk = { fg = p.fg },
    DiagnosticVirtualTextError = { fg = p.red },
    DiagnosticVirtualTextWarn = { fg = p.accent },
    DiagnosticVirtualTextInfo = { fg = p.mid },
    DiagnosticVirtualTextHint = { fg = p.dim },
    DiagnosticUnderlineError = { undercurl = true, sp = p.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.accent },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.mid },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.dim },
    DiagnosticFloatingError = { fg = p.red },
    DiagnosticFloatingWarn = { fg = p.accent },
    DiagnosticFloatingInfo = { fg = p.mid },
    DiagnosticFloatingHint = { fg = p.dim },
    Error = { fg = p.red, bold = true },
    ErrorMsg = { fg = p.red, bold = true },
    WarningMsg = { fg = p.accent, bold = true },

    -- LSP
    LspReferenceText = { bg = "NONE", underline = true },
    LspReferenceRead = { bg = "NONE", underline = true },
    LspReferenceWrite = { fg = p.bright, bg = "NONE", underline = true, bold = true },
    LspInlayHint = { fg = p.dim, italic = true },
    LspCodeLens = { fg = p.dim, italic = true },
    LspSignatureActiveParameter = { fg = p.bright, bold = true },

    -- Diff and version control
    DiffAdd = { fg = p.fg, bg = "NONE" },
    DiffChange = { fg = p.accent, bg = "NONE" },
    DiffDelete = { fg = p.red, bg = "NONE" },
    DiffText = { fg = p.accent_bright, bg = "NONE", underline = true },
    Added = { fg = p.fg },
    Changed = { fg = p.accent },
    Removed = { fg = p.red },
    GitSignsAdd = { fg = p.mid },
    GitSignsChange = { fg = p.accent },
    GitSignsDelete = { fg = p.red },

    -- Status and tab lines
    StatusLine = { fg = p.fg, bg = "NONE" },
    StatusLineNC = { fg = p.dim, bg = "NONE" },
    TabLine = { fg = p.dim, bg = "NONE" },
    TabLineFill = { bg = "NONE" },
    TabLineSel = { fg = p.bright, bg = "NONE", bold = true, underline = true },
    WinBar = { fg = p.fg, bg = "NONE" },
    WinBarNC = { fg = p.dim, bg = "NONE" },

    -- Common plugin integrations
    TelescopeBorder = { fg = p.mid, bg = "NONE" },
    TelescopeTitle = { fg = p.accent, bold = true },
    TelescopePromptPrefix = { fg = p.accent, bold = true },
    TelescopeSelection = { fg = p.bright, bg = "NONE", reverse = true },
    NeoTreeDirectoryIcon = { fg = p.mid },
    NeoTreeDirectoryName = { fg = p.bright },
    NeoTreeGitAdded = { fg = p.mid },
    NeoTreeGitModified = { fg = p.accent },
    NeoTreeGitDeleted = { fg = p.red },
    WhichKey = { fg = p.bright, bold = true },
    WhichKeyGroup = { fg = p.mid, bold = true },
    WhichKeyDesc = { fg = p.fg },
    MiniStatuslineModeNormal = { fg = p.black, bg = p.mid, bold = true },
    MiniStatuslineModeInsert = { fg = p.black, bg = p.bright, bold = true },
    MiniStatuslineModeVisual = { fg = p.black, bg = p.accent, bold = true },
    MiniStatuslineModeCommand = { fg = p.black, bg = p.accent_bright, bold = true },
    MiniStatuslineModeOther = { fg = p.black, bg = p.mid, bold = true },
  })

  -- Tree-sitter captures. Bold is reserved for syntax structure:
  -- declarations, control flow, functions, and types.
  set_groups({
    ["@comment"] = { fg = p.dim, italic = true },
    ["@comment.todo"] = { fg = p.black, bg = p.accent_bright, bold = true },
    ["@variable"] = { fg = p.fg },
    ["@variable.builtin"] = { fg = p.accent },
    ["@variable.parameter"] = { fg = p.fg, italic = true },
    ["@variable.member"] = { fg = p.fg },
    ["@constant"] = { fg = p.accent },
    ["@constant.builtin"] = { fg = p.accent_bright, bold = true },
    ["@module"] = { fg = p.mid },
    ["@label"] = { fg = p.mid, bold = true },

    ["@string"] = { fg = p.string },
    ["@string.documentation"] = { fg = p.string, italic = true },
    ["@string.escape"] = { fg = p.accent_bright, bold = true },
    ["@string.special"] = { fg = p.accent },
    ["@character"] = { fg = p.string },
    ["@character.special"] = { fg = p.accent_bright, bold = true },

    ["@boolean"] = { fg = p.accent_bright, bold = true },
    ["@number"] = { fg = p.accent },
    ["@number.float"] = { fg = p.accent },

    ["@function"] = { fg = p.bright, bold = true },
    ["@function.call"] = { fg = p.bright, bold = true },
    ["@function.builtin"] = { fg = p.accent, bold = true },
    ["@function.method"] = { fg = p.bright, bold = true },
    ["@function.method.call"] = { fg = p.bright, bold = true },
    ["@method"] = { fg = p.bright, bold = true },
    ["@constructor"] = { fg = p.mid, bold = true },

    ["@keyword"] = { fg = p.fg, bold = true },
    ["@keyword.conditional"] = { fg = p.fg, bold = true },
    ["@keyword.repeat"] = { fg = p.fg, bold = true },
    ["@keyword.return"] = { fg = p.accent_bright, bold = true },
    ["@keyword.exception"] = { fg = p.red, bold = true },
    ["@keyword.directive"] = { fg = p.mid, bold = true },
    ["@keyword.directive.define"] = { fg = p.accent, bold = true },
    ["@keyword.operator"] = { fg = p.accent },
    ["@operator"] = { fg = p.accent },

    ["@type"] = { fg = p.mid, bold = true },
    ["@type.builtin"] = { fg = p.mid, bold = true },
    ["@type.definition"] = { fg = p.bright, bold = true },
    ["@attribute"] = { fg = p.accent },
    ["@property"] = { fg = p.fg },
    ["@field"] = { fg = p.fg },
    ["@punctuation"] = { fg = p.mid },
    ["@punctuation.bracket"] = { fg = p.mid },
    ["@punctuation.delimiter"] = { fg = p.dim },
    ["@punctuation.special"] = { fg = p.accent },
    ["@tag"] = { fg = p.mid, bold = true },
    ["@tag.attribute"] = { fg = p.fg },
    ["@tag.delimiter"] = { fg = p.dim },

    -- Markdown and documentation
    ["@markup.heading"] = { fg = p.bright, bold = true },
    ["@markup.heading.1"] = { fg = p.accent_bright, bold = true },
    ["@markup.strong"] = { fg = p.bright, bold = true },
    ["@markup.italic"] = { fg = p.fg, italic = true },
    ["@markup.link"] = { fg = p.accent, underline = true },
    ["@markup.link.url"] = { fg = p.dim, underline = true },
    ["@markup.raw"] = { fg = p.string },
    ["@markup.list"] = { fg = p.accent, bold = true },
    ["@markup.quote"] = { fg = p.dim, italic = true },
  })

  -- C and C++-specific legacy groups remain useful without Tree-sitter.
  set_groups({
    cStatement = { fg = p.fg, bold = true },
    cType = { fg = p.mid, bold = true },
    cStorageClass = { fg = p.fg, bold = true },
    cStructure = { fg = p.mid, bold = true },
    cOperator = { fg = p.accent },
    cConstant = { fg = p.accent },
    cPreProc = { fg = p.mid, bold = true },
    cInclude = { fg = p.accent, bold = true },
    cDefine = { fg = p.accent, bold = true },
    cppStatement = { fg = p.fg, bold = true },
    cppType = { fg = p.mid, bold = true },
    cppAccess = { fg = p.fg, bold = true },
    cppModifier = { fg = p.fg, bold = true },
  })
end

return M
