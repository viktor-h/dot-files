return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        local gs = require("gitsigns")
        gs.setup()

        vim.keymap.set("n", "<leader>gm", function ()
            gs.change_base("origin/main", true)
        end, { desc = "Gitsigns: diff against origin/main" })

        vim.keymap.set("n", "<leader>gM", function ()
            gs.change_base(nil, true)
        end, { desc = "Gitsigns: reset diff base to index" })

        vim.keymap.set("n", "<leader>gn", function ()
            gs.nav_hunk("next")
        end, { desc = "Gitsigns: next hunk" })

        vim.keymap.set("n", "<leader>gp", function ()
            gs.nav_hunk("prev")
        end, { desc = "Gitsigns: previous hunk" })
    end
}
