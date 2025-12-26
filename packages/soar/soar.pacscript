pkgname="soar"
arch=("any")
pkgver="0.8.1"
license=("MIT")
repology=("project: soar")
url='https://soar.qaidvoid.dev/'
pkgdesc='Fast, modern package manager for Static Binaries and Portable Formats'
source=("https://github.com/pkgforge/soar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("208230b0f4588c84d52cf8ac64074f1815ca38658e5e1e4655474869b32e61ff")
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
