pkgname="ananicy-cpp"
arch=("any")
pkgver="1.2.0"
source=("@${pkgname}~${pkgver}::https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v${pkgver}/ananicy-cpp-v${pkgver}.tar.gz")
sha256sums=("d75157b9588748ce6ae04c3e2d71625d8eec6bf2d23e06f8cb6f9687c74813f7")
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
