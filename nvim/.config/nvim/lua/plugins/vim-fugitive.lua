return {
  "tpope/vim-fugitive",
  config = function()
    vim.cmd [[set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P]]

    vim.keymap.set("n", "<leader>xg", function()
      local wins = vim.fn.filter(vim.api.nvim_list_wins(), function(_, w)
        return vim.bo[vim.api.nvim_win_get_buf(w)].filetype == "fugitive"
      end)
      if #wins > 0 then
        vim.api.nvim_win_close(wins[1], false)
      else
        vim.cmd.Git()
      end
    end, { desc = "Toggle Git (fugitive)" })
  end
}
