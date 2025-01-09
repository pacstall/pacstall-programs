pkgname="scrcpy"
pkgver="2.7"
pkgdesc="Display and control your Android device"
repology=("project: ${pkgname}")
url="https://github.com/Genymobile/scrcpy"
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replaces=("${pkgname}")
maintainer=()
source=(
  "@${pkgname}~${pkgver}::https://github.com/Genymobile/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-server::https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/${pkgname}-server-v${pkgver}"
)
sha256sums=(
  "3ceea215f6eccb59535f68a16db6db2b05a8a1c91bdcb4a6e222d3093a9daf8c"
  "a23c5659f36c260f105c022d27bcb3eafffa26070e7baa9eda66d01377a1adba"
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
