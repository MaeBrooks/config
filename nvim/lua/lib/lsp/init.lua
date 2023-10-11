require("mason").setup()

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  local function opts (cb) return { noremap=false, silent=true, callback = cb} end

  vim.api.nvim_set_keymap("n", "<leader>i", "", opts(vim.lsp.buf.hover))
  vim.api.nvim_set_keymap("n", "<C-p>", "", opts(vim.diagnostic.goto_prev))
  vim.api.nvim_set_keymap("n", "<C-n>", "", opts(vim.diagnostic.goto_next))
  vim.api.nvim_set_keymap("n", "<leader>n", "", opts(vim.diagnostic.open_float))
  vim.api.nvim_set_keymap("n", "<leader>b", "", opts(vim.lsp.buf.code_action))
  vim.api.nvim_set_keymap("n", "<leader>s", "", opts(vim.lsp.buf.format))
end)

lsp.setup()

local cmp = require('cmp')

require "lib.au.vim"

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

cmp.setup({
  completion = {
    autocomplete = false
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    -- {name = 'luasnip', keyword_length = 2},
  }
})

