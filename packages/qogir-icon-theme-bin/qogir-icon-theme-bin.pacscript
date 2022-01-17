#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="qogir-icon-theme-bin"
pkgname="qogir-icon-theme"
pkgdir="${STOWDIR}/${name}"
version="2022-01-12"
description="A colorful design icon theme for linux desktops"
url="https://github.com/vinceliuice/Qogir-icon-theme/archive/${version}.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="afcd0955ead6f9ef73a801cb6fd5917d8ccdd655381b583312e418198d468e10"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install license
  sudo install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Run installation script
  sudo install -d "${pkgdir}/usr/share/icons"
  sudo ./install.sh -d "${pkgdir}/usr/share/icons"
}

removescript() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
