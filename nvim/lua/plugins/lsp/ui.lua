-- LSP UI Configuration
-- Diagnostics display and custom LspInfo command

-- Configure diagnostic display
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Custom LspInfo command with better formatting
local function show_lsp_info()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	local buf_ft = vim.bo.filetype

	if #clients == 0 then
		print("No LSP clients attached to current buffer")
		return
	end

	local lines = {
		"LSP clients attached to buffer " .. vim.api.nvim_get_current_buf(),
		"Filetype: " .. buf_ft,
		"",
	}

	for _, client in ipairs(clients) do
		table.insert(lines, "Client: " .. client.name .. " (id: " .. client.id .. ")")
		table.insert(lines, "  Root dir: " .. (client.root_dir or "N/A"))
		table.insert(lines, "  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

		-- Count attached buffers
		local attached_bufs = vim.lsp.get_buffers_by_client_id(client.id)
		table.insert(lines, "  Attached buffers: " .. #attached_bufs)
		table.insert(lines, "")
	end

	-- Display in a floating window
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].modifiable = false
	vim.bo[buf].filetype = "lspinfo"

	local width = 80
	local height = #lines
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = " LSP Info ",
		title_pos = "center",
	})

	-- Close on q or Esc
	vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, nowait = true })
	vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, nowait = true })
end

vim.api.nvim_create_user_command("LspInfo", show_lsp_info, {})
