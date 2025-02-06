-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--
--https://github.com/AstroNvim/astrocore#%EF%B8%8F-configuration
--

return {
  "AstroNvim/astrocore",

  opts = {

    mappings = {
      n = {
        ["<C-t>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" },
      },
      t = {
        ["<C-t>"] = { "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      },
      i = {
        ["<C-t>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      },
      v = {
        ["<C-t>"] = { "<Esc><Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      },
    },
  },
}
