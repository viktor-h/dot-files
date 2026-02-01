return {
  -- {
  --   "seblyng/roslyn.nvim",
  --   ---@module 'roslyn.config'
  --   ---@type RoslynNvimConfig
  --   opts = {
  --     -- your configuration comes here; leave empty for default settings
  --   },
  -- },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua", "mfussenegger/nvim-dap" },
    config = function()
      require("easy-dotnet").setup()
    end
  },
  -- {
  --   'nvim-neotest/neotest',
  --   dependencies = {
  --     'nvim-neotest/nvim-nio',
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   opts = {
  --     adapters = {
  --       require('neotest-vstest') {},
  --     },
  --     summary = {
  --       open = 'botright vsplit | vertical resize 80',
  --     },
  --   },
  -- },
  -- {
  --   'nsidorenco/neotest-vstest',
  --   dependencies = {
  --     'nvim-neotest/neotest',
  --   },
  -- },
}
