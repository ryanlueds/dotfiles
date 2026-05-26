-- Gruber Darker colorscheme.

-- Reset highlighting.
vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' then
    vim.cmd.syntax 'reset'
end
vim.o.termguicolors = true
vim.g.colors_name = 'gruber-darker'

local colors = {
    bg = '#181818',
    bg_m1 = '#101010',
    bg_1 = '#282828',
    bg_2 = '#453d41',
    bg_3 = '#484848',
    bg_4 = '#52494e',
    fg = '#e4e4ef',
    fg_1 = '#f4f4ff',
    fg_2 = '#f5f5f5',
    white = '#ffffff',
    black = '#000000',
    red = '#f43841',
    red_1 = '#c73c3f',
    bright_red = '#ff4f58',
    green = '#73c936',
    yellow = '#ffdd33',
    brown = '#cc8c3c',
    quartz = '#95a99f',
    niagara = '#96a6c8',
    niagara_1 = '#565f73',
    niagara_2 = '#303540',
    wisteria = '#9e95c7',
}

-- Terminal colors.
vim.g.terminal_color_0 = colors.bg_m1
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.niagara
vim.g.terminal_color_5 = colors.wisteria
vim.g.terminal_color_6 = colors.quartz
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bg_3
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.niagara
vim.g.terminal_color_13 = colors.wisteria
vim.g.terminal_color_14 = colors.quartz
vim.g.terminal_color_15 = colors.fg_2
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs {
    Normal = 'niagara',
    Pending = 'wisteria',
    Visual = 'yellow',
    Insert = 'green',
    Command = 'quartz',
    Other = 'brown',
} do
    statusline_groups['StatuslineMode' .. mode] = { fg = colors.bg_m1, bg = colors[color] }
    statusline_groups['StatuslineModeSeparator' .. mode] = { fg = colors[color], bg = colors.bg_m1 }
end
statusline_groups = vim.tbl_extend('error', statusline_groups, {
    StatuslineItalic = { fg = colors.bg_4, bg = colors.bg_m1, italic = true },
    StatuslineSpinner = { fg = colors.green, bg = colors.bg_m1, bold = true },
    StatuslineTitle = { fg = colors.white, bg = colors.bg_m1, bold = true },
})

---@type table<string, vim.api.keyset.highlight>
local groups = vim.tbl_extend('error', statusline_groups, {
    -- Builtins.
    Boolean = { fg = colors.white },
    Character = { fg = colors.green },
    ColorColumn = { bg = colors.bg_1 },
    Comment = { fg = colors.brown, italic = true },
    Conceal = { fg = colors.brown },
    Conditional = { fg = colors.yellow },
    Constant = { fg = colors.quartz },
    CurSearch = { fg = colors.black, bg = colors.fg_1 },
    Cursor = { fg = colors.yellow },
    CursorColumn = { bg = colors.bg_1 },
    CursorLine = { bg = colors.bg_1 },
    CursorLineNr = { fg = colors.yellow, bold = true },
    Define = { link = 'PreProc' },
    Directory = { fg = colors.niagara },
    EndOfBuffer = { fg = colors.bg_1, bg = colors.bg },
    Error = { fg = colors.red_1 },
    ErrorMsg = { fg = colors.red },
    FloatBorder = { fg = colors.fg },
    FoldColumn = {},
    Folded = { bg = colors.bg_1 },
    Function = { fg = colors.niagara },
    Identifier = { fg = colors.fg_1 },
    IncSearch = { bg = colors.fg_1, fg = colors.niagara_1 },
    Include = { link = 'PreProc' },
    Keyword = { fg = colors.yellow, bold = true },
    Label = { fg = colors.yellow },
    LineNr = { fg = colors.yellow },
    LineNrAbove = { fg = colors.bg_4 },
    LineNrBelow = { fg = colors.bg_4 },
    Macro = { link = 'PreProc' },
    MatchParen = { bg = colors.bg_4 },
    NonText = { fg = colors.bg_4 },
    Normal = { fg = colors.fg, bg = 'NONE' },
    NormalFloat = { link = 'Normal' },
    Number = { fg = colors.white },
    Pmenu = { bg = colors.bg_1 },
    PmenuSbar = { bg = colors.bg_1 },
    PmenuSel = { bg = colors.bg_m1 },
    PmenuThumb = { link = 'Pmenu' },
    PreCondit = { link = 'PreProc' },
    PreProc = { fg = colors.quartz },
    Question = { fg = colors.fg },
    Repeat = { fg = colors.yellow },
    Search = { bg = colors.fg_2, fg = colors.black },
    SignColumn = { link = 'Normal' },
    Special = { link = 'Normal' },
    SpecialChar = { link = 'String' },
    SpecialComment = { fg = colors.green, italic = true },
    SpecialKey = { fg = colors.bg_4 },
    SpellBad = { fg = colors.red, underline = true },
    SpellCap = { fg = colors.yellow, underline = true },
    SpellLocal = { fg = colors.yellow, underline = true },
    SpellRare = { fg = colors.yellow, underline = true },
    Statement = { fg = colors.yellow },
    StatusLine = { fg = colors.white, bg = colors.bg_1 },
    StatusLineNC = { fg = colors.quartz, bg = colors.bg_1 },
    StorageClass = { fg = colors.quartz },
    String = { fg = colors.green },
    Structure = { fg = colors.quartz },
    Substitute = { fg = colors.black, bg = colors.fg_1, bold = true },
    Title = { fg = colors.niagara },
    Todo = { fg = colors.wisteria, bold = true, italic = true },
    Type = { fg = colors.quartz },
    TypeDef = { fg = colors.yellow },
    Underlined = { fg = colors.niagara, underline = true },
    VertSplit = { fg = colors.bg_2 },
    Visual = { bg = colors.bg_3 },
    VisualNOS = { fg = colors.bg_3 },
    WarningMsg = { fg = colors.red },
    Whitespace = { fg = colors.bg_2 },
    WildMenu = { fg = colors.black, bg = colors.white },
    WinSeparator = { link = 'Normal' },

    -- Treesitter.
    ['@annotation'] = { fg = colors.quartz },
    ['@attribute'] = { fg = colors.quartz },
    ['@boolean'] = { fg = colors.white },
    ['@character'] = { fg = colors.green },
    ['@constant'] = { fg = colors.quartz },
    ['@constant.builtin'] = { fg = colors.quartz },
    ['@constant.macro'] = { fg = colors.quartz },
    ['@constructor'] = { fg = colors.quartz },
    ['@error'] = { fg = colors.red_1 },
    ['@function'] = { fg = colors.niagara },
    ['@function.builtin'] = { fg = colors.niagara },
    ['@function.macro'] = { fg = colors.niagara },
    ['@function.method'] = { fg = colors.niagara },
    ['@keyword'] = { fg = colors.yellow, bold = true },
    ['@keyword.conditional'] = { fg = colors.yellow, bold = true },
    ['@keyword.exception'] = { fg = colors.yellow, bold = true },
    ['@keyword.function'] = { fg = colors.yellow, bold = true },
    ['@keyword.function.ruby'] = { fg = colors.yellow, bold = true },
    ['@keyword.include'] = { fg = colors.quartz },
    ['@keyword.operator'] = { link = 'Normal' },
    ['@keyword.repeat'] = { fg = colors.yellow, bold = true },
    ['@label'] = { fg = colors.yellow },
    ['@markup'] = { fg = colors.fg },
    ['@markup.emphasis'] = { fg = colors.fg, italic = true },
    ['@markup.heading'] = { fg = colors.red_1, bold = true },
    ['@markup.link'] = { fg = colors.niagara, bold = true },
    ['@markup.link.uri'] = { fg = colors.niagara, italic = true },
    ['@markup.list'] = { fg = colors.niagara },
    ['@markup.raw'] = { fg = colors.green },
    ['@markup.strong'] = { fg = colors.fg, bold = true },
    ['@markup.underline'] = { fg = colors.niagara },
    ['@module'] = { fg = colors.fg },
    ['@number'] = { fg = colors.white },
    ['@number.float'] = { fg = colors.white },
    ['@operator'] = { link = 'Normal' },
    ['@parameter.reference'] = { fg = colors.fg },
    ['@property'] = { fg = colors.fg },
    ['@punctuation.bracket'] = { fg = colors.fg },
    ['@punctuation.delimiter'] = { fg = colors.fg },
    ['@string'] = { fg = colors.green },
    ['@string.escape'] = { fg = colors.niagara },
    ['@string.regexp'] = { fg = colors.green },
    ['@string.special.symbol'] = { fg = colors.green },
    ['@structure'] = { fg = colors.quartz },
    ['@tag'] = { fg = colors.quartz },
    ['@tag.attribute'] = { fg = colors.fg },
    ['@tag.delimiter'] = { fg = colors.quartz },
    ['@type'] = { fg = colors.quartz },
    ['@type.builtin'] = { fg = colors.quartz, italic = true },
    ['@type.qualifier'] = { fg = colors.yellow },
    ['@variable'] = { fg = colors.fg },
    ['@variable.builtin'] = { fg = colors.fg },
    ['@variable.member'] = { fg = colors.fg },
    ['@variable.parameter'] = { fg = colors.fg },

    -- Semantic tokens.
    ['@class'] = { fg = colors.quartz },
    ['@decorator'] = { fg = colors.quartz },
    ['@enum'] = { fg = colors.quartz },
    ['@enumMember'] = { fg = colors.quartz },
    ['@event'] = { fg = colors.quartz },
    ['@interface'] = { fg = colors.quartz },
    ['@lsp.type.class'] = { fg = colors.quartz },
    ['@lsp.type.decorator'] = { fg = colors.niagara },
    ['@lsp.type.enum'] = { fg = colors.quartz },
    ['@lsp.type.enumMember'] = { fg = colors.quartz },
    ['@lsp.type.function'] = { fg = colors.niagara },
    ['@lsp.type.interface'] = { fg = colors.quartz },
    ['@lsp.type.macro'] = { fg = colors.quartz },
    ['@lsp.type.method'] = { fg = colors.niagara },
    ['@lsp.type.namespace'] = { fg = colors.fg },
    ['@lsp.type.parameter'] = { fg = colors.fg },
    ['@lsp.type.property'] = { fg = colors.fg },
    ['@lsp.type.struct'] = { fg = colors.quartz },
    ['@lsp.type.type'] = { fg = colors.quartz },
    ['@lsp.type.variable'] = { fg = colors.fg },
    ['@modifier'] = { fg = colors.yellow },
    ['@regexp'] = { fg = colors.green },
    ['@struct'] = { fg = colors.quartz },
    ['@typeParameter'] = { fg = colors.quartz },

    -- LSP.
    ComplHint = { link = 'Comment' },
    DiagnosticDeprecated = { strikethrough = true, fg = colors.fg },
    DiagnosticError = { fg = colors.red },
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingHint = { fg = colors.cyan },
    DiagnosticFloatingInfo = { fg = colors.cyan },
    DiagnosticFloatingWarn = { fg = colors.yellow },
    DiagnosticHint = { fg = colors.cyan },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnnecessary = { fg = colors.grey, italic = true },
    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.transparent_red },
    DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextInfo = { fg = colors.cyan, bg = colors.transparent_blue },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
    DiagnosticWarn = { fg = colors.yellow },
    LspCodeLens = { fg = colors.cyan, underline = true },
    LspInlayHint = { fg = colors.lavender, italic = true },
    LspReferenceRead = { bg = colors.transparent_blue },
    LspReferenceText = {},
    LspReferenceWrite = { bg = colors.transparent_red },
    LspSignatureActiveParameter = { bold = true, underline = true, sp = colors.fg },

    -- Completions:
    BlinkCmpKindClass = { link = '@type' },
    BlinkCmpKindColor = { link = 'DevIconCss' },
    BlinkCmpKindConstant = { link = '@constant' },
    BlinkCmpKindConstructor = { link = '@type' },
    BlinkCmpKindEnum = { link = '@variable.member' },
    BlinkCmpKindEnumMember = { link = '@variable.member' },
    BlinkCmpKindEvent = { link = '@constant' },
    BlinkCmpKindField = { link = '@variable.member' },
    BlinkCmpKindFile = { link = 'Directory' },
    BlinkCmpKindFolder = { link = 'Directory' },
    BlinkCmpKindFunction = { link = '@function' },
    BlinkCmpKindInterface = { link = '@type' },
    BlinkCmpKindKeyword = { link = '@keyword' },
    BlinkCmpKindMethod = { link = '@function.method' },
    BlinkCmpKindModule = { link = '@module' },
    BlinkCmpKindOperator = { link = '@operator' },
    BlinkCmpKindProperty = { link = '@property' },
    BlinkCmpKindReference = { link = '@parameter.reference' },
    BlinkCmpKindSnippet = { link = '@markup' },
    BlinkCmpKindStruct = { link = '@structure' },
    BlinkCmpKindText = { link = '@markup' },
    BlinkCmpKindTypeParameter = { link = '@variable.parameter' },
    BlinkCmpKindUnit = { link = '@variable.member' },
    BlinkCmpKindValue = { link = '@variable.member' },
    BlinkCmpKindVariable = { link = '@variable' },
    BlinkCmpLabelDeprecated = { link = 'DiagnosticDeprecated' },
    BlinkCmpLabelDescription = { fg = colors.grey, italic = true },
    BlinkCmpLabelDetail = { fg = colors.grey, bg = colors.bg },
    BlinkCmpMenu = { bg = colors.bg },
    BlinkCmpMenuBorder = { bg = colors.bg },

    -- Dap UI.
    DapStoppedLine = { default = true, link = 'Visual' },
    NvimDapVirtualText = { fg = colors.lavender, underline = true },

    -- Diffs.
    DiffAdd = { fg = colors.green, bg = colors.transparent_green },
    DiffChange = { fg = colors.white, bg = colors.transparent_yellow },
    DiffDelete = { fg = colors.red, bg = colors.transparent_red },
    DiffText = { fg = colors.orange, bg = colors.transparent_yellow, bold = true },
    DiffviewFolderSign = { fg = colors.cyan },
    DiffviewNonText = { fg = colors.lilac },
    diffAdded = { fg = colors.bright_green, bold = true },
    diffChanged = { fg = colors.bright_yellow, bold = true },
    diffRemoved = { fg = colors.bright_red, bold = true },

    -- Command line.
    MoreMsg = { fg = colors.bright_white, bold = true },
    MsgArea = { fg = colors.cyan },
    MsgSeparator = { fg = colors.lilac },

    -- Winbar styling.
    WinBar = { fg = colors.fg, bg = colors.transparent_black },
    WinBarNC = { bg = colors.transparent_black },
    WinBarDir = { fg = colors.bright_magenta, bg = colors.transparent_black, italic = true },
    WinBarSeparator = { fg = colors.green, bg = colors.transparent_black },

    -- Quickfix window.
    QuickFixLine = { italic = true, bg = colors.transparent_red },

    -- Gitsigns.
    GitSignsAdd = { fg = colors.bright_green },
    GitSignsChange = { fg = colors.cyan },
    GitSignsCurrentLineBlame = { fg = colors.lavender },
    GitSignsDelete = { fg = colors.bright_red },
    GitSignsStagedAdd = { fg = colors.orange },
    GitSignsStagedChange = { fg = colors.orange },
    GitSignsStagedDelete = { fg = colors.orange },

    -- Gitlinker.
    NvimGitLinkerHighlightTextObject = { link = 'Visual' },

    -- Tabline.
    MiniTablineCurrent = { fg = colors.bg, bg = colors.bright_magenta },
    MiniTablineHidden = { fg = colors.comment, bg = colors.bg },
    MiniTablineVisible = { fg = colors.bright_magenta, bg = colors.bg },
    MiniTablineModifiedCurrent = { fg = colors.bg, bg = colors.grey, italic = true },
    MiniTablineModifiedHidden = { fg = colors.grey, bg = colors.bg, italic = true },
    MiniTablineModifiedVisible = { fg = colors.grey, bg = colors.bg, italic = true },

    -- When triggering flash, use a white font and make everything in the backdrop italic.
    FlashBackdrop = { italic = true },
    FlashPrompt = { link = 'Normal' },

    -- Make these titles more visible.
    MiniClueTitle = { bold = true, fg = colors.cyan },
    MiniFilesTitleFocused = { bold = true, fg = colors.cyan },

    -- Nicer yanky highlights.
    YankyPut = { link = 'Visual' },
    YankyYanked = { link = 'Visual' },

    -- Highlight for the Treesitter sticky context.
    TreesitterContextBottom = { underline = true, sp = colors.lilac },

    -- Fzf overrides.
    FzfLuaBorder = { fg = colors.comment },
    FzfLuaHeaderBind = { fg = colors.lavender },
    FzfLuaHeaderText = { fg = colors.pink },
    FzfLuaLivePrompt = { link = 'Normal' },
    FzfLuaLiveSym = { fg = colors.fuchsia },
    FzfLuaPreviewTitle = { fg = colors.fg },
    FzfLuaSearch = { bg = colors.transparent_red },

    -- Nicer sign column highlights for grug-far.
    GrugFarResultsChangeIndicator = { link = 'Changed' },
    GrugFarResultsRemoveIndicator = { link = 'Removed' },
    GrugFarResultsAddIndicator = { link = 'Added' },

    -- Links.
    HighlightUrl = { underline = true, fg = colors.neon_cyan, sp = colors.neon_cyan },

    -- AI completions.
    NeoCodeiumSuggestion = { link = 'Comment' },
})

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end
