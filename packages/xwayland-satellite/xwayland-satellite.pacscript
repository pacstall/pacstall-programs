pkgname="xwayland-satellite"
pkgver="0.8.2"
pkgrel="2"
arch=("amd64" "arm64")
pkgdesc="Xwayland outside your Wayland"
url='https://github.com/Supreeeme/xwayland-satellite'
license=('GPL-3.0-or-later')
source=("${url}.git#tag=v${pkgver}")
external_connection=true
_cargo_ver="1.83"
makedepends=(
  "clang"
  "xwayland"
  "libwayland-dev"
  "libclang-dev"
  "pkg-config"
  "cargo-${_cargo_ver} | cargo>=${_cargo_ver}.0 | rustup"
  "libxcb-cursor-dev"
  "libxkbcommon-dev"
)
depends=("xwayland")
maintainer=("Alxhr0 <alxhr0@proton.me>")

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export PATH="/usr/lib/rust-${_cargo_ver}/bin:${PATH}"
  cargo build --locked --release -j"${NCPU}" -F systemd
}

package() {
  cd "${pkgname}"
  install -vDm755 target/release/"${pkgname}" -t "${pkgdir}/usr/bin/"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/xwayland-satellite|' resources/xwayland-satellite.service
  install -vDm644 resources/xwayland-satellite.service -t "${pkgdir}/usr/lib/systemd/system/"
}
