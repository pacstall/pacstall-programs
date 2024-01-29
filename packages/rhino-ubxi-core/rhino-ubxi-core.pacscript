name="rhino-ubxi-core"
url="https://github.com/oklopfer/debs/raw/master/empty.tar.xz"
pacdeps=("rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git" "rhino-system-git" "pacstall-qa-git" "pipewire-bundle")
depends=("printer-driver-all-enforce")
pkgdesc="Transitional package to provide all core Rhino Linux software, without a desktop environment"
maintainer="Oren Klopfer <oren@taumoda.com>"
compatible=("ubuntu:devel" "ubuntu:noble")
replace=("rhino-core" "rhino-pine-core" "rhino-server-core")
priority="essential"
pkgver="2023.4"
pkgrel="5"
style="(ubxi)"
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
  cd - > /dev/null
}
