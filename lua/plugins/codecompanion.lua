-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.nvim",
  },
  lazy = false,
  config = function()
    require("codecompanion").setup {
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            schema = {
              model = {
                default = "o1-preview-2024-09-12",
              },
            },
            env = {
              api_key = vim.env.OPENAI_API_KEY,
            },
          })
        end,
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama",
            schema = {
              model = {
                default = "deepseek-r1:14b",
              },
            },
            env = {
              url = "http://localhost:11434",
            },
            headers = {
              ["Content-Type"] = "application/json",
            },
            parameters = {
              sync = true,
            },
          })
        end,
        openai_code = function()
          return require("codecompanion.adapters").extend("openai", {
            schema = {
              model = {
                default = "o1-mini-2024-09-12",
              },
            },
            env = {
              api_key = vim.env.OPENAI_API_KEY,
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = "horizontal", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "mini_diff", -- default|mini_diff
        },
      },
    }
  end,
  keys = {
    { "<leader>a", "", desc = "Code Companion" },
    { "<leader>a", "", mode = "v", desc = "Code Companion" },
    { "<leader>ac", function() vim.cmd "CodeCompanionChat" end, desc = "Start Chat" },
    { "<leader>ai", function() vim.cmd "CodeCompanion /buffer" end, desc = "Inline" },
    { "<leader>ai", function() vim.cmd "CodeCompanion" end, mode = "v", desc = "Inline" },
    { "<leader>af", function() vim.cmd "CodeCompanion /fix" end, mode = "v", desc = "Fix Code" },
    { "<leader>ae", function() vim.cmd "CodeCompanion /explain" end, mode = "v", desc = "Explain Code" },
  },
}
