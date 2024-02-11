return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = false,
            signs = {
                error = "e",
                warning = "w",
                hint = "h",
                information = "i"
            },
        }
    end
}
