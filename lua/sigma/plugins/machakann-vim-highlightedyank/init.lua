local utils = require('sigma.utils')
local M = {
    setup = function()
        vim.g.highlightedyank_highlight_duration = 1000
        utils.cmd([[hi! link HighlightedyankRegion Search]])
    end
}

return M
