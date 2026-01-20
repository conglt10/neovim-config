return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>gr", function() Snacks.picker.grep() end, desc = "Grep" },
    },
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = true },
      -- picker = { enabled = true },
       picker = {
      actions = {
        opencode_send = function(picker)
          local selected = picker:selected({ fallback = true })
          if selected and #selected > 0 then
            local files = {}
            for _, item in ipairs(selected) do
              if item.file then
                table.insert(files, item.file)
              end
            end
            picker:close()

            require("opencode.core").open({
              new_session = false,
              focus = "input",
              start_insert = true,
            })

            local context = require("opencode.context")
            for _, file in ipairs(files) do
              context.add_file(file)
            end
          end
        end,
      },
      win = {
        input = {
          keys = {
            -- Use <localleader>o or any preferred key to send files to opencode
            ["<localleader>o"] = { "opencode_send", mode = { "n", "i" } },
          },
        },
      },
    },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vim", "lua", "vimdoc", "html", "css", "javascript", "typescript", "ruby" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "lua-language-server", "typescript-language-server" },
    }
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
        })
    end
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required dependency
      'nvim-tree/nvim-web-devicons', -- Optional, for file icons
    },
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewFileHistory',
    },
  },
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    keys = { 
      { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Find & Replace (grug-far)" },
      { "<leader>sg", function() 
         require("grug-far").open({ engine = "astgrep" })
        end, desc = "Find & Replace with sg (grug-far)"
      },
    },
    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup({
          engine = "ripgrep"
      });
    end
  }
}
