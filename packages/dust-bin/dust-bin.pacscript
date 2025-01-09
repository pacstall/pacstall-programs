#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="dust-bin"
gives="dust"
pkgver="0.8.6"
pkgdesc="A more intuitive version of du in rust"
source=("@${pkgname}~${pkgver}::https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("06e9bcac22ba29e74395dde046cfd5b260cf6fabab48e1ed3dfc017b4e8bada7")
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
