return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()

        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local on_attach = function()

            keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
            keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        end

        -- autocompletion assign it to all language servers below
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure language servers
        require("roslyn").setup({
            dotnet_cmd = "dotnet",
            roslyn_version = "4.8.0-3.23475.7",
            on_attach = on_attach,
            capabilities = capabilities 
        })
    end,
}
