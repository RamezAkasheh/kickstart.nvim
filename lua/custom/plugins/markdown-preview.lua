return {

	-- Markdown plugin
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		ft = { 'markdown' },
		build = function() vim.fn['mkdp#util#install']() end,
		config = function()
			vim.keymap.set({ 'n', 'v' }, '<leader>mp', ':MarkdownPreviewToggle<cr>',
				{ desc = '[M]arkdown [P]review', silent = true, noremap = true })
		end,
	},

}
