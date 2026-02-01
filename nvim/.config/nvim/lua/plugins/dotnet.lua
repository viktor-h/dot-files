return {
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
  -- {
  --   "GustavEikaas/easy-dotnet.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua", "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("easy-dotnet").setup()
  --   end
  -- },
  {
    'nsidorenco/neotest-vstest',
    dependencies = {
      'nvim-neotest/neotest',
    },
  },
}
