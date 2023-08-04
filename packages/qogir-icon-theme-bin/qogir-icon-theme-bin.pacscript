#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="qogir-icon-theme-bin"
pkgname="qogir-icon-theme"
version="2022-11-05"
description="A colorful design icon theme for linux desktops"
build_depends=("gtk-update-icon-cache")
url="https://github.com/vinceliuice/Qogir-icon-theme/archive/${version}.tar.gz"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="7747f8a139e01a075a94b832d95a53a98b98784b06e866dd8259bb0a38404480"

package() {
  # Install license
  sudo install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Run installation script
  sudo install -d "${pkgdir}/usr/share/icons"
  sudo ./install.sh -d "${pkgdir}/usr/share/icons"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
