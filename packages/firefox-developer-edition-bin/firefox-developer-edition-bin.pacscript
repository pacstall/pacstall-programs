pkgname="firefox-developer-edition-bin"
maintainer=("Oren Klopfer <oren@taumoda.com>")
gives="firefox-developer-edition"
pkgver="122.0b9"
pkgdesc="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
source=(
  "https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2"
  "${gives}.desktop"
  "${gives}.png::https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"
)
homepage='https://www.mozilla.org/en-US/firefox/developer/'
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
sha256sums=(
  "8a18a6604183940a67403b21a2e071a510714b502468bdc04624d929655bee5a"
  "SKIP"
  "SKIP"
)
arch=('amd64')
repology=("project: firefox" "visiblename: firefox-developer-edition")

package() {
  cd "${srcdir}"
  # Make dirs and assign permissions
  mkdir -p "${pkgdir}/opt/firefox-developer-edition"
  cp -r firefox/* "${pkgdir}/opt/firefox-developer-edition"

  # Install the icon for the desktop file
  install -Dm644 "${srcdir}/${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install the desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
