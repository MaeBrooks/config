return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    lazy = false,
    init = function()
      require('neogit').setup {}
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    init = function()
      vim.keymap.set(
        "n",
        "<leader>v",
        function()
          require("gitsigns").blame_line()
          --  :Gitsigns blame_line
        end
      )
    end
  }
}
