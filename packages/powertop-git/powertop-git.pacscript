pkgname="powertop-git"
gives="powertop"
replaces=("powertop")
breaks=("powertop")
source=("https://github.com/fenrus75/powertop.git")
pkgver="2.15"
makedepends=("libpci-dev" "libnl-3-dev" "libnl-genl-3-dev" "gettext" "libgettextpo-dev" "autopoint" "gettext" "libncurses5-dev" "libncursesw5-dev" "libtool-bin" "dh-autoreconf" "autoconf-archive" "pkg-config")
maintainer=("Elsie19 <elsie19@pm.me>")
pkgdesc="Linux tool used to diagnose issues with power consumption and power management"

prepare() {
  cd "${_archive}"
  ./autogen.sh
  ./configure
}

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make DESTDIR="${pkgdir}" install
}
