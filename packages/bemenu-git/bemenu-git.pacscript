name="bemenu-git"
pkgname="bemenu"
version="4b7b483"
url="https://github.com/Cloudef/bemenu.git"
description="Dynamic menu library and client program inspired by dmenu"
build_depends="libxinerama-dev libxkbcommon-dev libncurses-dev wayland-protocols libwayland-dev libcairo2-dev libpango1.0-dev libpangocairo-1.0-0"
gives="bemenu"
breaks="bemenu-bin"
maintainer="wizard-28 <basak.sb2006@gmail.com>"

prepare() {
    true
  }

build() {
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/bemenu-git
}
