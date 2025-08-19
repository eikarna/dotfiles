-- lua/user/settings.lua
-- Pengaturan dasar dan optimasi performansi

-- Nonaktifkan provider yang tidak digunakan
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_node_provider = 0  -- Uncomment jika ingin nonaktifkan Node provider

-- Pengaturan tampilan dan indentasi
vim.opt.number = true                    -- Tampilkan nomor baris
vim.opt.relativenumber = true            -- Nomor relatif untuk navigasi
vim.opt.tabstop = 4                      -- Lebar tab = 4 spasi
vim.opt.shiftwidth = 4                   -- Indentasi = 4 spasi
vim.opt.expandtab = true                 -- Konversi tab ke spasi
vim.opt.autoindent = true                -- Auto indent baris baru
vim.opt.clipboard = "unnamedplus"        -- Sinkronisasi dengan clipboard sistem

-- Aktifkan syntax highlighting dan filetype detection
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Tab untuk buffer selanjutnya
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
-- Shift-Tab untuk buffer sebelumnya
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- CTRL + S untuk save file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Quick chat keybinding
vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer
    })
  end
end, { desc = "CopilotChat - Quick chat" })

vim.keymap.set({ 'n', 'v' }, '<leader>ccs', function()
  local input = vim.fn.input("Perplexity: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      agent = "perplexityai",
      selection = false,
    })
  end
end, { desc = "CopilotChat - Perplexity Search" })
