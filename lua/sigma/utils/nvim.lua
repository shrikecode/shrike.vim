--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/utils/nvim.lua
-- Lua util functions for Neovim

local keyset = function (mode, keymap, command, opts)
    vim.keymap.set(mode, keymap, command, opts)
end

local M = {
    set = function (opt, value)
        vim.opt[opt] = value
    end,
    keyset = keyset,
    noremap = function (mode, keymap, command, opts)
        opts.noremap = true
        keyset(mode, keymap, command, opts)
    end,
    map = function (mode, keymap, command, opts)
        opts.noremap = false
        keyset(mode, keymap, command, opts)
    end,
    cmd = vim.cmd
}

return M
