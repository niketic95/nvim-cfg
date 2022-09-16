vim.wo.nu = true
vim.wo.rnu = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.background = 'dark' -- or "light" for light mode

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guifont = { 'MonoLisa Custom', 'h12' }
vim.opt.termguicolors = true

require('plugins')

-- Since gruvbox's an addon colorscheme add after plugins loaded
vim.cmd([[colorscheme gruvbox]])

require('nvim-tree').setup{}

require('lualine').setup()
require('gitsigns').setup()
require('hop').setup()
require('bufferline').setup()
