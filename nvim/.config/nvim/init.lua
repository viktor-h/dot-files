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
    keymap.set("n", " dl", "<cmd>FzfLua diagnostics_document<CR>", opts)
    keymap.set("n", " r", vim.lsp.buf.rename, opts)
    keymap.set('n', ' f', function()
      require("conform").format { lsp_fallback = true }
    end, opts)
    keymap.set({ 'n', 'v' }, ' ca', vim.lsp.buf.code_action, opts)
  end,
})

vim.lsp.config('buf-lsp', {
  cmd = { 'buf', 'lsp', 'serve' },
  filetypes = { 'proto' },
  root_markers = { 'buf.yaml', '.git' },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } }
    }
  }
})

vim.lsp.config("roslyn", {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    client.server_capabilities.diagnosticProvider = { workspaceDiagnostics = true }
  end,
  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
    },
    -- ["csharp|background_analysis"] = {
    --   dotnet_analyzer_diagnostics_scope = "openFiles",
    --   dotnet_compiler_diagnostics_scope = "openFiles",
    -- },
    ["csharp|inlay_hints"] = {
      -- csharp_enable_inlay_hints_for_implicit_object_creation = true,
      -- csharp_enable_inlay_hints_for_implicit_variable_types = true,
      -- csharp_enable_inlay_hints_for_lambda_parameter_types = true,
      csharp_enable_inlay_hints_for_types = true,
      dotnet_enable_inlay_hints_for_parameters = true,
      dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
      dotnet_show_name_completion_suggestions = true,
    },
  },
})

vim.lsp.enable("buf-lsp")
vim.lsp.enable("yamlls")
vim.lsp.enable("bicep")
vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("vtsls")
vim.lsp.enable("html")
