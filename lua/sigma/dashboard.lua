--    _____ _                      _    ___           ____
--   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
--   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
--  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
-- /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
--        /____/
-- sigma/dashboard.lua
-- Default dashboard configuration

if (vim.g['sigma#plugins']['glepnir/dashboard-nvim'] ~= 0)
then
    local db = require('dashboard')

    db.custom_header = {
        [[   _____ _                      _    ___           ____      ]],
        [[  / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____]],
        [[  \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/]],
        [[ ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__  ]],
        [[/____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/  ]],
        [[       /____/                                                ]],
        [[烈NEOVIM]]
    }

    db.hide_statusline = false
    db.hide_tabline = false

    db.custom_center = {
        {icon = '  ',
            desc = 'Open project                            ',
            shortcut = 'SPC p p',
            action ='ProjectList'},
        {icon = '  ',
            desc = 'Find recent files                       ',
            action = 'FzfLua oldfiles',
            shortcut = 'SPC f r'},
        {icon = '  ',
            desc = 'Find files                              ',
            action = 'FzfLua files',
            shortcut = 'SPC f f'},
        {icon = '  ',
            desc ='File browser                            ',
            action =  'NnnPicker',
            shortcut = 'SPC f b'},
        {icon = '  ',
            desc = 'Find word                               ',
            action = 'lua require(\'fzf-lua\').live_grep({ cmd = "rg -g \'!{.git,node_modules}/\' --hidden --no-ignore", search = "", fzf_opts = { [\'--nth\'] = \'2..\' } })',
            shortcut = 'SPC r g'},
        {icon = '  ',
            desc = 'Vim Be Good                             ',
            action = 'VimBeGood',
            shortcut = 'SPC b g'},
        {icon = '  ',
            desc = 'Update plugins                          ',
            action = 'PlugUpdate',
            shortcut = 'SPC u p'},
        {icon = '  ',
            desc = 'Configure                               ',
            action = 'e ~/.config/nvim/init.vim',
            shortcut = 'SPC f P'}

    }

    local function randomFooter()
        local footers = {'In order to exit, press and hold the Power button', 'Neovim loaded BLAZINGLY FAST'}

        return footers[os.time() % 2 + 1]
    end

    db.custom_footer = { '', randomFooter() }
end
