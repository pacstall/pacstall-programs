name="rhino-server-core"
url="https://raw.githubusercontent.com/oklopfer/debs/master/logos/rhino-text.png"
pacdeps=("rhino-pkg-git" "rhino-neofetch-git" "pacstall-qa-git")
pkgdesc="Transitional package to provide minimal core Rhino Linux software"
maintainer="Oren Klopfer <oren@taumoda.com>"
compatible=("ubuntu:devel" "ubuntu:noble")
replace=("rhino-core" "rhino-pine-core" "rhino-ubxi-core")
priority="essential"
pkgver="2023.4"
pkgrel="4"
style="(server)"
branch="devel"

pre_install() {
  sudo dpkg-divert --quiet --package "${name}" --divert /usr/lib/ubuntu-release --no-rename /usr/lib/os-release
  sudo dpkg-divert --quiet --package "${name}" --divert /usr/share/pixmaps/ubuntu-logo-text-overwritten.png --no-rename /usr/share/pixmaps/ubuntu-logo-text.png
  sudo dpkg-divert --quiet --package "${name}" --divert /usr/share/pixmaps/ubuntu-logo-text-dark-overwritten.png --no-rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
}

package() {
  sudo mkdir -p "${pkgdir}/usr/lib"
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps"
  for i in ubuntu-logo-text.png ubuntu-logo-text-dark.png; do
    sudo cp rhino-text.png "${pkgdir}/usr/share/pixmaps/${i}"
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
UBUNTU_CODENAME=\"${branch}\"" | sudo tee "${pkgdir}/usr/lib/os-release" > /dev/null
}

post_remove() {
  sudo dpkg-divert --quiet --package "${name}" --remove --rename /usr/lib/os-release
  sudo dpkg-divert --quiet --package "${name}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text.png
  sudo dpkg-divert --quiet --package "${name}" --remove --rename /usr/share/pixmaps/ubuntu-logo-text-dark.png
}
