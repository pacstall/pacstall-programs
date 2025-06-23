pkgname="greetd-phrog"
pkgver="0.42.1"
pkgdesc="Mobile device greeter"
url='https://github.com/samcday/phrog'
arch=('amd64' 'arm64')
license=('GPL-3.0-only')
depends=('phosh' 'greetd' 'libphosh-0.43-0' 'libglib2.0-bin')
makedepends=('cargo' 'libphosh-0.43-dev')
source=("${url}/archive/${pkgver}/phrog-${pkgver}.tar.gz"
  "libphosh-0.43.patch")
sha512sums=('cae7347840e8c6358f36292a2497f05f18e456f8f8cdda0552ead3fe4037edb791c4b905f51e4c1b03abe2a1c643e9b848be099e5361bca52134391b7b460657'
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
