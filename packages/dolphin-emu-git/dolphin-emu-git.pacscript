pkgname="dolphin-emu-git"
gives="dolphin-emu"
url='https://dolphin-emu.org'
source=("https://github.com/dolphin-emu/dolphin.git")
makedepends=("build-essential" "cmake" "ffmpeg" "libavcodec-dev" "libavformat-dev" "libavutil-dev" "libswscale-dev" "libevdev-dev" "libusb-1.0-0-dev" "libxrandr-dev" "libxi-dev" "libpangocairo-1.0-0" "qt6-base-private-dev" "libqt6svg6-dev" "libbluetooth-dev" "libasound2-dev" "libpulse-dev" "libgl1-mesa-dev" "libcurl4-openssl-dev" "libudev-dev" "libsystemd-dev | libeudev-dev")
depends=("${makedepends[@]}")
pkgver="5.0"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc='Dolphin is an emulator for running GameCube and Wii games'
license=('GPL-2.0-or-later')

prepare() {
  mkdir -p "${pkgdir}/usr/local/share/dolphin-emu"
  mkdir -p "${pkgdir}/usr/local/bin"
}

build() {
  cd dolphin
  mkdir build && cd build
  cmake ..  -DLINUX_LOCAL_DEV=true
  make -j"${NCPU}"
  cp -r ../Data/Sys/ Binaries/
  mv Binaries ../
}

package() {
  cp -r dolphin/Binaries "${pkgdir}/usr/local/share/dolphin-emu"
  ln -sf "/usr/local/share/dolphin-emu/Binaries/dolphin-emu" "${pkgdir}/usr/local/bin/dolphin-emu"
}
