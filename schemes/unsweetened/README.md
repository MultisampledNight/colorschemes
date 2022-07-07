# unsweetened

And another Vim colorscheme that tries to fix issues that never existed. [(Firefox theme)](https://color.firefox.com/?theme=XQAAAAKZAgAAAAAAAABBqYhm849SCicxcUF-LXcGHf3p79EhVPbBRatwfC0dgUWzDSChmYusvMyAv0wWsBVLjbQJt2waNaoe9UQUVwvQlY3eXIWbyTd2DFPnCvT0tURaRbUgUJUYsqyGx77mbEsjmEKELDPmfVyeR4noSw7H8n9BBD-tEnVKTsxiMQy1auxuNqscgkHfs_o59GSkUviY8YAYecLJ_wySxhQcOsnFtnmI6s1xPDP6vGuAwACj4sqbps2kJ8ZEVLs6MmQpuaF53FFr9rSAa73pHBdONruKxplROw306F2dskpe6sU7O3xl2ocHRa9Cir6vWJxE27aaa5uFjKL3H-OX-zLNS_xjmX1rhtqdBZscbMzKmAYAgoIn2ovfo6Po5s1D6jZvVgh__PI2Iw)

## Theoretically possible questions

### What's with the name again?!

1. I like unsweetened black tea.
2. I like `/usr/share/dict/words`.
3. It's an insider.

### How was that one created?

I used the [HSP color model](https://alienryderflex.com/hsp.html) to calculate
the perceived brightness of the base foreground color, and defined some fixed
hue points and a fixed saturation for a script to convert into RGB colors. Well,
now I found out about CIECAM02 and I'm a bit angry because I wrote a script for
nothing. (this was before I knew about the existence of LCH)
