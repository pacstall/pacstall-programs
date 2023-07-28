name="rhino-pine-core"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
pacdeps=("xfce4-settings-pine-git" "unicorn-mobile-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git" "rhino-system-git" "u-boot-mobian-deb" "mobile-usb-networking-deb")
depends=("eg25-manager" "modemmanager" "gnome-calls" "gnome-contacts" "chatty" "callaudiod" "feedbackd" "purple-mm-sms")
description="Transitional package to provide all core Rhino Linux Mobile software"
maintainer="Oren Klopfer <oren@taumoda.com>"
replace=("rhino-core" "rhino-server-core")
production="2023.1-beta7"
version="${production}-1"
style="(mobile)"
branch="devel"
postinst() {
  echo "PRETTY_NAME=\"Rhino Linux ${production} ${style}\"
NAME=\"Rhino Linux\"
VERSION_ID=\"${production}\"
VERSION=\"${production} ${style}\"
VERSION_CODENAME=\"${branch}\"
ID=ubuntu
ID_LIKE=debian
HOME_URL=\"https://rhinolinux.org/\"
SUPPORT_URL=\"https://github.com/rhino-linux\"
BUG_REPORT_URL=\"https://github.com/rhino-linux\"
PRIVACY_POLICY_URL=\"https://www.ubuntu.com/legal/terms-and-policies/privacy-policy\"
UBUNTU_CODENAME=\"${branch}\"" | sudo tee /usr/lib/os-release > /dev/null
  if [[ -f /usr/lib/systemd/system/modem-start.service ]]; then
    sudo systemctl enable modem-start.service --now
  fi
}
