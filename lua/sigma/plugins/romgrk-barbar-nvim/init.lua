local M = {
    setup = function()
        require('bufferline').setup({
            icon_separator_active = '',
            icon_separator_inactive = '',
            icon_pinned = ''
        })
    end
}

return M
