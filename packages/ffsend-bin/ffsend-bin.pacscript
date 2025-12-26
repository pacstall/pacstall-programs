pkgname="ffsend-bin"
gives="ffsend"
pkgver="0.2.77"
pkgdesc="Easily and securely share files from the command line"
repology=("project: ffsend")
license=("GPL-3.0")
arch=("amd64")
breaks=("${gives}")
depends=("ca-certificates")
optdepends=("xclip: clipboard support"
  "bash-completion: support auto-completion for bash")
source=(
  "https://github.com/timvisee/${gives}/releases/download/v${pkgver}/${gives}-v${pkgver}-linux-x64-static"
  "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/${gives}.bash"
  "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/_${gives}"
  "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/contrib/completions/${gives}.fish"
  "https://gitlab.com/timvisee/${gives}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  "ebd14a67c46e7d744ce84677f057d9dc07abc884eaa8f70d68a9e59d27357313"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)

package() {
  cd "${srcdir}"
  install -Dm755 "${gives}-v${pkgver}-linux-x64-static" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/${gives}.bash" "${pkgdir}/usr/share/bash-completion/completions/${gives}"
  install -Dm644 "${srcdir}/_${gives}" "${pkgdir}/usr/share/zsh/site-functions/_${gives}"
  install -Dm644 "${srcdir}/${gives}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${gives}.fish"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
