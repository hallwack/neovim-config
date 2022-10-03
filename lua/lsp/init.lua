local status, _ = pcall(require, 'lspconfig')
if (not status) then return end

require('lsp.mason-conf')
require('lsp.lsp-conf')
require('lsp.null-conf')
