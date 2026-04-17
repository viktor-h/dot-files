vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.scrolloff = 8

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.cursorline = true

vim.opt.autoread = true
vim.opt.updatetime = 4000
-- vim.api.nvim_create_autocmd("CursorHold", {
--   command = "checktime",
-- })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

vim.diagnostic.config({
  virtual_lines = {
    current_line = true
  }
})

vim.opt.winborder = "rounded"
