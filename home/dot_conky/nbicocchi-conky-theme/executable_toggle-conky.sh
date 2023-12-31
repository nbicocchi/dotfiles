#!/bin/sh
# vim: ft=sh:ts=4:sw=4:et:ai:cin

usage() {
    echo "USAGE: $(basename $0)"
}

conky_bin="conky"
magic_id="0ce31833f8f0bae3"

cd $(dirname $0)
if pkill --signal kill --full "conky.*\s-- $magic_id"; then
    echo "Stopping conky..."
else
    echo "Starting conky..."
    "$conky_bin" --daemonize --quiet --config=./conky.conf -- $magic_id
fi
