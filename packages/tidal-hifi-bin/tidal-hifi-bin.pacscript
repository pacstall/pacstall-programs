name="tidal-hifi-bin"
pkgname="tidal-hifi"
pkgver="5.8.0"
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
url="https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.tar.gz"
hash="598da80fc2cfe4065f0ba07fbb08ecab44e8dde76ba8d88d2a491cc6f3780ce9"
maintainer="Oren Klopfer <oren@taumoda.com>"
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
depends=("libxss1" "libnss3" "libgtk-3-0")

package() {
  # Get icon from github and install it
  wget -q "https://github.com/Mastermindzh/tidal-hifi/raw/master/build/icon.png"
  sudo install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Get desktop file and install it
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/tidal-hifi.desktop?h=tidal-hifi-bin" -O tidal-hifi.desktop
  sudo install -Dm644 tidal-hifi.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  sudo install -d "${pkgdir}/opt/${pkgname}/" "${pkgdir}/usr/bin"

  sudo cp -r "${SRCDIR}/tidal-hifi-${pkgver}/"* "${pkgdir}/opt/${pkgname}/"
  sudo chmod +x "${pkgdir}/opt/${pkgname}/tidal-hifi"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -sf "/opt/${pkgname}/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"
}
