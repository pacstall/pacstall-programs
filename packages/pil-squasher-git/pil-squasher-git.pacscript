pkgname="pil-squasher-git"
gives="${pkgname%-git}"
arch=("any")
pkgver="0.0.1"
source=("https://github.com/linux-msm/${gives}.git")
pkgdesc="Firmware compiler"
maintainer=("Oren Klopfer <oren@taumoda.com>")
makedepends=("make")
repology=("project: ${pkgname}")

build() {
  cd "${gives}"
  make -j"${NCPU}" prefix="/usr"
}

package() {
  cd "${gives}"
  make install prefix="/usr" DESTDIR="${pkgdir}"
}
