pkgname="firefox-developer-edition-bin"
pkgver="153.0b6"
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
  "35817fa613754c7172e9a499fc9e4e45574da0a0b2aa63cc63403dd02fca9c37"
  "SKIP"
  "SKIP"
)
sha256sums_arm64=(
  "0a5ad45996d1091585892380e7ab2f4afbe0d9ebf50938701dbb5bffb1dbe7e8"
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
