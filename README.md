# MultisampledNight's colorscheme collection

All of my colorschemes in one repository, bundled and small.

## Colorschemes

Chronologically sorted, newest first.


### abnormalize

Fresh, clean, green-blue-cyan, aggressive.

![abnormalize color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/abnormalize/source/morphtype.png)

### white-on-black

You probably _don't_ want to use this. Neutral.

![white-on-black color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/abnormalize/source/morphtype.png)

### morphtype

Consistent, context-aware, contrastful, direct.

![morphtype color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/morphtype/source/morphtype.png)

### unsweetened

Solid, distinct, friendly, demandful.

![unsweetened color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/unsweetened/source/morphtype.png)

### silentmission

Retro, calm, thrusting.

![silentmission color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/silentmission/source/morphtype.png)

### samplednight

Flashing, sharp, literally unreadable.

![samplednight color showcase](https://raw.githubusercontent.com/MultisampledNight/colorschemes/main/samplednight/source/morphtype.png)

Used setup:

- Font: CamingoCode
- Neovim GUI: Neovide
- HiDPI scale: 2

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

- Firefox
	
	Install the Firefox Color extension and open the respective link in the
	colorscheme readme.

Else, just generate it yourself with your favorite base16 builder.

## Programmatic usage

These colorschemes use [base16](https://github.com/chriskempson/base16), which
allows me to write my colorscheme once and have it automatically applied
everywhere. All colorschemes are defined in the manner of
`schemes/theme-name/theme-name.yaml` in casual YAML files. Some might contain
additional versions with `base00`-`base07` being a full range from dark to
light ("fullrange"), or have `base08-base0F` ordered ("hueordered").

## FAQ

- How can I "rebuild" the Vim colorscheme after modifying a colorscheme source?

	See `utils/regenerate`, which can be executed from anywhere in this directory.
	It requires `git` and
	[`pybase16`](https://github.com/InspectorMustache/base16-builder-python) to be
	installed (protip: use `pip` on the repo).

- What steps do I need to take to add a new colorscheme?

	First: I store only my colorschemes here. Probably you want to make your own
	repository with your own thoughts on structure and design.

	- Add it to `.gitignore` both under `schemes` and `colors`, following already
		existing entries
	- Create `schemes/theme-name/theme-name.yaml` following [the base16
	  spec](https://github.com/base16-project/base16/blob/main/styling.md)
	- Run `utils/regenerate`

<!--
  vim: tw=80
-->
