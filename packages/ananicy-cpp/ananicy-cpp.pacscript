name="ananicy-cpp"
version="1.1.0"
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v${version}/ananicy-cpp-v${version}.tar.gz"
hash="49f59e8fa842c7603be344b7317eace773c3e416d881dae4ad7779b39b03fc4a"
description="Rewrite of Ananicy in C++"
repology=("project: ananicy-cpp")
build_depends=("cmake" "g++" "libsystemd-dev" "ninja-build")

build() {
  cmake -S . -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_SYSTEMD=ON \
    -DVERSION=${version}
    cmake --build build --target ananicy-cpp --parallel "${NCPU}"
}

package() {
    sudo DESTDIR="${pkgdir}" cmake --install build --component Runtime
    sudo install -m755 -d "${pkgdir}/etc/ananicy.d"
}
