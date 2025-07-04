pkgname="firefox-developer-edition-bin"
pkgver="141.0b5"
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
  "9d1220e1c58e73a772fd44c278fe4a8b3fe91ba88992c299c68e1f607bc5e6dd"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "44899db28c3cf37b1e1746e5c21a41b07cc2211af8483fdcca28d13a69972105"
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
