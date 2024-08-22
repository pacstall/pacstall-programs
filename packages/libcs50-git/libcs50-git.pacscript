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

  # Manually skip or suppress the ldconfig error
  # Skipping ldconfig to avoid read-only filesystem issues
  echo "skipping the ldconfig because it gives error doing this after the install"
}

post_install() {
  ldconfig /usr/local/lib
}
