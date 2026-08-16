pkgname="soar"
arch=("any")
pkgver="0.13.0"
license=("MIT")
repology=("project: soar")
url='https://soar.qaidvoid.dev/'
pkgdesc='Fast, modern package manager for Static Binaries and Portable Formats'
source=("https://github.com/pkgforge/soar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1d289ea0291dd9b1ccaf5a124aa66005c31fd4fb3d0952a6f0df4a2231371ed2")
makedepends=("cargo>=1.88.0 | rustup")
maintainer=("Elsie19 <elsie19@pm.me>")
external_connection=true

build() {
  cd "soar-${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "soar-${pkgver}"
  install -Dm755 "target/release/soar" -t "${pkgdir}/usr/bin"
}
