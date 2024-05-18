pkgname="prismlauncher-git"
gives="prismlauncher"
source=("https://github.com/PrismLauncher/PrismLauncher.git")
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
maintainer=("Oren Klopfer <oren@taumoda.com>")


build() {
  cd "${_archive}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_LTO=ON

  cmake --build build
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" cmake --install build
}
