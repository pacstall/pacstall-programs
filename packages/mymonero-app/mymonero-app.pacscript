name="mymonero-app"
gives="mymonero"
pkgver="1.3.3"
pkgdesc="The simplest way to use the next-generation private digital currency Monero"
url="https://github.com/mymonero/mymonero-app-js/releases/download/v${pkgver}/MyMonero-${pkgver}.AppImage"
makedepends=("libfuse2")
depends=("libfuse2")
hash="fd53a237be201dc6e10cc0a9136fb02be1522622b0de67798c34623ca2ecddef"
maintainer="Elsie19 <elsie19@pm.me>"
__icon_url="https://github.com/mymonero/mymonero-app-js/raw/master/build/icon.png"
repology=("project: mymonero")

package() {
  sudo install -Dm755 "MyMonero-${pkgver}.AppImage" "${pkgdir}/usr/bin/mymonero"
  wget -q -O "MyMonero.png" "${__icon_url}"
  sudo install -Dm644 "MyMonero.png" "${pkgdir}/usr/share/pixmaps/MyMonero.png"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Name=MyMonero
    Icon=MyMonero
    Type=Application
    Exec=/usr/bin/mymonero" | sudo tee "${pkgdir}/usr/share/applications/mymonero.desktop" > /dev/null
}
