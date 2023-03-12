local M = {
    setup = function()
        vim.g['airline#extensions#branch#enabled'] = 1
        vim.g['airline#extensions#tabline#enabled'] = 1
        vim.g['airline#extensions#tabline#left_sep'] = ' '
        vim.g['airline#extensions#tabline#left_alt_sep'] = ''
        vim.g.airline_left_sep = ''
        vim.g.airline_left_alt_sep = ''
        vim.g.airline_right_sep = ''
        vim.g.airline_right_alt_sep = ''
        vim.g.airline_detect_modified = 1
        vim.g.airline_detect_paste = 1
        vim.g.airline_detect_crypt = 1
        if vim.call('exists', 'g.airline_symbols')
        then
            vim.g.airline_symbols = {}
        end
        vim.g.airline_symbols.branch = ''
        vim.g.airline_symbols.colnr = ' ℅:'
        vim.g.airline_symbols.readonly = ''
        vim.g.airline_symbols.linenr = ' :'
        vim.g.airline_symbols.maxlinenr = '☰ '
        vim.g.airline_symbols.dirty = '⚡'
        vim.g['airline#extensions#default#layout'] = {
            { 'a', 'b',       'c' },
            { 'x', 'warning', 'error', 'y', 'z' }
        }
    end
}

return M
