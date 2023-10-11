return {
  {
    "neovim/nvim-lspconfig",
    lazy = false
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    deps = {
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
      -- status icon bottom right, shows loading info for lsp
      { "j-hui/fidget.nvim", branch = "legacy" },
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    }
  }
}
