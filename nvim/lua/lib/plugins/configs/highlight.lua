return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter.configs")

      ts.setup({
        highlight = {
          enable = true,
        }
      });
    end
  },
}
