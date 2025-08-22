-- lua/user/lazy.lua
-- Setup plugin menggunakan lazy.nvim

-- Bootstrap lazy.nvim jika belum terinstal
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- gunakan rilis stabil terbaru
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "hat0uma/csvview.nvim" },
  { "tpope/vim-sensible" },
  { "junegunn/vim-easy-align" },
  { "folke/tokyonight.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
  { "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" }},
  { "MagicDuck/grug-far.nvim" },
  { "echasnovski/mini.icons", version = '*' },
  {
    "Saghen/blink.cmp",  -- Plugin blink.cmp
    version = '*',
    event = "InsertEnter",  -- Lazy-load saat masuk ke mode insert
    fuzzy = { implementation = "rust" },
  },
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        cmp = {
          enable_auto_complete = false,
        },
        blink = {
          enable_auto_complete = true,
        },
        virtualtext = {
          -- auto_trigger_ft = { "python", "lua", "c", "cpp", "markdown", "go" },
          auto_trigger_ft = { "*" },
          keymap = {
            accept = "<A-a>",
            accept_line = "<A-A>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
        throttle = 5000,
        debounce = 3000,
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.5-flash",
            stream = true,
            api_key = function() return os.getenv("GEMINI_API_KEY") or "" end,
            max_tokens = 1000000,
            request_timeout = 3,
          },
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-lua/plenary.nvim" },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
   {
     'MeanderingProgrammer/render-markdown.nvim',
     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
     ---@module 'render-markdown'
     ---@type render.md.UserConfig
     opts = {},
   },
   {
      "neoclide/coc.nvim",
      branch = "release",
      build = "pnpm install", -- atau "yarn install --frozen-lockfile" kalau ada yarn 
      event = "VeryLazy", -- biar nggak makan resource pas startup 
   },
})
