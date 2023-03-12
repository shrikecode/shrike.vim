local M = {
    setup = function()
        require('neoclip').setup({
            default_register = "+",
            enable_persistent_history = true,
            continuous_sync = true
        })
    end
}

return M
