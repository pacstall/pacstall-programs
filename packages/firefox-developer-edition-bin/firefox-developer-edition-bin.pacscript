name="firefox-developer-edition-bin"
maintainer="Paul Cosma (saenai255) <paul.cosma97@gmail.com>"
pkgname="firefox-developer-edition"
pkgver="117.0b3"
pkgdesc="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
url="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox/developer/'
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
hash="fc9b73f0d075629b7a119fe21ebb552c7aaa3995fa7fa8d3fdce162162f320b1"
arch=('amd64')
repology=("project: firefox" "visiblename: firefox-developer-edition")
__icon_url="https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"

package() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/firefox-developer-edition"
  sudo cp -r firefox/* "${pkgdir}/opt/firefox-developer-edition"

  # Install the icon for the desktop file
  wget -q -O "${pkgname}.png" "${__icon_url}"
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
