pkgname="scrcpy"
pkgver="4.1"
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
  "537b2ade623cb94b6edddfa5c61bf0b0af21484aa8365ea2531b686ea573249a"
  "deacb991ed2509715160ffdc7907e47b4160eb30d1566217e9047fd5b8850cae"
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
