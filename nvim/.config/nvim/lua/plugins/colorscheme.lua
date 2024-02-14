return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
        vim.cmd[[colorscheme tokyonight]]
    end
}
--[[
--return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
        vim.cmd("colorscheme rose-pine")
    end
}
--]]

