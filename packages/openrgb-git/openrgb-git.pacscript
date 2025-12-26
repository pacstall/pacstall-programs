pkgname="openrgb-git"
gives="openrgb"
pkgver="1.0rc1"
pkgrel="2"
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=("amd64" "arm64")
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
depends=("qtbase5-dev" "libusb-1.0-0-dev" "libhidapi-dev" "libmbedtls-dev")
makedepends=("qttools5-dev" "qtbase5-dev" "libusb-1.0-0-dev" "libhidapi-dev" "libmbedtls-dev" "pkgconf")
optdepends=('i2c-tools: Motherboard & RAM access')
provides=("openrgb")
conflicts=("openrgb")
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git")
sha256sums=("SKIP")
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${srcdir}"
  echo "i2c-dev" > openrgb.conf
}

build() {
  cd "${srcdir}/OpenRGB"
  export CXXFLAGS=${CXXFLAGS/-pipe/}
  qmake OpenRGB.pro PREFIX=/usr
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/lib/modules-load.d openrgb.conf
  cd "${srcdir}/OpenRGB"
  make INSTALL_ROOT="${pkgdir}" install
}
