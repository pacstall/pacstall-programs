pkgname="libx86emu"
gives=("libx86emu3")
provides=("libx86emu-dev")
pkgver="3.5"
pkgdesc='x86 emulation library'
arch=("amd64")
url='https://github.com/wfeldt/libx86emu'
pacdeps=("setconf")
source=("git+https://github.com/wfeldt/libx86emu#commit=41aaa2f246d362f6d7dea262052a43141743ead2") # tag: 3.5
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")
external_connection=true

prepare() {
# shellcheck disable=all
  sed -i 's/-shared -Wl/-shared '"$LDFLAGS"'/g' ${pkgname}/Makefile
  setconf "${pkgname}"/Makefile \
    CFLAGS="${CFLAGS}0 -shared -fPIC -fvisibility=hidden -fomit-frame-pointer -w"
}

build() {
  make -C "${pkgname}" LIBDIR=/usr/lib
}

package() {
  make -C "${pkgname}" LIBDIR=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
