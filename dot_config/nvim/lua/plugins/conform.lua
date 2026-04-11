return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      lua = { "stylua" },
      python = { "ruff_format", "ruff_organize_imports" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      clang_format = {
        -- Use .clang-format file if available, otherwise fallback to Google style
        prepend_args = { "--style=file", "--fallback-style=Google" },
      },
    },
  },
}
