require("v")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

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
    keymap.set("n", "<leader>df", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)
    keymap.set("n", "<leader>dp", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)
    keymap.set("n", " dl", "<c_md>FzfLua diagnostics_document<CR>", opts)
    keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap.set("n", " r", vim.lsp.buf.rename, opts)
    keymap.set('n', ' f', function()
      require("conform").format { lsp_fallback = true }
    end, opts)
    keymap.set({ 'n', 'v' }, ' ca', vim.lsp.buf.code_action, opts)
  end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("vtsls")
vim.lsp.enable("html")
