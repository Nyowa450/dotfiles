if status is-interactive
    # Commands to run in interactive sessions can go here
    alias la='exa -la --icons'
    alias ll='exa -l --icons'
    alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
    alias t='tmux'
    alias bd='bundle'
    status --is-interactive; and rbenv init - fish | source

end
