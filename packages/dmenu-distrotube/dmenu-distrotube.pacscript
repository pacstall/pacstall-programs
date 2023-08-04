name="dmenu-distrotube"
pkgname="dmenu"
version="1.4"
url="https://gitlab.com/dwt1/dmenu-distrotube.git"
makedepends=("libxinerama-dev" "libxft-dev")
depends=("fontconfig")
gives="dmenu"
description="Distrotube's dmenu build"
breaks=("dmenu" "dmenu_run" "dmenu_path")

build() {
  make -j"$(nproc)"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
