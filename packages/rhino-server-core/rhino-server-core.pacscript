pkgname="rhino-server-core"
source=("https://raw.githubusercontent.com/oklopfer/debs/master/logos/rhino-text.png")
pacdeps=("rhino-pkg-git" "rhino-neofetch-git" "rhino-hotfix-git")
pkgdesc="Transitional package to provide minimal core Rhino Linux software"
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=("ubuntu:devel" "ubuntu:questing" "ubuntu:resolute")
replaces=("rhino-core" "rhino-pine-core" "rhino-ubxi-core")
priority="essential"
arch=("all")
pkgver="2025.3"
pkgrel="2"
style="(server)"
branch="devel"

pre_install() {
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/lib/ubuntu-release --rename /usr/lib/os-release
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/share/pixmaps/ubuntu-logo-text-overwritten.png --rename /usr/share/pixmaps/ubuntu-logo-text.png
  sudo dpkg-divert --quiet --package "${pkgname}" --divert /usr/share/pixmaps/ubuntu-logo-text-dark-overwritten.png --rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
}

package() {
  cd "${srcdir}"
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
  if ! [[ -d "${STAGEDIR}/${pkgname}" ]]; then
    sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/lib/os-release
    sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text.png
    sudo dpkg-divert --quiet --package "${pkgname}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
  fi
}
