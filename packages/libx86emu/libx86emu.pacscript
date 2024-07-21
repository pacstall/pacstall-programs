pkgname="libx86emu"
gives=("libx86emu3")
provides=("libx86emu-dev")
pkgver="3.5"
pkgdesc='x86 emulation library'
arch=("amd64")
url='https://github.com/wfeldt/libx86emu'
pacdeps=("setconf")
source=("git+https://github.com/wfeldt/libx86emu#tag=${pkgver}")
sha256sums=('SKIP')
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
