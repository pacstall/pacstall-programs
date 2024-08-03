pkgname="scrcpy"
pkgver="2.6.1"
pkgdesc="Display and control your Android device"
repology=("project: ${pkgname}")
url="https://github.com/Genymobile/scrcpy"
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replaces=("${pkgname}")
maintainer=("vigress8 <vig@disroot.org>")
source=(
  "https://github.com/Genymobile/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-server::https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/${pkgname}-server-v${pkgver}"
)
sha256sums=(
  "4948474f1494fdff852a0a7fa823a0b3c25d3ea0384acdaf46c322e34b13e449"
  "ca7ab50b2e25a0e5af7599c30383e365983fa5b808e65ce2e1c1bba5bfe8dc3b"
)

prepare() {
  cd "${_archive}"
  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${srcdir}/${pkgname}-server"
}

build() {
  cd "${_archive}"
  ninja -Cbuild -j"${NCPU}"
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -Cbuild install
}
