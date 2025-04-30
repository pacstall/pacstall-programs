pkgname="openrgb-git"
gives="openrgb"
pkgver="0.9"
pkgrel="2"
pkgdesc="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
arch=("amd64" "arm64")
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
depends=("qtbase5-dev" "libusb-1.0-0-dev" "libhidapi-dev" "libmbedtls-dev")
makedepends=("qttools5-dev" "qtbase5-dev" "libusb-1.0-0-dev" "libhidapi-dev" "libmbedtls-dev" "pkgconf")
optdepends=('i2c-tools: Motherboard & RAM access')
provides=("openrgb")
conflicts=("openrgb")
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git"
  "openrgb.conf::https://aur.archlinux.org/cgit/aur.git/plain/openrgb.conf?h=openrgb-git"
  "openrgb.service::https://aur.archlinux.org/cgit/aur.git/plain/openrgb.service?h=openrgb-git")
sha256sums=("SKIP"
  "b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2"
  "272dc43a77d0e48d29f32da753c7e05fd635883b173c21047f4eefa8bfc77938")
maintainer=("xdavius <xdavius@github.com>")

# Fix hueplusplus, waiting for upstream fix... thanks to Morg

case "${DISTRO}" in
  ubuntu:devel | ubuntu:plucky | ubuntu:questing | debian:testing | debian:sid | debian:trixie)
    prepare() {
      cd "${srcdir}/OpenRGB"
      # Fix libmbedtls-dev-3.* issue, fix hueplusplus build error...
      sed -i -- 's/#include "mbedtls\/certs.h"//g' dependencies/hueplusplus-1.1.0/src/EntertainmentMode.cpp
    }
    ;;
  *) ;;
esac

build() {
  cd "${srcdir}/OpenRGB"
  qmake OpenRGB.pro
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/lib/modules-load.d "."/openrgb.conf
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system "."/openrgb.service
  cd "${srcdir}/OpenRGB"
  make INSTALL_ROOT="${pkgdir}" install
}
