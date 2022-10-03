local status, mason = pcall(require, 'mason')
if (not status) then return end

local status_mason_lsp, masonlsp = pcall(require, 'mason-lspconfig')
if (not status_mason_lsp) then return end

mason.setup()
masonlsp.setup({
  automatic_installation = true
})
