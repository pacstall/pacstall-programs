pkgname="tor"
repology=("project: ${pkgname}")
replaces=("${pkgname}")
breaks=("${pkgname}-git")
arch=("any")
pkgver="0.4.8.16"
source=("@${pkgname}~${pkgver}::https://dist.torproject.org/${pkgname}-${pkgver}.tar.gz")
makedepends=("make" "autoconf" "libevent-dev" "libnss3-dev" "libzstd-dev" "liblzma-dev" "openssl" "libssl-dev" "ca-certificates" "libseccomp-dev" "zlib1g-dev")
depends=("openssl")
pkgdesc="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use"
sha256sums=("6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --enable-lzma --enable-zstd
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
