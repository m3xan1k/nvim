local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
    configure_diagnostics = false,
})

local lsp_signature = require('lsp_signature')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps(
        {
            buffer = bufnr,
            preserve_mappings = false
        }
    )
    lsp_signature.on_attach(
        {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded"
            },
            hint_prefix = "λ "
        },
        bufnr)
end)

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = { source = "always", border = "rounded" },
})

local lspconfig = require('lspconfig')


-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.clangd.setup({})

-- pyright
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
            }
        }
    }
})

lsp.setup()
