return {
	-- Symbol usage plugin
	{
		'Wansmer/symbol-usage.nvim',
		event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			local SymbolKind = vim.lsp.protocol.SymbolKind

			--------------------------------bubbles---------------------------------
			local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

			-- hl-groups can have any name
			vim.api.nvim_set_hl(0, 'SymbolUsageRounding', { fg = h('CursorLine').bg, italic = true })
			vim.api.nvim_set_hl(0, 'SymbolUsageContent',
				{ bg = h('CursorLine').bg, fg = h('Comment').fg, italic = true })
			vim.api.nvim_set_hl(0, 'SymbolUsageRef',
				{ fg = h('Function').fg, bg = h('CursorLine').bg, italic = true })
			vim.api.nvim_set_hl(0, 'SymbolUsageDef',
				{ fg = h('Type').fg, bg = h('CursorLine').bg, italic = true })
			vim.api.nvim_set_hl(0, 'SymbolUsageImpl',
				{ fg = h('@keyword').fg, bg = h('CursorLine').bg, italic = true })

			local function text_format(symbol)
				local res = {}

				local round_start = { '', 'SymbolUsageRounding' }
				local round_end = { '', 'SymbolUsageRounding' }

				if symbol.references then
					local usage = symbol.references <= 1 and 'usage' or 'usages'
					local num = symbol.references == 0 and 'no' or symbol.references
					table.insert(res, round_start)
					table.insert(res, { '󰌹 ', 'SymbolUsageRef' })
					table.insert(res, { ('%s %s'):format(num, usage), 'SymbolUsageContent' })
					table.insert(res, round_end)
				end

				if symbol.definition then
					if #res > 0 then
						table.insert(res, { ' ', 'NonText' })
					end
					table.insert(res, round_start)
					table.insert(res, { '󰳽 ', 'SymbolUsageDef' })
					table.insert(res, { symbol.definition .. ' defs', 'SymbolUsageContent' })
					table.insert(res, round_end)
				end

				if symbol.implementation then
					if #res > 0 then
						table.insert(res, { ' ', 'NonText' })
					end
					table.insert(res, round_start)
					table.insert(res, { '󰡱 ', 'SymbolUsageImpl' })
					table.insert(res, { symbol.implementation .. ' impls', 'SymbolUsageContent' })
					table.insert(res, round_end)
				end

				return res
			end

			-------------------------------------labels-------------------------------------j
			--[[ local function h(name) return vim.api.nvim_get_hl(0, { name = name }) end

      vim.api.nvim_set_hl(0, 'SymbolUsageRef', { bg = h('Type').fg, fg = h('Normal').bg, bold = true })
      vim.api.nvim_set_hl(0, 'SymbolUsageRefRound', { fg = h('Type').fg })

      vim.api.nvim_set_hl(0, 'SymbolUsageDef', { bg = h('Function').fg, fg = h('Normal').bg, bold = true })
      vim.api.nvim_set_hl(0, 'SymbolUsageDefRound', { fg = h('Function').fg })

      vim.api.nvim_set_hl(0, 'SymbolUsageImpl', { bg = h('@parameter').fg, fg = h('Normal').bg, bold = true })
      vim.api.nvim_set_hl(0, 'SymbolUsageImplRound', { fg = h('@parameter').fg })

      local function text_format(symbol)
        local res = {}

        if symbol.references then
          table.insert(res, { '󰍞', 'SymbolUsageRefRound' })
          table.insert(res, { '󰌹 ' .. tostring(symbol.references), 'SymbolUsageRef' })
          table.insert(res, { '󰍟', 'SymbolUsageRefRound' })
        end

        if symbol.definition then
          if #res > 0 then
            table.insert(res, { ' ', 'NonText' })
          end
          table.insert(res, { '󰍞', 'SymbolUsageDefRound' })
          table.insert(res, { '󰳽 ' .. tostring(symbol.definition), 'SymbolUsageDef' })
          table.insert(res, { '󰍟', 'SymbolUsageDefRound' })
        end

        if symbol.implementation then
          if #res > 0 then
            table.insert(res, { ' ', 'NonText' })
          end
          table.insert(res, { '󰍞', 'SymbolUsageImplRound' })
          table.insert(res, { '󰡱 ' .. tostring(symbol.implementation), 'SymbolUsageImpl' })
          table.insert(res, { '󰍟', 'SymbolUsageImplRound' })
        end

        return res
      end ]]

			-- require('symbol-usage').setup()
			UserOpts = {
				-- @type table<string, any> `nvim_set_hl`-like options for highlight virtual text
				hl = { link = 'Comment' },
				-- @type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
				kinds = { SymbolKind.Function, SymbolKind.Method },
				-- Additional filter for kinds. Recommended use in the filetypes override table.
				-- fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
				-- `symbol` and `parent` is an item from `textDocument/documentSymbol` request
				-- See: #filter-kinds
				-- @type table<lsp.SymbolKind, filterKind[]>
				kinds_filter = {},
				-- @type 'above'|'end_of_line'|'textwidth' above by default
				vt_position = 'above',
				-- Text to display when request is pending. If `false`, extmark will not be
				-- created until the request is finished. Recommended to use with `above`
				-- vt_position to avoid "jumping lines".
				-- @type string|table|false
				request_pending_text = 'loading...',
				-- The function can return a string to which the highlighting group from `opts.hl` is applied.
				-- Alternatively, it can return a table of tuples of the form `{ { text, hl_group }, ... }`` - in this case the specified groups will be applied.
				-- See `#format-text-examples`
				-- @type function(symbol: Symbol): string|table Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil }
				text_format = text_format,
				references = { enabled = true, include_declaration = false },
				definition = { enabled = false },
				implementation = { enabled = false },
				-- @type { lsp?: string[], filetypes?: string[] } Disables `symbol-usage.nvim' on certain LSPs or file types.
				disable = { lsp = {}, filetypes = {} },
				-- @type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
				-- filetypes = {},
				-- @type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
				symbol_request_pos = 'end', -- Recommended redifine only in `filetypes` override table
			}

			require('symbol-usage').setup(UserOpts)
		end
	}
}
