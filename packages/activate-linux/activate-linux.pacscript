pkgname="activate-linux"
pkgver="1.2.0"
pkgdesc="The Activate Windows watermark ported to Linux"
repology=("project: activate-linux")
arch=("any")
url='https://github.com/MrGlockenspiel/activate-linux'
license=("GPL-3.0-only")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5c1ab8dc9ddfc3984398f410cd5cf6169609650659d9474b88b1d852a1c3c32b")
makedepends=("gcc" "make" "gawk" "pkg-config" "libcairo2-dev" "libpango1.0-dev" "libx11-dev" "libxext-dev" "libxfixes-dev" "libxinerama-dev" "libxrandr-dev" "libwayland-dev" "wayland-protocols" "libconfig-dev")
depends=("libc6" "libcairo2" "libglib2.0-0t64 | libglib2.0-0" "libpango-1.0-0" "libpangocairo-1.0-0" "libx11-6" "libxext6" "libxfixes3" "libxinerama1" "libxrandr2" "libwayland-client0" "libconfig11 | libconfig9")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

build() {
  cd "${pkgname}-${pkgver}"
  make -j"${NCPU}" backends="wayland x11" with="libconfig"
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr" MANDIR="${pkgdir}/usr/share/man" backends="wayland x11" with="libconfig"
  install -Dm644 "res/activate-linux.desktop" -t "${pkgdir}/usr/share/applications"
  sed -i 's/^Categories=Utility$/Categories=Utility;/' "${pkgdir}/usr/share/applications/activate-linux.desktop"
  install -Dm644 "res/activate-linux.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
}
