name="rhino-pine-core"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
pacdeps=("unicorn-mobile-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git" "rhino-system-git" "u-boot-mobian-deb" "mobile-usb-networking-deb" "pacstall-qa-git")
depends=("initramfs-tools")
if [[ -f /usr/bin/enable-modem ]]; then
  depends+=("eg25-manager" "modemmanager" "gnome-calls" "gnome-contacts" "chatty" "callaudiod" "feedbackd" "purple-mm-sms" "ofono" "ofono-scripts" "gpsd")
fi
pkgdesc="Transitional package to provide all core Rhino Linux Mobile software"
maintainer="Oren Klopfer <oren@taumoda.com>"
compatible=("ubuntu:devel" "ubuntu:noble")
replace=("rhino-core" "rhino-server-core" "rhino-ubxi-core")
pkgver="2023.4~RC"
pkgrel="1"
style="(mobile)"
branch="devel"
post_install() {
  echo "PRETTY_NAME=\"Rhino Linux ${pkgver} ${style}\"
NAME=\"Rhino Linux\"
VERSION_ID=\"${pkgver}\"
VERSION=\"${pkgver} ${style}\"
VERSION_CODENAME=\"${branch}\"
ID=ubuntu
ID_LIKE=debian
HOME_URL=\"https://rhinolinux.org/\"
SUPPORT_URL=\"https://github.com/rhino-linux\"
BUG_REPORT_URL=\"https://github.com/rhino-linux\"
PRIVACY_POLICY_URL=\"https://www.ubuntu.com/legal/terms-and-policies/privacy-policy\"
UBUNTU_CODENAME=\"${branch}\"" | sudo tee /usr/lib/os-release > /dev/null
  cd /usr/share/pixmaps
  for i in ubuntu-logo-text.png ubuntu-logo-text-dark.png; do
    sudo rm "${i}"
    sudo wget -q https://raw.githubusercontent.com/oklopfer/debs/master/logos/rhino-text.png -O "${i}"
  done
  cd -
  if [[ -f /usr/bin/enable-modem ]]; then
    echo 'START_DAEMON="true"
USBAUTO="true"
DEVICES="/dev/EG25.NMEA"
GPSD_OPTIONS="-D3"' | sudo tee /etc/default/gpsd
    sudo systemctl enable gpsd
  fi
}
