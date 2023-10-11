return {
  { "Mofiqul/dracula.nvim", priority = 1000, init = function()
    vim.cmd "colorscheme dracula"
  end},
  {
    "norcalli/nvim-colorizer.lua",
    name = "colorizer",
    config = true,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    lazy = true,
    name = "tailwindcss-colors",
    config = true,
  }
}
