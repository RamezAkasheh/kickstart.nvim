return {

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
        virt_text = true,
        virt_text_pos = 'right_align',
        virt_text_priority = 100,
      },

      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [H]unk [S]tage' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [H]unk [R]eset' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git [H]unk [S]tage' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git [H]unk [R]eset' })
        -- map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'git [H]unk [U]ndo stage' })
        -- map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'git [H]unk [P]review' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = true }
        end, { desc = 'git [H]unk [B]lame' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git [H]unk [D]iff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git [H]unk [D]iff last commit' })
        map('n', '<leader>ga', ':Git commit --amend --no-edit<cr>', { desc = '[G]it [A]mend' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'git [T]oggle [B]lame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'git [T]oggle [D]eleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = '[I]nside [H]unk' })
      end,
    },
  },
}
