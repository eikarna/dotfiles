-- init.lua
-- Inisialisasi konfigurasi Neovim secara modular

-- Pengaturan dasar dan optimasi performansi
require("user.settings")

-- Setup plugin manager lazy.nvim
require("user.lazy")

-- Konfigurasi tema
require("user.theme")

-- Konfigurasi plugin blink.cmp
require("user.blinkcmp")

-- Konfigurasi plugin minuet-ai
-- require("user.minuet-ai")
