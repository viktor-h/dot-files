return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        local opts = { buffer = ev.buf }

        -- disable semantic tokens from lsp
        -- client.server_capabilities.semanticTokensProvider = nil

        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        keymap.set('n', 'gr', "<cmd>FzfLua lsp_references<CR>", opts)
        keymap.set("n", " df", vim.diagnostic.goto_next, opts)
        keymap.set("n", " dp", vim.diagnostic.goto_prev, opts)
        keymap.set("n", " dl", "<cmd>FzfLua diagnostics_document<CR>", opts)
        keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
        keymap.set("n", " r", vim.lsp.buf.rename, opts)
        keymap.set('n', ' f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
        keymap.set({ 'n', 'v' }, ' ca', vim.lsp.buf.code_action, opts)
      end,
    })

    -- autocompletion assign it to all language servers below
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config["lua_ls"] = {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    vim.lsp.config["ts_ls"] = {
      capabilities = capabilities
    }

    vim.lsp.config.clangd = {
      capabilities = capabilities,
      cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
      init_options = {
        fallbackFlags = { '-std=c++17' },
      },
    }
  end,
}
