pkgname="soar"
arch=("any")
pkgver="0.11.0"
license=("MIT")
repology=("project: soar")
url='https://soar.qaidvoid.dev/'
pkgdesc='Fast, modern package manager for Static Binaries and Portable Formats'
source=("https://github.com/pkgforge/soar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ad5d8b11d53b0be18b7dd773febdaa1cdf83f997c5886ec6c22ad24e04c44692")
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
