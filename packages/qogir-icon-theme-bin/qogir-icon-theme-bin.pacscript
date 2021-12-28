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
version="2021-10-14"
description="A colorful design icon theme for linux desktops"
url="https://github.com/vinceliuice/Qogir-icon-theme/archive/${version}.tar.gz"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
hash="329032fb3a4e3d68a697dbea7fd4389a138c1da55a7433a1dc25803bda568d32"

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
