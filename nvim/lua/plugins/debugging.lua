return {
	{
		"mfussenegger/nvim-dap",
		--Check this for having the feature where your exe can get picked up by dap automatically
	},
	{
		"williamboman/mason.nvim",
		opts = {
		  ensure_installed = {
			"clangd",
			"clang-format",
			"codelldb",
		  }
		}
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
		  "williamboman/mason.nvim",
		  "mfussenegger/nvim-dap",
		},
		opts = {
		  handlers = {}
		},
	  },
	  {
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
		  local dap = require("dap")
		  local dapui = require("dapui")
		  dapui.setup()
		  dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		  end
		  dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		  end
		  dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		  end
		    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)	--to add breakpoints using dap
			vim.keymap.set('n', '<Leader>q', function() require("dapui").toggle() end)			--To toggle dapui 
		end
	  }
}

  --vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
  --vim.keymap.set('n', '<Leader>c', function() require('dap').continue() end)