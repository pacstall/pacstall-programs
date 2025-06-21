#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="dust-bin"
gives="dust"
pkgver="1.2.1"
pkgdesc="A more intuitive version of du in rust"
source=("@${pkgname}~${pkgver}::https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("15716b5c0df538f30025d2db7c509fc6d5540f4ecc1eaf555e0c639c67ed7abf")
arch=('amd64')
repology=("project: du-dust")

package() {
  cd "${pkgname}~${pkgver}"
  # Install license
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install binary
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${gives}"
  sudo rm -rf "/usr/share/doc/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
