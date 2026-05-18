# openbangla-keyboard-git.pacscript
# Build the latest OpenBangla-Keyboard from the master branch

pkgname="openbangla-keyboard-git"
gives="openbangla-keyboard"
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
url="https://github.com/OpenBangla/OpenBangla-Keyboard"
maintainer=("Niamot <58494481+niam0t@users.noreply.github.com>")

external_connection="true"

arch=("amd64")
source=("git+https://github.com/OpenBangla/OpenBangla-Keyboard.git")
repology=("project: ${gives}")
pkgver="0.0.0"

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
  pkgver="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/OpenBangla-Keyboard"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DRUSTC_EXECUTABLE=/usr/bin/rustc \
    -DCARGO_EXECUTABLE=/usr/bin/cargo
  make -j"${NCPU}"
}

package() {
  cd "${srcdir}/OpenBangla-Keyboard/build"
  make install DESTDIR="${pkgdir}"
}

