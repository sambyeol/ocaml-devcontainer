#!/usr/bin/env bash

USERNAME=${1:-"root"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e "Script must be run with privilege."
    exit 1
fi

# create non-root user
if ! [ "${USERNAME}" = "root" ]; then
    useradd --shell $(which zsh) -G sudo -m -d /home/${USERNAME} -k /etc/skel ${USERNAME}
    sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers
    su ${USERNAME} -s /bin/sh -c "touch /home/${USERNAME}/.sudo_as_admin_successful"
fi
