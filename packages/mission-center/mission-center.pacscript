pkgname="mission-center"
pkgver="1.1.0"
pkgdesc="Monitor your CPU, Memory, Disk, Network and GPU usage"
arch=("amd64" "arm64")
url='https://gitlab.com/mission-center-devs/mission-center'
license=("GPL-3.0-or-later")
depends=(
  "dmidecode"
  "libadwaita-1-0"
)
makedepends=(
  "blueprint-compiler"
  "cargo"
  "meson"
  "gettext"
  "pkg-config"
  "python3-pip"
  "python3-gi"
  "libdrm-dev"
  "libudev-dev"
  "libgbm-dev"
  "libpango1.0-dev"
  "libgdk-pixbuf-2.0-dev"
  "libgtk-4-dev"
  "libdbus-1-dev"
  "libadwaita-1-dev"
)
checkdepends=("appstream-util")
source=("${url}/-/archive/v${pkgver}/mission-center-v${pkgver}.tar.gz")
sha256sums=("7c634958158ab47c9a46445380314d3550382965b192a28de9253a3a83a2b7ee")
compatible=(
  "debian:trixie"
  "debian:sid"
  "ubuntu:oracular"
  "ubuntu:devel"
)
external_connection=true

prepare() {
  cd "${pkgname}-v${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-v${pkgver}"
  export CFLAGS="${CFLAGS:-} -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable

  meson setup build -Dbuildtype=release
  ninja -C build -j"${NCPU}"
}

check() {
  cd "${pkgname}-v${pkgver}"
  meson test -C build --print-errorlogs || :
}

package() {
  cd "${pkgname}-v${pkgver}"
  meson install -C build --no-rebuild --destdir "${pkgdir}"
}
