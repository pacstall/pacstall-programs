name="xfce4-settings-pine-git"
gives="xfce4-settings"
replace=("${gives}")
build_depends=("xfce4-dev-tools" "libexo-2-dev" "libgarcon-1-dev" "libxfce4ui-2-dev")
url="https://github.com/oklopfer/xfce4-settings.git"
maintainer="Oren Klopfer <oren@taumoda.com>"
description="XFCE4 patch that allows Pine64 Devices to auto-rotate"
pkgver() {
  echo 4.18.0
}
version="$(pkgver)"

prepare() {
  sudo ./autogen.sh
}

build() {
  sudo make -j"$(nproc)"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
