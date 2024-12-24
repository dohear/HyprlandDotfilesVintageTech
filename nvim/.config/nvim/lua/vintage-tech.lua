-- vintage-tech.lua
-- Vintage tech inspired colorscheme for Neovim

local M = {}

-- Color palette aligned with terminal theme
local colors = {
    cream = "#F5F1E6",        -- Main background
    cream_dark = "#E5E1D6",   -- Darker background elements
    off_white = "#EEEBE6",    -- Secondary background
    blue = "#0057B8",         -- Primary accent
    blue_muted = "#446891",   -- Secondary accent
    red = "#FF0000",          -- Errors and warnings
    red_muted = "#CC3333",    -- Soft warnings
    dark_navy = "#1C2541",    -- Main text
    gray = "#4C515C",         -- Comments and secondary text
    gray_light = "#697187"    -- Subtle highlights
}

function M.setup()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    
    vim.o.termguicolors = true
    vim.g.colors_name = "vintage-tech"
    
    local groups = {
        -- Editor chrome
        Normal = { fg = colors.dark_navy, bg = colors.cream },
        NormalFloat = { fg = colors.dark_navy, bg = colors.cream_dark },
        Cursor = { fg = colors.cream, bg = colors.blue },
        CursorLine = { bg = colors.cream_dark },
        CursorLineNr = { fg = colors.blue, bold = true },
        LineNr = { fg = colors.gray },
        SignColumn = { bg = colors.cream },
        VertSplit = { fg = colors.gray },
        ColorColumn = { bg = colors.cream_dark },
        Folded = { fg = colors.gray, bg = colors.cream_dark },
        FoldColumn = { fg = colors.gray, bg = colors.cream },
        
        -- Syntax highlighting
        Comment = { fg = colors.gray, italic = true },
        String = { fg = colors.blue },
        Number = { fg = colors.blue_muted },
        Boolean = { fg = colors.blue, bold = true },
        Character = { fg = colors.blue },
        Conditional = { fg = colors.dark_navy, bold = true },
        Constant = { fg = colors.blue_muted },
        Define = { fg = colors.dark_navy },
        Function = { fg = colors.dark_navy, bold = true },
        Identifier = { fg = colors.dark_navy },
        Include = { fg = colors.blue },
        Keyword = { fg = colors.blue, bold = true },
        Label = { fg = colors.dark_navy },
        Operator = { fg = colors.gray },
        PreProc = { fg = colors.blue_muted },
        Special = { fg = colors.blue_muted },
        Statement = { fg = colors.dark_navy },
        Type = { fg = colors.blue },
        
        -- UI Components
        Pmenu = { fg = colors.dark_navy, bg = colors.cream_dark },
        PmenuSel = { fg = colors.cream, bg = colors.blue },
        PmenuSbar = { bg = colors.cream_dark },
        PmenuThumb = { bg = colors.gray },
        StatusLine = { fg = colors.cream, bg = colors.blue },
        StatusLineNC = { fg = colors.cream, bg = colors.blue_muted },
        TabLine = { fg = colors.dark_navy, bg = colors.cream_dark },
        TabLineFill = { bg = colors.cream_dark },
        TabLineSel = { fg = colors.cream, bg = colors.blue, bold = true },
        Title = { fg = colors.blue, bold = true },
        Visual = { bg = colors.cream_dark },
        
        -- Search and selection
        Search = { fg = colors.cream, bg = colors.blue_muted },
        IncSearch = { fg = colors.cream, bg = colors.blue },
        MatchParen = { fg = colors.blue, bold = true },
        
        -- Diagnostics
        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.red_muted },
        DiagnosticInfo = { fg = colors.blue_muted },
        DiagnosticHint = { fg = colors.gray },
        
        -- Git highlighting
        DiffAdd = { fg = colors.cream, bg = colors.blue_muted },
        DiffChange = { fg = colors.dark_navy, bg = colors.cream_dark },
        DiffDelete = { fg = colors.cream, bg = colors.red_muted },
        DiffText = { fg = colors.cream, bg = colors.blue },
        
        -- Spelling
        SpellBad = { undercurl = true, sp = colors.red },
        SpellCap = { undercurl = true, sp = colors.blue },
        SpellLocal = { undercurl = true, sp = colors.blue_muted },
        SpellRare = { undercurl = true, sp = colors.red_muted },
        
        -- Tree-sitter specific
        ["@function"] = { fg = colors.dark_navy, bold = true },
        ["@method"] = { fg = colors.dark_navy, bold = true },
        ["@variable"] = { fg = colors.dark_navy },
        ["@parameter"] = { fg = colors.dark_navy },
        ["@field"] = { fg = colors.dark_navy },
        ["@property"] = { fg = colors.dark_navy },
        ["@constructor"] = { fg = colors.blue },
        ["@tag"] = { fg = colors.blue },
        ["@keyword"] = { fg = colors.blue, bold = true },
        ["@string"] = { fg = colors.blue },
        ["@type"] = { fg = colors.blue },
        ["@comment"] = { fg = colors.gray, italic = true }
    }
    
    -- Set highlight groups
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end



-- Add the reload function for development
function M.reload()
    package.loaded["vintage-tech"] = nil
    require("vintage-tech").setup()
    print("Vintage Tech theme reloaded!")
end

return M


