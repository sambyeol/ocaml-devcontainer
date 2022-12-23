#!/usr/bin/env zsh

USE_OMZ=${1:-"true"}

if [ "${USE_OMZ}" = "true" ] ; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sed -i -e "s/ZSH_THEME=.*/ZSH_THEME=\"simple\"/g" ~/.zshrc
fi
