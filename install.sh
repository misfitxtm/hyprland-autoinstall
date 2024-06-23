#/bin/sh
set -eu -o pipefail

sudo -n true
test $? -eq 0 || exit 1 "Must run as super user"

echo -INSTALLING PRE-REQUISITES-
while read -r p ; do sudo dnf install -y $p ; done < <(cat << "EOF"
  git
  unzip
  zip
  wget
  curl
EOF
)
echo -INSTALLING CORE-
sleep 6

APPLIST='zsh cargo rust gcc clang bpytop cava feh python fastfetch zsh-autosuggestions zsh-syntax-highlighting kitty hyprland rofi-wayland waybar hyprlock rofi-themes rofi-themes-base16 wlogout mono-complete wine wine-alsa xcur2png lutris steam'

DELETE='foot swaylock'

sudo dnf distro-sync --refresh && sudo dnf update --refresh
sudo dnf install $APPLIST -y

sudo dnf remove 

echo -INSTALLING EXTRA APPS-


sudo sh -c 'echo -e "[unityhub-beta]\nname=Unity Hub Beta\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/unstable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/unstable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub_beta.repo'
sudo install unity-hub

wget https://github.com/Alex313031/thorium/releases/download/M124.0.6367.218/thorium-browser_124.0.6367.218_AVX2.rpm
install ~/thorium-browser_124.0.6367.218_AVX2.rpm
sudo rm -rf ~/thorium-browser_124.0.6367.218_AVX2.rpm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/nwg-piotr/nwg-look
cd nwg-look/
make build
sudo make install






sleep 6


