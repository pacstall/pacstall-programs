pkgname="ananicy-cpp"
arch=("any")
pkgver="1.1.0"
source=("@${pkgname}~${pkgver}::https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v${pkgver}/ananicy-cpp-v${pkgver}.tar.gz")
sha256sums=("49f59e8fa842c7603be344b7317eace773c3e416d881dae4ad7779b39b03fc4a")
pkgdesc="Rewrite of Ananicy in C++"
repology=("project: ananicy-cpp")
makedepends=("cmake" "g++" "libsystemd-dev" "ninja-build")
external_connection=true

build() {
  cd "${pkgname}~${pkgver}"
  cmake -S . -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_SYSTEMD=ON \
    -DVERSION="${pkgver}"
  cmake --build build --target ananicy-cpp --parallel "${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime
  install -m755 -d "${pkgdir}/etc/ananicy.d"
}
