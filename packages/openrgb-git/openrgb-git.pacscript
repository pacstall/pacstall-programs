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
source=("git+https://gitlab.com/CalcProgrammer1/OpenRGB.git"
  "openrgb.conf::https://aur.archlinux.org/cgit/aur.git/plain/openrgb.conf?h=openrgb-git")
sha256sums=("SKIP"
  "b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2")
maintainer=("xdavius <xdavius@github.com>")

#prepare() {
# Fix hueplusplus, waiting for upstream fix... thanks to Morg

#case "${DISTRO}" in
#  ubuntu:devel | ubuntu:plucky | ubuntu:questing | debian:testing | debian:sid | debian:trixie)
#      cd "${srcdir}/OpenRGB"
#      # Fix libmbedtls-dev-3.* issue, fix hueplusplus build error...
#      sed -i -- 's/#include "mbedtls\/certs.h"//g' dependencies/hueplusplus-1.1.0/src/EntertainmentMode.cpp
#    ;;
#  *) ;;
#esac
#}

build() {
  cd "${srcdir}/OpenRGB"
  export CXXFLAGS=${CXXFLAGS/-pipe/}
  qmake OpenRGB.pro PREFIX=/usr
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/lib/modules-load.d "."/openrgb.conf
  cd "${srcdir}/OpenRGB"
  make INSTALL_ROOT="${pkgdir}" install
}
