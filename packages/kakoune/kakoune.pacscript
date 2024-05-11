pkgname="kakoune"
pkgver="2023.08.05"
pkgdesc="mawww's experiment for a better code editor"
repology=("project: ${pkgname}")
url="https://kakoune.org/"
arch=("amd64" "arm64" "i386")
replaces=("${pkgname}")
maintainer=("vigress8 <vig@disroot.org>")
source=("https://github.com/mawww/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1ad7bfe9e1d861115cd418cb500990ea5fa63726e998df13702e5caa8fc84356")

build() {
  cd "${_archive}"
  cd src
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
