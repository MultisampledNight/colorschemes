# MultisampledNight's colorscheme collection

All of my colorschemes in one repository, bundled and small.

## Colorschemes

Chronologically sorted, newest first.


### abnormalize

Fresh, clean, green-blue-cyan, aggressive.

### white-on-black

You probably _don't_ want to use this. Neutral.

### morphtype

Consistent, context-aware, contrastful, direct.

### unsweetened

Solid, distinct, friendly, demandful.

### silentmission

Retro, calm, thrusting.

### samplednight

Flashing, sharp, literally unreadable.

#### Used setup:

- Font: CamingoCode
- Neovim GUI: Neovide
- HiDPI scale: 2

## Installation

Setup is almost identical to any other plugin, just use your favorite plugin
manager. For example, using vim-plug:

```vim
Plug 'MultisampledNight/colorschemes'
```

Next you can load the colorschemes in here just like any other. Beware that I
use base16 though, so all colorschemes are prefixed with `base16`. Also the
`-alt` versions are optimized for Vim (for now, see below for more), so for
abnormalize the proper theme name is `base16-abnormalize-alt`.

## Other programs

Most colorschemes also have themes for programs which are not (Neo)Vim:

- Firefox
	
	Install the Firefox Color extension and open the respective link in the
	colorscheme readme.

Else, just generate it yourself with your favorite base16 builder.

## Programmatic usage + base16 specifics

These colorschemes base on [base16](https://github.com/chriskempson/base16), which
allows me to write my colorscheme once and have it automatically applied
everywhere. All colorschemes are defined in the manner of
`schemes/theme-name/theme-name.yaml` in casual YAML files. You want to use that.

There are a few things to note though.

- `base00`-`base07` being a full range from dark to light (
	`base06` and `base07` **not** being special), [this is actually
	off-spec](https://github.com/base16-project/base16/blob/099f69eebafa085105c4f49c8095491e565e66a8/styling.md)
	but many editors just interpret it like that anyways. `base00`-`base03` are
	background colors, other five are shades of the foreground (`base06` is the
	canonical foreground, `base07` is then even lighter than the foreground
	(assuming a dark scheme).
- `hueordered`: `base08-base0F` are ordered by hue, in ascending order.
	_Usually_ that ends up with `Red, Orange, Yellow, Green, Cyan, Blue, Purple,
	Magenta` but that's not necessarily true.

`theme-name-alt.yaml` is an alternative version of the colorscheme which
circumvents the issue of base16 not really specifying what colors _mean_ by
using red for cyan, for example. It also follows the actual base16 `base06`
and `base07` definitions, and is thought for older things like the Vim template.
The [base17](https://github.com/base16-project/base17) project is on their way
of fixing that behavior, so the `alt` "workaround" might only be temporary.

Some colorschemes are still in an old format with JSON files, I'm in the process
of converting those (with a script, since I'm not sure if I'm going to keep that
JSON workflow). The only real theme for now is abnormalize.

## FAQ

- How can I "rebuild" the Vim colorscheme after modifying a colorscheme source?

	See `utils/regenerate`, which can be executed from anywhere in this directory.
	It requires `git` and
	[`pybase16`](https://github.com/InspectorMustache/base16-builder-python) to be
	installed (protip: use `pip` on the repo).

- What steps do I need to take to add a new colorscheme?

	First: I store only my colorschemes here. Probably you want to make your own
	repository with your own thoughts on structure and design.

	- Create `schemes/theme-name/theme-name.yaml` following [the base16
	  spec](https://github.com/base16-project/base16/blob/main/styling.md)
	- Run `utils/regenerate`
	- ~~profit~~ You're done!

<!--
  vim: tw=80
-->
