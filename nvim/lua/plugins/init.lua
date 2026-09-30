return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  --
  {
    "nvim-neotest/nvim-nio",
    lazy = true,
  },
  {
    "APZelos/blamer.nvim",
    event = "BufReadPost",
    init = function()
      vim.g.blamer_enabled = true
      vim.g.blamer_template = "<committer> - <committer-time> - <commit-short> - <summary>"
    end,
    config = function()
      vim.cmd "autocmd! blamer BufLeave"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    ft = "python",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      require("dap-python").setup "uv"
      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "launch",
        name = "Pytest: current file",
        module = "pytest",
        args = { "${file}", "-s" },
        console = "integratedTerminal",
        subProcess = false,
        env = {
          PYTHONFROZENMODULES = "off",
          QT_LOGGING_RULES = "*.warning=false",
        },
      })
    end,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()

      -- auto open/close ui with the debug session
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { dir = vim.fn.expand(vim.fn.stdpath "state") .. "/sessions/" },
    lazy = false,
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "Select Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load { last = true }
        end,
        desc = "Restore Last Session",
      },
    },
  },
}
