name="kakoune"
pkgver="2023.08.05"
pkgdesc="mawww's experiment for a better code editor"
repology=("project: ${name}")
homepage="https://kakoune.org/"
arch=("amd64" "arm64" "i386")
replace=("${name}")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/mawww/${name}/archive/refs/tags/v${pkgver}.tar.gz"
hash="1ad7bfe9e1d861115cd418cb500990ea5fa63726e998df13702e5caa8fc84356"

build() {
  cd src
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
