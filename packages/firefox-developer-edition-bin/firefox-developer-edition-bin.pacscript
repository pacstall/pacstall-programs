pkgname="firefox-developer-edition-bin"
pkgver="148.0b15"
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
  "db7144bed6613578ad176b982e1560866bad7f0529b4074a4f997735b05cafdb"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "ab5b50ad33b593b2b0c2f22be46919863e5a610a80a4cb919db0057569c5ef5c"
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
