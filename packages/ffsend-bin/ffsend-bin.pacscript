name="ffsend-bin"
gives="ffsend"
pkgver="0.2.76"
pkgdesc="Easily and securely share files from the command line. A Send client."
repology=("project: ffsend")
license=("GPL3")
arch=("amd64")
breaks=("${gives}")
depends=("ca-certificates")
optdepends=("xclip: clipboard support"
  "bash-completion: support auto-completion for bash")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/timvisee/${gives}/releases/download/v${pkgver}/${gives}-v${pkgver}-linux-x64-static"

package() {
  sudo install -Dm755 "${gives}-v${pkgver}-linux-x64-static" "${pkgdir}/usr/bin/${gives}"

  # Shell completions and LICENSE file
  wget -q "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/${gives}.bash" \
    "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/_${gives}" \
    "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/${gives}.fish" \
    "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/LICENSE"

  sudo install -Dm644 "${gives}.bash" "${pkgdir}/usr/share/bash-completion/completions/${gives}"
  sudo install -Dm644 "_${gives}" "${pkgdir}/usr/share/zsh/site-functions/_${gives}"
  sudo install -Dm644 "${gives}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${gives}.fish"
  sudo install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
