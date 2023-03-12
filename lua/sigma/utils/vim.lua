--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/utils/vim.lua
-- Lua util functions for Vim

local keyset = function(mode, keymap, command, opts)
    if (opts.silent ~= nil and opts.silent == true)
    then
        keymap = '<silent>' .. keymap
    end

    local map_cmd = 'map'

    if (opts.noremap == true)
    then
        map_cmd = 'noremap'
    end

    vim.command(mode .. map_cmd .. ' ' .. keymap .. ' ' .. command)
end

local M = {
    set = function(opt, value)
        vim.command('set ' .. opt .. '=' .. value)
    end,
    keyset = keyset,
    noremap = function(mode, keymap, command, opts)
        opts.noremap = true
        keyset(mode, keymap, command, opts)
    end,
    map = function(mode, keymap, command, opts)
        opts.noremap = false
        keyset(mode, keymap, command, opts)
    end,
    cmd = vim.command
}

return M
