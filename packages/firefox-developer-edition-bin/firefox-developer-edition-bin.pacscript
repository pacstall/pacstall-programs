pkgname="firefox-developer-edition-bin"
pkgver="152.0b1"
gives="firefox-developer-edition"
arch=("amd64" "arm64")
pkgdesc="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
url='https://www.mozilla.org/en-US/firefox/developer/'
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
source=(
  "https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}/linux-${AARCH}/en-US/firefox-${pkgver}.tar.xz"
  "${gives}.desktop"
  "${gives}.png::https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"
)
sha256sums_amd64=(
  "a02bf81152d9bfd02557a716395e27b4aa393c6dcbe1047168edf1f20042ed7e"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "be18ad5724826746340e278271d5d246d5e4d62d07d248ce12d15fe4c67aba16"
  "SKIP"
  "SKIP"
)
repology=("project: firefox" "visiblename: firefox-developer-edition" "status: devel")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/firefox-developer-edition"
  cp -r firefox/* "${pkgdir}/opt/firefox-developer-edition"
  install -Dm644 "${srcdir}/${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
