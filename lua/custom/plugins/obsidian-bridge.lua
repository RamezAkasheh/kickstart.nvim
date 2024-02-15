return {
	"oflisback/obsidian-bridge.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = {
		"BufReadPre ~/Documents/Obsidian/main/**.md",
		"BufNewFile ~/Documents/Obsidian/main/**.md",
	},
	config = function()
		require("obsidian-bridge").setup({
			obsidian_server_address = "https://localhost:27124"
		})
	end,
	lazy = true
}
