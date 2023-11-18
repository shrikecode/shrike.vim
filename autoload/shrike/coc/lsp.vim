"    _____ __         _ __      _    ___
"   / ___// /_  _____(_) /_____| |  / (_)___ ___
"   \__ \/ __ \/ ___/ / //_/ _ \ | / / / __ `__ \
"  ___/ / / / / /  / / ,< /  __/ |/ / / / / / / /
" /____/_/ /_/_/  /_/_/|_|\___/|___/_/_/ /_/ /_/
"
" autoload/shrike/coc/lsp.vim
" ShrikeVim CoC LSP

function! shrike#coc#lsp#init()
    set encoding=utf-8
    set nobackup
    set nowritebackup
    set updatetime=300
    set signcolumn=yes

    augroup mygroup
        autocmd!
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    autocmd CursorHold * silent call CocActionAsync('highlight')

    command! -nargs=0 Format :call CocActionAsync('format')
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
endfunction

function! shrike#coc#lsp#show_documentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

function! shrike#coc#lsp#check_backspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
