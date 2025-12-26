pkgname="python3-fvs"
pkgver="0.3.4"
pkgdesc="File Versioning System with hash comparison, deduplication and data storage to create unlinked states that can be deleted"
arch=("any")
url='https://github.com/mirkobrombin/FVS'
license=("MIT")
depends=("python3-orjson")
makedepends=("python3-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("c57bcda81cd7500bc54b8f93c81405cccbc4c54b794209f8316ae27f43372696")
compatible=(
  "debian:trixie"
  "debian:sid"
  "ubuntu:oracular"
  "ubuntu:devel"
)

build() {
  cd "FVS-${pkgver}"
  python3 setup.py build
}

package() {
  cd "FVS-${pkgver}"
  python3 setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
