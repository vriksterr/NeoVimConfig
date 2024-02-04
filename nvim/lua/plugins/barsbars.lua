--Source of the plugin is https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#usage
return{
    'romgrk/barbar.nvim', version = false ,
    config = function()
        require('barbar').setup {
            {'romgrk/barbar.nvim',
              dependencies = {
                'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
                'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
              },
              init = function() vim.g.barbar_auto_setup = false end,
              opts = {
                -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
                insert_at_start = true,
                separator = {left = '▎', right = ''},
                offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
              },
          }
        }
        --This is the place where you use to configure settings https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#known-issues
        require('barbar').setup ({

            -- Enable/disable animations
            animation = true,

            -- Automatically hide the tabline when there are this many buffers left.
            -- Set to any value >=0 to enable.
            auto_hide = false,

            -- Enables/disable clickable tabs
            --  - left-click: go to buffer
            --  - middle-click: delete buffer
            clickable = true,

          sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = nil}
            NvimTree = true,
            -- Or, specify the text used for the offset:
            undotree = {text = 'undotree'},
            -- Or, specify the event which the sidebar executes when leaving:
            ['neo-tree'] = {event = 'BufWipeout'},
            -- Or, specify both
            Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
          },
        })
          local map = vim.api.nvim_set_keymap
          local opts = { noremap = true, silent = true }
          
            -- Move to previous/next
            map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
            map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
            -- Re-order to previous/next
            map('n', '<Tab>h', '<Cmd>BufferMovePrevious<CR>', opts)
            map('n', '<Tab>l', '<Cmd>BufferMoveNext<CR>', opts)
            -- Goto buffer in position...
            map('n', '<Tab>1', '<Cmd>BufferGoto 1<CR>', opts)
            map('n', '<Tab>2', '<Cmd>BufferGoto 2<CR>', opts)
            map('n', '<Tab>3', '<Cmd>BufferGoto 3<CR>', opts)
            map('n', '<Tab>4', '<Cmd>BufferGoto 4<CR>', opts)
            map('n', '<Tab>5', '<Cmd>BufferGoto 5<CR>', opts)
            map('n', '<Tab>6', '<Cmd>BufferGoto 6<CR>', opts)
            map('n', '<Tab>7', '<Cmd>BufferGoto 7<CR>', opts)
            map('n', '<Tab>8', '<Cmd>BufferGoto 8<CR>', opts)
            map('n', '<Tab>9', '<Cmd>BufferGoto 9<CR>', opts)
            map('n', '<Tab>0', '<Cmd>BufferLast<CR>', opts)
            -- Pin/unpin buffer
            map('n', '<Tab>p', '<Cmd>BufferPin<CR>', opts)
            -- Close buffer
            map('n', '<Tab>x', '<Cmd>BufferClose<CR>', opts)
    end
}