#/bin/sh
set -eu -o pipefail

sudo -n true
test $? -eq 0 || exit 1 "Must run as super user"

echo UNINSTALLING
sleep 6

APPLIST='kitty hyprland rofi-wayland rofi-themes waybar rofi-themes-base16 wlogout'

#sudo dnf distro-sync --refresh && sudo dnf update --refresh
sudo dnf remove $APPLIST -y 

sleep 6

echo FINISHED!
