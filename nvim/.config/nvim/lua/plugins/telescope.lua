return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
	{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" }
      }
}
