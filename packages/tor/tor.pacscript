pkgname="tor"
repology=("project: ${pkgname}")
replaces=("${pkgname}")
breaks=("${pkgname}-git")
arch=("any")
pkgver="0.4.7.13"
source=("@${pkgname}~${pkgver}::https://dist.torproject.org/${pkgname}-${pkgver}.tar.gz")
makedepends=("make" "autoconf" "libevent-dev" "libnss3-dev" "libzstd-dev" "liblzma-dev" "openssl" "libssl-dev" "ca-certificates" "libseccomp-dev" "zlib1g-dev")
depends=("openssl")
pkgdesc="Tor protects your privacy on the internet by hiding the connection between your Internet address and the services you use"
sha256sums=("2079172cce034556f110048e26083ce9bea751f3154b0ad2809751815b11ea9d")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --enable-lzma --enable-zstd
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
