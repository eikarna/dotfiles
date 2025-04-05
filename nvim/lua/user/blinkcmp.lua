-- lua/user/blinkcmp.lua
-- Konfigurasi plugin blink.cmp

require("blink-cmp").setup({
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
    completion = { documentation = { auto_show = false }, trigger = { prefetch_on_insert = false } },
})
