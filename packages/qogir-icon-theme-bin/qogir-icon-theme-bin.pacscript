#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="qogir-icon-theme-bin"
gives="qogir-icon-theme"
pkgver="2022-11-05"
pkgdesc="A colorful design icon theme for linux desktops"
makedepends=("gtk-update-icon-cache")
source=("https://github.com/vinceliuice/Qogir-icon-theme/archive/${pkgver}.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("7747f8a139e01a075a94b832d95a53a98b98784b06e866dd8259bb0a38404480")

package() {
  cd "${_archive}"
  # Install license
  install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Run installation script
  install -d "${pkgdir}/usr/share/icons"
  ./install.sh -d "${pkgdir}/usr/share/icons"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
