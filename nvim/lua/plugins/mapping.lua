return{
        --navigation when in insertion mode
        vim.api.nvim_set_keymap('i', '<C-h>', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-j>', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-k>', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-l>', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true }),
        
        --copy and paste from and to neovim from system clipboard
        --https://www.reddit.com/r/neovim/comments/13zrqcs/how_do_you_copypaste_stuff_fromto_vim/
        --vim.keymap.set({'n', 'v'}, '<C-y>', '"+y'), -- yank motion this only sets an alternative not overrides the original one use bottom one to override
        vim.api.nvim_set_keymap('i', 'y', '<Nop>', { noremap = true, silent = true }),      --This disables the default copy command
        vim.api.nvim_set_keymap('n', 'y', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', 'y', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', 'd', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-c>', '"+y', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', '<C-x>', '"+d', { noremap = true, silent = true }),      --cut

        vim.api.nvim_set_keymap('i', 'p', '<Nop>', { noremap = true, silent = true }),      --This disables the default paste command
        vim.api.nvim_set_keymap('n', 'p', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', 'p', '<Nop>', { noremap = true, silent = true }),  
        vim.api.nvim_set_keymap('i', '<C-v>', '"+p', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true }),

        --undo
        vim.api.nvim_set_keymap('i', '<C-w>', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', 'u', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('i', '<C-z>', 'u', { noremap = true, silent = true }),  --this overrides the original keybind
        vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true }),
        

        --delete line
        vim.api.nvim_set_keymap('n', 'd', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', 'dd', '<Nop>', { noremap = true, silent = true }), --this delets line in normal mode 
        vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>:d<CR>i', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<C-d>', ':d<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('v', '<C-d>', ':d<CR>', { noremap = true, silent = true }),


        --save file using ctrl s
        vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>i', { noremap = true, silent = true }), --saving in inspect mode
        vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true }),  --saving in normal and visual mode
        vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>v', { noremap = true, silent = true }),


        --closing vsp and sp split window
        vim.api.nvim_set_keymap('n', '<C-w>q', '<Nop>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<C-q>', '<C-w>q', { noremap = true, silent = true }),



        --some other keybinds to be disabled
        vim.api.nvim_set_keymap('n', '.', '<Nop>', { noremap = true, silent = true }),
        
}