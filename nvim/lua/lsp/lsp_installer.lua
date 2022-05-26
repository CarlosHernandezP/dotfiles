local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

local servers = {'pyright', 'texlab'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
end
