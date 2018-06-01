# kakoune-i3

[kakoune](http://kakoune.org) plugin to create predictable clients with the [i3 window manager](http://i3wm.org/).

## Install

Add `i3.kak` to your autoload dir: `~/.config/kak/autoload/`.
It depends on `x11.kak`.

## Usage

4 commands available:

- `i3-new-left` ← new window on the left
- `i3-new-right` → new window on the right
- `i3-new-up` ↑ new window above
- `i3-new-down` ↓ new window below

New windows display a *cloned view*: same buffer, same line.

A `i3` user-mode is also declared:

```
# Suggested mappings

map global user 3 ':enter-user-mode i3<ret>' -docstring 'i3…'
```

i.e. `<space>3k` will open a new window above the current one.

## See also

- [rc/extra/i3.kak](https://github.com/mawww/kakoune/blob/master/rc/extra/i3.kak) - config highlighters

## Licence

MIT
