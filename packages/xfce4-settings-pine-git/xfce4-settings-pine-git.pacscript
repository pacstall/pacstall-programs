pkgname="xfce4-settings-pine-git"
gives="xfce4-settings"
replaces=("${gives}")
makedepends=("xfce4-dev-tools" "libexo-2-dev" "libgarcon-1-dev" "libxfce4ui-2-dev")
source=("https://github.com/oklopfer/xfce4-settings.git")
pkgver="4.18.0"
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="XFCE4 patch that allows Pine64 Devices to auto-rotate"

prepare() {
  cd "${_archive}"
  ./autogen.sh
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
