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
    sessions = {
      -- Configure auto saving
      autosave = {
        last = true, -- auto save last session
        cwd = true, -- auto save session for each working directory
      },
    },
    autocmds = {
      -- disable alpha autostart
      alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession" })
            end
          end,
        },
      },
    },
  },
  require("toggleterm").setup {
    shell = "powershell.exe",
  },
}
