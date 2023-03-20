name="xfce4-settings-pine-git"
gives="xfce4-settings"
replace="${gives}"
build_depends="xfce4-dev-tools libexo-2-dev libgarcon-1-dev libxfce4ui-2-dev"
url="https://github.com/oklopfer/xfce4-settings.git"
maintainer="oklopfer <oren@taumoda.com>"
description="XFCE4 patch that allows PinePhonePro to auto-rotate"
version="4.18.0"

prepare() {
  sudo ./autogen.sh
}

build() {
  sudo make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
