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

if has('nvim')
    call SigmaAdd('kyazdani42/nvim-web-devicons')
    call SigmaAdd('romgrk/barbar.nvim')
    call SigmaAdd('lewis6991/gitsigns.nvim')
    call SigmaAdd('ibhagwan/fzf-lua', {'branch': 'main'})
    call SigmaAdd('AckslD/nvim-neoclip.lua')
    call SigmaAdd('kkharji/sqlite.lua', { 'as': 'sqlite' })
    call SigmaAdd('numToStr/Comment.nvim')
    call SigmaAdd('nvim-lualine/lualine.nvim')
    call SigmaAdd('glepnir/dashboard-nvim')
    call SigmaAdd('ThePrimeagen/vim-be-good')
    call SigmaAdd('windwp/nvim-spectre')
    call SigmaAdd('nvim-lua/plenary.nvim')
    call SigmaAdd('norcalli/nvim-colorizer.lua')
else
    call SigmaAdd('vim-airline/vim-airline')
    call SigmaAdd('ryanoasis/vim-devicons')
    call SigmaAdd('scrooloose/nerdcommenter')
    call SigmaAdd('junegunn/fzf.vim')
    call SigmaAdd('mhinz/vim-startify')
    call SigmaAdd('tpope/vim-fugitive',)
    call SigmaAdd('mhinz/vim-signify')
endif
