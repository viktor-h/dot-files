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

        local on_attach = function(_, bufnr)

            local opts = { buffer = bufnr, noremap = true, silent = true }

            keymap.set("n", "K", vim.lsp.buf.hover, opts)
            keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            keymap.set("n", " df", vim.diagnostic.goto_next, opts)
            keymap.set("n", " dp", vim.diagnostic.goto_prev, opts)
            keymap.set("n", " dl", "<cmd>Telescope diagnostics<cr>", opts)
            keymap.set("n", " r", vim.lsp.buf.rename, opts)

       end

        -- autocompletion assign it to all language servers below
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- lsp_signature setup
        require "lsp_signature".on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded"
            }
        }, bufnr)
        
        -- configure language servers
        require("roslyn").setup({
            dotnet_cmd = "dotnet",
            roslyn_version = "4.8.0-3.23475.7",
            on_attach = on_attach,
            capabilities = capabilities 
        })
    end,
}
