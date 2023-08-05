name="xfce4-settings-pine-git"
gives="xfce4-settings"
replace=("${gives}")
makedepends=("xfce4-dev-tools" "libexo-2-dev" "libgarcon-1-dev" "libxfce4ui-2-dev")
url="https://github.com/oklopfer/xfce4-settings.git"
pkgver="4.18.0"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="XFCE4 patch that allows Pine64 Devices to auto-rotate"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  sudo ./autogen.sh
}

build() {
  sudo make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
