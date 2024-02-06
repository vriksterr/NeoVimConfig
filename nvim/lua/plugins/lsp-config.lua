return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  --Mason Package Installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          --Lua
          "lua_ls",
          
          --C++
          "clangd",
          "codelldb",
          
          --python
          "pyright",
          "mypy", -- prettier formatter
          "pylint", -- python linter
          "debugpy",
          "black", -- python formatter

          --go
          --"gopls",
          
          "eslint_d", -- js linter

        }
      })
    end
  },
  


    --LSP
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {}
        })
      end
    },
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.clangd.setup({})
        lspconfig.pyright.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {"python"},
        })

        --[[
        local util = require "lspconfig/util"
        lspconfig.gopls.setup ({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = {"gopls"},
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        })
        ]]
        --lspconfig.java_language_server.setup({})
        --lspconfig.tsserver.setup({})
  
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      end,
    },
  


    
  --DAP
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
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {}
			})
		end
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
	},
  
  
  --!!!!!!!!!!!!!LANDUAGES SPECIFIC SETUP!!!!!!!!!!!!!!!!!!!!!
  --Python
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      --local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python" --this parth is for arch linux
      local path = "C:\\Users\\Administrator\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"   --this is for windows
      require("dap-python").setup(path)
    end,
  },
  
  --Java

  --go

--    {
--      "dreamsofcode-io/nvim-dap-go",
--      ft = "go",
--      dependencies = "mfussenegger/nvim-dap",
--      config = function(_, opts)
--        require("dap-go").setup(opts)
--      end
--    },
--    {
--      "olexsmir/gopher.nvim",
--      ft = "go",
--      config = function(_, opts)
--        require("gopher").setup(opts)
--      end,
--      build = function()
--        vim.cmd [[silent! GoInstallDeps]]
--     end,
--    },


}
