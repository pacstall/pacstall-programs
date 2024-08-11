pkgname="joplin-desktop-app"
gives="joplin-desktop"
pkgver="3.0.14"
pkgrel="2"
makedepends=("libfuse2")
depends=("libfuse2")
url='https://joplinapp.org/'
pkgdesc="Joplin - the secure note taking and to-do app with synchronisation capabilities for Windows, macOS, Linux, Android and iOS"
source=(
  "https://github.com/laurent22/joplin/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage"
  "joplin-desktop.png::https://joplinapp.org/images/Icon512.png"
)
sha256sums=(
  "f7f3dfa6e5006c550853dff7c8c415e236443e6fde43751c370c04ff0bdf9683"
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
    Exec=env APPIMAGELAUNCHER_DISABLE=1 joplin-desktop %u
    Icon=joplin-desktop
    StartupWMClass=Joplin
    Type=Application
    Categories=Office;
    MimeType=x-scheme-handler/joplin;
    X-GNOME-SingleWindow=true
    X-SingleMainWindow=true" | tee "${pkgdir}/usr/share/applications/joplin-desktop.desktop" > /dev/null
}
