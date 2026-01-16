pkgname="xwayland-satellite"
pkgver="0.8"
arch=("amd64" "arm64")
pkgdesc="Xwayland outside your Wayland"
url='https://github.com/Supreeeme/xwayland-satellite'
license=('GPL-3.0-or-later')
source=("${url}.git#tag=v${pkgver}")
external_connection=true
makedepends=("clang" "xwayland" "libwayland-dev" "libclang-dev" "pkg-config" "cargo>=1.83.0" "libxcb-cursor-dev" "libxkbcommon-dev")
maintainer=("Alxhr0 <alxhr0@proton.me>")

build() {
  cd "${pkgname}"
  cargo build --locked --release -j"${NCPU}"
}

package() {
  cd "${pkgname}"
  install -vDm755 target/release/"${pkgname}" -t "${pkgdir}/usr/bin/"
}
