return{
    {
        -- amongst your other plugins
        'akinsho/toggleterm.nvim', version = "*", config = true,
        config = function()
            require("toggleterm").setup{
                --  direction = 'vertical' | 'horizontal' | 'tab' | 'float',
                direction = 'horizontal',
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            }
            vim.keymap.set("n", '<C-t>', ":ToggleTerm<CR>") --CR means Enter on keyboard
            vim.keymap.set("t", '<C-t>', "exit<CR>")        --"t" means for terminal mode i means for insert and n means for normal
        end
        -- or
        --{'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
    }
}