return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

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

    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "DapBreakpoint", numhl = "" })
  end
}
