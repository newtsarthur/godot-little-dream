#!/bin/sh
echo -ne '\033c\033]0;Little Dream\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Little Dream.x86_64" "$@"
