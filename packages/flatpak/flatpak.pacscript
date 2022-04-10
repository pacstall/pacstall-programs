name="flatpak"
repology=("project: ${name}")
build_depends="libtool autoconf automake"
depends="libseccomp-dev appstream libjson-glib-dev bison ostree libarchive-dev gobject-introspection gtk-doc-tools gettext libpcap-dev libxau-dev mate-polkit libgpgme-dev libsoup-gnome2.4-dev libxml2-dev"
breaks="{name}-git {name}-bin"
replace="${name}"
version="1.12.7"
url="https://github.com/${name}/${name}/releases/download/{version}/${name}-${version}.tar.xz"
description="Linux application sandboxing and distribution framework"
hash="6db52a531ce278282ac7ebfb99f66a0bb3eccaf44e864844c2c95c1ee5ba9316"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  ./autogen.sh
}

build() {
  ./configure
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="/usr/src/pacstall/${name}"
}

postinst() {
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}
