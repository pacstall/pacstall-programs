name="scrcpy"
pkgver="2.3.1"
pkgdesc="Display and control your Android device"
repology=("project: ${name}")
homepage="https://github.com/Genymobile/scrcpy"
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replaces=("${name}")
maintainer="vigress8 <vig@disroot.org>"
source=(
  "https://github.com/Genymobile/${name}/archive/refs/tags/v${pkgver}.tar.gz"
  "${name}-server::https://github.com/Genymobile/${name}/releases/download/v${pkgver}/${name}-server-v${pkgver}"
)
hash=(
  "76f38779f00d91d0b46a399ebca32c82ff1facdbd843871b7e46c2e7cad38a42"
  "f6814822fc308a7a532f253485c9038183c6296a6c5df470a9e383b4f8e7605b"
)

prepare() {
  mkdir -p build
  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${name}-server"
}

build() {
  ninja -Cbuild -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -Cbuild install
}
