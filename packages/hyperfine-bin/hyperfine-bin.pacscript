#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="hyperfine-bin"
gives="hyperfine"
pkgver="1.19.0"
pkgdesc="A command-line benchmarking tool"
source=("@${pkgname}~${pkgver}::https://github.com/sharkdp/${gives}/releases/download/v${pkgver}/${gives}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=("825287143f397774093539ca2458854ab3735c0e8a1aaf075c22edce7d261556")
arch=('amd64')
repology=("project: hyperfine")

package() {
  cd "${pkgname}~${pkgver}"
  # Install license
  install -Dm644 "LICENSE-APACHE" "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${gives}"

  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${gives}"

  # Install binary
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"

  # Install completions
  install -Dm644 "autocomplete/${gives}.bash" "${pkgdir}/usr/share/bash-completion/completions/${gives}"
  install -Dm644 "autocomplete/${gives}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${gives}.fish"
  install -Dm644 "autocomplete/_${gives}" "${pkgdir}/usr/share/zsh/site-functions/_${gives}"

  # Install man page
  install -Dm644 "${gives}.1" "${pkgdir}/usr/share/man/man1/${gives}.1"
  gzip --best "${pkgdir}/usr/share/man/man1/${gives}.1"
}

# vim:set ft=sh ts=2 sw=2 et:
