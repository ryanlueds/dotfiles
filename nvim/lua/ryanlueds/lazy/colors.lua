function TransparentPencils()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         -- Example config in lua
    --         --
    --         -- Default options:
    --         require("gruvbox").setup({
    --           terminal_colors = true, -- add neovim terminal colors
    --           undercurl = false,
    --           underline = false,
    --           bold = false,
    --           italic = {
    --             strings = false,
    --             emphasis = false,
    --             comments = false,
    --             operators = false,
    --             folds = false,
    --           },
    --           strikethrough = false,
    --           invert_selection = false,
    --           invert_signs = false,
    --           invert_tabline = false,
    --           invert_intend_guides = false,
    --           inverse = true, -- invert background for search, diffs, statuslines and errors
    --           contrast = "", -- can be "hard", "soft" or empty string
    --           palette_overrides = {},
    --           overrides = {},
    --           dim_inactive = false,
    --           transparent_mode = false,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end, },
    -- {
    --     'shaunsingh/nord.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Example config in lua
    --         vim.g.nord_contrast = true
    --         vim.g.nord_borders = false
    --         vim.g.nord_disable_background = true
    --         vim.g.nord_italic = false
    --         vim.g.nord_uniform_diff_background = true
    --         vim.g.nord_bold = false

    --         -- Load the colorscheme
    --         require('nord').set()

    --         -- Toggle background transparency
    --         local bg_transparent = true

    --         local toggle_transparency = function()
    --             bg_transparent = not bg_transparent
    --             vim.g.nord_disable_background = bg_transparent
    --             vim.cmd [[colorscheme nord]]
    --         end

    --         vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    --     end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                term_colors = true,
            })
            vim.cmd.colorscheme('catppuccin')


            vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#CD9EFC' })
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#BABBF6' })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#BABBF6' })
        end,
    }
    -- {
    --   'sainnhe/sonokai',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     -- Optionally configure and load the colorscheme
    --     -- directly inside the plugin declaration.
    --     vim.g.sonokai_enable_italic = true
    --     vim.cmd.colorscheme('sonokai')
    --   end
    -- }
    -- {
    --     'ficcdaf/ashen.nvim',
    --     config = function()
    --         vim.cmd.colorscheme('ashen')
    --         -- vim.cmd('lua ColorMyPencils()')
    --     end,
    -- },

    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Default options:
    --         require('kanagawa').setup({
    --             compile = false,             -- enable compiling the colorscheme
    --             undercurl = true,            -- enable undercurls
    --             commentStyle = { italic = true },
    --             functionStyle = {},
    --             keywordStyle = { italic = true},
    --             statementStyle = { bold = true },
    --             typeStyle = {},
    --             transparent = false,         -- do not set background color
    --             dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    --             terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    --             colors = {                   -- add/modify theme and palette colors
    --                 palette = {},
    --                 theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --             },
    --             overrides = function(colors) -- add/modify highlights
    --                 return {}
    --             end,
    --             theme = "wave",              -- Load "wave" theme when 'background' option is not set
    --             background = {               -- map the value of 'background' option to a theme
    --                 dark = "wave",           -- try "dragon" !
    --                 light = "lotus"
    --             },
    --         })
    --         -- setup must be called before loading
    --         vim.cmd('colorscheme kanagawa-dragon')
    --         -- vim.cmd('lua ColorMyPencils()')
    --     end,

    -- },
    -- Or with configuration
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('github-theme').setup({
    --             -- ...
    --         })

    --         vim.cmd('colorscheme github_dark_default')
    --         vim.cmd('lua ColorMyPencils()')
    --     end,
    -- },
    -- {
    --     'thimc/gruber-darker.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('gruber-darker').setup({ })
    --         vim.cmd.colorscheme('gruber-darker')
    --         vim.cmd('lua TransparentPencils()')


    --         vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffdd33' })
    --         vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'white' })
    --         vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'white' })
	--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


    --         -- vim.api.nvim_set_hl(0, 'Type', { fg = '#c4c9c3' })
    --         vim.api.nvim_set_hl(0, 'Comment', { fg = '#db9342' })
    --         -- vim.api.nvim_set_hl(0, 'Function', { fg = '#a5b0c7' })
    --         -- vim.api.nvim_set_hl(0, 'Constant', { fg = '#ffffff' })
    --         
    --         -- vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#373737' })
    --         -- '#db9342'
    --         -- '#cc8c3c' this is the cool brown color
    --         -- '#ffdd33'  this is the cool yellow color
    --     end,
    -- },
    -- {
    --     'behemothbucket/gruber-darker-theme.nvim',
    --     config = function()
    --         require('gruber-darker').setup()
    --         -- vim.cmd('lua ColorMyPencils()')
    --     end
    -- },
    -- {
    --     'Domeee/mosel.nvim',
    --     config = function()
    --         vim.cmd.colorscheme('mosel')
    --     end
    -- }
    -- {
    --     "sho-87/kanagawa-paper.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd.colorscheme('kanagawa-paper')
    --     end
    -- }
}
