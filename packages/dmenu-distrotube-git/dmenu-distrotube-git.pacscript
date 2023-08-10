name="dmenu-distrotube-git"
pkgver="1.4"
url="https://gitlab.com/dwt1/dmenu-distrotube.git"
makedepends=("libxinerama-dev" "libxft-dev")
depends=("fontconfig")
gives="dmenu"
pkgdesc="Distrotube's dmenu build"
breaks=("dmenu" "dmenu_run" "dmenu_path")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
