pkgname="firefox-developer-edition-bin"
pkgver="143.0b9"
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
  "ef116160db98534128eb3cf2c848d6e0d5f874da4ec7850837404cf4cc78aceb"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "da954b044215a4f35e3466ee0f39c01f408afed8b42172f727a939db73c11e4c"
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
