-- lua/user/theme.lua
-- Konfigurasi dan penerapan tema Tokyo Night

require("tokyonight").setup({
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
})
vim.cmd("colorscheme tokyonight-night")
