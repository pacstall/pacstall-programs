name="batsignal"
repology=("project: ${name}")
pkgver="1.6.4"
source=("https://github.com/electrickite/batsignal/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("pkg-config" "libnotify4" "libnotify-dev")
breaks=("${name}" "${name}-git")
pkgdesc="A lightweight battery monitor daemon"
hash=("58439dac2b678ab798831fe861c06d2d5c128c4bb4bae1476a62ba1771da3983")
maintainer="Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>"

build() {
  sed -i '47d' Makefile
  sed -i '48d' Makefile
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
