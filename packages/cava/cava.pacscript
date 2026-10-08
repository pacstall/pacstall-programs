pkgname="cava"
pkgver="1.0.0"
arch=("any")
pkgdesc="Cross-platform audio visualizer"
url='https://github.com/karlstav/cava'
license=("MIT")
maintainer=("Don Alfons <donnisnoni@outlook.com>")
repology=("project: cava")
source=("@${pkgname}~${pkgver}::https://github.com/karlstav/cava/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("603c6af87a4bd100a171dad1c657364b914d172eca1a27a6f18a71ea586056cc")
breaks=("${pkgname}-bin" "${pkgname}-deb" "${pkgname}-git" "${pkgname}-app")
makedepends=(
  "build-essential"
  "pkg-config"
  "libtool"
  "libfftw3-dev"
  "libiniparser-dev"
  "libasound2-dev"
  "libpulse-dev"
  "libpipewire-0.3-dev"
  "libjack-jackd2-dev"
  "libsdl2-dev"
  "libncurses-dev"
)
depends=(
  "libc6"
  "libfftw3-double3"
  "libiniparser4"
  "libasound2t64 | libasound2"
  "libpulse0"
  "libpipewire-0.3-0t64 | libpipewire-0.3-0"
  "libjack-jackd2-0"
  "libsdl2-2.0-0"
  "libncursesw6"
  "libtinfo6"
)

build() {
  cd "${pkgname}~${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-input-alsa \
    --enable-input-pipewire \
    --enable-input-pulse \
    --enable-input-jack \
    --enable-output-sdl \
    --enable-output-sdl-glsl \
    --enable-output-ncurses

  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  gzip -n -9 "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
