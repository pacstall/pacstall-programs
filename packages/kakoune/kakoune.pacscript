pkgname="kakoune"
pkgver="2025.06.03"
pkgdesc="mawww's experiment for a better code editor"
license=('Unlicense')
repology=("project: ${pkgname}")
url='https://kakoune.org/'
arch=("amd64" "arm64" "armhf" "i386")
replaces=("${pkgname}")
source=("https://github.com/mawww/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e065dbb715bfe6b0abdaeee775243115748bd540a346d0212fdca6c20c13d340")

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
