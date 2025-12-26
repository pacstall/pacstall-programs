pkgname="openvr"
gives="libopenvr-dev"
provides=("libopenvr-api1" "libopenvr-apt1t64")
replace=("libopenvr-dev" "libopenvr-api1" "libopenvr-apt1t64")
pkgver="2.12.1"
pkgdesc="API and runtime that allows access to VR hardware from multiple vendors"
arch=("amd64")
url='https://github.com/ValveSoftware/openvr'
license=("BSD-3-Clause")
depends=("libjsoncpp25" "libgl1")
makedepends=("cmake" "libjsoncpp-dev" "libgl-dev")
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "openvr-fix-vsprintf_s.patch::${url}/pull/594.patch"
  "openvr-use-system-jsoncpp-1.23.7.patch::${url}/pull/1716.patch")
sha256sums=('71a97dc98f7512f1d1a19f56058c536910989b4d047eceff57977ad09c52740f'
  '1d954060f27b16485e398654d6730105abc251d372da03fbba38496db17885ae'
  'f79c6edf25efa1aac42b60db48d72f4e3c771039c9cd0fc0870fd51f17712229')
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${pkgname}-${pkgver}"
  rm -rf thirdparty/jsoncpp
  patch -p1 < ../openvr-fix-vsprintf_s.patch
  patch -p1 < ../openvr-use-system-jsoncpp-1.23.7.patch
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED=1 \
    -DUSE_SYSTEM_JSONCPP=True \
    -DCMAKE_CXX_FLAGS=-I/usr/include/jsoncpp
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgname}-${pkgver}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
