name="powertop-git"
gives="powertop"
replace=("powertop")
breaks=("powertop")
url="https://github.com/fenrus75/powertop.git"
build_depends=("libpci-dev" "libnl-3-dev" "libnl-genl-3-dev" "gettext" "libgettextpo-dev" "autopoint" "gettext" "libncurses5-dev" "libncursesw5-dev" "libtool-bin" "dh-autoreconf" "autoconf-archive" "pkg-config")
maintainer="Henryws <hwengerstickel@pm.me>"
description="Linux tool used to diagnose issues with power consumption and power management"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

prepare() {
  ./autogen.sh
  ./configure
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make DESTDIR="${pkgdir}" install
}
