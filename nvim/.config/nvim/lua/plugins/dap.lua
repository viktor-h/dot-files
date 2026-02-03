return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

      local netcoredbg_adapter = {
        type = "executable",
        command = mason_path,
        args = { "--interpreter=vscode" },
      }

      dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
      dap.adapters.coreclr = netcoredbg_adapter    -- needed for unit test debugging

      local dotnet = require("custom.nvim-dap-dotnet-dll-hunter")

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return dotnet.build_dll_path()
          end,
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dapui.setup()

      vim.keymap.set("n", "q", function()
        dap.terminate()
        dap.clear_breakpoints()
      end, { desc = "Terminate and clear breakpoints" })
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Step over (alt)" })
      vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
      vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
      vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
      vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })
      vim.keymap.set("n", "<space>de", function()
        dapui.eval(nil, { enter = true })
      end, { desc = "Eval under cursor" })

      vim.fn.sign_define('DapBreakpoint',
        {
          text = '⚪',
          texthl = 'DapBreakpointSymbol',
          linehl = 'DapBreakpoint',
          numhl = 'DapBreakpoint'
        })

      vim.fn.sign_define('DapStopped',
        {
          text = '🔴',
          texthl = 'yellow',
          linehl = 'DapBreakpoint',
          numhl = 'DapBreakpoint'
        })
      vim.fn.sign_define('DapBreakpointRejected',
        {
          text = '⭕',
          texthl = 'DapStoppedSymbol',
          linehl = 'DapBreakpoint',
          numhl = 'DapBreakpoint'
        })
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" }
  },
  -- for arm64
  -- {
  --   "Cliffback/netcoredbg-macOS-arm64.nvim",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require('netcoredbg-macOS-arm64').setup(require('dap'))
  --   end
  -- }
}
