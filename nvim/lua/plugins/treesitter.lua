return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      vim.keymap.set("n", "T", ":Inspect<CR>", {})
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        --markid = {enable = true,},  --park of markid.lua
      })
    -- Using packer.nvim
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,   --keep it disabled so you use default syntax instead of treesitter
      },
    }

-- Define a custom highlight group for C++ FieldIdentifier (replace with the actual syntax group)
vim.cmd[[highlight link CppFieldIdentifier FieldIdentifier]]

-- Set the color for C++ FieldIdentifier
vim.cmd[[augroup CustomCppHighlight]]
vim.cmd[[  autocmd!]]
vim.cmd[[  autocmd ColorScheme * hi CppFieldIdentifier guifg=#81A35C ctermfg=red]]
vim.cmd[[augroup END]]

    end
  }
}
