pkgname="openvr"
gives="libopenvr-dev"
provides=("libopenvr-api1" "libopenvr-apt1t64")
replace=("libopenvr-dev" "libopenvr-api1" "libopenvr-apt1t64")
pkgver="2.15.6"
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors"
arch=("amd64")
url='https://github.com/ValveSoftware/openvr'
license=("BSD-3-Clause")
depends=("libgl1")
makedepends=("cmake" "libgl-dev")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "openvr-fix-vsprintf_s.patch::${url}/pull/594.patch")
sha256sums=('e184cb625010fab7043a9d5e1e000fdeb3067a152bb3169ef53f64dfac37164c'
  '1d954060f27b16485e398654d6730105abc251d372da03fbba38496db17885ae'
  'f79c6edf25efa1aac42b60db48d72f4e3c771039c9cd0fc0870fd51f17712229')
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../openvr-fix-vsprintf_s.patch
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED=1
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgname}-${pkgver}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
