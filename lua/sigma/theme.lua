--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/theme.lua
-- Default Neovim and Lualine theme

if (vim.g['sigma#plugins']['voidekh/kyotonight.vim'] ~= 0)
then
    vim.cmd[[colorscheme kyotonight]]

    if (vim.g['sigma#plugins']['nvim-lualine/lualine.nvim'] ~= 0)
    then
        require('lualine').setup {
            options = {
                theme = 'kyotonight'
            }
        }
    end
end
