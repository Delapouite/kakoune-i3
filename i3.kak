# http://i3wm.org
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# depends on: x11.kak
# see also: tmux.kak

## Temporarily override the default client creation command
define-command -hidden -params 1.. i3-new-impl %{
  evaluate-commands %sh{
    if [ -z "$kak_opt_termcmd" ]; then
      echo "fail 'termcmd option is not set'"
      exit
    fi
    i3_split="$1"
    shift
    # clone (same buffer, same line)
    cursor="$kak_cursor_line.$kak_cursor_column"
    kakoune_args="-e 'execute-keys $@ :buffer <space> $kak_buffile <ret> :select <space> $cursor,$cursor <ret>'"
    {
      # https://github.com/i3/i3/issues/1767
      [ -n "$i3_split" ] && i3-msg "split $i3_split"
      exec $kak_opt_termcmd "kak -c $kak_session $kakoune_args"
    } < /dev/null > /dev/null 2>&1 &
  }
}

define-command i3-new-down -docstring "Create a new window below" %{
  i3-new-impl v 
}

define-command i3-new-up -docstring "Create a new window below" %{
  i3-new-impl v :nop <space> '%sh{ i3-msg move up }' <ret>
}

define-command i3-new-right -docstring "Create a new window on the right" %{
  i3-new-impl h
}

define-command i3-new-left -docstring "Create a new window on the left" %{
  i3-new-impl h :nop <space> '%sh{ i3-msg move left }' <ret>
}

define-command i3-new -docstring "Create a new window in the current container" %{
  i3-new-impl ""
}

# Suggested aliases

alias global new i3-new

declare-user-mode i3
map global i3 n :i3-new<ret> -docstring "new window in the current container"
map global i3 h :i3-new-left<ret> -docstring '← new window on the left'
map global i3 l :i3-new-right<ret> -docstring '→ new window on the right'
map global i3 k :i3-new-up<ret> -docstring '↑ new window above'
map global i3 j :i3-new-down<ret> -docstring '↓ new window below'

# Suggested mapping

#map global user 3 ': enter-user-mode i3<ret>' -docstring 'i3…'
