pkgname="surf"
arch=("any")
pkgver="2.1"
source=("@${pkgname}~${pkgver}::https://dl.suckless.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
makedepends=("make")
depends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
pkgdesc="surf is a simple web browser based on WebKit2/GTK+."
sha256sums=("72e582920ba25a646203e93c2d2331d87f03037a28894d6c7e99af00ee043257")
maintainer=("WRM-42 <y8bsbahy@anonaddy.me>")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
