pkgname="rhino-core"
source=("https://raw.githubusercontent.com/oklopfer/debs/master/logos/rhino-text.png")
pacdeps=("unicorn-desktop-git" "rhino-kvantum-theme-git" "rhino-plymouth-theme-git" "rhino-pkg-git" "rhino-neofetch-git" "rhino-system-git" "pacstall-qa-git")
depends=("printer-driver-all-enforce")
pkgdesc="Transitional package to provide all core Rhino Linux software"
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=("ubuntu:devel" "ubuntu:noble")
replaces=("rhino-pine-core" "rhino-server-core" "rhino-ubxi-core")
priority="essential"
pkgver="2023.4"
pkgrel="7"
style="(mainline)"
branch="devel"

pre_install() {
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/lib/ubuntu-release --no-rename /usr/lib/os-release
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/share/pixmaps/ubuntu-logo-text-overwritten.png --no-rename /usr/share/pixmaps/ubuntu-logo-text.png
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/share/pixmaps/ubuntu-logo-text-dark-overwritten.png --no-rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
}

package() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  for i in ubuntu-logo-text.png ubuntu-logo-text-dark.png; do
    cp rhino-text.png "${pkgdir}/usr/share/pixmaps/${i}"
  done
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
UBUNTU_CODENAME=\"${branch}\"" | tee "${pkgdir}/usr/lib/os-release" > /dev/null
}

post_remove() {
  sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/lib/os-release
  sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text.png
  sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
}
