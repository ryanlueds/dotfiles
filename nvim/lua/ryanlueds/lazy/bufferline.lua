return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                -- idk.
            },
            highlights = {
                fill = { bg = '#1e2030'},  -- catppuccin macchiato mantle
            },
        })
    end
}
