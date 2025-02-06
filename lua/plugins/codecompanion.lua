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
      opts = {
        system_prompt = function(opts) return nil end,
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama",
            schema = {
              model = {
                default = "deepseek-r1",
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
        azure_openai = function()
          local s = require("codecompanion.adapters").extend("openai", {
            url = "http://localhost:2000/?resource=af-openai-nc-prod&deployment=af-openainc-o1mini-prod&api_version=2024-08-01-preview",
            schema = {
              model = {
                default = "af-openainc-o1mini-prod",
              },
            },
          })
          print(vim.inspect(s))
          return s
        end,
      },
      strategies = {
        chat = {
          adapter = "azure_openai",
          opts = {
            system_prompt = false,
          },
        },
        inline = {
          adapter = "azure_openai",
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
