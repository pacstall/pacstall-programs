name="firefox-developer-edition-bin"
maintainer="Oren Klopfer <oren@taumoda.com>"
gives="firefox-developer-edition"
pkgver="120.0b9"
pkgdesc="The browser made for developers. All the latest developer tools in beta, plus experimental features like the Multi-line Console Editor and WebSocket Inspector."
url="https://download-installer.cdn.mozilla.net/pub/devedition/releases/${pkgver}/linux-x86_64/en-US/firefox-${pkgver}.tar.bz2"
homepage='https://www.mozilla.org/en-US/firefox/developer/'
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
hash="55b665f1fe42977f9c4a33865f3b38127ca298b7451f6f92c78f51a507dae501"
arch=('amd64')
repology=("project: firefox" "visiblename: firefox-developer-edition")
__icon_url="https://www.mozilla.org/media/img/structured-data/logo-firefox-developer.8aedc8028e4d.png"

package() {
  cd ..
  # Make dirs and assign permissions
  sudo mkdir -p "${pkgdir}/opt/firefox-developer-edition"
  sudo cp -r firefox/* "${pkgdir}/opt/firefox-developer-edition"

  # Install the icon for the desktop file
  wget -q -O "${gives}.png" "${__icon_url}"
  sudo install -Dm644 "${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install the desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${gives}.desktop"
  sudo install -Dm644 "${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
