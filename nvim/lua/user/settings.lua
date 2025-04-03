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
