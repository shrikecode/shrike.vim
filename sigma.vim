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

function! SigmaConfig()
    " General Config
    set termguicolors
    set guifont="SauceCodePro Nerd Font:h10"

    if has('nvim')
        set title
        set signcolumn
        set laststatus=3
        set noshowmode
        :lua require('e-resize-fix')
    else
        set laststatus=2
        let &t_SI = "\e[5 q"
        let &t_EI = "\e[1 q"
        set swapfile
        set undodir=~/.vim/tmp
        set backupdir=~/.vim/tmp
        set directory=~/.vim/tmp
        set incsearch
    endif

    set nocompatible
    set mouse=a

    let mapleader = " "
    syntax on
    set clipboard=unnamedplus
    set nu
    set relativenumber
    set encoding=UTF-8
    set smarttab
    set smartindent
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set nowrap
    set textwidth=0
    set wrapmargin=0
    set colorcolumn=120
    set whichwrap+=<>[]hl
    set cursorline

    " vim-auto-save
    let g:auto_save = 1

    " suda.vim
    let g:suda_smart_edit = 1

    " nnn.vim
    let g:nnn#layout = { 'window': { 'width': 1, 'height': 1, 'border': 'none' } }
    let g:nnn#replace_netrw = 1
    let g:nnn#command = 'nnn -a -Pp'

    if has('nvim')
        " kyotonight.vim | lualine.nvim
        :lua require('sigma.theme')
        " dashboard-nvim
        :lua require('sigma.dashboard')
        " other lua plugins initialization
        :lua require('sigma.plugins')
    else
        " kyotonight.vim
        let g:kyotonight_italic = 1
        let g:kyotonight_italic_comments = 1

        colorscheme kyotonight
        " vim-airline
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline_left_sep=''
        let g:airline_left_alt_sep=''
        let g:airline_right_sep=''
        let g:airline_right_alt_sep=''
        let g:airline_detect_modified=1
        let g:airline_detect_paste=1
        let g:airline_detect_crypt=1
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_symbols.branch = ''
        let g:airline_symbols.colnr = ' ℅:'
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ' :'
        let g:airline_symbols.maxlinenr = '☰ '
        let g:airline_symbols.dirty='⚡'
        let g:airline#extensions#default#layout = [
                    \ [ 'a', 'b',  'c'],
                    \ [ 'x', 'warning', 'error', 'y', 'z']
                    \ ]

        " startify
        let g:startify_custom_header = 
                    \ startify#pad(split(system('figlet -f slant "SigmaVimRc"'), '\n'))
        let g:startify_custom_footer = 
                    \ startify#pad(split(system('echo "In order to exit Vim, press and hold the Power button"'), '\n'))
        let g:startify_lists = [
                    \ { 'type': 'files',     'header': ['   Recent Files']   },
                    \ { 'type': 'commands',  'header': ['   Commands']       },
                    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                    \ ]
        let g:startify_commands = [
                    \ ['  Open project     SPC p p', 'ProjectList'],
                    \ ['  Recent files     SPC f r', 'History'],
                    \ ['  Find files       SPC f f', 'Files'],
                    \ ['  File browser     SPC f b', 'NnnPicker'],
                    \ ['  Update plugins   SPC u p', 'PlugUpdate'],
                    \ ['  Configure        SPC f P', 'e ~/.vimrc'],
                    \ ]
    endif

    " Mappings
    nnoremap <leader>pp <Cmd>ProjectList<CR>
    nnoremap <leader>fb <Cmd>NnnPicker<CR>

    nnoremap <Esc> <Cmd>noh<CR>
    nnoremap <leader>uc <Cmd>PlugClean<CR>
    nnoremap <leader>up <Cmd>PlugUpdate<CR><Cmd>PlugUpgrade<CR>

    if has('nvim')
        nnoremap <leader>ff <Cmd>FzfLua files<CR>
        nnoremap <leader>bi <Cmd>FzfLua buffers<CR>
        nnoremap <leader>fr <Cmd>FzfLua oldfiles<CR>
        nnoremap <leader>rg <Cmd>lua require('fzf-lua').live_grep({ cmd = "rg -g '!{.git,node_modules}/' --hidden --no-ignore", search = "", fzf_opts = { ['--nth'] = '2..' } })<CR>
        nnoremap <leader>cp <Cmd>FzfLua commands<CR>
        nnoremap <leader>ll <Cmd>FzfLua lines<CR>
        nnoremap <leader>fg <Cmd>IconPickerNormal nerd_font<CR>
        nnoremap <leader>rr <Cmd>source ~/.config/nvim/init.vim<CR>
        nnoremap <leader>fP <Cmd>e ~/.config/nvim/init.vim<CR>

        " barbar.nvim
        nnoremap <C-,> <Cmd>BufferMovePrevious<CR>
        nnoremap <C-.> <Cmd>BufferMoveNext<CR>
        nnoremap <A-p> <Cmd>BufferPin<CR>
        nnoremap <A-C> <Cmd>BufferCloseAllButCurrentOrPinned<CR>

        " Spectre
        nnoremap <leader>S  <cmd>lua require('spectre').open()<CR>
        nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
        vnoremap <leader>s  <esc>:lua require('spectre').open_visual()<CR>
        nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

        " Neoclip
        nnoremap <leader>yy <Cmd>lua require('neoclip.fzf')()<CR>

        " Vim Be Good
        nnoremap <leader>bg <Cmd>VimBeGood<CR>
    else
        nnoremap <leader>rr <Cmd>source ~/.vimrc<CR>
        nnoremap <leader>fP <Cmd>e ~/.vimrc<CR>
        nnoremap <leader>S  <Cmd>ProjectFindInFiles<CR>
        nnoremap <leader>ff <Cmd>Files<CR>
        nnoremap <leader>bi <Cmd>Buffers<CR>
        nnoremap <leader>fr <Cmd>History<CR>
        nnoremap <leader>rg <Cmd>Rg<CR>
        nnoremap <leader>cp <Cmd>Commands<CR>
        nnoremap <leader>ll <Cmd>Lines<CR>
    endif

    noremap <C-n> <Cmd>NnnPicker %:p:h<CR>
    nnoremap <silent><leader>gg <Cmd>execute "!kitty @ launch lazygit -p" getcwd()<C-j><CR>
    nnoremap <silent><leader>tt <Cmd>execute "!kitty @ launch" getcwd()<C-j><CR>
    nnoremap <leader>uu <Cmd>UndotreeToggle<CR>

    " you've got some moves
    nnoremap <C-u> <C-u>zz
    nnoremap <C-d> <C-d>zz

    " switch between windows
    nnoremap <leader>wh <C-w>h
    nnoremap <leader>wl <C-w>l
    nnoremap <leader>wj <C-w>j
    nnoremap <leader>wk <C-w>k

    " resize windows
    nnoremap <A-h> <C-w>>
    nnoremap <A-l> <C-w><
    nnoremap <A-k> <C-w>+
    nnoremap <A-j> <C-w>-
    nnoremap <A-J> <C-w>_
    nnoremap <A-K> <C-w>_
    nnoremap <A-H> <C-w>|
    nnoremap <A-L> <C-w>|
    nnoremap <A-e> <C-w>=

    " Next/previous buffer
    nnoremap <A-.> <Cmd>bn<CR>
    nnoremap <A-,> <Cmd>bp<CR>

    " Close buffer
    nnoremap <A-c> <Cmd>bd<CR>

    " greatest remap ever
    xnoremap <leader>p "_dP

    " split windows
    nnoremap <leader>ws <C-w>s
    nnoremap <leader>wv <C-w>v

    " close window
    nnoremap <leader>wc <C-w>c

    " Magento 2 linters
    nnoremap <silent><leader>md <Cmd>!phpmdm2 %<CR>
    nnoremap <silent><leader>mc <Cmd>!phpcsm2 %<CR>
    nnoremap <silent><leader>mb <Cmd>!phpcbfm2 %<CR>
    nnoremap <silent><leader>mf <Cmd>!php-cs-fixer-m2 fix %<CR>
    nnoremap <silent><leader>me <Cmd>!eslint %<CR>

    " Autocmd
    autocmd BufWritePost * :call SyncUploadFile()
    autocmd FileType org :set cc=80
    autocmd FileType markdown :set cc=80

endfunction


function! SigmaInit()
    let s:count = 0

    call plug#begin()

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

    call plug#end()
    
    call SigmaConfig()

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
