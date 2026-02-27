return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
        vim.cmd[[colorscheme tokyonight]]
    end
}

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       variant = "main", -- auto, main, moon, or dawn
--     })
--     vim.cmd("colorscheme rose-pine-main")
--   end
-- }
