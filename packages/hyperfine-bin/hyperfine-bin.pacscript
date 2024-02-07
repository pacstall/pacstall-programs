#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="hyperfine-bin"
pkgname="hyperfine"
pkgver="1.17.0"
pkgdesc="A command-line benchmarking tool"
url="https://github.com/sharkdp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="563de47d843810de501e3e6bfcb4571a4ff957eab811c2af87be23d1c599ae47"
arch=('amd64')
repology=("project: hyperfine")

package() {
  # Install license
  sudo install -Dm644 "LICENSE-APACHE" "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install binary
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install completions
  sudo install -Dm644 "autocomplete/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  sudo install -Dm644 "autocomplete/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  sudo install -Dm644 "autocomplete/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # Install man page
  sudo install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  sudo gzip --best "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

post_remove() {
  # Remove empty directories
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
