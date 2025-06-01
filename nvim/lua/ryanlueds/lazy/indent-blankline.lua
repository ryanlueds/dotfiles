return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local hooks = require("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#44475a" })
            -- #f38ba8
            -- #fab387
            -- #a6e3a1
            -- #89b4fa
            -- #b4befe
            -- #cba6f7
            vim.api.nvim_set_hl(0, "IblScopeCatppuccin", { fg = "#b4befe", bg = "NONE" })
        end)

        require("ibl").setup({
            indent = {
                char = '⎸',  -- NOTE: this is very left-aligned on meslo nerd font. different fonts may mess this up
            },
            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
                highlight = {
                    "IblScopeCatppuccin",
                },
            },
        })
    end
}
