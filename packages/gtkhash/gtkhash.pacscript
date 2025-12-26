pkgname="gtkhash"
arch=("any")
pkgver="1.5"
source=("@${pkgname}~${pkgver}::https://github.com/tristanheaven/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
makedepends=(build-essential
  libtool
  gettext
  autopoint
  appstream
  libglib2.0-dev
  libgtk-3-dev
  libgcrypt20-dev
  nettle-dev
  libb2-dev
  libmbedtls-dev
  libssl-dev
  linux-libc-dev
  librsvg2-bin
  libxml2-utils
  at-spi2-core
  xvfb
  gnome-icon-theme)
replaces=("${pkgname}")
pkgdesc="Desktop utility for computing message digests or checksums"
sha256sums=("7102a192eca3e82ed67a8252a6850440e50c1dbea7c6364bda154ec80f8ff005")

build() {
  local config_flags=(
    --enable-debug
    --enable-blake2
    --enable-gcrypt
    --enable-glib-checksums
    --enable-mbedtls
    --enable-nettle
    --enable-libcrypto
    --enable-linux-crypto
    --disable-dependency-tracking
  )

  cd "${pkgname}~${pkgver}"
  ./autogen.sh
  ./configure "${config_flags[@]}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
