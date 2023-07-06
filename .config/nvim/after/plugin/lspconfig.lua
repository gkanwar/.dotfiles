local lsp_zero = require('lsp-zero').preset({})
lsp_zero.setup()

local lspconfig = require('lspconfig')
-- rust
lspconfig.rust_analyzer.setup {}
-- lua
local nvim_lua = lsp_zero.nvim_lua_ls()
nvim_lua.settings.Lua.telemetry.enable = false
lspconfig.lua_ls.setup(nvim_lua)
-- c/c++
lspconfig.ccls.setup {}

local cmp = require('cmp')
cmp.setup {
  mapping = {
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<C-Space>'] = cmp.mapping.complete(),
  }
}
