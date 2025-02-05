-- if true then return {} end -- WARN: REMOVE
-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
}
