pkgname="dsview"
pkgver="1.3.2"
arch=("amd64" "arm64")
url='https://www.dreamsourcelab.com'
license=('GPL-3.0-or-later')
pkgdesc="Multi-function logic analyzer, oscilloscope and DAQ GUI"
repology=("project: ${pkgname}")
maintainer=("Huang Rui <vowstar@gmail.com>")
breaks=("${pkgname}-bin" "${pkgname}-git" "${pkgname}-deb")
source=("https://github.com/DreamSourceLab/DSView/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("da68674c32da7bd212883d599267a137ce152060d28796ea16cc3442695de7ab")
depends=(
  "libqt5core5a"
  "libqt5gui5"
  "libqt5widgets5"
  "libqt5concurrent5"
  "libglib2.0-0"
  "libusb-1.0-0"
  "libfftw3-double3"
  "libpython3-stdlib"
  "zlib1g"
)
makedepends=(
  "build-essential"
  "cmake"
  "pkg-config"
  "qtbase5-dev"
  "libglib2.0-dev"
  "libusb-1.0-0-dev"
  "libfftw3-dev"
  "libboost-dev"
  "python3-dev"
  "zlib1g-dev"
)

prepare() {
  cd "DSView-${pkgver}"
  sed -i 's/^cmake_minimum_required(VERSION [0-9.]*)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
  sed -i '/^cmake_minimum_required/a add_definitions(-D_DEFAULT_SOURCE)' CMakeLists.txt
  sed -i '/CMAKE_CXX_FLAGS_RELEASE "-O3"/d; /add_compile_options(-O3)/d' CMakeLists.txt
  sed -i '/^#include <string.h>$/a #include <strings.h>' \
    libsigrok4DSL/input/in_wav.c \
    libsigrok4DSL/strutil.c
}

build() {
  cd "DSView-${pkgver}"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel "${NCPU}"
}

package() {
  cd "DSView-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
