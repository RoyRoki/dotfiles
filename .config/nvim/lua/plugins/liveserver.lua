return {
	"RoyRoki/live-server-bun-nvim", -- Custom live-server integration with Bun.js
	lazy = false, -- Load immediately

	config = function()
		local function get_html_file()
			local current_file = vim.fn.expand("%:p")
			if current_file:match("%.html$") then
				return current_file
			end

			-- Look for index.html in the project root
			local index_html = vim.fn.findfile("index.html", ".;")
			if index_html ~= "" then
				return index_html
			end

			-- Find any HTML file in the project
			local any_html = vim.fn.globpath(vim.fn.getcwd(), "*.html", false, true)
			if #any_html > 0 then
				return any_html[1]
			end

			-- No HTML file found
			vim.notify("⚠️ No HTML file found to serve!", vim.log.levels.WARN, { title = "Live Server" })
			return nil
		end

		-- Start Live Server
		vim.api.nvim_create_user_command("LiveServerStart", function()
			local html_file = get_html_file()
			if not html_file then
				return
			end
			local cmd = { "bunx", "live-server", "--port=5500", html_file }
			vim.fn.jobstart(cmd, { detach = true })
			vim.notify(
				"🔥 Live Server started on http://localhost:5500",
				vim.log.levels.INFO,
				{ title = "Live Server" }
			)
		end, {})

		-- Stop Live Server
		vim.api.nvim_create_user_command("LiveServerStop", function()
			vim.fn.jobstart("pkill -f 'bunx live-server'", { detach = true })
			vim.notify("⛔ Live Server stopped", vim.log.levels.INFO, { title = "Live Server" })
		end, {})

		-- Restart Live Server
		vim.api.nvim_create_user_command("LiveServerRestart", function()
			vim.cmd("LiveServerStop")
			vim.defer_fn(function()
				vim.cmd("LiveServerStart")
			end, 500)
		end, {})

		-- Open in Browser
		vim.api.nvim_create_user_command("LiveServerOpen", function()
			vim.fn.jobstart("xdg-open http://localhost:5500", { detach = true }) -- Linux
		end, {})

		-- Keymaps
		vim.keymap.set(
			"n",
			"<leader>ls",
			":LiveServerStart<CR>",
			{ noremap = true, silent = true, desc = "Start Live Server" }
		)
		vim.keymap.set(
			"n",
			"<leader>lx",
			":LiveServerStop<CR>",
			{ noremap = true, silent = true, desc = "Stop Live Server" }
		)
		vim.keymap.set(
			"n",
			"<leader>lr",
			":LiveServerRestart<CR>",
			{ noremap = true, silent = true, desc = "Restart Live Server" }
		)
		vim.keymap.set(
			"n",
			"<leader>lo",
			":LiveServerOpen<CR>",
			{ noremap = true, silent = true, desc = "Open Live Server in Browser" }
		)
	end,
}
