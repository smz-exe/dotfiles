return {
  -- Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "gopls",
          "clangd",
        },
        automatic_installation = true,
        -- handlers
        handlers = (function()
          -- Capabilities for nvim-cmp_autopairs
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          return {
            -- default handler
            function(server_name)
              require("lspconfig")[server_name].setup({
                capabilities = capabilities,
              })
            end,

            -- Lua-specific settings
            ["lua_ls"] = function()
              require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                  Lua = {
                    diagnostics = { globals = { "vim" } },
                  },
                },
              })
            end,

            ["clangd"] = function()
              require("lspconfig").clangd.setup({
                capabilities = capabilities,
                cmd = {
                  "clangd",
                  "--offset-encoding=utf-16",
                  "--clang-tidy",
                  "--header-insertion=iwyu",
                  "--completion-style=detailed",
                  "--function-arg-placeholders",
                  "--fallback-style=llvm",
                },
                init_options = {
                  usePlaceholders = true,
                  completeUnimported = true,
                  clangdFileStatus = true,
                },
              })
            end,

            ["ts_ls"] = function()
              require("lspconfig").ts_ls.setup({
                capabilities = capabilities,
                settings = {
                  typescript = {
                    inlayHints = {
                      includeInlayParameterNameHints = "all",
                    },
                  },
                },
              })
            end,

            -- pyright: configured via after/lsp/pyright.lua (Neovim 0.11+)
          }
        end)(),
      })
    end,
  },

  -- Neodev
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- LSPConfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()

      -- LSP key mappings
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
          vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
          vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })

      -- Diagnostic configurations
      vim.diagnostic.config({
        virtual_text = {
          source = "if_many",
          prefix = "●",
        },
        float = {
          source = "if_many",
          border = "rounded",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
