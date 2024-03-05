name="surf"
pkgver="2.1"
source=("https://dl.suckless.org/${name}/${name}-${pkgver}.tar.gz")
makedepends=("make")
depends=("libc6" "libgcr-3-dev" "libglib2.0-dev" "libgtk-3-dev" "libwebkit2gtk-4.0-dev" "libx11-6")
breaks=("${name}-git")
replaces=("${name}")
pkgdesc="surf is a simple web browser based on WebKit2/GTK+."
hash=("72e582920ba25a646203e93c2d2331d87f03037a28894d6c7e99af00ee043257")
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm644 README -t "${pkgdir}/usr/share/doc/${name}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
