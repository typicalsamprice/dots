#!/usr/bin/sh

set -e
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
THIS_DIR="$(dirname $(readlink -e $0))"

link_to_basedir() {
    if [ -f "${1}/${2}" ]; then
        return 0
    fi
    if [ -d "${1}/${2}" ]; then
        return 0
    fi
    printf "Linking %s to %s ...\n" "${THIS_DIR}/${2}" "${1}/${2}"
    ln -sf "${THIS_DIR}/${2}" "${1}/${2}"
}
link_to_conf_directly() {
    link_to_basedir "${CONFIG_DIR}" "${1}"
}


link_to_conf_directly "starship.toml"
link_to_conf_directly "nvim"
link_to_conf_directly "fish/config.fish"
link_to_conf_directly "alacritty"
link_to_conf_directly "youtube-dl"

link_to_basedir "$HOME" ".gitconfig"
link_to_basedir "$HOME" ".tmux.conf"
link_to_basedir "$HOME" ".zshrc"
