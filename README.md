# MultisampledNight's colorscheme collection

All of my colorschemes in one repository, bundled and small.

## Colorschemes

Chronologically sorted, newest first.


## Installation

Setup is almost identical to any other plugin, just use your favorite plugin
manager. For example, using vim-plug:

```vim
Plug 'MultisampledNight/colorschemes'
```

Unfortunately plugins are loaded *after* the init script, but this plugin performs
some `runtimepath` hacking in order to have Vim even find these colorschemes.
This basically means, load your colorscheme in the `VimEnter` autocmd and not directly:

```
autocmd VimEnter * colorscheme abnormalize
```

## Other programs

Most colorschemes also have themes for programs which are not (Neo)Vim:

- Alacritty

	Include the `alacritty-colors.yml` the colorscheme directory contains in your
	config.

- Firefox
	
	Install the Firefox Color extension and open the respective link in the
	colorscheme readme.

## Programmatic usage

All colorschemes (except `samplednight` and `silentmission`) have a JSON file
in `source`, which contains all color definitions. Only `rgb` is ensured to be
defined, where `background` is always contained and `foreground` is always
contained. Some additionally contain `comment`, `lch` and `hsp` sections.

## FAQ

- A lot of those colorschemes contain repetition. Couldn't you generate them
	automatically or use one basic "meta-scheme" to build upon?

	That'd be possible, but take quite some time and thought to define because
	every colorscheme has a different take on what's important. Some don't have
	any tertiary color, some might have more than one highlight color, some might
	want to define non-focused areas the same way as focused ones.

<!--
  vim: tw=80
-->
