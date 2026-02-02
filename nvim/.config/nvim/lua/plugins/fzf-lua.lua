return {
  "ibhagwan/fzf-lua",
  opts = {},
  keys = {
    {
      "<leader>pf",
      "<cmd>FzfLua files<CR>",
      desc = "Find files",
    },
    {
      "<C-p>",
      "<cmd>FzfLua git_files<CR>",
      desc = "Find git files",
    },
    {
      "<leader>ps",
      "<cmd>FzfLua grep<CR>",
      desc = "Grep",
    },
    {
      "<leader>vh",
      "<cmd>FzfLua helptags<CR>",
      desc = "Help tags",
    },
    {
      "<leader>pws",
      "<cmd>FzfLua grep_cword<CR>",
      desc = "Grep word under cursor",
    },
    {
      "<leader>pWs",
      "<cmd>FzfLua grep_cWORD<CR>",
      desc = "Grep WORD under cursor",
    },
    {
      "<leader>bs",
      "<cmd>FzfLua buffers<CR>",
      desc = "Search buffers",
    },
    {
      "<leader>vf",
      "<cmd>FzfLua global<CR>",
      desc = "Global search",
    },
  },
  config = function()
    require("fzf-lua").setup()
    local config = require("fzf-lua.config")
    local actions = require("trouble.sources.fzf").actions
    config.defaults.actions.files["ctrl-t"] = actions.open
  end
}
