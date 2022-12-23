--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/plugins.lua
-- Default Lua plugins configurations

if (vim.g['sigma#plugins']['romgrk/barbar.nvim'] ~= 0)
then
    -- barbar.nvim
    require('bufferline').setup({ icon_separator_active = '', icon_separator_inactive = '', icon_pinned = '' })
end

if (vim.g['sigma#plugins']['lewis6991/gitsigns.nvim'] ~= 0)
then
    -- gitsigns.nvim
    require('gitsigns').setup()
end

if (vim.g['sigma#plugins']['AckslD/nvim-neoclip.lua'] ~= 0)
then
    -- nvim-neoclip.lua
    require('neoclip').setup({ default_register = "+", enable_persistent_history = true, continuous_sync = true })
end

if (vim.g['sigma#plugins']['windwp/nvim-spectre'] ~= 0)
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
