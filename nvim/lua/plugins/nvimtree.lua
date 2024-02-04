return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 40,
          },
      }
      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true
      vim.keymap.set("n", '<leader>t', ":NvimTreeToggle<CR>")   --This will Toggle Tree on or off
    end,
}