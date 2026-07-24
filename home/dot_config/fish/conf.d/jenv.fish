set -Ux JENV_ROOT $HOME/.jenv
test -d $JENV_ROOT/bin; and fish_add_path $JENV_ROOT/bin

if status is-interactive; and not set -q MC_SID
    type -q jenv; and jenv init - | source
end
