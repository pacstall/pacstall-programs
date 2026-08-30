pkgname="lact"
repology=("project: lact")
arch=('x86_64' 'aarch64')
pkgver="0.10.1"
_min_cargo="1.97"
_commit='30dc182391e2c002f6f7c988e76aa477a4772aa2'
url='https://github.com/ilya-zlobintsev/LACT'
source=("https://github.com/ilya-zlobintsev/LACT.git#commit=${_commit}")
sha256sums=("SKIP")
depends=(
  "hwdata"
  "vulkan-tools"
  "clinfo"
  "libgtk-4-1"
  "libdrm2"
  "libdrm-amdgpu1"
  "libadwaita-1-0"
  "libdisplay-info-bin"
)
makedepends=(
  "cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup"
  "make"
  "git"
  "clang"
  "vulkan-tools"
  "clinfo"
  "libgtk-4-dev"
  "pkg-config"
  "build-essential"
  "libdrm-dev"
  "dbus"
  "libadwaita-1-dev"
  "libdisplay-info-dev"
)
pkgdesc="Linux GPU Control Application"
backup=('etc/lact/config.yaml')
maintainer=("pejuton <pejuton@proton.me>")
license=('MIT')
external_connection=true

prepare() {
  cd "LACT"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export RUSTUP_TOOLCHAIN=stable
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -p lact --frozen --release --jobs "${NCPU}"
}

package() {
  cd "LACT"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
