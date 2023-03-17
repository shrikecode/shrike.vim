# SigmaVimRc

<!--toc:start-->
- [SigmaVimRc](#sigmavimrc)
  - [BREAKING](#breaking)
  - [Why another Vim distribution](#why-another-vim-distribution)
  - [What is Sigma](#what-is-sigma)
  - [Dependencies](#dependencies)
  - [Installation](#installation)
  - [Configuration](#configuration)
    - [FZF](#fzf)
    - [nnn](#nnn)
    - [lazygit](#lazygit)
    - [Overriding configuration](#overriding-configuration)
    - [Plugins](#plugins)
    - [Extra functions](#extra-functions)
    - [LSP](#lsp)
  - [Default plugins](#default-plugins)
  - [Keybindings](#keybindings)
  - [Features](#features)
  - [Known issues](#known-issues)
    - [Cursor line gets lost in Neovim](#cursor-line-gets-lost-in-neovim)
  - [Roadmap](#roadmap)
<!--toc:end-->

![](https://imgur.com/yGA7GRN.png)

![](https://imgur.com/4oOuxJ7.png)

## BREAKING

Neovim support will be dropped in favor of new Lua-only
[Sigma.nvim](https://github.com/wmwnuk/sigma.nvim), and SigmaVimRc will
go into maintenance mode.

You might have already seen NvChad, but you use Vim or want a simpler
config and be a Chad too? SigmaVimRC was made for you.

```sh
............................................................
............................... ... ........................
..................... ......'...,,.... .....................
...................  ..'''''',''';;;;'......................
................... ..',,;:::cclodxxdo;.....................
..................  ...''',,,;:ccllllc;.....................
..................   ...',;::::clllcc:,.....................
................... .... ............','....................
......................      ...      ..',,..................
......................... ...:;.....',,'....................
...................  .......'cl,.'......''..................
...................    ...........'..  .....................
...................             ....   .....................
...................           ...  .    ....................
.....................                 ......................
.....................                .......................
.....................               ...''...................
....................               ....';::,................
................'...              ....'';:clool:,...........
..........',,''.....             ....',;:ccccloodddl;.......
.......,;;;;,''......           ..',;:cloooooodoooodddl;'...
',,,;;:::;;;;,''''....         ...';:clloloooooddoodxxxxdddd
;:::::::::;;;,,,''...............';:cllllcllloooodddddddddoo
;;;;;;;;;;;;;;,,,'''......'''....',;::cccccllllllllllllllllc
,,,,,,,,,;;;;;;;,,,,,,,,,,,,;'...'',;:::ccllllllllccc::;;;;;
....'',,,,,,;;;;;;;;;;;;;;;;;,..',,;;:::cclllccccc::;;,''.''
......'''',,,,,;;;;;;;;;;;;::'..'',;;::::ccccc::::;,,,'.....
. ........'''',,,;;;;;;;;,;;;....'',,,;;;;;;;;;;,,,''....   
   ...........'',,,,,,;;;;;;;.....'''',,,,,,''''........    
    ............''''''''''''.............'............
```

## Why another Vim distribution

First of all, most of "Vim" distros, are Neovim distros. Sigma is
compatible with Vim and Neovim.

Most of these distributions are pretty complex, and usually require some
Lua knowledge, and happen to be a pain to actually replace some base
plugins.

## What is Sigma

Sigma is meant to be simple. It uses vim-plug as plugin manager, which
is also wrapped in sigma#add, sigma#remove and sigma#init functions,
which allows full control over what plugins from base set are actually
used.

Sigma comes with sane (or maybe opinionated?) defaults and utilities to
make your vimrc (or init.vim) as small and readable as possible.

Sigma comes with kyotonight.vim theme, which might easily be changed to
any theme of your choice. There is also a plan of adding a possibility
to create your own colorscheme providing just color palette.

Sigma uses fzf which powers all the fuzzy finding in the default config.
Check the recommended config section for FZF.

Sigma uses nnn as file picker and file browser in place of netrw, it
also doesn\'t provide any file-tree plugin.

Rationale for this choices is just... keeping it simple. Use the same
tools inside of Vim which you would use outside of Vim. Fzf is great all
around fuzzy finder, unlike Telescope which might be amazing, but it's
Neovim only plugin. Nnn is a full blown, fully functional file manager.
No file browser plugin can compare with that. And again, it\'s a tool
for everyday use, not just in Vim.

If you prefer different workflow, replacing nnn.vim with a file-tree
plugin of choice is just removing one plugin, adding another one, and
replacing 2 remaps. You can also add a file-tree plugin on top of nnn,
so you might just want to replace only one remap, <C-n> with toggling
your file-tree.

If you don't want fzf, there would be a lot more changes to do, and it
might miss the point of making your init.vim simple, as there would be
at least dozen remaps to replace, and Telescope, which seems an only
alternative here, requires a bunch of plugins and configuration to
replicate what SigmaVimRc offers. So, if you just hate fzf or love
Telescope, you might give Sigma and fzf a chance, but if you'd still
want Telescope, NvChad might be a better choice.

Vim version of Sigma comes with vim-fugitive, but it's solely for hunks
in vim-airline. Intended git workflow is using lazygit in a kitty / tmux
pane opened by <leader>gg keybinding. Follows the same rationale of
using tools usable outside of Vim, but you can easily install / use your
preferred plugin for git... as the actual lazygit integration in Sigma
is this single keybinding for opening lazygit in current working
directory. There's no plugin for that in the base set.

In the end, you might always take parts of SigmaVimRc as inspiration for
making your own config, which is also a valid use case for this little
project. :)

## Dependencies

- [NerdFont](https://github.com/ryanoasis/nerd-fonts) (Sauce Code Pro
    Nerd Font is the default guifont)
- [Fzf](https://github.com/junegunn/fzf) (All the fuzzy finding)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (For Fzf default
    config in Sigma)
- [fd](https://github.com/sharkdp/fd) (Also for Fzf)
- [nnn](https://github.com/jarun/nnn) (Default file picker, might be
    disabled / replaced)
- [npm](https://github.com/npm/cli) (For coc.nvim / lsp)
- [kitty](https://github.com/kovidgoyal/kitty) or
    [tmux](https://github.com/tmux/tmux) (For sigma#run support /
    lazygit integration)
- [lazygit](https://github.com/jesseduffield/lazygit) (For... lazygit
    integration)
- [python3](https://www.python.org/) (Ultisnips)

## Installation

Install vim-plug first:

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install SigmaVimRc:

```sh
curl -fLo ~/.vim/autoload/sigma.vim --create-dirs \
    https://raw.githubusercontent.com/voidekh/SigmaVimRc/master/autoload/sigma.vim
```

## Configuration

To use the default SigmaVimRc just add this line to your .vimrc:

```vim
call sigma#init()
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

If Vim is started by \'-e\' option of terminal emulator, it might not
inherit your shell env, so you might need to add the same options in
your .vimrc/init.vim:

```vim
let $FZF_DEFAULT_COMMAND = "rg -g '!{.git,node_modules,.composer}/' --hidden --no-ignore -l ''"
let $FZF_DEFAULT_OPTS = '--color=fg:#a9b1d6,bg:#1a1b26,hl:#7aa2f7 --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff --color=info:#cfc9c2,prompt:#f7768e,pointer:#bb9af7 --color=marker:#9ece6a,spinner:#bb9af7,header:#73daca'
```

Should you want to customize your fzf theme, e.g. to match colorscheme
you\'ve chosen instead of the default kyotonight.vim (why would you do
that? :( ) check out [this site](https://minsw.github.io/fzf-color-picker/).

### nnn

Since nnn file manager is a big part of intended SigmaVimRc workflow,
below is the recommended configuration (note: preview-tui plugin
requires kitty or tmux):

```sh
# nnn config
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_PLUG='p:/usr/share/nnn/plugins/preview-tui;f:/usr/share/nnn/plugins/fzopen'
```

Colors configuration should be quite universal, as it will use your
terminals colors, so if you use a theme matching your Vim colorscheme,
everything would look right. Also be sure to tweak the nnn plugins paths
to match the ones on your system. If nnn package on your system doesn\'t
come with its plugins, you can download them
[here](https://github.com/jarun/nnn/tree/master/plugins).

### lazygit

Only thing that is needed here is running Vim in kitty or tmux, and also
having lazygit installed. The <leader>gg keybinding pulls up a pane
with lazygit in current working directory.

### Overriding configuration

To override default Sigma configuration... just set your configuration
changes after calling sigma#init function. That includes plugin
configurations.

### Plugins

To remove a plugin:

```vim
call sigma#remove('plugin/name')
```

Add a plugin:

```vim
call sigma#add('plugin/name', {'branch': 'master'}) " optional params
```

These functions need to be called **BEFORE** *sigma#init*.

### Extra functions

- sigma#run - opens a split in kitty or tmux, running a supplied
    command in current working directory, or no command is supplied it
    just opens the terminal.

1.  Examples

    ```vim
    " Run lazygit in current working directory
    nnoremap <silent><leader>gg <Cmd>call sigma#run("lazygit -p")<CR>
    " Open terminal in current working directory
    nnoremap <silent><leader>tt <Cmd>call sigma#run()<CR>
    ```

### LSP

Sigma provides a choice to include ALE. To use it, put this **BEFORE** calling `sigma#init` function:

```vim
let g:sigma#use_ale = 1
```

## Default plugins

- [honza/vim-snippets](https://github.com/honza/vim-snippets)
- [907th/vim-auto-save](https://github.com/907th/vim-auto-save)
- [tpope/vim-abolish](https://github.com/tpope/vim-abolish)
- [eshion/vim-sync](https://github.com/eshion/vim-sync)
- [voidekh/kyotonight.vim](https://github.com/voidekh/kyotonight.vim)
- [leafOfTree/vim-project](https://github.com/leafOfTree/vim-project)
- [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
- [skywind3000/asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
- [mcchrish/nnn.vim](https://github.com/mcchrish/nnn.vim)
- [mbbill/undotree](https://github.com/mbbill/undotree)
- [dbeniamine/cheat.sh-vim](https://github.com/dbeniamine/cheat.sh-vim)
- [noahfrederick/vim-skeleton](https://github.com/noahfrederick/vim-skeleton)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [BourgeoisBear/clrzr](https://github.com/BourgeoisBear/clrzr)
- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- [mhinz/vim-signify](https://github.com/mhinz/vim-signify)
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
- [mengelbrecht/lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline)
- [junnegunn/fzf.vim](https://github.com/junnegunn/fzf.vim)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [junegunn/vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
- [dense-analysis/ale](https://github.com/dense-analysis/ale)
- [maximbaz/lightline-ale](https://github.com/maximbaz/lightline-ale)

## Keybindings

Check [sigma#mappings()](https://github.com/voidekh/SigmaVimRc/blob/master/autoload/sigma.vim#L47)
function, and also review some of the default mappings of listed
plugins.

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
- Nnn file manager integration
- Easy shortcuts to lazygit and full fledged terminal (kitty or tmux required)
- Auto-save
- Easy to configure remote sync
- Undotree
- Better search and replace
- Cheat.sh support
- Color strings highlighting
- Clipboard history picker

## Known issues

### Cursor line gets lost in Neovim

For some reason `nocursorline` option gets set **sometimes**. I
haven't tracked the issue yet. A workaround (if you want cursorline
that is) is adding following autocmd to your init.vim:

```vim
autocmd FileType * if &ft != 'startify' && &ft != 'dashboard' | :set cursorline | endif
```

## Roadmap

- [x] Add screenshots
- [x] Documentation (and default keybindings info)
- [x] Figure out a way for vim-plug to manage SigmaVimRc or let it
    manage itself
- [x] Features explanation
- [x] Add vim-signify / gitsigns support for lightline
- [ ] Dynamic theme plugin
- [x] New installation method (bootstrap SigmaVimRc and let vim-plug
    manage the full plugin)
- [x] Replace coc.nvim with ALE or vim-lsp
- [x] Remove all Neovim specific stuff
- [ ] Ultisnips
