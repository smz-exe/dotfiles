return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "dark",
        floats = "transparent",
      },
      day_brightness = 0.3,

      on_colors = function(colors)
        colors.error = "#ff0000"
      end,

      on_highlights = function(highlights)
        -- Background transparency
        highlights.Normal = { bg = "NONE" }
        highlights.NormalFloat = { bg = "NONE" }

        -- Line numbers
        highlights.LineNr = { fg = "#666666" }

        -- Visual selection
        highlights.Visual = { bg = "#404040" }
      end,
    })
    vim.cmd.colorscheme "tokyonight"
  end,
}
