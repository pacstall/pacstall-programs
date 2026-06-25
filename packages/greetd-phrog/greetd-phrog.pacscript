pkgname="greetd-phrog"
pkgver="0.53.0"
pkgdesc="Mobile device greeter"
url='https://github.com/samcday/phrog'
arch=('amd64' 'arm64')
license=('GPL-3.0-only')
depends=('phosh' 'greetd' 'libphosh-0.43-0' 'libglib2.0-bin')
makedepends=('cargo' 'libphosh-0.43-dev')
source=("${url}/archive/${pkgver}/phrog-${pkgver}.tar.gz"
  "libphosh-0.43.patch")
sha512sums=('4ac04d47e1b0b33e6f8794e5317258002be79500ab38deee49eb0c97fd34eb832516ab6ace004d782fd5e5fa54f8ed81affc712503822c51e46ed33036c1f5cd'
  '00962de17ea6bc215e18fa5c613f663bb249632d4392bf9a5a36cb15315101983feea34b04ee8bc5c5b5e4290d9e73137ee561042a8e4bfd94caad1219a93d8f')
maintainer=("Oren Klopfer <oren@taumoda.com>")
external_connection=true
compatible=("ubuntu:devel" "ubuntu:plucky" "ubuntu:questing")

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
