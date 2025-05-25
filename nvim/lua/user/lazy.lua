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
  { "fatih/vim-go" },
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
        throttle = 3000,
        debounce = 1000,
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.0-flash",
            stream = true,
            api_key = function() return "" end,
            max_tokens = 2048,
            request_timeout = 3,
          },
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-lua/plenary.nvim" },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
})
