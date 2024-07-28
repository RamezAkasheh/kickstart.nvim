-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- don't require any configuration

  -- Extra added plugins
  'tpope/vim-surround',
  'easymotion/vim-easymotion',
  'iamcco/markdown-preview.nvim',
  'Wansmer/symbol-usage.nvim',

  -- git plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Telescope plugins
  'olacin/telescope-gitmoji.nvim',
  'debugloop/telescope-undo.nvim',

  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}
