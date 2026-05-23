pkgname="scrcpy"
pkgver="3.3.4"
pkgdesc="Display and control your Android device"
repology=("project: ${pkgname}")
url='https://github.com/Genymobile/scrcpy'
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replaces=("${pkgname}")
source=(
  "@${pkgname}~${pkgver}::https://github.com/Genymobile/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-server::https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/${pkgname}-server-v${pkgver}"
)
sha256sums=(
  "03b72d1f71ca7783cff2995ca7cd8c67b9b75038a3cc35e443a1913e951b49dd"
  "8588238c9a5a00aa542906b6ec7e6d5541d9ffb9b5d0f6e1bc0e365e2303079e"
)

prepare() {
  cd "${pkgname}~${pkgver}"
  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${srcdir}/${pkgname}-server"
}

build() {
  cd "${pkgname}~${pkgver}"
  ninja -Cbuild -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -Cbuild install
}
