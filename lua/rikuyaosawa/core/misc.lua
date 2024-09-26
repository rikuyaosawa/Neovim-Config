-- Highlight trailing whitespace
vim.cmd("highlight TrailingWhitespace guifg=#FF0000 guibg=#3C0000") -- Original highlight

-- Highlight for the error text
vim.cmd("highlight TrailingWhitespaceError guifg=#ffce17 guibg=#3A3A00") -- Dark red background

local my_namespace = vim.api.nvim_create_namespace("trailing_whitespace")

-- Function to highlight trailing spaces
local function highlight_trailing_spaces()
	vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
end

-- Function to set virtual text for trailing whitespace
local function set_trailing_whitespace(line)
	vim.api.nvim_buf_set_virtual_text(
		0,
		my_namespace,
		line - 1,
		{ { "■ Whitespace!!! AHH, get out of here!", "TrailingWhitespaceError" } },
		{}
	)
end

-- Function to clear all virtual text in the namespace
local function clear_virtual_text()
	vim.api.nvim_buf_clear_namespace(0, my_namespace, 0, -1)
end

-- Function to check and highlight trailing spaces
local function check_trailing_spaces()
	clear_virtual_text() -- Clear previous virtual text
	local line_count = vim.fn.line("$")
	for i = 1, line_count do
		local line = vim.fn.getline(i)
		if line:match("%s+$") then
			set_trailing_whitespace(i) -- Set virtual text for trailing whitespace
		end
	end
end

-- Autocommand to check for trailing spaces on buffer events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre" }, {
	pattern = "*",
	callback = function()
		check_trailing_spaces()
		highlight_trailing_spaces()
	end,
})
