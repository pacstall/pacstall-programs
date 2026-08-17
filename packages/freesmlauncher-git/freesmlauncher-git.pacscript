pkgname="freesmlauncher-git"
gives="freesmlauncher"
pkgdesc="Prism Launcher fork aimed to provide a free way to play Minecraft"
url='https://github.com/FreesmTeam/FreesmLauncher'
maintainer="CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>"
pkgver="0.r0"
arch=("any")
source=("git+https://github.com/FreesmTeam/FreesmLauncher.git")
makedepends=(
  "build-essential"
  "pkg-config"
  "cmake"
  "ninja-build"
  "extra-cmake-modules"
  "openjdk-17-jdk | openjdk-21-jdk"
  "qt6-base-dev"
  "qt6-networkauth-dev"
  "libqt6svg6-dev"
  "libcmark-dev"
  "cmark"
  "libarchive-dev"
  "libgl-dev"
  "libqrencode-dev"
  "scdoc"
  "libtomlplusplus-dev"
  "libvulkan-dev"
  "gamemode-dev"
  "zlib1g-dev"
)

build() {
  cd "${srcdir}/FreesmLauncher"

  # test to compile successfully because without this it wouldnt work as of develop@5114de6
  sed -i '/<property name="supportedDragActions">/,+2d' launcher/ui/dialogs/ModToggleConfirmDialog.ui

  # here to compile successfully because JDK 20+ dropped -source 7 support
  sed -i 's/-target 7 -source 7/-target 8 -source 8/' libraries/launcher/CMakeLists.txt libraries/javacheck/CMakeLists.txt

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLauncher_BUILD_PLATFORM="Pacstall"

  cmake --build build -j"${NCPU}"
}

package() {
  cd "${srcdir}/FreesmLauncher"
  DESTDIR="${pkgdir}" cmake --install build
}
