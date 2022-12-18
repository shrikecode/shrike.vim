"    _____ _                      _    ___           ____
"   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
"   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
"  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
" /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
"        /____/
" plugin/sigma.vim
" Main SigmaVimRc functions

let g:sigma#plugins = {
        \ 'laniusone/sigma.vim': 1,
        \ 'laniusone/kyotonight.vim': 1,
        \ '907th/vim-auto-save': 1,
        \ 'eshion/vim-sync': 1,
        \ 'skywind3000/asyncrun.vim': 1,
        \ 'lambdalisue/suda.vim': 1,
        \ 'lambtpope/vim-abolish': 1,
        \ 'lambhonza/vim-snippets': 1,
        \ 'lambdbeniamine/cheat.sh-vim': 1,
        \ 'lambmcchrish/nnn.vim': 1,
        \ 'lambleafOfTree/vim-project': 1,
        \ 'lambneoclide/coc.nvim': {'branch': 'release'},
        \ 'lambmbbill/undotree': 1,
        \ 'lambjunegunn/fzf': 1
      \ }

if has('nvim')
    SigmaAdd('kyazdani42/nvim-web-devicons')
    SigmaAdd('romgrk/barbar.nvim')
    SigmaAdd('lewis6991/gitsigns.nvim')
    SigmaAdd('ibhagwan/fzf-lua', {'branch': 'main'})
    SigmaAdd('AckslD/nvim-neoclip.lua')
    SigmaAdd('kkharji/sqlite.lua', { 'as': 'sqlite' })
    SigmaAdd('numToStr/Comment.nvim')
    SigmaAdd('nvim-lualine/lualine.nvim')
    SigmaAdd('glepnir/dashboard-nvim')
    SigmaAdd('ThePrimeagen/vim-be-good')
    SigmaAdd('windwp/nvim-spectre')
    SigmaAdd('nvim-lua/plenary.nvim')
    SigmaAdd('norcalli/nvim-colorizer.lua')
else
    SigmaAdd('vim-airline/vim-airline')
    SigmaAdd('ryanoasis/vim-devicons')
    SigmaAdd('scrooloose/nerdcommenter')
    SigmaAdd('junegunn/fzf.vim')
    SigmaAdd('mhinz/vim-startify')
    SigmaAdd('tpope/vim-fugitive',)
    SigmaAdd('mhinz/vim-signify')
endif

function! SigmaRemove(plugin)
    for [key, value] in items(g:sigma#plugins)
        if a:plugin == key
            let g:sigma#plugins[key] = 0
        endif
    endfor
endfunction

function! SigmaAdd(plugin, config = 1)
    if type(a:config) == v:t_dict
        let g:sigma#plugins[a:plugin] = a:config
    else
        let g:sigma#plugins[a:plugin] = 1
    endif
endfunction

function! SigmaInit()
    let s:count = 0

    plug#begin()

    for [key, value] in items(g:sigma#plugins)
        if value != 0
            let s:count += 1
            if type(value) == v:t_dict
                Plug key, value
            else
                Plug key
            endif
        endif
    endfor

    plug#end()
    
    call sigma#SigmaConfig()

    echo "烈VimRc loaded ".s:count." plugins.";
endfunction

function! SigmaRun(command = '')
    if $TERM == 'xterm-kitty'
        execute "kitty @ launch " a:command getcwd()
    else if $TMUX != ''
        execute "tmux split-window " a:command getcwd()
    else
        echoerr 'Vim must be run in kitty terminal or tmux for SigmaRun to work'
    endif
endfunction
