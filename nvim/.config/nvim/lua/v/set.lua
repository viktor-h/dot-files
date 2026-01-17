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

vim.diagnostic.config({
  virtual_lines = {
    current_line = true
  }
})

vim.opt.winborder = "rounded"
