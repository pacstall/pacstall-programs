pkgname="dmenu-distrotube-git"
arch=("any")
pkgver="1.4"
source=("https://gitlab.com/dwt1/dmenu-distrotube.git")
makedepends=("libxinerama-dev" "libxft-dev")
depends=("fontconfig")
gives="dmenu"
pkgdesc="Distrotube's dmenu build"
breaks=("dmenu" "dmenu_run" "dmenu_path")

build() {
  cd "dmenu-distrotube"
  make -j"${NCPU}"
}

package() {
  cd "dmenu-distrotube"
  make install DESTDIR="${pkgdir}"
}
