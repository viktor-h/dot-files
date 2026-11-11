require("v.set")
require("v.remap")

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.hl.hl_op { higroup = 'IncSearch', timeout = 150 }
  end,
})
