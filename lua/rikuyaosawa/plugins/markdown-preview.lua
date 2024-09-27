-- install with yarn or npm
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Show markdown preview" })
		keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop markdown preview" })
	end,
}
