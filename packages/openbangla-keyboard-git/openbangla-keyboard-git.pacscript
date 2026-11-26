pkgname="openbangla-keyboard-git"
gives="openbangla-keyboard"
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
url="https://github.com/OpenBangla/OpenBangla-Keyboard"
maintainer=("Niamot <58494481+niam0t@users.noreply.github.com>")

external_connection="true"

arch=("amd64")
source=("git+https://github.com/OpenBangla/OpenBangla-Keyboard.git")
repology=("project: ${gives}")
pkgver="2.0.0+git"

replaces=("${gives}")
conflicts=("${gives}")

depends=(
  "ibus"
  "libzstd1"
  "libqt5gui5"
  "libqt5widgets5"
  "libqt5network5"
)
makedepends=(
  "cmake"
  "build-essential"
  "rustc"
  "cargo"
  "libibus-1.0-dev"
  "qtbase5-dev"
  "qtbase5-dev-tools"
  "libzstd-dev"
)

prepare() {
  cd "${srcdir}/OpenBangla-Keyboard"
  git submodule update --init --recursive

  if grep -q 'enable_language(Rust)' CMakeLists.txt; then
    sed -i 's|enable_language(Rust)|if(CMAKE_VERSION VERSION_GREATER_EQUAL "4.4.0")\n  set(CMAKE_EXPERIMENTAL_RUST "b6fdddce-bf66-41a5-bc5f-077f6fa4d2a1")\nelse()\n  set(CMAKE_EXPERIMENTAL_RUST "3cc9b32c-47d3-4056-8953-d74e69fc0d6c")\nendif()\nenable_language(Rust)|' CMakeLists.txt
  fi

  pkgver="${pkgver}r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/OpenBangla-Keyboard"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}/OpenBangla-Keyboard/build"
  make install DESTDIR="${pkgdir}"
}
