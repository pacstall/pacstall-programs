name="scrcpy"
gives="${name}"
pkgver="2.3.1"
pkgdesc="Display and control your Android device"
repology=("project: ${gives}")
homepage="https://github.com/Genymobile/scrcpy"
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replace=("${gives}")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/Genymobile/${gives}/archive/refs/tags/v${pkgver}.tar.gz"
hash="76f38779f00d91d0b46a399ebca32c82ff1facdbd843871b7e46c2e7cad38a42"

prepare() {
  wget -qO "${gives}-server" "https://github.com/Genymobile/${gives}/releases/download/v${pkgver}/${gives}-server-v${pkgver}"
  wget -q "https://github.com/Genymobile/${gives}/releases/download/v${pkgver}/SHA256SUMS.txt"
  if [[ $(sha256sum "${gives}-server" | awk '{print $1}') != $(awk 'FNR <= 1 {print $1}' "SHA256SUMS.txt") ]]; then
    fancy_message error "Could not verify integrity of ${gives}-server"
    return 1;
  fi

  mkdir -p build
  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${gives}-server"
}

build() {
  ninja -Cbuild -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -Cbuild install
}
