#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="dust-bin"
pkgname="dust"
pkgver="0.8.6"
pkgdesc="A more intuitive version of du in rust"
url="https://github.com/bootandy/dust/releases/download/v${pkgver}/dust-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="06e9bcac22ba29e74395dde046cfd5b260cf6fabab48e1ed3dfc017b4e8bada7"
arch=('amd64')
repology=("project: du-dust")

package() {
  # Install license
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

post_remove() {
    # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
