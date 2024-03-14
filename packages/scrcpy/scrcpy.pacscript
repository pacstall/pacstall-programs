name="scrcpy"
pkgver="2.4"
pkgdesc="Display and control your Android device"
repology=("project: ${name}")
homepage="https://github.com/Genymobile/scrcpy"
arch=("amd64" "arm64")
makedepends=("libavcodec-dev" "libavdevice-dev" "libavformat-dev" "libavutil-dev" "libsdl2-dev" "libswresample-dev" "libusb-1.0-0-dev" "meson" "ninja-build")
depends=("adb" "ffmpeg" "libsdl2-2.0-0" "libusb-1.0-0")
replace=("${name}")
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/Genymobile/${name}/archive/refs/tags/v${pkgver}.tar.gz"
server_url="https://github.com/Genymobile/${name}/releases/download/v${pkgver}/${name}-server-v${pkgver}"
hash="60596f6d4c11163083da3e6805666326873ed57f7defd8a20256b928a1d3503b"
server_hash="93c272b7438605c055e127f7444064ed78fa9ca49f81156777fd201e79ce7ba3"

prepare() {
  fancy_message info "Downloading ${name}-server"
  curl -L# -o "${name}-server" "${server_url}"
  if [[ $(sha256sum "${name}-server" | awk '{print $1}') != "${server_hash}" ]]; then
    fancy_message error "Integrity check failed for ${name}-server"
    return 1
  fi

  meson setup build --buildtype=release --strip -Db_lto=true -Dprebuilt_server="${name}-server"
}

build() {
  ninja -Cbuild -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -Cbuild install
}
