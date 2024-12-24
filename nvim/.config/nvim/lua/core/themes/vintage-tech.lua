-- Initialize module table
local M = {}

-- Color palette aligned with terminal theme
M.colors = {
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

-- Setup function
function M.setup()
    -- Reset highlights
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    -- Set options
    vim.o.termguicolors = true
    vim.g.colors_name = "vintage-tech"
    
    local groups = {
        -- Editor chrome
        Normal = { fg = M.colors.dark_navy, bg = M.colors.cream },
        NormalFloat = { fg = M.colors.dark_navy, bg = M.colors.cream_dark },
        Cursor = { fg = M.colors.cream, bg = M.colors.blue },
        CursorLine = { bg = M.colors.cream_dark },
        CursorLineNr = { fg = M.colors.blue, bold = true },
        LineNr = { fg = M.colors.gray },
        SignColumn = { bg = M.colors.cream },
        VertSplit = { fg = M.colors.gray },
        ColorColumn = { bg = M.colors.cream_dark },
        Folded = { fg = M.colors.gray, bg = M.colors.cream_dark },
        FoldColumn = { fg = M.colors.gray, bg = M.colors.cream },
        
        -- Syntax highlighting
        Comment = { fg = M.colors.gray, italic = true },
        String = { fg = M.colors.blue },
        Number = { fg = M.colors.blue_muted },
        Boolean = { fg = M.colors.blue, bold = true },
        Character = { fg = M.colors.blue },
        Conditional = { fg = M.colors.dark_navy, bold = true },
        Constant = { fg = M.colors.blue_muted },
        Define = { fg = M.colors.dark_navy },
        Function = { fg = M.colors.dark_navy, bold = true },
        Identifier = { fg = M.colors.dark_navy },
        Include = { fg = M.colors.blue },
        Keyword = { fg = M.colors.blue, bold = true },
        Label = { fg = M.colors.dark_navy },
        Operator = { fg = M.colors.gray },
        PreProc = { fg = M.colors.blue_muted },
        Special = { fg = M.colors.blue_muted },
        Statement = { fg = M.colors.dark_navy },
        Type = { fg = M.colors.blue }
    }
    
    -- Apply highlights
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
