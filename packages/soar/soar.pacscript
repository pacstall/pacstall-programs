pkgname="soar"
arch=("any")
pkgver="0.6.3"
license=("MIT")
repology=("project: soar")
url='https://soar.qaidvoid.dev/'
pkgdesc='Fast, modern package manager for Static Binaries and Portable Formats'
source=("https://github.com/pkgforge/soar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ccb28356d524daea65ec437d956c74d05b4d0adbc4103edff0f3c68177ea2fa4")
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
