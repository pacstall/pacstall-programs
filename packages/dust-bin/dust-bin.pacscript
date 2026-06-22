#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="dust-bin"
gives="dust"
pkgver="1.2.3"
pkgdesc="A more intuitive version of du in rust"
source=("@${pkgname}~${pkgver}::https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("2767e53a07a6f887c95d80dc7b976fbb0f85c24fa19e83704639ff5d67ebfbf4")
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
