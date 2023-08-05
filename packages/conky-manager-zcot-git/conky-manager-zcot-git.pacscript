name="conky-manager-zcot-git"
url="https://github.com/zcot/conky-manager2.git"
pkgver="2.7"
pkgver() {
  git ls-remote "${url}" add-1.10-support | cut -f1 | cut -c1-8
}
makedepends=("valac" "libgee-0.8-dev" "libgtk-3-dev" "libjson-glib-dev" "gettext" "libgettextpo-dev" "p7zip-full" "imagemagick")
depends=("conky" "rsync")
pkgdesc="Simple tool for managing Conky configs"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
