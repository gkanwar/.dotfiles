local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = 'vim' },
      telemetry = { enable = false }
    }
  }
}
