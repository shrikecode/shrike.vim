--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/plugins.lua
-- Default Lua plugins configurations

local utils = require('sigma.utils')

for key, _ in pairs(vim.g['sigma#plugins']) do
    if (utils.is_enabled(key))
    then
        local status, plug = pcall(require, 'sigma.plugins.' .. utils.get_plug(key))
        if (status)
        then
            plug.setup()
        end
    end
end
