name="tidal-hifi-bin"
gives="tidal-hifi"
pkgver="5.7.1"
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
url="https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.tar.gz"
hash="193afcc9447602d5da5d16685996685a43af772526a22a144c05829205928582"
maintainer="Oren Klopfer <oren@taumoda.com>"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("libxss1" "libnss3" "libgtk-3-0")

package() {
  # Get icon from github and install it
  wget -q "https://github.com/Mastermindzh/tidal-hifi/raw/master/build/icon.png"
  sudo install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Get desktop file and install it
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/tidal-hifi.desktop?h=tidal-hifi-bin" -O tidal-hifi.desktop
  sudo install -Dm644 tidal-hifi.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/${gives}/" "${pkgdir}/usr/bin"

  sudo cp -r "${SRCDIR}/tidal-hifi-${pkgver}/"* "${pkgdir}/opt/${gives}/"
  sudo chmod +x "${pkgdir}/opt/${gives}/tidal-hifi"
}

post_install() {
  sudo ln -s -r "/opt/${gives}/tidal-hifi" "/usr/bin/tidal-hifi"
}

post_remove() {
  sudo rm -f "/usr/bin/tidal-hifi"
}
