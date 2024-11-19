pkgname="libcs50-git"
gives="libcs50"
arch=("any")
pkgver="11.0.3"
source=("https://github.com/cs50/libcs50.git")
makedepends=("make")
maintainer=("Vaibhav Sharma <vvaibhavv3434@gmail.com>")
pkgdesc="Library provided by Harvard University for learning the basic C language"

build() {
  cd "${gives}"
  make -j"${NCPU}"
}

package() {
  cd "${gives}"
  make DESTDIR="${pkgdir}/usr/local" install || true
}

post_install() {
  ldconfig /usr/local/lib
}
