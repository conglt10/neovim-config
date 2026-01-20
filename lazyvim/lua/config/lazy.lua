local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.cmd("command! CpRel call setreg('+', expand('%:p:.'))")

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      -- ✅ THAY ĐỔI 1: Thêm 'opts' để đặt colorscheme mặc định là "vscode"
      opts = {
        colorscheme = "jellybeans",
      },
    },
    {
      "wtfox/jellybeans.nvim",
      name = "jellybeans",
      lazy = false,
      priority = 1000,
      opts = {}, -- Optional
    },
    {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    {
      'MagicDuck/grug-far.nvim',
      -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
      -- additional lazy config to defer loading is not really needed...
      keys = { 
        { "<leader>r", "<cmd>GrugFar<cr>", desc = "Find & Replace (grug-far)" },
        { "<leader>se", function() 
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
    },
    {
      "sudo-tee/opencode.nvim",
      config = function()
        require("opencode").setup({})
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
        {
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            anti_conceal = { enabled = false },
            file_types = { 'markdown', 'opencode_output' },
          },
          ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
        },
        -- Optional, for file mentions and commands completion, pick only one
        'saghen/blink.cmp',
        -- 'hrsh7th/nvim-cmp',

        -- Optional, for file mentions picker, pick only one
        'folke/snacks.nvim',
        -- 'nvim-telescope/telescope.nvim',
        -- 'ibhagwan/fzf-lua',
        -- 'nvim_mini/mini.nvim',
      },
    },
  --   {
  --     "olimorris/codecompanion.nvim",
  --     dependencies = {
  --       "nvim-lua/plenary.nvim"
  --     },
  --     opts = {
  --       interactions = {
  --         chat = {
  --           adapter = "copilot",
  --           model = "gpt-4.1"
  --         },
  --       },
  --       opts = {
  --         log_level = "DEBUG",
  --       },
  --     },
  --   },
  --   opts = function(_, opts)
  --     opts.snippet = {
  --       expand = function(item)
  --         return LazyVim.cmp.expand(item.body)
  --       end,
  --     }
  --     if LazyVim.has("nvim-snippets") then
  --       table.insert(opts.sources, { name = "snippets" })
  --     end
  --   end,
  -- },
    {
      "mg979/vim-visual-multi",
    },
    -- Vô hiệu hóa plugin tokyonight mặc định
    { "folke/tokyonight.nvim", enabled = false },

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- ✅ THAY ĐỔI 3: Cập nhật colorscheme cho bước cài đặt ban đầu
  install = { colorscheme = { "jellybeans" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}})
