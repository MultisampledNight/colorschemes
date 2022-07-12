# MultisampledNight's colorscheme collection

All of my colorschemes in one repository, bundled and small.


## Colorschemes

Chronologically sorted, newest first.

### abnormalize

Fresh, clean, green-blue-cyan, aggressive.

![abnormalize-rust](https://user-images.githubusercontent.com/80128916/178453652-6a4847a2-5530-4cf6-a70e-b46d2d4deb6c.png)
![abnormalize-python](https://user-images.githubusercontent.com/80128916/178453656-efb67c62-ca4c-4a1f-8e7a-969335b52e8a.png)
![abnormalize](https://user-images.githubusercontent.com/80128916/178453529-8066e971-dbbd-4994-abd0-caa4a3d64a5d.png)

### white-on-black

You probably _don't_ want to use this. Neutral.

![white-on-black-rust](https://user-images.githubusercontent.com/80128916/178453560-74f7af20-1db4-4620-8129-0bbd5660031b.png)
![white-on-black-python](https://user-images.githubusercontent.com/80128916/178453571-b2a30504-073a-47a6-98f8-5a374792133a.png)
![white-on-black](https://user-images.githubusercontent.com/80128916/178453506-a32039de-ae75-4178-9c51-72a9f4a098e9.png)

### morphtype

Consistent, context-aware, contrastful, direct.

![morphtype-rust](https://user-images.githubusercontent.com/80128916/178453643-ab1930ec-77e7-46fc-88c0-213f65ec567f.png)
![morphtype-python](https://user-images.githubusercontent.com/80128916/178453646-5a89cf2c-62fc-490d-93a1-21f65ca99413.png)
![morphtype](https://user-images.githubusercontent.com/80128916/178453525-0e8bdae9-f57c-4b5b-93e9-4bc822bff359.png)

### unsweetened

Solid, distinct, friendly, demandful.

![unsweetened-rust](https://user-images.githubusercontent.com/80128916/178453575-f3d72c89-a671-4aeb-9709-8067d54102a2.png)
![unsweetened-python](https://user-images.githubusercontent.com/80128916/178453582-459802f7-d89d-4a26-a10d-8d38d561efab.png)
![unsweetened](https://user-images.githubusercontent.com/80128916/178453512-99cd5a3e-5300-4ad0-9d63-79ff05108b80.png)

### silentmission

Retro, calm, thrusting.

![silentmission-rust](https://user-images.githubusercontent.com/80128916/178453597-de0d0120-2511-4de7-9be6-5e3be9518e51.png)
![silentmission-python](https://user-images.githubusercontent.com/80128916/178453606-c7e361ae-e098-4c38-aae7-3f3b0d85956c.png)
![silentmission](https://user-images.githubusercontent.com/80128916/178453516-016b599d-e2c9-45ff-bcaa-2497c5ad090f.png)

### samplednight

Flashing, sharp, literally unreadable.

![samplednight-rust](https://user-images.githubusercontent.com/80128916/178453610-20555a5e-6f88-4197-92c1-ce9157cdbf5e.png)
![samplednight-python](https://user-images.githubusercontent.com/80128916/178453634-ec42446c-e158-456d-9a3b-e5dbb9871904.png)
![samplednight](https://user-images.githubusercontent.com/80128916/178453522-4ff4cd07-1ada-4e09-889f-6943df44144f.png)

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
- `base08-base0F` are ordered by hue, in ascending order.
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
