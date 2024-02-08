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

          --java
          "jdtls",
          "java-test",
          "java-debug-adapter",

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
        lspconfig.jdtls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {"java"},
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
  {
    'mfussenegger/nvim-jdtls',
    config = function()
        -- Java Language Server Configuration
        local jdtls_ok, jdtls = pcall(require, "jdtls")
        if not jdtls_ok then
            vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
            return
        end

        -- Paths and directories
        local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
        local path_to_lsp_server = jdtls_path .. "/config_win"
        local path_to_plugins = jdtls_path .. "/plugins/"
        local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
        local lombok_path = path_to_plugins .. "lombok.jar"
        local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
        local root_dir = require("jdtls.setup").find_root(root_markers)
        if root_dir == "" then
            return
        end
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
        os.execute("mkdir " .. workspace_dir)

        -- Main Config
        local config = {
            cmd = {
                'C:/Program Files/Java/jdk-21/bin/java.exe',
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-javaagent:' .. lombok_path,
                '-Xms1g',
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                '-jar', path_to_jar,
                '-configuration', path_to_lsp_server,
                '-data', workspace_dir,
            },
            root_dir = root_dir,
            settings = {
                java = {
                    home = 'C:/Program Files/Java/jdk-21',
                    eclipse = {
                        downloadSources = true,
                    },
                    configuration = {
                        updateBuildConfiguration = "interactive",
                        runtimes = {
                            {
                                name = "JavaSE-21",
                                path = "C:/Program Files/Java/jdk-21",
                            },
                        }
                    },
                    maven = {
                        downloadSources = true,
                    },
                    implementationsCodeLens = {
                        enabled = true,
                    },
                    referencesCodeLens = {
                        enabled = true,
                    },
                    references = {
                        includeDecompiledSources = true,
                    },
                    format = {
                        enabled = true,
                        settings = {
                            url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
                            profile = "GoogleStyle",
                        },
                    },
                },
                signatureHelp = { enabled = true },
                completion = {
                    favoriteStaticMembers = {
                        "org.hamcrest.MatcherAssert.assertThat",
                        "org.hamcrest.Matchers.*",
                        "org.hamcrest.CoreMatchers.*",
                        "org.junit.jupiter.api.Assertions.*",
                        "java.util.Objects.requireNonNull",
                        "java.util.Objects.requireNonNullElse",
                        "org.mockito.Mockito.*",
                    },
                    importOrder = {
                        "java",
                        "javax",
                        "com",
                        "org"
                    },
                },
                extendedClientCapabilities = extendedClientCapabilities,
                sources = {
                    organizeImports = {
                        starThreshold = 9999,
                        staticStarThreshold = 9999,
                    },
                },
                codeGeneration = {
                    toString = {
                        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                    },
                    useBlocks = true,
                },
            },
            flags = {
                allow_incremental_sync = true,
            },
            init_options = {
                bundles = {},
            },
        }

        config['on_attach'] = function(client, bufnr)
            require'keymaps'.map_java_keys(bufnr);
            require "lsp_signature".on_attach({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                floating_window_above_cur_line = false,
                padding = '',
                handler_opts = {
                    border = "rounded"
                }
            }, bufnr)
        end

        require('jdtls').start_or_attach(config)
    end
}

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
