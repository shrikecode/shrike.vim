--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/utils/init.lua
-- Lua util functions for Vim / Neovim

local function has_nvim()
    return vim.call('has', 'nvim')
end

local function is_enabled(plugin)
    return vim.g['sigma#plugins'][plugin] ~= nil and vim.g['sigma#plugins'][plugin] ~= 0
end

local function get_plug(name)
    return name:gsub('/', '-'):gsub('%.', '-')
end

local M = {}

if (has_nvim() == 1)
then
    M = require('sigma.utils.nvim')
else
    M = require('sigma.utils.vim')
end

M.has_nvim = has_nvim
M.is_enabled = is_enabled
M.get_plug = get_plug

return M
