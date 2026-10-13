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
-- Reload buffers when the underlying file changes on disk.
-- FocusGained/BufEnter cover switching in; CursorHold(I) cover staying put
-- (fires after 'updatetime' of inactivity).
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})
-- Notify after an external change is auto-loaded into the buffer.
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  command = "echohl WarningMsg | echo 'File changed on disk, buffer reloaded' | echohl None",
})

vim.diagnostic.config({
  virtual_lines = {
    current_line = true
  }
})

vim.opt.winborder = "rounded"
