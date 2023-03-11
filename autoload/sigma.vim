"    _____ _                      _    ___           ____
"   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
"   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
"  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
" /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
"        /____/
" autoload/sigma.vim
" Main SigmaVimRc file

let g:sigma#plugins = {
            \ 'voidekh/kyotonight.vim': 1,
            \ '907th/vim-auto-save': 1,
            \ 'eshion/vim-sync': 1,
            \ 'skywind3000/asyncrun.vim': 1,
            \ 'lambdalisue/suda.vim': 1,
            \ 'tpope/vim-abolish': 1,
            \ 'honza/vim-snippets': 1,
            \ 'dbeniamine/cheat.sh-vim': 1,
            \ 'mcchrish/nnn.vim': 1,
            \ 'leafOfTree/vim-project': 1,
            \ 'mbbill/undotree': 1,
            \ 'junegunn/fzf': 1,
            \ 'tpope/vim-commentary': 1,
            \ 'noahfrederick/vim-skeleton': 1,
            \ 'mhinz/vim-startify': 1,
            \ }

let g:sigma#line_options = {
            \ 'lightline': 'itchyny/lightline.vim',
            \ 'lualine': 'nvim-lualine/lualine.nvim',
            \ 'airline': 'vim-airline/vim-airline'
            \ }

let g:sigma#lsp_servers = [ 'vimls', 'lua_ls' ]

function! sigma#remove(plugin)
    let g:sigma#plugins[a:plugin] = 0
endfunction

function! sigma#add(plugin, config = 1, no_override = 0)
    if a:no_override == 1 && has_key(g:sigma#plugins, a:plugin)
        return
    elseif type(a:config) == v:t_dict
        let g:sigma#plugins[a:plugin] = a:config
    else
        let g:sigma#plugins[a:plugin] = 1
    endif
endfunction

function! sigma#lsp_add(server)
    let g:sigma#lsp_servers += [ a:server ]
endfunction

function! sigma#mappings()
    " Mappings
    nnoremap <leader>pp <Cmd>ProjectList<CR>
    nnoremap <leader>fb <Cmd>NnnPicker<CR>

    nnoremap <Esc> <Cmd>noh<CR>
    nnoremap <leader>uc <Cmd>PlugClean<CR>
    nnoremap <leader>up <Cmd>PlugUpdate<CR>
    nnoremap <leader>uv <Cmd>PlugUpgrade<CR>
    nnoremap <leader>us <Cmd>SigmaUpdate<CR>

    nnoremap <leader>ff <Cmd>SigmaFiles<CR>
    nnoremap <leader>fr <Cmd>SigmaRecentFiles<CR>
    nnoremap <leader>rg <Cmd>SigmaRg<CR>
    nnoremap <leader>fP <Cmd>SigmaConfig<CR>


    if has_key(g:sigma#plugins, 'mhinz/vim-startify') && g:sigma#plugins['mhinz/vim-startify'] != 0
        nnoremap <leader>ss <Cmd>SigmaDashboard<CR>
    endif

    if has('nvim')
        nnoremap <leader>bi <Cmd>FzfLua buffers<CR>
        nnoremap <leader>cp <Cmd>FzfLua commands<CR>
        nnoremap <leader>ll <Cmd>FzfLua lines<CR>
        nnoremap <leader>gl <Cmd>FzfLua blines<CR>
        nnoremap <leader>gj <Cmd>FzfLua jumps<CR>
        nnoremap <leader>km <Cmd>FzfLua keymaps<CR>
        nnoremap <leader>rr <Cmd>source ~/.config/nvim/init.vim<CR>

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
    else
        nnoremap <leader>rr <Cmd>source ~/.vimrc<CR>
        nnoremap <leader>S  <Cmd>ProjectFindInFiles<CR>
        nnoremap <leader>bi <Cmd>Buffers<CR>
        nnoremap <leader>cp <Cmd>Commands<CR>
        nnoremap <leader>ll <Cmd>Lines<CR>
        nnoremap <leader>gl <Cmd>BLines<CR>
        nnoremap <leader>km <Cmd>Maps<CR>
    endif

    noremap <C-n> <Cmd>NnnPicker %:p:h<CR>

    if $TERM == 'xterm-kitty' || $TMUX != ''
        if $TMUX != ''
            nnoremap <silent><leader>gg <Cmd>call sigma#run("lazygit")<C-j><CR>
        else
            nnoremap <silent><leader>gg <Cmd>call sigma#run("lazygit -p")<C-j><CR>
        endif
        nnoremap <silent><leader>tt <Cmd>call sigma#run()<C-j><CR>
    endif

    nnoremap <leader>uu <Cmd>UndotreeToggle<CR>

    " you've got some moves
    nnoremap <C-u> <C-u>zz
    nnoremap <C-d> <C-d>zz
    nnoremap n nzzzv
    nnoremap N Nzzzv
    nnoremap gg ggzz
    nnoremap G Gzz
    nnoremap gd gdzz
    nnoremap gD gDzz
    nnoremap gi gizz
    nnoremap <C-i> <C-i>zz
    nnoremap <C-o> <C-o>zz

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
    if has('nvim')
        nnoremap <A-.> <Cmd>BufferNext<CR>
        nnoremap <A-,> <Cmd>BufferPrevious<CR>
    else
        nnoremap <A-.> <Cmd>bn<CR>
        nnoremap <A-,> <Cmd>bp<CR>
    endif

    " Close buffer
    nnoremap <A-c> <Cmd>bd<CR>

    " greatest remap ever
    xnoremap <leader>p "_dP

    " split windows
    nnoremap <leader>ws <C-w>s
    nnoremap <leader>wv <C-w>v

    " close window
    nnoremap <leader>wc <C-w>c
endfunction

function! sigma#config()
    " General Config
    set termguicolors
    set guifont="SauceCodePro Nerd Font:h10"
    set signcolumn=yes
    set undofile
    set swapfile
    set backup
    set backupdir=~/.local/state/nvim/backup

    if has('nvim')
        set title
        set laststatus=3
        set noshowmode
        :lua require('sigma.e-resize-fix')
    else
        set laststatus=2
        let &t_SI = "\e[5 q"
        let &t_EI = "\e[1 q"
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        call system('mkdir -p ~/.vim/tmp/undo')
        call system('mkdir -p ~/.vim/tmp/backup')
        call system('mkdir -p ~/.vim/tmp/swap')
        set undodir=~/.vim/tmp/undo
        set backupdir=~/.vim/tmp/backup
        set directory=~/.vim/tmp/swap
        set incsearch
    endif

    set nocompatible
    set mouse=a

    let g:mapleader = " "
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
    let g:nnn#command = 'nnn -a -Pp -o'

    " kyotonight.vim
    let g:kyotonight_italic = 1
    let g:kyotonight_italic_comments = 1

    if has('nvim')
        " kyotonight.vim | lualine.nvim
        :lua require('sigma.theme')
        " other lua plugins initialization
        :lua require('sigma.plugins')
        " coc.nvim or lsp config
        if g:sigma#use_lsp == 1 && g:sigma#lsp_default == 1
            set completeopt=menu,menuone,noselect
            :lua require('sigma.lsp')
        elseif g:sigma#use_coc == 1 && g:sigma#coc_default == 1
            call sigmacoc#config()
        endif
    else
        " kyotonight.vim
        colorscheme kyotonight
        " machakann/vim-highlightedyank
        let g:highlightedyank_highlight_duration = 1000
        hi! link HighlightedyankRegion Search
    endif

    if g:sigma#line == 'airline'
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
    endif

    if g:sigma#line == 'lightline'
        if g:sigma#use_lsp == 1
            let g:lightline#lsp#indicator_warnings = " "
            let g:lightline#lsp#indicator_errors = " "
            let g:lightline#lsp#indicator_info = " "
            let g:lightline#lsp#indicator_hints = " "
            let g:lightline#lsp#indicator_ok = ""
            let g:lightline = {
                        \ 'colorscheme': 'kyotonight',
                        \   'active': {
                        \       'left': [[ 'mode', 'paste'], [ 'gitbranch'],
                        \               ['lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lsp_status' ],
                        \               ['readonly', 'filename', 'modified' ]],
                        \       'right': [[ 'lineinfo' ], [ 'percent' ],
                        \               ['fileformat', 'fileencoding', 'filetype']]
                        \   },
                        \ 'component_function': {
                        \		'gitbranch': 'FugitiveHead'
                        \	}
                        \ }

            " register compoments:
            call lightline#lsp#register()
        else
            let g:lightline = {
                        \ 'colorscheme': 'kyotonight',
                        \   'active': {
                        \       'left': [[ 'mode', 'paste'], [ 'gitbranch'],
                        \             ['readonly', 'filename', 'modified' ]],
                        \       'right': [	 [ 'lineinfo' ], [ 'percent' ],
                        \             [ 'fileformat', 'fileencoding', 'filetype']]
                        \   },
                        \ 'component_function': {
                        \		'gitbranch': 'FugitiveHead'
                        \	}
                        \ }
        endif
    endif

    " startify
    if has('nvim')
        let s:sigmavim_line = "   烈NEOVIM                                                     "
    else
        let s:sigmavim_line = "   烈VIM                                                        "
    endif

    if has_key(g:sigma#plugins, 'mhinz/vim-startify') && g:sigma#plugins['mhinz/vim-startify'] == 1
        let g:startify_custom_header = [
                    \ "      _____ _                      _    ___           ____      ",
                    \ "     / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \\_____",
                    \ "     \\__ \\/ / __ `/ __ `__ \\/ __ `/ | / / / __ `__ \\/ /_/ / ___/",
                    \ "    ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__  ",
                    \ "   /____/_/\\__, /_/ /_/ /_/\\__,_/ |___/_/_/ /_/ /_/_/ |_|\\___/  ",
                    \ "          /____/                                                ",
                    \ s:sigmavim_line
                    \ ]
        let g:startify_custom_footer = 
                    \ startify#pad(split(system('echo "In order to exit Vim, press and hold the Power button"'), '\n'))
        let g:startify_lists = [
                    \ { 'type': 'files',     'header': ['   Recent Files']   },
                    \ { 'type': 'commands',  'header': ['   Commands']       },
                    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                    \ ]
        let g:startify_commands = [
                    \ {'p': ['  Open project      SPC p p', 'ProjectList']},
                    \ {'r': ['  Recent files      SPC f r', 'SigmaRecentFiles']},
                    \ {'f': ['  Find files        SPC f f', 'SigmaFiles']},
                    \ {'n': ['  File browser      SPC f b', 'NnnPicker']},
                    \ {'z': ['  Find word         SPC r g', 'SigmaRg']},
                    \ {'s': ['烈 Update SigmaVimRc SPC u s', 'SigmaUpdate']},
                    \ {'u': ['  Update plugins    SPC u p', 'PlugUpdate']},
                    \ {'c': ['  Configure         SPC f P', 'SigmaConfig']},
                    \ ]
        if has('nvim') && has_key(g:sigma#plugins, 'kyazdani42/nvim-web-devicons') && g:sigma#plugins['kyazdani42/nvim-web-devicons'] == 1
            " dev icons for startify
            :lua function _G.webDevIcons(path) local filename = vim.fn.fnamemodify(path, ':t') local extension = vim.fn.fnamemodify(path, ':e') return require'nvim-web-devicons'.get_icon(filename, extension, { default = true }) end

            function! StartifyEntryFormat() abort
                return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
            endfunction
        endif
    endif

    if g:sigma#use_coc == 1 && g:sigma#coc_default == 1
        call sigmacoc#config()
    endif

    call sigma#mappings()

    " Autocmd
    autocmd BufWritePost * :call SyncUploadFile()
    autocmd FileType org :set cc=80
    autocmd FileType markdown :set cc=80

    if has('nvim')
        autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="Search", timeout=1000}
    endif

    if has_key(g:sigma#plugins, 'noahfrederick/vim-skeleton') && g:sigma#plugins['noahfrederick/vim-skeleton'] == 1
        call system('mkdir -p ~/.vim/templates')
    endif

endfunction

function! sigma#update()
    let s:sigma_dir = '~/.vim/pack/plugins/start/SigmaVimRc'

    if has('nvim')
        let s:sigma_dir = '~/.local/share/nvim/site/pack/plugins/start/SigmaVimRc'
    endif

    execute "!cd ".s:sigma_dir." && git pull"
endfunction

function! sigma#default_plugins()
    let g:sigma#use_coc = get(g:, 'sigma#use_coc', 0)
    let g:sigma#use_lsp = get(g:, 'sigma#use_lsp', 0)
    let g:sigma#coc_default = get(g:, 'sigma#coc_default', 0)
    let g:sigma#lsp_default = get(g:, 'sigma#lsp_default', 0)
    let s:enable = 1
    let s:no_override = 1

    if has('nvim')
        let g:sigma#line = get(g:, 'sigma#line', 'lualine')
    else
        let g:sigma#line = get(g:, 'sigma#line', 'lightline')
    endif

    if g:sigma#use_coc == 1
        call sigma#add('neoclide/coc.nvim', {'branch': 'release'}, s:no_override)
    endif

    call sigma#add(g:sigma#line_options[g:sigma#line], s:enable, s:no_override)

    if has('nvim')

        if g:sigma#use_lsp == 1
            call sigma#add('williamboman/mason.nvim', s:enable, s:no_override)
            call sigma#add('williamboman/mason-lspconfig.nvim', s:enable, s:no_override)
            call sigma#add('neovim/nvim-lspconfig', s:enable, s:no_override)
            call sigma#add('hrsh7th/cmp-nvim-lsp', s:enable, s:no_override)
            call sigma#add('hrsh7th/cmp-buffer', s:enable, s:no_override)
            call sigma#add('hrsh7th/cmp-path', s:enable, s:no_override)
            call sigma#add('hrsh7th/cmp-cmdline', s:enable, s:no_override)
            call sigma#add('hrsh7th/nvim-cmp', s:enable, s:no_override)
            call sigma#add('SirVer/ultisnips', s:enable, s:no_override)
            call sigma#add('quangnguyen30192/cmp-nvim-ultisnips', s:enable, s:no_override)

            if sigma#line == 'lightline'
                call sigma#add('josa42/nvim-lightline-lsp', s:enable, s:no_override)
            endif
        elseif g:sigma#use_coc == 1
            call sigma#add('neoclide/coc.nvim', {'branch': 'release'}, s:no_override)
        endif

        if g:sigma#line == 'lightline' || g:sigma#line == 'airline'
            call sigma#add('tpope/vim-fugitive', s:enable, s:no_override)
        endif

        call sigma#add('kyazdani42/nvim-web-devicons', s:enable, s:no_override)
        call sigma#add('romgrk/barbar.nvim', s:enable, s:no_override)
        call sigma#add('lewis6991/gitsigns.nvim', s:enable, s:no_override)
        call sigma#add('ibhagwan/fzf-lua', {'branch': 'main'}, s:no_override)
        call sigma#add('AckslD/nvim-neoclip.lua', s:enable, s:no_override)
        call sigma#add('kkharji/sqlite.lua', { 'as': 'sqlite' }, s:no_override)
        call sigma#add('windwp/nvim-spectre', s:enable, s:no_override)
        call sigma#add('nvim-lua/plenary.nvim', s:enable, s:no_override)
        call sigma#add('norcalli/nvim-colorizer.lua', s:enable, s:no_override)
    else

        if g:sigma#use_coc == 1
            call sigma#add('neoclide/coc.nvim', {'branch': 'release'}, s:no_override)
        endif

        call sigma#add('ryanoasis/vim-devicons', s:enable, s:no_override)
        call sigma#add('junegunn/fzf.vim', s:enable, s:no_override)
        call sigma#add('tpope/vim-fugitive', s:enable, s:no_override)
        call sigma#add('mhinz/vim-signify', s:enable, s:no_override)
        call sigma#add('BourgeoisBear/clrzr', s:enable, s:no_override)
        call sigma#add('junegunn/vim-peekaboo', s:enable, s:no_override)
        call sigma#add('machakann/vim-highlightedyank', s:enable, s:no_override)
    endif
endfunction

function! sigma#init()
    call sigma#default_plugins()

    call plug#begin()

    for [key, value] in items(g:sigma#plugins)
        if type(value) == v:t_dict
            Plug key, value
        elseif value == 1
            Plug key
        endif
    endfor

    call plug#end()
    
    call sigma#config()

    command! SigmaUpdate :call sigma#update()

    if has('nvim')
        command! SigmaRecentFiles :FzfLua oldfiles
        command! SigmaFiles :FzfLua files
        command! SigmaRg :lua require('fzf-lua').live_grep({ cmd = "rg -g '!{.git,node_modules}/' --hidden --no-ignore --column", search = "", fzf_opts = { ['--nth'] = '2..' } })
        command! SigmaConfig :e ~/.config/nvim/init.vim
    else
        command! SigmaRecentFiles :History
        command! SigmaFiles :Files
        command! SigmaRg :Rg
        command! SigmaConfig :e ~/.vimrc
    endif

    if has_key(g:sigma#plugins, 'mhinz/vim-startify') && g:sigma#plugins['mhinz/vim-startify'] != 0
        command! SigmaDashboard :Startify
    endif
endfunction

function! sigma#run(command = '', split = 'h')
    if $TERM == 'xterm-kitty'
        execute "!kitty @ launch " a:command getcwd()
    elseif $TMUX != ''
        execute "!tmux split-window -" . a:split "-c" getcwd() a:command
    else
        echoerr 'Vim must be run in kitty terminal or tmux for sigma#run to work'
    endif
endfunction

