return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = 'main',
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "c_sharp", "javascript", "html", "markdown" },
        highlight = {
            enable = true,
        },
        indent = { enable = true }
    }
}
