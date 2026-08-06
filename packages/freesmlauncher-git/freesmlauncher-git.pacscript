pkgname="freesmlauncher-git"
gives="freesmlauncher"
pkgdesc="A Prism Launcher fork aimed to provide a free way to play Minecraft"
homepage="https://github.com/FreesmTeam/FreesmLauncher"
maintainer="CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>"
pkgrel="1"
pkgver="0.r0"
arch=("amd64" "arm64")

source=("git+https://github.com/FreesmTeam/FreesmLauncher.git")

pkgver() {
  cd "${srcdir}/FreesmLauncher"
  printf "%s.r%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=(
  "build-essential"
  "cmake"
  "ninja-build"
  "extra-cmake-modules"
  "openjdk-17-jdk"
  "qt6-base-dev"
  "qt6-networkauth-dev"
  "libqt6svg6-dev"
  "libcmark-dev"
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

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLauncher_BUILD_PLATFORM="Pacstall"

  cmake --build build -j"$(nproc)"
}

package() {
  cd "${srcdir}/FreesmLauncher"

  DESTDIR="${pkgdir}" cmake --install build
}
