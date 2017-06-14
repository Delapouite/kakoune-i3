# http://i3wm.org
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# depends on: x11.kak
# see also: tmux.kak

## Temporarily override the default client creation command
def -hidden -params 1.. i3-new-impl %{
    nop %sh{
        if [ -z "${kak_opt_termcmd}" ]; then
           echo "echo -color Error 'termcmd option is not set'"
           exit
        fi
        i3_args="$1"
        shift
        if [ $# -ne 0 ]; then kakoune_params="-e '$@'"; fi
        i3-msg $i3_args; exec $kak_opt_termcmd "kak -c ${kak_session} ${kakoune_params}" < /dev/null > /dev/null 2>&1 &
    }
}

def i3-new-vertical -params .. -command-completion -docstring "Create a new vertical window" %{
    i3-new-impl 'split v' %arg{@}
}

def i3-new-horizontal -params .. -command-completion -docstring "Create a new horizontal window" %{
    i3-new-impl 'split h' %arg{@}
}

alias global new i3-new-horizontal
alias global newh i3-new-horizontal
alias global newv i3-new-vertical
