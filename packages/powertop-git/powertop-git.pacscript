name="powertop-git"
gives="powertop"
replace=("powertop")
breaks=("powertop")
url="https://github.com/fenrus75/powertop.git"
build_depends=("libpci-dev" "libnl-3-dev" "libnl-genl-3-dev" "gettext" "libgettextpo-dev" "autopoint" "gettext" "libncurses5-dev" "libncursesw5-dev" "libtool-bin" "dh-autoreconf" "autoconf-archive" "pkg-config")
maintainer="Henryws <hwengerstickel@pm.me>"
description="Linux tool used to diagnose issues with power consumption and power management"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  ./autogen.sh
  ./configure
}

build() {
  make -j"${NCPU}"
}

install() {
  sudo make DESTDIR="${pkgdir}" install
}
