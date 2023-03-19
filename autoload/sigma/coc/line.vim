"    _____ _                      _    ___           ____
"   / ___/(_)___ _____ ___  ____ | |  / (_)___ ___  / __ \_____
"   \__ \/ / __ `/ __ `__ \/ __ `/ | / / / __ `__ \/ /_/ / ___/
"  ___/ / / /_/ / / / / / / /_/ /| |/ / / / / / / / _, _/ /__
" /____/_/\__, /_/ /_/ /_/\__,_/ |___/_/_/ /_/ /_/_/ |_|\___/
"        /____/
" autoload/sigma/coc/line.vim
" SigmaVimRc CoC line
" Derived from: https://github.com/josa42/vim-lightline-coc/blob/master/autoload/lightline/coc.vim

let s:indicator = { 
            \ 'error': get(g:, 'sigma#coc#line#indicator_errors', ' '),
            \ 'warning': get(g:, 'sigma#coc#line#indicator_warnings', ' '),
            \ 'hint': get(g:, 'sigma#coc#line#indicator_hints', ' '),
            \ 'info': get(g:, 'sigma#coc#line#indicator_info', ' ')
            \ }

function! sigma#coc#line#errors()
    return s:get_coc('error')
endfunction

function! sigma#coc#line#warnings()
    return s:get_coc('warning')
endfunction

function! sigma#coc#line#hints()
    return s:get_coc('hint')
endfunction

function! sigma#coc#line#infos()
    return s:get_coc('info')
endfunction

function! sigma#coc#line#status()
  return get(g:, 'coc_status', '')
endfunction

function! sigma#coc#line#register() abort
  call s:setLightline('component_expand', 'coc_status', 'sigma#coc#line#status')
  call s:setLightline('component_expand', 'coc_errors', 'sigma#coc#line#errors')
  call s:setLightline('component_expand', 'coc_warnings', 'sigma#coc#line#warnings')
  call s:setLightline('component_expand', 'coc_info', 'sigma#coc#line#info')
  call s:setLightline('component_expand', 'coc_hints', 'sigma#coc#line#hints')

  call s:setLightline('component_type', 'coc_warnings', 'warning')
  call s:setLightline('component_type', 'coc_errors', 'error')
  call s:setLightline('component_type', 'coc_info', 'info')
  call s:setLightline('component_type', 'coc_hints', 'hint')

  call s:setLightline('component_function', 'coc_status', 'sigma#coc#line#status')
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
