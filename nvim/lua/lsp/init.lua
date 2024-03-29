local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require('lsp.lsp_installer')
require('lsp.handlers').setup()
require('lsp.python')
require('lsp.latex')
