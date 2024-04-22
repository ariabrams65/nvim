return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                --automatically installs parser when encountering that filetype
                auto_install = true,
                -- ensure_installed = {'lua', 'python', 'vimdoc', 'javascript', 'json'},
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}
