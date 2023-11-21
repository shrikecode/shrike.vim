# ShrikeVim

![ShrikeVim dashboard](https://i.imgur.com/TmrPNgz.png)

<!-- markdown-toc start - Don't edit this section. Run M-x
markdown-toc-refresh-toc --> **Table of Contents**

- [ShrikeVim](#shrikevim)
- [Why another Vim distribution](#why-another-vim-distribution)
- [What is ShrikeVim](#what-is-shrikevim)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Configuration](#configuration)
- [FZF](#fzf)
- [lazygit](#lazygit)
- [Overriding configuration](#overriding-configuration)
- [Plugins](#plugins)
- [Extra functions](#extra-functions)
- [LSP](#lsp)
- [Default plugins](#default-plugins)
- [Keybindings](#keybindings)
- [Features](#features)
- [Known issues](#known-issues)
- [Cursor line gets lost](#cursor-line-gets-lost)
- [Roadmap](#roadmap)

<!-- markdown-toc end -->

## Why another Vim distribution

First of all, most of "Vim" distros, are Neovim distros. ShrikeVim is an actual
Vim distribution (if we want to call it like this).

Most of these distributions are pretty complex,  and happen to be a pain to
actually replace some base plugins.

## What is ShrikeVim

ShrikeVim is meant to be simple. It uses vim-plug as plugin manager, which is
also wrapped in shrike#add, shrike#remove and shrike#init functions, which
allows full control over what plugins from base set are actually used.

ShrikeVim comes with sane (or maybe opinionated?) defaults and utilities to make
your vimrc as small and readable as possible.

ShrikeVim comes with kyotonight.vim theme, which might easily be changed to any
theme of your choice. There is also a plan of adding a possibility to create
your own colorscheme providing just color palette.

ShrikeVim uses fzf which powers all the fuzzy finding in the default config.
Check the recommended config section for FZF.

ShrikeVim uses nnn as file picker and file browser in place of netrw, it also
doesn't provide any file-tree plugin.

Rationale for this choices is just... keeping it simple. Use the same tools
inside of Vim which you would use outside of Vim. Fzf is great all around fuzzy
finder. Nnn is a full blown, fully functional file manager.  No file browser
plugin can compare with that. And again, it's a tool for everyday use, not just
in Vim.

If you prefer different workflow, replacing nnn.vim with a file-tree plugin of
choice is just removing one plugin, adding another one, and replacing 2 remaps.
You can also add a file-tree plugin on top of nnn, so you might just want to
replace only one remap, `<C-n>` with toggling your file-tree.

ShrikeVim comes with vim-fugitive, but it's solely for hunks in lightline.
Intended git workflow is using lazygit in a kitty, tmux or Vim terminal pane
opened by `<leader>gg` keybinding. It follows the same rationale of using tools
usable outside of Vim, but you can easily install / use your preferred plugin
for git, as the actual lazygit integration in ShrikeVim is this single
keybinding for opening lazygit in current working directory. There's no plugin
for that in the base set.

In the end, you might always take parts of ShrikeVimRc as inspiration for making
your own config, which is also a valid use case for this little project. :)

## Dependencies

- [NerdFont](https://github.com/ryanoasis/nerd-fonts)
- [Fzf](https://github.com/junegunn/fzf) (All the fuzzy finding)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (For Fzf default config in
    ShrikeVim)
- [fd](https://github.com/sharkdp/fd) (Also for Fzf)
- [npm](https://github.com/npm/cli) (For coc.nvim)
- [kitty](https://github.com/kovidgoyal/kitty) or
    [tmux](https://github.com/tmux/tmux) (optional)
- [lazygit](https://github.com/jesseduffield/lazygit) (For... lazygit
    integration)
- [python3](https://www.python.org/) (Ultisnips)

## Installation

Install vim-plug first:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install ShrikeVimRc:

```sh
curl -fLo ~/.vim/autoload/shrike.vim --create-dirs \
    https://raw.githubusercontent.com/shrikecode/shrike.vim/main/autoload/shrike.vim
```

## Configuration

To use the default ShrikeVimRc just add this line to your .vimrc:

```vim
call shrike#init()
```

### FZF

Recommended options for fzf are as follows:

```sh
# fzf default command
export FZF_DEFAULT_COMMAND="rg -g '!{.git,node_modules,.composer}/' --hidden --no-ignore -l ''"
# fzf theming
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#a9b1d6,bg:#1a1b26,hl:#7aa2f7 --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff --color=info:#cfc9c2,prompt:#f7768e,pointer:#bb9af7 --color=marker:#9ece6a,spinner:#bb9af7,header:#73daca'
```

You should put it in your shell configuration (.bashrc/.zshrc or
.profile/.zshenv)

If Vim is started by `-e` option of terminal emulator, it might not inherit your
shell env, so you might need to add the same options in your .vimrc:

```vim
let $FZF_DEFAULT_COMMAND = "rg -g '!{.git,node_modules,.composer}/' --hidden --no-ignore -l ''"
let $FZF_DEFAULT_OPTS = '--color=fg:#a9b1d6,bg:#1a1b26,hl:#7aa2f7 --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff --color=info:#cfc9c2,prompt:#f7768e,pointer:#bb9af7 --color=marker:#9ece6a,spinner:#bb9af7,header:#73daca'
```

Should you want to customize your fzf theme, e.g. to match colorscheme you've
chosen instead of the default kyotonight.vim (why would you do that? :( ) check
out [this site](https://minsw.github.io/fzf-color-picker/).

### lazygit

Only thing that is needed here is having lazygit installed. The `<leader>gg`
keybinding pulls up a pane with lazygit in current working directory.

### Overriding configuration

To override default ShrikeVim configuration... just set your configuration
changes after calling shrike#init function. That includes plugin configurations.

### Plugins

To remove a plugin:

```vim
call shrike#remove('plugin/name')
```

Add a plugin:

```vim
call shrike#add('plugin/name', {'branch': 'master'}) " optional params
```

These functions need to be called **BEFORE** *shrike#init*.

### Extra functions

- shrike#run - opens a split in kitty or tmux, running a supplied command in
    current working directory, or if no command is supplied it just opens the
    terminal. If Vim is run in an unsupported terminal, it just opens Vim
    terminal

1. Examples

    ```vim
    " Run lazygit in current working directory
    nnoremap <silent><leader>gg <Cmd>call shrike#run("lazygit -p")<CR>
    " Open terminal in current working directory
    nnoremap <silent><leader>tt <Cmd>call shrike#run()<CR>
    ```

### LSP

ShrikeVim provides a choice to include CoC.  To use it, put this **BEFORE**
calling `shrike#init` function:

```vim
let g:shrike#use_coc = 1
```

ShrikeVim also provides its custom CoC diagnostics support for lightline.

## Default plugins

- [shrikecode/kyotonight.vim](https://github.com/shrikecode/kyotonight.vim)
- [shrikecode/skeleton.vim](https://github.com/shrikecode/skeleton.vim)
- [tpope/vim-abolish](https://github.com/tpope/vim-abolish)
- [tpope/vim-vinegar](https://github.com/tpope/vim-vinegar)
- [leafOfTree/vim-project](https://github.com/leafOfTree/vim-project)
- [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
- [mbbill/undotree](https://github.com/mbbill/undotree)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [BourgeoisBear/clrzr](https://github.com/BourgeoisBear/clrzr)
- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [mengelbrecht/lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline)
- [sineto/lightline-hunks](https://github.com/sineto/lightline-hunks)
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [junnegunn/fzf.vim](https://github.com/junnegunn/fzf.vim)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [junegunn/vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
- [machakann/vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)
- [honza/vim-snippets](https://github.com/honza/vim-snippets)
- [neoclice/coc.nvim](https://github.com/neoclice/coc.nvim)

## Keybindings

Check
[shrike#mappings()](https://github.com/shrikecode/shrike.vim/blob/master/autoload/shrike.vim#L47)
function, and also review some of the default mappings of listed plugins.

Some of them might've been borrowed from NvChad or ThePrimeagen.

## Features

- Dashboard with useful shortcuts
- Good looking, easy on the eyes theme
- Code commenting plugins
- Simple project management
- Privilege elevating when editing system config
- Fuzzy finder
- Fancy yet useful status and bufferline
- Autocompletion and snippets
- LSP support
- Undotree
- Better file manager
- Easy shortcuts to lazygit and full fledged terminal (kitty or tmux required)
- Auto-save
- Easy to configure remote sync
- Better search and replace
- Color strings highlighting
- Clipboard history picker

## Known issues

### Cursor line gets lost

For some reason `nocursorline` option gets set **sometimes**. I haven't tracked
the issue yet. A workaround (if you want cursorline that is) is adding following
autocmd to your init.vim:

```vim
autocmd FileType * if &ft != 'startify' && &ft != 'dashboard' | :set cursorline | endif
```

## Roadmap

- [x] Add screenshots
- [x] Documentation (and default keybindings info)
- [x] Figure out a way for vim-plug to manage ShrikeVimRc or let it manage
    itself
- [x] Features explanation
- [x] Add vim-signify / gitsigns support for lightline
- [ ] Dynamic theme plugin
- [x] New installation method (bootstrap ShrikeVim and let vim-plug manage the
    full plugin)
- [x] Remove all Neovim specific stuff
