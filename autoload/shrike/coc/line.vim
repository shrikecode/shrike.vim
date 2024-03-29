"    _____ __         _ __      _    ___
"   / ___// /_  _____(_) /_____| |  / (_)___ ___
"   \__ \/ __ \/ ___/ / //_/ _ \ | / / / __ `__ \
"  ___/ / / / / /  / / ,< /  __/ |/ / / / / / / /
" /____/_/ /_/_/  /_/_/|_|\___/|___/_/_/ /_/ /_/
"
" autoload/shrike/coc/line.vim
" ShrikeVim CoC line
" Derived from: https://github.com/josa42/vim-lightline-coc/blob/master/autoload/lightline/coc.vim

let s:indicator = { 
            \ 'error': get(g:, 'shrike#coc#line#indicator_errors', '󰅚 '),
            \ 'warning': get(g:, 'shrike#coc#line#indicator_warnings', '󰀪 '),
            \ 'hint': get(g:, 'shrike#coc#line#indicator_hints', '󰌶 '),
            \ 'info': get(g:, 'shrike#coc#line#indicator_info', '󰋽 ')
            \ }

function! shrike#coc#line#errors()
    return s:get_coc('error')
endfunction

function! shrike#coc#line#warnings()
    return s:get_coc('warning')
endfunction

function! shrike#coc#line#hints()
    return s:get_coc('hint')
endfunction

function! shrike#coc#line#infos()
    return s:get_coc('info')
endfunction

function! shrike#coc#line#status()
  return get(g:, 'coc_status', '')
endfunction

function! shrike#coc#line#register() abort
  call s:setLightline('component_expand', 'coc_status', 'shrike#coc#line#status')
  call s:setLightline('component_expand', 'coc_errors', 'shrike#coc#line#errors')
  call s:setLightline('component_expand', 'coc_warnings', 'shrike#coc#line#warnings')
  call s:setLightline('component_expand', 'coc_infos', 'shrike#coc#line#infos')
  call s:setLightline('component_expand', 'coc_hints', 'shrike#coc#line#hints')

  call s:setLightline('component_type', 'coc_warnings', 'warning')
  call s:setLightline('component_type', 'coc_errors', 'error')
  call s:setLightline('component_type', 'coc_infos', 'info')
  call s:setLightline('component_type', 'coc_hints', 'hint')

  call s:setLightline('component_function', 'coc_status', 'shrike#coc#line#status')

  augroup shrike#coc#line
      autocmd!
      autocmd User CocDiagnosticChange call lightline#update()
      autocmd User CocStatusChange call lightline#update()
  augroup END
endfunction

function! s:get_coc(type) abort
    if s:isHidden()
        return 0
    endif

    let info =  get(b:, 'coc_diagnostic_info', {})
    let coc_count = get(info, a:type, 0)
    return coc_count == 0 ? '' : printf(s:indicator[a:type] . '%d', coc_count)
endfunction

function! s:isHidden()
    return exists('*lightline#sensible#isHidden') && lightline#sensible#isHidden()
endfunction

function! s:setLightline(scope, name, value) abort
    let g:lightline = get(g:, 'lightline', {})
    let g:lightline[a:scope] = get(g:lightline, a:scope, {})
    let g:lightline[a:scope][a:name] =  get(g:lightline[a:scope], a:name, a:value)
endfunction
