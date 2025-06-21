pkgname="gtkhash"
arch=("any")
pkgver="1.5"
source=("@${pkgname}~${pkgver}::https://github.com/tristanheaven/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
makedepends=("autoconf" "automake" "libtool" "intltool" "wget")
depends=("libgtk-3-dev" "libglib2.0-dev" "libgcrypt-dev" "nettle-dev" "libb2-dev" "openssl" "libmbedtls-dev")
replaces=("${pkgname}")
pkgdesc="gtkhash is a desktop utility for computing message digests or checksums."
sha256sums=("7102a192eca3e82ed67a8252a6850440e50c1dbea7c6364bda154ec80f8ff005")

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
