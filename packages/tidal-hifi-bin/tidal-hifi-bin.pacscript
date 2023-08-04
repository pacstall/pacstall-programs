name="tidal-hifi-bin"
pkgname="tidal-hifi"
version="5.3.0"
description="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
url="https://github.com/Mastermindzh/tidal-hifi/releases/download/${version}/tidal-hifi-${version}.tar.gz"
hash="5d04c081e2c011b07598fe11c75a3de71e28d1cc6b5aec8511a08ba91bc46f23"
maintainer="Marie Piontek <marie@kaifa.ch>"
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

  sudo cp -r "${SRCDIR}/tidal-hifi-${version}/"* "${pkgdir}/opt/${pkgname}/"
  sudo chmod +x "${pkgdir}/opt/${pkgname}/tidal-hifi"
}

post_install() {
  sudo ln -s -r "/opt/${pkgname}/tidal-hifi" "/usr/bin/tidal-hifi"
}

post_remove() {
  sudo rm -f "/usr/bin/tidal-hifi"
}
