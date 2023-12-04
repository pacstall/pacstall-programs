name="popsicle"
pkgver="1.3.0"
url="https://github.com/pop-os/popsicle/archive/refs/tags/1.3.0.zip"
license="MIT"
makedepends=("cargo" "libgtk-3-dev" "help2man")
pkgdesc="Multiple USB File Flasher"
hash="4dd0f92f46d0befabd56c0cea50829b4db6d2ae8a8673e3d31c7e4228b02248b"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
