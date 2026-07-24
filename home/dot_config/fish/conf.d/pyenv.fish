set -Ux PYENV_ROOT $HOME/.pyenv
test -d $PYENV_ROOT/bin; and fish_add_path $PYENV_ROOT/bin

if status is-interactive; and not set -q MC_SID
    type -q pyenv; and pyenv init - | source
    type -q pyenv; and pyenv virtualenv-init - | source
end
