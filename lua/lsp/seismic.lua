local configs = require 'lspconfig.configs'
local lspconfig = require 'lspconfig'
local capabilities = require('blink.cmp').get_lsp_capabilities()

if not configs.seismic_ls then
  configs.seismic_ls = {
    default_config = {
      cmd = { 'node', '/home/jaybe1234/dev/seismic-vscode-solidity/dist/cli/server.js', '--stdio' },
      -- cmd = { '/usr/local/bin/vscode-solidity-server', '--stdio' },
      filetypes = { 'solidity' },
      root_dir = lspconfig.util.root_pattern('hardhat.config.js', 'foundry.toml', '.git'),
    },
  }
end

lspconfig.seismic_ls.setup {
  capabilities = capabilities,
  settings = {
    seismic = {
      enabledAsYouTypeCompilationErrorCheck = true,
      defaultCompiler = 'remote',
      compileUsingRemoteVersion = 'latest',
    },
  },
}
