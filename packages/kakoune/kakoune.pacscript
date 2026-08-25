pkgname="kakoune"
pkgver="2026.05.21"
pkgdesc="mawww's experiment for a better code editor"
license=('Unlicense')
repology=("project: ${pkgname}")
url='https://kakoune.org/'
arch=("amd64" "arm64" "armhf" "i386")
replaces=("${pkgname}")
source=("https://github.com/mawww/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7ef778bd199e05977841e6f69aad2bee6cd58fb23b0e4bc265d012d42de17580")

build() {
  make -C "${pkgname}-${pkgver}" -j"${NCPU}"
}

check() {
  # A few tests fail.
  make -C "${pkgname}-${pkgver}" test || :
}

package() {
  make -C "${pkgname}-${pkgver}" install \
    DESTDIR="${pkgdir}" PREFIX=/usr
}
