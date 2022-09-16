vim.wo.nu = true
vim.wo.rnu = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.background = 'dark' -- or "light" for light mode

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guifont = { 'MonoLisa Custom', 'h12' }
vim.opt.termguicolors = true
vim.go.mouse = 'a'
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins
require('plugins')

-- Since gruvbox's an addon colorscheme add after plugins loaded
vim.cmd([[colorscheme gruvbox]])

require('nvim-tree').setup({
	renderer = {
		indent_markers = {
			enable = true
		},
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false
			}
		}
	}
})
require('neogit').setup()
require('lualine').setup()
require('gitsigns').setup()
require('hop').setup()
require('bufferline').setup({
	options = {
		buffer_close_icon = 'X',
		close_icon = 'X',
		color_icons = false,
		show_buffer_icons = false
	}
})



