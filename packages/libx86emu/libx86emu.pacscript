pkgname="libx86emu"
gives=("libx86emu3")
provides=("libx86emu-dev")
pkgver="3.7"
pkgdesc='x86 emulation library'
arch=("amd64")
url='https://github.com/wfeldt/libx86emu'
pacdeps=("setconf")
source=("https://github.com/wfeldt/libx86emu/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('03754aede79530baa0e862e1aad5527e9c1bd3371736b1ab5a2bc769e4a3d680')
maintainer=("xdavius <xdavius@github.com>")
external_connection=true

prepare() {
  setconf "${pkgname}"/Makefile \
    CFLAGS="${CFLAGS}0 -shared -fPIC -fvisibility=hidden -fomit-frame-pointer -w" \
    LDFLAGS="-Wl,-shared"
}

build() {
  make -C "${pkgname}" LIBDIR=/usr/lib
}

package() {
  make -C "${pkgname}" LIBDIR=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
