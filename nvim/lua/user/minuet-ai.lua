-- lua/user/minuet-ai.lua
-- Konfigurasi untuk plugin minuet-ai.nvim

-- Inisialisasi plugin dengan konfigurasi default.
-- Kamu bisa menambahkan opsi konfigurasi tambahan di sini sesuai kebutuhan.
require("minuet").setup({
  -- Contoh opsi konfigurasi:
  keymap = {
        -- Manually invoke minuet completion.
        ['<A-y>'] = require('minuet').make_blink_map(),
    },
    sources = {
         -- Enable minuet for autocomplete
        default = { 'lsp', 'path', 'buffer', 'snippets', 'minuet' },
        -- For manual completion only, remove 'minuet' from default
        providers = {
            minuet = {
                name = 'minuet',
                module = 'minuet.blink',
                score_offset = 8, -- Gives minuet higher priority among suggestions
            },
        },
    },
    -- Recommended to avoid unnecessary request
    completion = { trigger = { prefetch_on_insert = false } },
})

vim.api.nvim_set_keymap("n", "<leader>ai enable", "<cmd>Minuet blink enable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ai disable", "<cmd>Minuet blink disable<CR>", { noremap = true, silent = true })
