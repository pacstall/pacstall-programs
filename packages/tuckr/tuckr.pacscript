pkgname="tuckr"
pkgver="0.11.0"
pkgdesc="Super powered replacement for GNU Stow"
arch=('amd64' 'i386' 'arm64')
url='https://github.com/RaphGL/Tuckr'
license=('GPL-3.0')
makedepends=('cargo>=1.80' 'git')
source=("git+${url}#tag=${pkgver}")
sha256sums=("SKIP")
repology=("project: tuckr")
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")
external_connection=true

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd Tuckr
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd Tuckr
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/tuckr"
}
