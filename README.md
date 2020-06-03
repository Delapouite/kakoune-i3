# kakoune-i3

[kakoune](http://kakoune.org) plugin to create predictable clients with the [i3 window manager](http://i3wm.org/).

## Install

Add `i3.kak` to your autoload dir: `~/.config/kak/autoload/`.
It depends on `x11.kak`.

Or via [plug.kak](https://github.com/andreyorst/plug.kak):

```
plug 'delapouite/kakoune-i3' %{
  # Suggested mapping
  map global user 3 ': enter-user-mode i3<ret>' -docstring 'i3…'
}
```

## Usage

5 commands available:

- `i3-new` new window in the current container
- `i3-new-left` ← new window on the left
- `i3-new-right` → new window on the right
- `i3-new-up` ↑ new window above
- `i3-new-down` ↓ new window below

New windows display a *cloned view*: same buffer, same line.

A `i3` user-mode is also declared. With the mapping in the Install section above:

`<space>3k` will open a new window above the current one.

## Screenshots

![kakoune-i3](https://raw.githubusercontent.com/delapouite/kakoune-i3/master/screenshot.png)

## See also

- [rc/filetype/i3.kak](https://github.com/mawww/kakoune/blob/master/rc/filetype/i3.kak) - config highlighters
- [kakoune-sway](https://github.com/mreppen/kakoune-sway) - support for https://swaywm.org/

## Licence

MIT
