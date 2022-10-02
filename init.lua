vim.wo.nu = true
vim.wo.rnu = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.background = 'dark' -- or "light" for light mode

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guifont = {'MonoLisa Custom', 'h12'}
vim.opt.termguicolors = true
vim.go.mouse = 'a'
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Load plugins
require('plugins')

local onedark = require('onedark')
onedark.setup {style = 'darker'}
onedark.load()
require('nvim-tree').setup({
    renderer = {
        indent_markers = {enable = true},
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

require('bufferline').setup{
	options = {
		mode = 'buffers',
		numbers = "buffer_id",
		buffer_close_icon = '☒',
		right_trunc_marker = '▸',
		separator_style = {'', ''},
		color_icons = false,
		show_buffer_icons = false,
		show_buffer_close_icons = false,
		show_buffer_default_icon = false,
		show_close_icon = false,
		offsets = {
			{
				filetype = "NvimTree",
				text_align = 'left',
				separator = true
			}
		},
	}

}

require('lualine').setup()
require('gitsigns').setup()
require('hop').setup()

-- Tree sitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua', 'rust', 'toml', 'c', 'cpp'},
    auto_install = true,
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    ident = {enable = true},
    rainbow = {enable = true, extended_mode = true, max_file_lines = nil}
}

-- Neorg

require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {config = {engine = 'nvim-cmp'}}
    }
}

-- Autocomplete setup 
require('mason').setup()
require('mason-lspconfig').setup()

local lsp = require 'lspconfig'
local cmp = require 'cmp'
local rt = require 'rust-tools'
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions,
                           {buffer = bufnr})
            -- Code action groups
            vim.keymap.set("n", "<Leader>a",
                           rt.code_action_group.code_action_group,
                           {buffer = bufnr})
        end
    }
})

cmp.setup({
    -- Enable LSP snippets
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    },
    -- Installed sources:
    sources = {
        {name = 'path'}, -- file paths
        {name = 'nvim_lsp', keyword_length = 3}, -- from language server
        {name = 'nvim_lsp_signature_help'}, -- display function signatures with current parameter emphasized
        {name = 'nvim_lua', keyword_length = 2}, -- complete neovim's Lua runtime API such vim.lsp.*
        {name = 'buffer', keyword_length = 2}, -- source current buffer
        {name = 'vsnip', keyword_length = 2}, -- nvim-cmp source for vim-vsnip 
        {name = 'calc'} -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫'
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end
    }
})
