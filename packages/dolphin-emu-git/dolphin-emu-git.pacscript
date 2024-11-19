pkgname="dolphin-emu-git"
gives="dolphin-emu"
url='https://dolphin-emu.org'
source=("${gives}::https://github.com/dolphin-emu/dolphin.git")
makedepends=("build-essential" "ninja-build" "cmake" "ffmpeg" "libavcodec-dev" "libavformat-dev" "libavutil-dev" "libswscale-dev" "libevdev-dev" "libusb-1.0-0-dev" "libxrandr-dev" "libxi-dev" "libpangocairo-1.0-0" "qt6-base-private-dev" "libqt6svg6-dev" "libbluetooth-dev" "libasound2-dev" "libpulse-dev" "libgl1-mesa-dev" "libcurl4-openssl-dev" "libudev-dev" "libsystemd-dev | libeudev-dev")
depends=("${makedepends[@]}")
arch=("any")
pkgver="5.0"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc='An emulator for running GameCube and Wii games'
license=('GPL-2.0-or-later')

build() {
  cmake -S dolphin-emu -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISTRIBUTOR=Pacstall \
    -DENABLE_ANALYTICS=OFF \
    -DENABLE_AUTOUPDATE=OFF \
    -DENABLE_LTO=ON \
    -DENABLE_TESTS=OFF \
    -DUSE_MGBA=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 dolphin-emu/Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}
