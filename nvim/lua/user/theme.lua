-- lua/user/theme.lua
-- Konfigurasi dan penerapan tema Tokyo Night

require("tokyonight").setup({
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
})
vim.cmd("colorscheme tokyonight-night")

-- Copilot Chat colorscheme
vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })
