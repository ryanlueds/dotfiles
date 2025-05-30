return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        local colorizer = require("colorizer")
        -- REQUIRED
        colorizer.setup({
            'css';
            'javascript';
            'conf';
            'lua';
            html = { mode = 'background' };
        }, { mode = 'background' })
    end
}
