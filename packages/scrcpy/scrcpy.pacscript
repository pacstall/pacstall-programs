pkgname="scrcpy"
pkgver="2.4"
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
  "60596f6d4c11163083da3e6805666326873ed57f7defd8a20256b928a1d3503b"
  "93c272b7438605c055e127f7444064ed78fa9ca49f81156777fd201e79ce7ba3"
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
