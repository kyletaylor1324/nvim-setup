return {
  "echasnovski/mini.files",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>e"] = {
              function()
                if not require("mini.files").close() then require("mini.files").open() end
              end,
              desc = "Explorer",
            },
          },
        },
      },
    },
  },
  specs = {
    { "neo-tree.nvim", optional = true, enabled = false },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },
  opts = {
    mappings = {
      -- synchronize = "s",
    },
    windows = {
      -- Maximum number of windows to show side by side
      max_number = math.huge,
      -- Whether to show preview of file/directory under cursor
      preview = true,
      -- Width of focused window
      width_focus = 25,
      -- Width of non-focused window
      width_nofocus = 15,
      -- Width of preview window
      width_preview = 50,
    },
  },
}
