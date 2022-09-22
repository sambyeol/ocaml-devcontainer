USE_OMB=${1:-"true"}

if [ "${USE_OMB}" = "true" ] ; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
    sed -i -e "s/OSH_THEME=.*/OSH_THEME=\"simple\"/g" ~/.bashrc
fi
