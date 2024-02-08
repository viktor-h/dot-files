return {
    "vim-test/vim-test",
    keys = {
        { "<leader>t", "<cmd>TestNearest -strategy=neovim<cr>", desc = "TestNearest" },
        { "<leader>a", "<cmd>TestSuite -strategy=neovim<cr>", desc= "TestSuite" },
        { "<leader>l", "<cmd>TestLast -strategy=neovim<cr>", desc= "TestLast" },
        { "<leader>g", "<cmd>TestVisit<cr>", desc = "TestVisit" },
    }
}
