return {

  -- Markdown plugin
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>mp', ':MarkdownPreviewToggle<cr>', { desc = '[M]arkdown [P]review', silent = true, noremap = true })
    end,
  },
}

-- vim.g.mkdp_preview_options = {
--   disable_filename = 1,
-- }
--
-- return {
--   {
--     'iamcco/markdown-preview.nvim',
--     cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
--     ft = { 'markdown' },
--     build = function()
--       vim.fn['mkdp#util#install']()
--     end,
--     config = function()
--       vim.keymap.set({ 'n', 'v' }, '<leader>mp', ':MarkdownPreviewToggle<cr>', {
--         desc = '[M]arkdown [P]review',
--         silent = true,
--         noremap = true,
--       })
--
--       -- CSS file mkdp will load
--       local css_path = vim.fn.expand '~/.config/nvim/markdown-preview.css'
--       vim.g.mkdp_markdown_css = css_path
--
--       -- Create it if it doesn't exist
--       if vim.fn.filereadable(css_path) == 0 then
--         local css = [[
-- .markdown-body {
--   max-width: 100% !important;
-- }
--
-- .markdown-body table {
--   display: block;
--   width: 100% !important;
--   overflow-x: auto;
--   white-space: nowrap;
-- }
-- ]]
--         vim.fn.writefile(vim.split(css, '\n'), css_path)
--       end
--     end,
--   },
-- }
