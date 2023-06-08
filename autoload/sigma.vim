"    _____ _                      _    ___           ____
"   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
"   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
"  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
" /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
"        /____/
" autoload/sigma.vim
" Main SigmaVimRc file

let g:sigma#plugins = {
            \ 'sigmavim/vimrc': {'branch': 'next', 'do': ':SigmaUpdate'},
            \ 'sigmavim/kyotonight': {'tag': 'v1.0.0'},
            \ 'sigmavim/skeleton': {'tag': 'v1.0.2'},
            \ '907th/vim-auto-save': {'commit': '2e3e54e'},
            \ 'eshion/vim-sync': {'commit': '8456c14'},
            \ 'skywind3000/asyncrun.vim': {'tag': '2.11.16'},
            \ 'lambdalisue/suda.vim': {'tag': 'v0.4.1'},
            \ 'tpope/vim-abolish': {'commit': 'cb3dcb2'},
            \ 'mcchrish/nnn.vim': {'commit': 'e0104e3'},
            \ 'leafOfTree/vim-project': {'commit': 'f6aa4e8'},
            \ 'mbbill/undotree': {'commit': '485f01e'},
            \ 'junegunn/fzf.vim': {'commit': '5d87ac1'},
            \ 'mhinz/vim-startify': {'commit': '81e36c3'},
            \ 'itchyny/lightline.vim': {'commit': 'b1e91b4'},
            \ 'mengelbrecht/lightline-bufferline': {'commit': '7185083'},
            \ 'tpope/vim-fugitive': {'commit': '5f0d280'},
            \ 'sineto/lightline-hunks': {'commit': 'ee54805'},
            \ 'tpope/vim-commentary': {'commit': 'e87cd90'},
            \ 'ryanoasis/vim-devicons': {'commit': '71f239a'},
            \ 'airblade/vim-gitgutter': {'commit': 'e2056e5'},
            \ 'BourgeoisBear/clrzr': {'tag': 'v1.8.2'},
            \ 'junegunn/vim-peekaboo': {'commit': 'cc4469c'},
            \ 'machakann/vim-highlightedyank': {'commit': 'fa3f57b'},
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
    return has_key(g:sigma#plugins, a:plugin) && (type(g:sigma#plugins[a:plugin]) == v:t_dict || g:sigma#plugins[a:plugin] != 0)
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

    if $TERM != 'xterm-kitty'
        nnoremap <silent><leader>gg <Cmd>call sigma#run("lazygit")<C-j><CR>
    else
        nnoremap <silent><leader>gg <Cmd>call sigma#run("lazygit -p")<C-j><CR>
    endif

    nnoremap <silent><leader>tt <Cmd>call sigma#run()<C-j><CR>

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

    if g:sigma#use_coc == 1
        call sigma#coc#mappings#init()
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

    " sigma-skeleton
    let g:sigma_skeleton_fill = 1

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
                \		'gitbranch': 'sigma#head'
                \	}
                \ }
    if g:sigma#use_coc == 1
        call sigma#coc#lsp#init()
        call sigma#coc#line#register()
        let g:lightline.active.left = [
                    \ [ 'mode', 'paste'], [ 'gitbranch'],
                    \ [ 'coc_status', 'coc_errors', 'coc_warnings', 'coc_hints', 'coc_infos' ],
                    \ [ 'readonly', 'filename', 'modified' ]
                    \ ]
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
    let g:sigma#use_coc = get(g:, 'sigma#use_coc', 0)
    let s:enable = 1
    let s:no_override = 1
    if (g:sigma#use_coc == 1)
        call sigma#add('neoclide/coc.nvim', {'branch': 'release'}, s:no_override)
        call sigma#add('honza/vim-snippets', s:enable, s:no_override)
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

    command!                SigmaRecentFiles    :History
    command!                SigmaFiles          :Files
    command! -bang -nargs=* SigmaRg             :call fzf#vim#grep("rg -g '!{.git,node_modules}/' --hidden --no-ignore --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
    command!                SigmaConfig         :e ~/.vimrc

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
        execute "term " .. a:command
    endif
endfunction

function! sigma#head()
    if sigma#is_enabled('sineto/lightline-hunks')
        return lightline#hunks#composer()
    endif

    return ''
endfunction
