pkgname="gtkhash"
arch=("any")
pkgver="1.4"
source=("@${pkgname}~${pkgver}::https://github.com/tristanheaven/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
makedepends=("autoconf" "automake" "libtool" "intltool" "wget")
depends=("libgtk-3-dev" "libglib2.0-dev" "libgcrypt-dev" "nettle-dev" "libb2-dev" "openssl" "libmbedtls-dev")
replaces=("${pkgname}")
pkgdesc="gtkhash is a desktop utility for computing message digests or checksums."
sha256sums=("20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --enable-mbedtls --enable-nettle
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
