-- Color scheme is help is taken from https://github.com/catppuccin/nvim/discussions/323#discussioncomment-3952454
-- and  https://github.com/catppuccin/nvim/discussions/323#discussioncomment-3952454
-- and https://github.com/catppuccin/nvim/discussions/323#discussioncomment-5287724
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {   --Check this guy comment for the color palet https://github.com/catppuccin/nvim/discussions/323#discussioncomment-4809323
        mocha = { -- mocha is just flavor name https://github.com/catppuccin/nvim/?tab=readme-ov-file#flavours
           
          base = "#252221",     -- Background chocolate color
          mantle = "#1c1a1a",   -- this is the bottom and TOP bar (Configure lualine.lua its own file itself)
          surface1 = "#574325", -- Left Side Numbering color
          
          --nvimtree colors
          lavender = "#6b6b6b",   -- Color of the directory path for NvimTree

          --welcome screen colors
          overlay0 = "#6b6b6b", -- Color of the directory path text at welcome screen
          pink = "#bf6632",     -- Color of MRU directory at welcome screen
          peach = "#ebc46a",    -- Color of numbers at welcome screen
          yellow = "#f9e2af",   -- Color of NeoVim Logo at welcome Screen and Warning error Color
          
          --other ui
          red = "#ff666b",      -- Color of error when clangd flags something


          blue = "#ac9e86",       -- For NvimTree Icon, Color & its text
          text = "#ac9e86",       --corlor of the text
          --sky = "#a36933",      -- Operator Color = + << < > etc 
          --blue = "#3c99a3",     -- functions
          --peach = "#d6930d",    -- constants and numbers 
          --mauve ="#a277c7",     -- Reserved Language Keywords: like #include, const, sizeof(), Class, Public, return
          --overlay2 = "#755636", -- changed the color of () {} :: ;
          --overlay0 = "#4d4a49", -- Comments
          --lavender = "#ac9e86", -- Namespaces (for some reason color of this is interfearing with private member variables)
          --yellow = "#c7c377",   -- Class & Data types (int, char, void)
          --pink = "#ff9900",     -- Class Object
          --color1 = "#0d00ff",
          },
      },
        custom_highlights = function(colors)
          return {
              --Comment = { fg = colors.flamingo },   --Now using TSComment
              TabLineSel = { fg = "#000000", bg = "#ffa14f" },
              CmpBorder = { fg = colors.surface2 },
              Pmenu = { bg = colors.none },
              TSComment = { fg = "#757575" },
              TSKeyword = { fg = "#a277c7" },
              TSNamespaceName = { fg = "#f6b26b" },
              TSTerminator = { fg = "#8a7b70" },
              TSClassName = { fg = "#c7c377" },
              TSString = { fg = "#a6e3a1" },
              TSNumber = { fg = "#d6930d" },
              TSVariable = { fg = "#ac9e86" },
              TSFunction = { fg = "#3c99a3" },
              TSOperator = { fg = "#a36933" },

              --Language to Link mapping--
              ["@comment"] = { link = "TSComment" },

              --CPP Language Mapping--
              ["@include"] = { link = "TSKeyword" },
              ["@keyword.cpp"] = { link = "TSKeyword" },
              ["@type.builtin.cpp"] = { link = "TSKeyword" },

              ["@lsp.type.namespace.cpp"] = { link = "TSNamespaceName" },
              ["@lsp.type.type.cpp"] = { link = "TSNamespaceName" },
              ["@type.definition.cpp"] = { link = "TSNamespaceName" },

              ["@punctuation.delimiter"] = { link = "TSTerminator" },   -- ; : ,
              ["@punctuation.bracket"] = { link = "TSTerminator" },     -- {}

              ["@lsp.typemod.class.defaultLibrary.cpp"] = { link = "TSClassName" },

              ["@string.cpp"] = { link = "TSString" },
              ["@character.cpp"] = { link = "TSString" },


              ["@number"] = { link = "TSNumber" },


              ["@variable"] = { link = "TSVariable" },    --also used by class objects as ther are also variable.              
              ["@lsp.typemod.variable.defaultLibrary.cpp"] = { link = "TSVariable" },  --std::cout 
              ["@lsp.typemod.variable.definition.cpp"] = { link = "TSVariable" }, --the Normal Class objects

              ["@function"] = { link = "TSFunction" },
              ["@lsp.typemod.function.defaultLibrary.cpp"] = { link = "TSFunction" },
              ["@lsp.typemod.method.defaultLibrary.cpp"] = { link = "TSFunction" },


              ["@operator"] = { link = "TSOperator" },
          }
        end
      })
    vim.cmd.colorscheme "catppuccin"
    end
  }
}
