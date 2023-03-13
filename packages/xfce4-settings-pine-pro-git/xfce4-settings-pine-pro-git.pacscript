name="xfce4-settings-pine-pro-git"
gives="xfce4-settings"
breaks="${gives}"
replace="${gives}"
build_depends="xfce4-dev-tools libexo-2-dev libgarcon-1-dev libxfce4ui-2-dev"
url="https://github.com/oklopfer/xfce4-settings.git"
maintainer="oklopfer <oren@taumoda.com>"
description="XFCE4 patch that allows PinePhonePro to auto-rotate"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="${pkgver}"

prepare() {
  ./autogen.sh
}

build() {
  sudo make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
