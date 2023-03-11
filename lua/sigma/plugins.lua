--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/plugins.lua
-- Default Lua plugins configurations

local function is_enabled(plugin)
    return vim.g['sigma#plugins'][plugin] ~= nil and vim.g['sigma#plugins'][plugin] ~= 0
end

if (is_enabled('romgrk/barbar.nvim'))
then
    -- barbar.nvim
    require('bufferline').setup({ icon_separator_active = '', icon_separator_inactive = '', icon_pinned = '' })
end

if (is_enabled('lewis6991/gitsigns.nvim'))
then
    -- gitsigns.nvim
    require('gitsigns').setup()
end

if (is_enabled('AckslD/nvim-neoclip.lua'))
then
    -- nvim-neoclip.lua
    require('neoclip').setup({ default_register = "+", enable_persistent_history = true, continuous_sync = true })
end

if (is_enabled('windwp/nvim-spectre'))
then
    -- nvim-spectre
    require('spectre').setup({
        find_engine = {
            ['rg'] = {
                cmd = "rg",
                args = {
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '-g "!.git"',
                } ,
                options = {
                    ['ignore-case'] = {
                        value= "--ignore-case",
                        icon="[]",
                        desc="ignore case"
                    },
                    ['hidden'] = {
                        value="--hidden",
                        desc="hidden file",
                        icon="[﬒]"
                    },
                    ['no-ignore'] = {
                        value="--no-ignore",
                        desc="no .gitignore",
                        icon="[]"
                    },
                }
            }
        }
    });
end
