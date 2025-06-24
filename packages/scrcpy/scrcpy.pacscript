pkgname="scrcpy"
pkgver="3.3.1"
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
  "9999d2ff3605e1c5d1efb0b737ed6e240a93a928091ab356ba07199c92f52ace"
  "a0f70b20aa4998fbf658c94118cd6c8dab6abbb0647a3bdab344d70bc1ebcbb8"
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
