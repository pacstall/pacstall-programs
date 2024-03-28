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
source=("https://github.com/Genymobile/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
server_url="https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/${pkgname}-server-v${pkgver}"
sha256sums=("60596f6d4c11163083da3e6805666326873ed57f7defd8a20256b928a1d3503b")
server_hash="93c272b7438605c055e127f7444064ed78fa9ca49f81156777fd201e79ce7ba3"

prepare() {
  cd "${_archive}"
  fancy_message info "Downloading ${pkgname}-server"
  curl -L# -o "${pkgname}-server" "${server_url}"
  if [[ $(sha256sum "${pkgname}-server" | awk '{print $1}') != "${server_hash}" ]]; then
    fancy_message error "Integrity check failed for ${pkgname}-server"
    return 1
  fi

  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${pkgname}-server"
}

build() {
  cd "${_archive}"
  ninja -Cbuild -j"${NCPU}"
}

package() {
  cd "${_archive}"
  sudo DESTDIR="${pkgdir}" ninja -Cbuild install
}
