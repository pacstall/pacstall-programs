pkgname="joplin-desktop-app"
gives="joplin-desktop"
pkgver="2.14.20"
makedepends=("libfuse2")
depends=("libfuse2")
homepage='https://joplinapp.org/'
pkgdesc="Joplin - the secure note taking and to-do app with synchronisation capabilities for Windows, macOS, Linux, Android and iOS"
source=(
  "https://github.com/laurent22/joplin/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage"
  "joplin-desktop.png::https://joplinapp.org/images/Icon512.png"
)
sha256sums=(
  "2d53781c72d0a94f3f4739c5ca1b00202af9d1850a9632283bdba5b16f688620"
  "SKIP"
)
repology=("project: joplin-desktop")
arch=("amd64")
maintainer=("lfromanini <lfromanini@yahoo.com>")

package() {
  cd "${_archive}"
  install -Dm755 "Joplin-${pkgver}.AppImage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/joplin-desktop.png" "${pkgdir}/usr/share/pixmaps/joplin-desktop.png"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Encoding=UTF-8
    Name=Joplin
    Comment=Joplin for Desktop
    Exec=joplin-desktop %u
    Icon=joplin-desktop
    StartupWMClass=Joplin
    Type=Application
    Categories=Office;
    MimeType=x-scheme-handler/joplin;
    X-GNOME-SingleWindow=true
    X-SingleMainWindow=true" | tee "${pkgdir}/usr/share/applications/joplin-desktop.desktop" > /dev/null
}
