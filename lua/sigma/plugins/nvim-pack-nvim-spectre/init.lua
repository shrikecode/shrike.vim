local M = {
    setup = function()
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
                    },
                    options = {
                        ['ignore-case'] = {
                            value = "--ignore-case",
                            icon = "[]",
                            desc = "ignore case"
                        },
                        ['hidden'] = {
                            value = "--hidden",
                            desc = "hidden file",
                            icon = "[﬒]"
                        },
                        ['no-ignore'] = {
                            value = "--no-ignore",
                            desc = "no .gitignore",
                            icon = "[]"
                        },
                    }
                }
            }
        })
    end
}

return M
