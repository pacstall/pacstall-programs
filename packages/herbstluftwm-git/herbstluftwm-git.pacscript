pkgname="herbstluftwm-git"
gives="herbstluftwm"
pkgver="0.9.4.r10.g5a627d55"
pkgdesc="Manual tiling window manager for X"
source=("https://github.com/herbstluftwm/herbstluftwm.git")
url='https://herbstluftwm.org'
maintainer=("aKqir24 <aKqir24@github.com>")
license=('BSD-2-Clause')
arch=('amd64' 'i386')
depends=(
  'bash'
  'libxinerama1'
  'libxrandr2'
  'libxft2'
  'libxext6'
  'libxfixes3'
  'libxrender1'
  'libfreetype6'
)
makedepends=(
  'git'
  'cmake'
  'asciidoc'
  'pkg-config'
  'libx11-dev'
  'libxinerama-dev'
  'libxrandr-dev'
  'libxft-dev'
  'libxext-dev'
  'libxfixes-dev'
  'libxrender-dev'
  'libfreetype6-dev'
)
provides=("${gives}")
conflicts=("${gives}")

build() {
  cd "${gives}"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBASHCOMPLETIONDIR=/usr/share/bash-completion/completions \
    -DZSHCOMPLETIONDIR=/usr/share/zsh/functions/Completion/X \
    -DCMAKE_INSTALL_PREFIX="/usr" ..

  make -j"${NCPU}"
}

package() {
  cd "${gives}/build"

  # Install the program
  make DESTDIR="${pkgdir}" install

  # Handle license installation
  install -d "${pkgdir}"/usr/share/licenses/"${gives}"/
  ln -s /usr/share/doc/"${gives}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/"${gives}"/LICENSE
}
