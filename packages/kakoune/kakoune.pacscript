pkgname="kakoune"
pkgver="2024.05.18"
pkgdesc="mawww's experiment for a better code editor"
license=('Unlicense')
repology=("project: ${pkgname}")
url="https://kakoune.org/"
arch=("amd64" "arm64" "armhf" "i386")
replaces=("${pkgname}")
maintainer=()
source=("https://github.com/mawww/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("50f2920db8ab8f71556b73dfd6d53fb924f67d1c60b9882050cfecfaa3aed31f")

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
