pkgname="polybar"
gives="polybar"
arch=("any")
pkgver="3.7.1"
source=("@${pkgname}~${pkgver}::https://github.com/polybar/polybar/releases/download/${pkgver}/polybar-${pkgver}.tar.gz")
makedepends=("cmake" "cmake-data" "pkg-config" "python3-sphinx" "python3-packaging" "libcairo2-dev" "libxcb1-dev" "libuv1-dev" "libxcb-util0-dev" "libxcb-randr0-dev" "libxcb-composite0-dev" "python3-xcbgen" "xcb-proto" "libxcb-image0-dev" "libxcb-ewmh-dev" "libxcb-icccm4-dev")
pkgdesc="Polybar aims to help users build beautiful and highly customizable status bars for their desktop environment, without the need of having a black belt in shell scripting"
maintainer=("Elsie19 <elsie19@pm.me>")
sha256sums=("5de6ad385ba09dc453a4e5ec7054749a4882b5b21a62c17ae40bf7c90613ff0f")
optdepends=("libxcb-xkb-dev: xkeyboard"
  "libxcb-xrm-dev: xrdb"
  "libxcb-cursor-dev: cursorclick/scroll"
  "libasound2-dev: alsa"
  "libpulse-dev: pulseaudio"
  "libjsoncpp-dev: json"
  "libmpdclient-dev: mpd"
  "libcurl4-openssl-dev: github"
  "libnl-genl-3-dev: network")
repology=("project: polybar")

build() {
  cd "${pkgname}~${pkgver}"
  mkdir build && cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cd build/
  make install DESTDIR="${pkgdir}"
}
