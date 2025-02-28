pkgname="soar"
arch=("any")
pkgver="0.5.9"
license=("MIT")
repology=("project: soar")
url='https://soar.qaidvoid.dev/'
pkgdesc='Fast, modern package manager for Static Binaries and Portable Formats'
source=("https://github.com/pkgforge/soar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("70be79806608cfb8482bc9d81e2238117cd31a60734939907031c25f76ed266b")
makedepends=("cargo>=1.82.0")
maintainer=("Elsie19 <hwengerstickel@pm.me>")
external_connection=true

build() {
  cd "soar-${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "soar-${pkgver}"
  install -Dm755 "target/release/soar" -t "${pkgdir}/usr/bin"
}
