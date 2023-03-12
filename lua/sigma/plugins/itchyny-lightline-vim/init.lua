local utils = require('sigma.utils')
local M = {
    setup = function()
        if (vim.g['sigma#line'] == 'lightline')
        then
            local lightline = {
                colorscheme = 'kyotonight',
                active = {
                    left = { { 'mode', 'paste' }, { 'gitbranch', 'hunks' },
                        { 'readonly', 'filename', 'modified' } },
                    right = { { 'lineinfo' }, { 'percent' },
                        { 'fileformat', 'fileencoding', 'filetype' } }
                },
                component_function = {
                    gitbranch = 'sigma#head',
                    hunks = 'sigma#hunks'
                }
            }
            if (vim.g['sigma#use_lsp'] == 1)
            then
                vim.g['lightline#lsp#indicator_warnings'] = " "
                vim.g['lightline#lsp#indicator_errors'] = " "
                vim.g['lightline#lsp#indicator_info'] = " "
                vim.g['lightline#lsp#indicator_hints'] = " "
                vim.g['lightline#lsp#indicator_ok'] = ""
                lightline.active.left = { { 'mode', 'paste' }, { 'gitbranch', 'hunks' },
                    { 'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lsp_status' },
                    { 'readonly', 'filename',  'modified' } }
                lightline.component_function = {
                    gitbranch = 'sigma#head',
                    hunks = 'sigma#hunks'
                }

                lightline.component_expand = {
                    lsp_warnings = 'lightline#lsp#warnings',
                    lsp_errors = 'lightline#lsp#errors',
                    lsp_info = 'lightline#lsp#info',
                    lsp_hints = 'lightline#lsp#hints',
                    lsp_ok = 'lightline#lsp#ok',
                    status = 'lightline#lsp#status',
                }

                lightline.component_type = {
                    lsp_warnings = 'warning',
                    lsp_errors = 'error',
                    lsp_info = 'info',
                    lsp_hints = 'hints',
                    lsp_ok = 'left',
                }
            end

            if (utils.is_enabled('mengelbrecht/lightline-bufferline'))
            then
                lightline.tabline = {
                    left = { { 'buffers' } },
                    right = { { 'close' } }
                }
                if (lightline.component_expand == nil)
                then
                    lightline.component_expand = {}
                end
                if (lightline.component_type == nil)
                then
                    lightline.component_type = {}
                end
                lightline.component_expand.buffers = 'lightline#bufferline#buffers'
                lightline.component_type.buffers = 'tabsel'

                vim.g['lightline#bufferline#show_number'] = 0
                vim.g['lightline#bufferline#enable_devicons'] = 1
                vim.g['lightline#bufferline#unicode_symbols'] = 1
                vim.g['lightline#bufferline#clickable'] = 1
                lightline.component_raw = { buffers = 1 }
                vim.g.lightline = lightline

                -- Do not show tabline on startify buffer
                utils.cmd([[autocmd FileType * if &ft != 'startify' && &ft != 'dashboard' | :set showtabline=2 | endif]])
            end

            if utils.is_enabled('sineto/lightline-hunks')
            then
                vim.g['lightline#hunks#exclude_filetypes'] = { 'startify' }
            end
        end
    end
}

return M
