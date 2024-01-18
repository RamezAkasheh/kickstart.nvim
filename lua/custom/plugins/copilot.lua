return {
	-- Copilot Plugin Setup
	{
		'github/copilot.vim',
		init = function()
			vim.g.copilot_no_tab_map = true
			-- vim.g.copilot_proxy_strict_ssl = false
		end,
		config = function()
			vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cp', ':Copilot panel<cr>',
				{ desc = '[C]opilot [P]anel', silent = true, noremap = true })
			vim.keymap.set("i", "<M-j>", "copilot#Accept('<CR>')",
				{ noremap = true, silent = true, expr = true, replace_keycodes = false })
		end,
	},

}
