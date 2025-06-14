return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-jdtls",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch dart",
				dartSdkPath = "~/dev/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
				flutterSdkPath = "~/dev/flutter/bin/flutter", -- ensure this is correct
				program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				dartSdkPath = "~/dev/flutter/bin/cache/dart-sdk/bin/dart", -- ensure this is correct
				flutterSdkPath = "~/dev/flutter/bin/flutter", -- ensure this is correct
				program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
				cwd = "${workspaceFolder}",
			},
		}

		dap.adapters.dart = {
			type = "executable",
			command = "dart",
			args = { "debug_adapter" },
		}
		dap.adapters.flutter = {
			type = "executable",
			command = "flutter",
			args = { "debug_adapter" },
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
	end,
}
