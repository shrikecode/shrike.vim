"    _____ __         _ __      _    ___
"   / ___// /_  _____(_) /_____| |  / (_)___ ___
"   \__ \/ __ \/ ___/ / //_/ _ \ | / / / __ `__ \
"  ___/ / / / / /  / / ,< /  __/ |/ / / / / / / /
" /____/_/ /_/_/  /_/_/|_|\___/|___/_/_/ /_/ /_/
"
" autoload/shrike.vim
" Main ShrikeVimRc file

let g:shrike#plugins = {
            \ 'shrikecode/shrike.vim': {'branch': 'main', 'do': ':ShrikeUpdate'},
            \ 'shrikecode/kyotonight.vim': {'tag': 'v1.0.0'},
            \ 'shrikecode/skeleton.vim': {'tag': 'v1.0.2'},
            \ 'lambdalisue/suda.vim': {'tag': 'v1.0.1'},
            \ 'tpope/vim-abolish': {'commit': 'dcbfe06'},
            \ 'tpope/vim-vinegar': {'commit': 'bb1bcdd'},
            \ 'leafOfTree/vim-project': {'commit': 'dd9362d'},
            \ 'mbbill/undotree': {'commit': '3ff3aa0'},
            \ 'junegunn/fzf.vim': {'commit': 'd1016db'},
            \ 'mhinz/vim-startify': {'commit': '4e089df'},
            \ 'itchyny/lightline.vim': {'commit': 'f11645c'},
            \ 'mengelbrecht/lightline-bufferline': {'commit': '7185083'},
            \ 'tpope/vim-fugitive': {'commit': 'cbe9dfa'},
            \ 'sineto/lightline-hunks': {'commit': 'ee54805'},
            \ 'tpope/vim-commentary': {'commit': 'e87cd90'},
            \ 'ryanoasis/vim-devicons': {'commit': '71f239a'},
            \ 'airblade/vim-gitgutter': {'commit': 'f7b9766'},
            \ 'BourgeoisBear/clrzr': {'tag': 'v1.8.2'},
            \ 'junegunn/vim-peekaboo': {'commit': 'cc4469c'},
            \ 'machakann/vim-highlightedyank': {'commit': 'fa3f57b'},
            \ 'liuchengxu/vim-which-key': {'commit': '08cf520'},
            \ }

function! shrike#remove(plugin)
    let g:shrike#plugins[a:plugin] = 0
endfunction

function! shrike#add(plugin, config = 1, no_override = 0)
    if a:no_override == 1 && has_key(g:shrike#plugins, a:plugin)
        return
    elseif type(a:config) == v:t_dict
        let g:shrike#plugins[a:plugin] = a:config
    else
        let g:shrike#plugins[a:plugin] = 1
    endif
endfunction

function! shrike#is_enabled(plugin)
    return has_key(g:shrike#plugins, a:plugin) && (type(g:shrike#plugins[a:plugin]) == v:t_dict || g:shrike#plugins[a:plugin] != 0)
endfunction

function! shrike#mappings()
    " Mappings
    if shrike#is_enabled('liuchengxu/vim-which-key')
        nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
    endif

    nnoremap <leader>pp <Cmd>ProjectList<CR>
    nnoremap <leader>fb <Cmd>NnnPicker<CR>

    nnoremap <Esc> <Cmd>noh<CR>
    nnoremap <leader>uc <Cmd>PlugClean<CR>
    nnoremap <leader>up <Cmd>PlugUpdate<CR>
    nnoremap <leader>uv <Cmd>PlugUpgrade<CR>
    nnoremap <leader>us <Cmd>ShrikeUpdate<CR>

    nnoremap <leader>ff <Cmd>ShrikeFiles<CR>
    nnoremap <leader>fb <Cmd>Ex<CR>
    nnoremap <leader>fr <Cmd>ShrikeRecentFiles<CR>
    nnoremap <leader>rg <Cmd>ShrikeRg<CR>
    nnoremap <leader>fP <Cmd>ShrikeConfig<CR>


    if shrike#is_enabled('mhinz/vim-startify')
        nnoremap <leader>ss <Cmd>ShrikeDashboard<CR>
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
        nnoremap <silent><leader>gg <Cmd>call shrike#run("lazygit")<C-j><CR>
    else
        nnoremap <silent><leader>gg <Cmd>call shrike#run("lazygit -p")<C-j><CR>
    endif

    nnoremap <silent><leader>tt <Cmd>call shrike#run()<C-j><CR>

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
    if shrike#is_enabled('mengelbrecht/lightline-bufferline')
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

    if g:shrike#use_coc == 1
        call shrike#coc#mappings#init()
    endif
endfunction

function! shrike#config()
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

    " suda.vim
    let g:suda_smart_edit = 1


    " kyotonight.vim
    let g:kyotonight_italic = 1
    let g:kyotonight_italic_comments = 1

    " skeleton.vim
    let g:shrike_skeleton_fill = 1

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
                \		'gitbranch': 'shrike#head'
                \	}
                \ }
    if g:shrike#use_coc == 1
        call shrike#coc#lsp#init()
        call shrike#coc#line#register()
        let g:lightline.active.left = [
                    \ [ 'mode', 'paste'], [ 'gitbranch'],
                    \ [ 'coc_status', 'coc_errors', 'coc_warnings', 'coc_hints', 'coc_infos' ],
                    \ [ 'readonly', 'filename', 'modified' ]
                    \ ]
    endif

    if shrike#is_enabled('mengelbrecht/lightline-bufferline')
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

    if shrike#is_enabled('sineto/lightline-hunks')
        let g:lightline#hunks#exclude_filetypes = [ 'startify' ]
    endif

    " startify
    if shrike#is_enabled('mhinz/vim-startify')
        let g:startify_custom_header = [
        \ "    _____ __         _ __      _    ___",
        \ "   / ___// /_  _____(_) /_____\| \|  / (_)___ ___",
        \ "   \\__ \\/ __ \\/ ___/ / //_/ _ \\ | / / / __ `__ \\",
        \ "  ___/ / / / / /  / / ,< /  __/ |/ / / / / / / /",
        \ " /____/_/ /_/_/  /_/_/|_|\\___/|___/_/_/ /_/ /_/",
        \ " "
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
                    \ {'r': ['󰋚  Recent files      SPC f r', 'ShrikeRecentFiles']},
                    \ {'f': ['  Find files        SPC f f', 'ShrikeFiles']},
                    \ {'n': ['  File browser      SPC f b', 'NnnPicker']},
                    \ {'z': ['󰈞  Find word         SPC r g', 'ShrikeRg']},
                    \ {'s': ['  Update ShrikeVim  SPC u s', 'ShrikeUpdate']},
                    \ {'u': ['  Update plugins    SPC u p', 'PlugUpdate']},
                    \ {'c': ['  Configure         SPC f P', 'ShrikeConfig']},
                    \ ]
    endif

    call shrike#mappings()

    " Autocmd
    autocmd BufWritePost * :call SyncUploadFile()
    autocmd FileType org :set cc=80
    autocmd FileType markdown :set cc=80

    if shrike#is_enabled('shrikecode/skeleton.vim')
        call system('mkdir -p ~/.vim/templates')
    endif

endfunction

function! shrike#update()
    execute "!curl -fLo ~/.vim/autoload/shrike.vim --create-dirs https://raw.githubusercontent.com/shrikecode/shrike.vim/main/autoload/shrike.vim"
endfunction

function! shrike#default_plugins()
    let g:shrike#use_coc = get(g:, 'shrike#use_coc', 0)
    let s:enable = 1
    let s:no_override = 1
    if (g:shrike#use_coc == 1)
        call shrike#add('neoclide/coc.nvim', {'branch': 'release'}, s:no_override)
        call shrike#add('honza/vim-snippets', s:enable, s:no_override)
    endif
endfunction

function! shrike#init()
    call shrike#default_plugins()

    call plug#begin()

    for [key, value] in items(g:shrike#plugins)
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
    
    call shrike#config()

    command! ShrikeUpdate :call shrike#update()

    command!                ShrikeRecentFiles    :History
    command!                ShrikeFiles          :Files
    command! -bang -nargs=* ShrikeRg             :call fzf#vim#grep("rg -g '!{.git,node_modules}/' --hidden --no-ignore --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
    command!                ShrikeConfig         :e ~/.vimrc

    if shrike#is_enabled('mhinz/vim-startify')
        command! ShrikeDashboard :Startify
    endif
endfunction

function! shrike#run(command = '', split = 'h')
    if $TERM == 'xterm-kitty'
        execute "!kitty @ launch " a:command getcwd()
    elseif $TMUX != ''
        execute "!tmux split-window -" . a:split "-c" getcwd() a:command
    else
        execute "term " .. a:command
    endif
endfunction

function! shrike#head()
    if shrike#is_enabled('sineto/lightline-hunks')
        return lightline#hunks#composer()
    endif

    return ''
endfunction
