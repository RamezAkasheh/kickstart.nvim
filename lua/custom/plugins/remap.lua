vim.g.mapleader = ' '
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'n', 'v' }, '<C-i>', '<C-u>zz')
vim.keymap.set({ 'n', 'v' }, 'n', 'nzzzv')
vim.keymap.set({ 'n', 'v' }, 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
-- vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
-- vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
-- vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>')

-- vim.keymap.set('n', '<leader>vpp', '<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>')
-- vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

-- vim.keymap.set('n', '<leader><leader>', function()
--   vim.cmd 'so'
-- end)

-- create download directory
vim.keymap.set('n', '<leader>cdd', ':lua D()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gp', ':Oil<CR>')

-- Redo with U
vim.keymap.set('n', 'U', '<c-r>', { noremap = true, silent = true })

-- Quick Save
vim.keymap.set('n', 's', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'S', ':w<CR>', { noremap = true, silent = true })

-- clears highlight on pressing <Esc> or \ in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '\\', ':noh<CR>', { noremap = true, silent = true })

-- [[ CUSTOM ADDITIONS START ]]
-- Esc with jk and kj
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<esc>', { noremap = true, silent = true })

-- Easy new line with [ and ]
vim.keymap.set('n', '<leader>[', 'O<esc>j', { noremap = true, silent = true })
vim.keymap.set('n', '[<leader>', 'O<esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]', 'o<esc>k', { noremap = true, silent = true })
vim.keymap.set('n', ']<leader>', 'o<esc>', { noremap = true, silent = true })

-- Terminal visual block
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<c-v>', { noremap = true, silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'x', '"xx', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'X', '"xX', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.opt.wrap = false

-- productivity keymaps
-- refresh vimrc
-- vim.keymap.set('n', '<leader>ll', ':luafile %<cr>', { noremap = true, silent = true })

-- pull tasks from html source
-- vim.keymap.set('n', '<leader>task',
vim.keymap.set(
  'n',
  '<Leader>task',
  [[:%s/<tr/\r\0/g<cr>:v/ramez/d<cr>:%s/\v\<td.{-}\>\zs([^<]*)\ze\<\// \0  |/g<cr>:%s/\v\<.{-}\>//g<cr>:%s/\v^.{-}\|/|/<cr>:%s/\v\|\zs.{-}([^0-9])*/ [[<cr>:%s/\v[0-9]{5}\zs.{-}$/]<cr>:%s/$/] | Ramez |       |       |        |               |<cr>:%s/^/| <input type="checkbox" unchecked id="ID"> | ID   | todo   <cr>:%s/ID/\=line('.')-1/g<cr>]],
  { noremap = true, silent = true, desc = 'take tasks from html source' }
)
--[[
:%s/<tr/\r\0/g<cr>
:v/ramez/d<cr>
:%s/\v\<td.{-}\>\zs([^<]*)\ze\<\// \0  |/g<cr>
:%s/\v\<.{-}\>//g<cr>
:%s/\v^.{-}\|/|/<cr>
:%s/\v\|\zs.{-}([^0-9])*/ [[<cr>
:%s/\v[0-9]{5}\zs.{-}$/]<cr>
:%s/$/] | Ramez |       |       |        |               |<cr>
:%s/^/| <input type="checkbox" unchecked id="ID"> | ID   | todo   <cr>
:%s/ID/\=line('.')-1/g<cr>
]]

-- pull ipv4 from ipconfig and add tomcat link
vim.keymap.set(
  'n',
  '<Leader>ip',
  [[:v/ipv4/d<cr>:%s/^\s.*ip.*: //g<cr>:%s/(.*) /:8080\/AMLUI_tomcat_war_exploded/g<cr>ggyy ]],
  { noremap = true, silent = true, desc = 'take tasks from html source' }
)

-- resize splits with ctrl + alt + shift + hjkl
vim.keymap.set('n', '<C-A-J>', ':resize -1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-A-K>', ':resize +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-A-H>', ':vertical resize -1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-A-L>', ':vertical resize +1<CR>', { noremap = true, silent = true })
-- [[ CUSTOM ADDITIONS END ]]

return {}
