pkgname=tuckr-git
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="A super powered replacement for GNU Stow"
arch=('amd64' 'i386' 'arm64')
url="https://github.com/RaphGL/Tuckr"
license=('GPL-3.0')
makedepends=('cargo' 'git')
source=("git+${url}#tag=${pkgver}")
sha256sums=("SKIP")
repology=("project: tuckr")
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")
external_connection=true

prepare() {
  cd Tuckr
  echo 'cargo-features = ["edition2024"]' > Cargo.toml.tmp
  cat Cargo.toml >> Cargo.toml.tmp
  mv Cargo.toml.tmp Cargo.toml
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd Tuckr
  cargo build --release
}

package() {
  cd Tuckr
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/tuckr"
}
