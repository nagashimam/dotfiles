return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.api.nvim_exec2(
			[[
        function DummyBrowserFunc(url)
          echo a:url
        endfunction
    ]],
			{}
		)
		vim.g.mkdp_browserfunc = "DummyBrowserFunc"
		vim.g.mkdp_open_to_the_world = 1
		vim.g.mkdp_open_ip = "127.0.0.1"
		vim.g.mkdp_port = 8080
	end,
	ft = { "markdown" },
}
