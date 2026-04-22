pkgname="lact"
repology=("project: lact")
arch=('x86_64' 'aarch64')
pkgver="0.8.4"
_commit='b65ae69a1e554f6ff2aef8cda95fe78d99dd3ca8'
url='https://github.com/ilya-zlobintsev/LACT'
source=("https://github.com/ilya-zlobintsev/LACT.git#commit=${_commit}")
sha256sums=("SKIP")
depends=("hwdata"
  "vulkan-tools"
  "clinfo"
  "libgtk-4-1"
  "libdrm2"
  "libdrm-amdgpu1"
  "libadwaita-1-0")
makedepends=("cargo>=1.84 | rustup"
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
  "libadwaita-1-dev")
pkgdesc="Linux GPU Control Application"
backup=('etc/lact/config.yaml')
maintainer=("pejuton <pejuton@proton.me>")
license=('MIT')
external_connection=true

prepare() {
  cd "LACT"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_GIT_FETCH_WITH_CLI="true"
  cargo fetch --locked --target "${AARCH}-unknown-linux-gnu"
}

build() {
  cd "LACT"
  CFLAGS+=' -ffat-lto-objects'

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_NET_GIT_FETCH_WITH_CLI="true"
  cargo build -p lact --frozen --release --jobs "${NCPU}"
}

package() {
  cd "LACT"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
