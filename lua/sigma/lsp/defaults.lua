local M = {
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', require('fzf-lua').lsp_declarations(), bufopts)
        vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions(), bufopts)
        vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references(), bufopts)
        vim.keymap.set('n', 'gi', require('fzf-lua').lsp_implementations(), bufopts)
        vim.keymap.set('n', '<space>D', require('fzf-lua').lsp_typedefs(), bufopts)
        vim.keymap.set('n', '<space>ca', require('fzf-lua').lsp_code_action(), bufopts)
        vim.keymap.set('n', '<space>ld', require('fzf-lua').lsp_diagnostics_document(), bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end,

    -- Set up lspconfig.
    flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

return M
