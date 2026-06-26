pkgname="cromite-bin"
gives="cromite"
pkgver="148.0.7778.168"
pkgsha="cb3baf14f52eb4365d017f640f85310735c19b79"
arch=("amd64")
pkgdesc="Cromite is a Chromium fork based on Bromite with built-in support for ad blocking and an eye for privacy"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=(
  "https://github.com/uazo/${gives}/releases/download/v${pkgver}-${pkgsha}/chrome-lin64.tar.gz"
  "cromite.svg"
  "cromite.desktop"
)
sha256sums=(
  "f27c78fe320dd5bfd53b05b4a33547a2c80c6ac83ad106807466910faeda9a4d"
  "SKIP"
  "SKIP"
)
repology=("project: ${gives}")

package() {
  cd "${srcdir}/chrome-lin"
  mkdir -p "${pkgdir}/usr/share/cromite"
  cp -r ./* "${pkgdir}/usr/share/cromite"
  chmod +x "${pkgdir}/usr/share/cromite/chrome"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/cromite.svg" "${pkgdir}/usr/share/pixmaps/cromite.svg"
  install -Dm644 "${srcdir}/cromite.desktop" "/usr/share/applications/cromite.desktop"
}
