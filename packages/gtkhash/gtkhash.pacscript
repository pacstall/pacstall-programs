name="gtkhash"
pkgver="1.4"
source=("https://github.com/tristanheaven/${name}/releases/download/v${pkgver}/${name}-${pkgver}.tar.xz")
makedepends=("autoconf" "automake" "libtool" "intltool" "wget")
depends=("libgtk-3-dev" "libglib2.0-dev" "libgcrypt-dev" "nettle-dev" "libb2-dev" "openssl" "libmbedtls-dev")
replaces=("${name}")
pkgdesc="gtkhash is a desktop utility for computing message digests or checksums."
hash=("20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4")

build() {
  ./configure --enable-mbedtls --enable-nettle
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${name}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
