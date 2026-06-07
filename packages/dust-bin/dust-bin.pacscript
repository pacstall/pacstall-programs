#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>" "aKqir24 <aKqir24@github.com>")

pkgname="dust-bin"
gives="dust"
pkgver="1.2.4"
pkgdesc="A more intuitive version of du in rust"
arch=('amd64' 'arm64')
source_amd64=("@${pkgname}~${pkgver}::https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums_amd64=("4e313f9f854017e58a2ada4c0d1774677b8cf53d63ab55a991d5871d5f504452")
sha256sums_arm64=("e09b0d24b5da0fa06aecf1561849c13ae41ef055c1ce7077e35e9a46744b16af")
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
