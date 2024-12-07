pkgname="conky-manager-zcot-git"
source=("https://github.com/zcot/conky-manager2.git")
arch=("any")
pkgver="2.7"
makedepends=("valac" "libgee-0.8-dev" "libgtk-3-dev" "libjson-glib-dev" "gettext" "libgettextpo-dev" "p7zip-full" "imagemagick")
depends=("conky" "rsync")
pkgdesc="Simple tool for managing Conky configs"

build() {
  cd "conky-manager2"
  make -j"${NCPU}"
}

package() {
  cd "conky-manager2"
  make install DESTDIR="${pkgdir}"
}
