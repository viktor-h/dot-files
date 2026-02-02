return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    adapters = {
      require('neotest-vstest') {},
    },
    summary = {
      open = 'botright vsplit | vertical resize 80',
    },
    -- discovery = {
    --   -- Drastically improve performance in ginormous projects by
    --   -- only AST-parsing the currently opened buffer.
    --   enabled = false,
    --   -- Number of workers to parse files concurrently.
    --   -- A value of 0 automatically assigns number based on CPU.
    --   -- Set to 1 if experiencing lag.
    --   concurrent = 1,
  },
  config = function(_, opts)
    local neotest = require("neotest")
    neotest.setup(opts)

    vim.keymap.set(
      "n",
      "<leader>td",
      function()
        neotest.run.run({ suite = false, strategy = "dap" })
      end,
      { desc = "Debug nearest test" }
    )
    vim.keymap.set(
      "n",
      "<leader>tn",
      function()
        neotest.run.run()
      end,
      { desc = "Run nearest test" }
    )
    vim.keymap.set(
      "n",
      "<leader>tf",
      function()
        neotest.run.run(vim.fn.expand("%"))
      end,
      { desc = "Run test for current file" }
    )
    vim.keymap.set(
      "n",
      "<leader>xt",
      function()
        neotest.summary.toggle()
      end,
      { desc = "Toggle test summary" }
    )
    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = "Run all tests (suite)" })
    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open()
    end, { desc = "Open test output" })
  end
}
