"    _____ _                      _    ___           ____
"   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
"   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
"  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
" /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
"        /____/
" autoload/sigma/coc/lsp.vim
" SigmaVimRc CoC LSP

function! sigma#coc#lsp#init()
    set encoding=utf-8
    set nobackup
    set nowritebackup
    set updatetime=300
    set signcolumn=yes

    augroup mygroup
        autocmd!
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    function! sigma#coc#lsp#show_documentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction

    function! sigma#coc#lsp#check_backspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    autocmd CursorHold * silent call CocActionAsync('highlight')

    command! -nargs=0 Format :call CocActionAsync('format')
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
endfunction
