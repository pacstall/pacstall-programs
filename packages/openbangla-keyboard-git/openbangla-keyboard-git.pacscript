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

  # --- Fix experimental Rust support in CMake ---
  # Insert CMAKE_EXPERIMENTAL_RUST before enable_language(Rust)
  # The UUID below is for CMake 4.x (used by current Ubuntu/Debian CI images).
  # Older CMake versions may need a different UUID; see the note below.
  if grep -q 'enable_language(Rust)' CMakeLists.txt; then
    sed -i '/enable_language(Rust)/i set(CMAKE_EXPERIMENTAL_RUST "3cc9b32c-47d3-4056-8953-d74e69fc0d6c")' CMakeLists.txt
  fi

  pkgver="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
