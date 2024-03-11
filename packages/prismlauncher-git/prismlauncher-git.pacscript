name="prismlauncher-git"
gives="prismlauncher"
url="https://github.com/PrismLauncher/PrismLauncher.git"
pkgver="8.2"
makedepends=("qt6-base-dev" "qtbase5-dev" "qtchooser" "qt5-qmake" "qmake6" "qtbase5-dev-tools" "cmake" "ninja-build" "extra-cmake-modules" "zlib1g-dev" "openjdk-17-jdk" "libgl1-mesa-dev" "scdoc")
case "${DISTRO}" in
  *:jammy)
    makedepends+=("libqt6core5compat6-dev")
    ;;
  *)
    makedepends+=("qt6-5compat-dev")
    ;;
esac
pkgdesc="Custom launcher for Minecraft"
maintainer="Oren Klopfer <oren@taumoda.com>"

pkgver() {
  git ls-remote "${url}" develop | cut -f1 | cut -c1-8
}

build() {
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_LTO=ON

  cmake --build build
}

package() {
  sudo DESTDIR="${pkgdir}" cmake --install build
}
