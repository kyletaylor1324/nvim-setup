-- if true then return {} end -- WARN: REMOVE
-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity
---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.search.nvim-spectre" },
}
