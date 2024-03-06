local lsp_zero = require('lsp-zero').preset({})
lsp_zero.setup()

local lspconfig = require('lspconfig')
-- rust
lspconfig.rust_analyzer.setup {}
-- lua
local nvim_lua = lsp_zero.nvim_lua_ls()
nvim_lua.settings.Lua.telemetry.enable = false
nvim_lua.settings.Lua.workspace = {
  checkThirdParty = false,
  -- Tells lua_ls where to find all the Lua files that you have loaded
  -- for your neovim configuration.
  library = {
    '${3rd}/luv/library',
    unpack(vim.api.nvim_get_runtime_file('', true)),
  },
}
lspconfig.lua_ls.setup(nvim_lua)
-- c/c++
lspconfig.ccls.setup {}
-- ocaml
lspconfig.ocamllsp.setup {}
-- latex
lspconfig.texlab.setup {}
-- python
lspconfig.pyright.setup {}

local cmp = require('cmp')
cmp.setup {
  mapping = {
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<C-Space>'] = cmp.mapping.complete(),
  }
}
