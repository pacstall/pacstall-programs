pkgname="mymonero-app"
gives="mymonero"
arch=("amd64")
pkgver="1.3.3"
pkgdesc="The simplest way to use the next-generation private digital currency Monero"
source=(
  "https://github.com/mymonero/mymonero-app-js/releases/download/v${pkgver}/MyMonero-${pkgver}.AppImage"
  "MyMonero.png::https://github.com/mymonero/mymonero-app-js/raw/master/build/icon.png"
)
makedepends=("libfuse2")
depends=("libfuse2")
sha256sums=(
  "fd53a237be201dc6e10cc0a9136fb02be1522622b0de67798c34623ca2ecddef"
  "SKIP"
)
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: mymonero")

package() {
  cd "${srcdir}"
  install -Dm755 "MyMonero-${pkgver}.AppImage" "${pkgdir}/usr/bin/mymonero"
  install -Dm644 "${srcdir}/MyMonero.png" "${pkgdir}/usr/share/pixmaps/MyMonero.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Name=MyMonero
    Icon=MyMonero
    Type=Application
    Exec=/usr/bin/mymonero" | tee "${pkgdir}/usr/share/applications/mymonero.desktop" > /dev/null
}
