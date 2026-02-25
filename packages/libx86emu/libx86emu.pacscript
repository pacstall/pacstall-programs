pkgname="libx86emu"
gives=("libx86emu3")
provides=("libx86emu-dev")
pkgver="3.7"
pkgdesc='x86 emulation library'
arch=("amd64")
url='https://github.com/wfeldt/libx86emu'
pacdeps=("setconf")
source=("@${pkgname}~${pkgver}::https://github.com/wfeldt/libx86emu/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('03754aede79530baa0e862e1aad5527e9c1bd3371736b1ab5a2bc769e4a3d680')
maintainer=("xdavius <xdavius@github.com>")
external_connection=true

prepare() {
  cd "${pkgname}~${pkgver}"
  setconf Makefile \
    CFLAGS="${CFLAGS}0 -shared -fPIC -fvisibility=hidden -fomit-frame-pointer -w" \
    LDFLAGS="-Wl,-shared"
}

build() {
  cd "${pkgname}~${pkgver}"
  make LIBDIR=/usr/lib -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make LIBDIR=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
