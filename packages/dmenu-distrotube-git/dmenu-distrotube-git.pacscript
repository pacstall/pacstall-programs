pkgname="dmenu-distrotube-git"
pkgver="1.4"
source=("https://gitlab.com/dwt1/dmenu-distrotube.git")
makedepends=("libxinerama-dev" "libxft-dev")
depends=("fontconfig")
gives="dmenu"
pkgdesc="Distrotube's dmenu build"
breaks=("dmenu" "dmenu_run" "dmenu_path")

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
