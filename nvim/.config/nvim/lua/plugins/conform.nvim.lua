return {
  "stevearc/conform.nvim",
  -- event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
      csproj = { "csharpier" },
    },
  },
}
