name="firefox-developer-edition-bin"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgname="firefox-developer-edition"
pkgver="122.0b9"
pkgdesc="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
source=(
  "https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2"
  "${pkgname}.png::https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
)
homepage='https://www.mozilla.org/en-US/firefox/developer/'
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash=(
  "8a18a6604183940a67403b21a2e071a510714b502468bdc04624d929655bee5a"
  "SKIP" "SKIP"
)
arch=('amd64')
repology=("project: firefox" "visiblename: firefox-developer-edition")

package() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/firefox-developer-edition"
  sudo cp -r firefox/* "${pkgdir}/opt/firefox-developer-edition"

  # Install the icon for the desktop file
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop file
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
