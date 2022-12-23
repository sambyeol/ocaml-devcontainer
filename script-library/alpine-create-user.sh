#!/usr/bin/env sh

USERNAME=${1:-"root"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e "Script must be run with privilege."
    exit 1
fi

# create non-root user
if ! [ "${USERNAME}" = "root" ]; then
    adduser -s $(which zsh) -G wheel -D ${USERNAME}
    echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
    su ${USERNAME} -s /bin/ash -c "touch /home/${USERNAME}/.sudo_as_admin_successful"
fi