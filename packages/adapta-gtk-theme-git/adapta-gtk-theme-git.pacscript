name="adapta-gtk-theme-git"
gives="adapta-gtk-theme"
breaks=("adapta")
url="https://github.com/adapta-project/${gives}.git"
build_depends=("parallel" "autoconf" "automake" "inkscape" "libgdk-pixbuf2.0-dev" "libglib2.0-dev" "libxml2-utils" "pkg-config" "sassc")
description="An adaptive Gtk+ theme based on Material Design Guidelines (Legacy)"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

prepare() {
  ./autogen.sh --prefix=/usr --enable-parallel
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
