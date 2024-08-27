function ColorMyPencils(color)
    color = color or "gruber_darker"
	-- vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "CursorLine", { fg = "#ffdd33" })
    -- vim.api.nvim_set_hl(0, 'Type', { fg = '#c4c9c3' })
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#db9342' })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#a5b0c7' })
    vim.api.nvim_set_hl(0, 'Constant', { fg = '#ffffff' })
end

return {

    -- Or with configuration
    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                -- ...
            })

            -- vim.cmd('colorscheme github_dark_default')
            --vim.cmd('lua ColorMyPencils()')
        end,
    },
    {
        'thimc/gruber-darker.nvim',
        config = function()
            require('gruber-darker').setup({
                -- OPTIONAL
                transparent = true, -- removes the background
                -- underline = false, -- disables underline fonts
                -- bold = false, -- disables bold fonts
            })
            vim.cmd.colorscheme('gruber-darker')
            vim.cmd('lua ColorMyPencils()')
        end,
    },
    -- {
    --     'behemothbucket/gruber-darker-theme.nvim',
    --     config = function()
    --         require('gruber-darker').setup()
    --         vim.cmd('lua ColorMyPencils()')
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
