pkgname="libcs50-git"
gives="libcs50"
pkgver="11.0.3"
source=("https://github.com/cs50/libcs50.git")
makedepends=("make")
maintainer=("Vaibhav Sharma <vvaibhavv3434@gmail.com>")
pkgdesc="Library provided by Harvard University for learning the basic C language"

build() {
  cd "${_archive}"
  make
}

package() {
  cd "${_archive}"
  make DESTDIR="${pkgdir}/usr/local" install || true
}

post_install() {
  ldconfig /usr/local/lib
}
