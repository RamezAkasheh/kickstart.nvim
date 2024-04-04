return {
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function()
        require('duck').hatch('ඞ', 10)
      end, { desc = '[D]uck [D]uck' })
      vim.keymap.set('n', '<leader>dk', function()
        require('duck').cook()
      end, { desc = '[D]uck [K]ill' })
      vim.keymap.set('n', '<leader>da', function()
        require('duck').cook_all()
      end, { desc = '[D]uck kill [A]ll' })
    end,
  },
}
