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
            action = 'SigmaRecentFiles',
            shortcut = 'SPC f r'},
        {icon = '  ',
            desc = 'Find files                              ',
            action = 'SigmaFiles',
            shortcut = 'SPC f f'},
        {icon = '  ',
            desc ='File browser                            ',
            action =  'NnnPicker',
            shortcut = 'SPC f b'},
        {icon = '  ',
            desc = 'Find word                               ',
            action = 'SigmaRg',
            shortcut = 'SPC r g'},
        {icon = '烈 ',
            desc = 'Update SigmaVimRc                       ',
            action = 'SigmaUpdate',
            shortcut = 'SPC u s'},
        {icon = '  ',
            desc = 'Update plugins                          ',
            action = 'PlugUpdate',
            shortcut = 'SPC u p'},
        {icon = '  ',
            desc = 'Configure                               ',
            action = 'SigmaConfig',
            shortcut = 'SPC f P'}
    }

    local function randomFooter()
        local footers = {'In order to exit, press and hold the Power button', 'Neovim loaded BLAZINGLY FAST'}

        return footers[os.time() % 2 + 1]
    end

    db.custom_footer = { '', randomFooter() }
end
