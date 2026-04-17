return {
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        style = "auto", -- Always use modus_operandi regardless of `vim.o.background`
        variant = "tinted", -- Use deuteranopia variant
        styles = {
          functions = { italic = true }, -- Enable italics for functions
        },

        -- on_colors = function(colors)
        --   colors.error = colors.red_faint -- Change error color to the "faint" variant
        -- end,
        on_highlights = function(highlight, color)
          highlight.Boolean = { fg = color.green } -- Change Boolean highlight to use the green color
        end,
      })
      vim.cmd([[colorscheme modus]]) -- modus_operandi, modus_vivendi
    end
  },
  -- {
  --     "folke/tokyonight.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     opts = {},
  --     config = function ()
  --         vim.cmd[[colorscheme tokyonight-day]]
  --     end
  -- },
  -- {
  --   'morhetz/gruvbox',
  --   config = function()
  --     vim.cmd.colorscheme("gruvbox")
  --   end
  -- },
  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.everforest_enable_italic = true
  --     vim.cmd.colorscheme('everforest')
  --   end
  -- },
  -- {
  --   "oskarnurm/koda.nvim",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- require("koda").setup({ transparent = true })
  --     -- vim.cmd("colorscheme koda") -- will dynamically switch between `light` and `dark` variants based on `vim.o.background`
  --     -- vim.cmd("colorscheme koda-dark")
  --     -- vim.cmd("colorscheme koda-light")
  --     -- vim.cmd("colorscheme koda-moss")
  --     vim.cmd("colorscheme koda-glade")
  --   end,
  -- },
  --   {
  --     "rose-pine/neovim",
  --     name = "rose-pine",
  --     config = function()
  --       require("rose-pine").setup({
  --         variant = "moon",      -- auto, main, moon, or dawn
  --         dark_variant = "moon", -- main, moon, or dawn
  --       })
  --       -- vim.cmd("colorscheme rose-pine")
  --     end
  --   },
  --   {
  --     "Mofiqul/vscode.nvim",
  --     config = function()
  --       require("vscode").setup({
  --
  --       })
  --       -- vim.cmd("colorscheme vscode")
  --     end
  --   },
  --   {
  --     "zenbones-theme/zenbones.nvim",
  --     -- Optionally install Lush. Allows for more configuration or extending the colorscheme
  --     -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
  --     -- In Vim, compat mode is turned on as Lush only works in Neovim.
  --     dependencies = "rktjmp/lush.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     -- you can set set configuration options here
  --     config = function()
  --       vim.g.zenbones_darken_comments = 45
  --       --   vim.cmd.colorscheme('zenbones')
  --     end
  --   },
  --   {
  --     "rebelot/kanagawa.nvim",
  --     config = function()
  --       require('kanagawa').setup({
  --         compile = false,  -- enable compiling the colorscheme
  --         undercurl = true, -- enable undercurls
  --         commentStyle = { italic = true },
  --         functionStyle = {},
  --         keywordStyle = { italic = true },
  --         statementStyle = { bold = true },
  --         typeStyle = {},
  --         transparent = false,   -- do not set background color
  --         dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  --         terminalColors = true, -- define vim.g.terminal_color_{0,17}
  --         colors = {             -- add/modify theme and palette colors
  --           palette = {},
  --           theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  --         },
  --         overrides = function(colors) -- add/modify highlights
  --           return {}
  --         end,
  --         theme = "lotus",  -- Load "wave" theme
  --         background = {    -- map the value of 'background' option to a theme
  --           dark = "lotus", -- try "dragon" !
  --           light = "lotus"
  --         },
  --       })
  --       -- vim.cmd("colorscheme kanagawa")
  --     end
  --   }
}
