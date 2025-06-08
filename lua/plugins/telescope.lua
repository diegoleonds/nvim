return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "[S]earch [F]iles" })

			vim.keymap.set("n", "<leader>sb", function()
				builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
			end, { desc = "[S]earch [B]uffers" })

			vim.keymap.set("n", "<leader>sm", function()
				builtin.lsp_document_symbols({ symbols = "function" })
			end, { desc = "[S]earch [M]ethods" })

			vim.keymap.set("n", "<leader>su", function()
				builtin.lsp_references({ include_declaration = false })
			end, { desc = "[S]earch [U]sages" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			vim.keymap.set("n", "<leader>sc", function()
				builtin.find_files({ cwd = "~/.config" })
			end, { desc = "[S]earch [C]onfig files" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
