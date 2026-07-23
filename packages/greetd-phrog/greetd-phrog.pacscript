pkgname="greetd-phrog"
pkgver="0.53.0"
pkgdesc="Mobile device greeter"
url='https://github.com/samcday/phrog'
arch=('amd64' 'arm64')
license=('GPL-3.0-only')
depends=('phosh' 'greetd' 'libphosh-0.45-0' 'libglib2.0-bin')
makedepends=('cargo>=1.87 | rustup' 'libphosh-0.45-dev')
source=("${url}/archive/${pkgver}/phrog-${pkgver}.tar.gz")
sha512sums=('4ac04d47e1b0b33e6f8794e5317258002be79500ab38deee49eb0c97fd34eb832516ab6ace004d782fd5e5fa54f8ed81affc712503822c51e46ed33036c1f5cd')
maintainer=("Oren Klopfer <oren@taumoda.com>")
external_connection=true

build() {
  cd "phrog-${pkgver}"
  patch -p1 < "${srcdir}/libphosh-0.43.patch"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "phrog-${pkgver}"
  install -Dm755 resources/mobi.phosh.phrog.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/mobi.phosh.phrog.gschema.xml"
  install -Dm755 target/release/phrog "${pkgdir}/usr/bin/phrog"
}

post_install() {
  echo "Compiling GSettings schemas..."
  glib-compile-schemas /usr/share/glib-2.0/schemas/
}
