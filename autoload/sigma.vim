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
            \ 'noahfrederick/vim-skeleton': 1,
            \ 'mhinz/vim-startify': 1,
            \ 'itchyny/lightline.vim': 1,
            \ 'mengelbrecht/lightline-bufferline': 1,
            \ 'tpope/vim-fugitive': 1,
            \ 'sineto/lightline-hunks': 1,
            \ 'tpope/vim-commentary': 1,
            \ 'ryanoasis/vim-devicons': 1,
            \ 'junegunn/fzf.vim': 1,
            \ 'airblade/vim-gitgutter': 1,
            \ 'BourgeoisBear/clrzr': 1,
            \ 'junegunn/vim-peekaboo': 1,
            \ 'machakann/vim-highlightedyank': 1,
            \ }

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

function! sigma#is_enabled(plugin)
    return has_key(g:sigma#plugins, a:plugin) && g:sigma#plugins[a:plugin] != 0
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


    if sigma#is_enabled('mhinz/vim-startify')
        nnoremap <leader>ss <Cmd>SigmaDashboard<CR>
    endif

    nnoremap <leader>rr <Cmd>source ~/.vimrc<CR>
    nnoremap <leader>S  <Cmd>ProjectFindInFiles<CR>
    nnoremap <leader>bi <Cmd>Buffers<CR>
    nnoremap <leader>cp <Cmd>Commands<CR>
    nnoremap <leader>ll <Cmd>Lines<CR>
    nnoremap <leader>gl <Cmd>BLines<CR>
    nnoremap <leader>km <Cmd>Maps<CR>

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
    nnoremap <leader>w<Left> <C-w>h
    nnoremap <leader>w<Right> <C-w>l
    nnoremap <leader>w<Down> <C-w>j
    nnoremap <leader>w<Up> <C-w>k

    " resize windows
    nnoremap <A-h> <C-w>>
    nnoremap <A-l> <C-w><
    nnoremap <A-k> <C-w>+
    nnoremap <A-j> <C-w>-
    nnoremap <A-Left> <C-w>>
    nnoremap <A-Right> <C-w><
    nnoremap <A-Up> <C-w>+
    nnoremap <A-Down> <C-w>-
    nnoremap <A-J> <C-w>_
    nnoremap <A-K> <C-w>_
    nnoremap <A-H> <C-w>|
    nnoremap <A-L> <C-w>|
    nnoremap <A-e> <C-w>=

    " Bufferline
    if sigma#is_enabled('mengelbrecht/lightline-bufferline')
        nnoremap <A-.> <Plug>lightline#bufferline#go_next()<CR>
        nnoremap <A-,> <Plug>lightline#bufferline#go_previous()<CR>
        nnoremap <C-,> <Plug>lightline#bufferline#move_previous()<CR>
        nnoremap <C-.> <Plug>lightline#bufferline#move_next()<CR>
        nnoremap <A-p> <Plug>lightline#bufferline#move_first()<CR>
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

    if g:sigma#use_ale == 1
        nnoremap gd <Cmd>ALEGoToDefinition<CR>
        nnoremap gr <Cmd>ALEFindReferences<CR>
        nnoremap gD <Cmd>ALEGoToTypeDefinition<CR>
        nnoremap gi <Cmd>ALEGoToImplementation<CR>
        nnoremap <leader>e <Cmd>ALEDetail<CR>
        nnoremap <leader>ca <Cmd>ALECodeAction<CR>
        nnoremap <leader>rn <Cmd>ALERename<CR>
        nnoremap <leader>f <Cmd>ALEFix<CR>
    endif
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

    " kyotonight.vim
    colorscheme kyotonight
    " machakann/vim-highlightedyank
    let g:highlightedyank_highlight_duration = 1000
    hi! link HighlightedyankRegion Search

    let g:lightline = {
                \ 'colorscheme': 'kyotonight',
                \ 'active': {
                \     'left': [[ 'mode', 'paste'], [ 'gitbranch', 'hunks'],
                \           ['readonly', 'filename', 'modified' ]],
                \     'right': [	 [ 'lineinfo' ], [ 'percent' ],
                \           [ 'fileformat', 'fileencoding', 'filetype']]
                \ },
                \ 'component_function': {
                \		'gitbranch': 'sigma#head',
                \       'hunks': 'sigma#hunks'
                \	}
                \ }
    if g:sigma#use_ale == 1
        let g:lightline.component_expand = {
                    \  'linter_checking': 'lightline#ale#checking',
                    \  'linter_infos': 'lightline#ale#infos',
                    \  'linter_warnings': 'lightline#ale#warnings',
                    \  'linter_errors': 'lightline#ale#errors',
                    \  'linter_ok': 'lightline#ale#ok',
                    \ }
        let g:lightline.component_type = {
                    \  'linter_checking': 'right',
                    \  'linter_infos': 'right',
                    \  'linter_warnings': 'warning',
                    \  'linter_errors': 'error',
                    \  'linter_ok': 'right',
                    \ }
        let g:lightline.active.left = [
                    \ [ 'mode', 'paste'], [ 'gitbranch', 'hunks'],
                    \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
                    \ [ 'readonly', 'filename', 'modified' ]
                    \ ]
        let g:lightline#ale#indicator_checking = " "
        let g:lightline#ale#indicator_warnings = " "
        let g:lightline#ale#indicator_errors = " "
        let g:lightline#ale#indicator_infos = " "
        let g:lightline#ale#indicator_ok = ""

        let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
        let g:ale_completion_enabled = 1
        let g:ale_sign_error = ' '
        let g:ale_sign_warning = ' '

    endif

    if sigma#is_enabled('mengelbrecht/lightline-bufferline')
        let g:lightline.tabline = {
                    \   'left': [ ['buffers'] ],
                    \   'right': [ ['close'] ]
                    \ }
        if !has_key(g:lightline, 'component_expand')
            let g:lightline.component_expand = {}
        endif
        if !has_key(g:lightline, 'component_type')
            let g:lightline.component_type = {}
        endif
        let g:lightline.component_expand.buffers = 'lightline#bufferline#buffers'
        let g:lightline.component_type.buffers = 'tabsel'

        let g:lightline#bufferline#show_number = 0
        let g:lightline#bufferline#enable_devicons = 1
        let g:lightline#bufferline#unicode_symbols = 1
        let g:lightline#bufferline#clickable = 1
        let g:lightline.component_raw = {'buffers': 1}

        " Do not show tabline on startify buffer
        autocmd FileType * if &ft != 'startify' && &ft != 'dashboard' | :set showtabline=2 | endif
    endif

    if sigma#is_enabled('sineto/lightline-hunks')
        let g:lightline#hunks#exclude_filetypes = [ 'startify' ]
    endif

    " startify
    let s:sigmavim_line = "   烈VIM                                                        "

    if sigma#is_enabled('mhinz/vim-startify')
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
    endif

    call sigma#mappings()

    " Autocmd
    autocmd BufWritePost * :call SyncUploadFile()
    autocmd FileType org :set cc=80
    autocmd FileType markdown :set cc=80

    if sigma#is_enabled('noahfrederick/vim-skeleton')
        call system('mkdir -p ~/.vim/templates')
    endif

endfunction

function! sigma#update()
    execute "!curl -fLo ~/.vim/autoload/sigma.vim --create-dirs https://raw.githubusercontent.com/voidekh/SigmaVimRc/master/autoload/sigma.vim"
endfunction

function! sigma#default_plugins()
    let g:sigma#use_ale = get(g:, 'sigma#use_ale', 0)
    let s:enable = 1
    let s:no_override = 1
    if (g:sigma#use_ale == 1)
        call sigma#add('dense-analysis/ale', s:enable, s:no_override)
        call sigma#add('maximbaz/lightline-ale', s:enable, s:no_override)
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

    " Automatically install missing plugins
    autocmd VimEnter *
                \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                \|   PlugInstall --sync | q
                \| endif
    
    call sigma#config()

    command! SigmaUpdate :call sigma#update()

    command! SigmaRecentFiles :History
    command! SigmaFiles :Files
    command! SigmaRg :Rg
    command! SigmaConfig :e ~/.vimrc

    if sigma#is_enabled('mhinz/vim-startify')
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

function! sigma#head()
    if sigma#is_enabled('sineto/lightline-hunks')
        return lightline#hunks#composer()
    elseif sigma#is_enabled('lewis6991/gitsigns.nvim')
        let s:head = get(b:, 'gitsigns_head', '')
        let g:sigma#branch_symbol = get(g:, 'sigma#branch_symbol', '')

        if s:head != ''
            let s:head = g:sigma#branch_symbol .. ' ' .. s:head
        endif

        return s:head
    endif
endfunction

function! sigma#hunks()
    if sigma#is_enabled('sineto/lightline-hunks')
        return '' " hunks are already returned from sigma#head in this case
    elseif sigma#is_enabled('lewis6991/gitsigns.nvim')
        return get(b:, 'gitsigns_status', '')
    endif
endfunction
