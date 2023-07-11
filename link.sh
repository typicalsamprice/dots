#!/usr/bin/sh

set -xe
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
THIS_DIR="$(dirname $(readlink -e $0))"

link_to_conf_directly() {
    ln -sf "${THIS_DIR}/${1}" "${CONFIG_DIR}/${1}"
}


link_to_conf_directly "starship.toml"
link_to_conf_directly "nvim"
